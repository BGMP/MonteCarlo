library(ggplot2)

# Gráfico de Perfilado del Algoritmo Secuencial

profiling_data <- data.frame(
  Function = c(
    "std::generate_canonical",
    "std::uniform_real_distribution::param_type::a",
    "std::uniform_real_distribution::operator()",
    "std::__detail::_Mod::__calc",
    "runSequentialMonteCarloPICalculation",
    "std::__detail::_Adaptor::operator()",
    "std::linear_congruential_engine::operator()",
    "std::__detail::_Adaptor::_Adaptor",
    "std::uniform_real_distribution::param_type::b"
  ),
  TimePercentage = c(52.86, 9.58, 9.32, 6.96, 5.23, 3.06, 2.87, 2.81, 1.79)
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

# Datos de tiempos de ejecución
samples <- c(1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000)
sequential_time <- c(0.000347, 0.00346, 0.040129, 0.341221, 3.14948, 31.0033, 300.377)
parallel_time <- c(0.02308, 0.02461, 0.029584, 0.03062, 0.053184, 0.303104, 3.76575)

# Crear el gráfico con ejes personalizados
plot(samples, sequential_time, type = "o", log = "xy", col = "blue", 
     xlab = "Número de muestras (escala logarítmica)", 
     ylab = "Tiempo de ejecución (s, escala logarítmica)", 
     main = "Comparación de tiempos de ejecución: Secuencial vs Paralelo",
     xaxt = "n", yaxt = "n") # Desactivar ticks automáticos

# Personalizar ticks del eje X
axis(1, at = samples, labels = format(samples, scientific = TRUE))

# Personalizar ticks del eje Y
y_ticks <- c(0.0001, 0.001, 0.01, 0.1, 1, 10, 100, 1000)
axis(2, at = y_ticks, labels = format(y_ticks, scientific = TRUE))

# Agregar líneas paralelas
lines(samples, parallel_time, type = "o", col = "red")

# Agregar leyenda
legend("bottomright", legend = c("Secuencial", "Paralelo"), 
       col = c("blue", "red"), lty = 1, pch = 1)
