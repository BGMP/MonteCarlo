library(ggplot2)

### Gráfico de perfilado (gprof)

profiling_data <- data.frame(
  Function = c(
    "std::generate_canonical",
    "std::__detail::_Mod::__calc",
    "runSequentialMonteCarloPICalculation",
    "std::uniform_real_distribution::operator()",
    "std::__detail::__mod",
    "std::linear_congruential_engine::operator()",
    "std::uniform_real_distribution::param_type::a",
    "std::linear_congruential_engine::min",
    "std::__detail::_Adaptor::operator()",
    "std::uniform_real_distribution::param_type::b"
  ),
  TimePercentage = c(31.73, 11.46, 8.90, 8.22, 7.63, 5.93, 5.13, 3.68, 3.49, 2.29)
)

profiling_data <- profiling_data[order(profiling_data$TimePercentage, decreasing = TRUE), ]

ggplot(profiling_data, aes(x = TimePercentage, y = reorder(Function, TimePercentage))) +
  geom_bar(stat = "identity", fill = "grey30", color = "black") +
  labs(
    title = "Distribución del Tiempo de Ejecución por Función",
    x = "Porcentaje de Tiempo (%)",
    y = "Función"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(size = 12, face = "bold"),
    axis.title.y = element_text(size = 12, face = "bold"),
    axis.text.y = element_text(size = 10)
  )

### Gráfico de Eficiencia

samples <- c(1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000)
sequential_time <- c(0.0018318, 0.0115891, 0.0645249, 0.576971, 5.699076, 56.8409, 573.238)
parallel_time <- c(0.00276308, 0.00292199, 0.0036289, 0.00903737, 0.0395245, 0.253236, 2.68905)

# Formatear números con separadores de miles (puntos) para el eje X
formatted_samples <- format(samples, big.mark = ".", scientific = FALSE)

# Limitar la cantidad de ceros después de la coma en el eje Y
y_ticks <- c(0.0001, 0.001, 0.01, 0.1, 1, 10, 100, 1000)
formatted_y_ticks <- gsub("\\.", ",", formatC(y_ticks, format = "f", digits = 1))

# Graficar datos
plot(samples, sequential_time, type = "o", log = "xy", col = "blue", 
     xlab = "Número de muestras", 
     ylab = "Tiempo de ejecución (segundos)", 
     main = "Comparación de tiempos de ejecución: Secuencial vs Paralelo",
     xaxt = "n", yaxt = "n") # Desactivar ticks automáticos

# Agregar etiquetas del eje X con separadores de miles
axis(1, at = samples, labels = formatted_samples)

# Agregar etiquetas del eje Y con coma como separador decimal y 1 dígito
axis(2, at = y_ticks, labels = formatted_y_ticks)

# Agregar líneas y leyenda
lines(samples, parallel_time, type = "o", col = "red")

legend("bottomright", legend = c("Secuencial", "Paralelo"), 
       col = c("blue", "red"), lty = 1, pch = 1)
