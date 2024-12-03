library(ggplot2)

# Updated Profiling Data from gprof Results
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

# Sorting data by TimePercentage in descending order
profiling_data <- profiling_data[order(profiling_data$TimePercentage, decreasing = TRUE), ]

# Plotting the data
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


# Desactivar notación científica
options(scipen = 999)

# Datos de tiempos de ejecución
samples <- c(1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000)
sequential_time <- c(0.0018318, 0.0115891, 0.0645249, 0.576971, 5.699076, 56.8409, 573.238)
parallel_time <- c(0.00276308, 0.00292199, 0.0036289, 0.00903737, 0.0395245, 0.253236, 2.68905)

# Crear el gráfico con ejes personalizados
plot(samples, sequential_time, type = "o", log = "xy", col = "blue", 
     xlab = "Número de muestras (escala logarítmica)", 
     ylab = "Tiempo de ejecución (s, escala logarítmica)", 
     main = "Comparación de tiempos de ejecución: Secuencial vs Paralelo",
     xaxt = "n", yaxt = "n") # Desactivar ticks automáticos

# Personalizar ticks del eje X (mostrar números completos sin notación científica)
axis(1, at = samples, labels = as.character(samples))

# Personalizar ticks del eje Y con valores adecuados para escala logarítmica
y_ticks <- c(0.0001, 0.001, 0.01, 0.1, 1, 10, 100, 1000, 10000)
# Escalar los valores para que correspondan a la escala logarítmica
log_y_ticks <- 10^log10(y_ticks)
axis(2, at = log_y_ticks, labels = as.character(y_ticks))

# Agregar líneas para los tiempos paralelos
lines(samples, parallel_time, type = "o", col = "red")

# Agregar leyenda
legend("bottomright", legend = c("Secuencial", "Paralelo"), 
       col = c("blue", "red"), lty = 1, pch = 1)

