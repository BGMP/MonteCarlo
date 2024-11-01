library(ggplot2)

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
