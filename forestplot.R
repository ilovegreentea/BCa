#gg forest plot with p value of krukal-wallis test.

ggplot(mono, aes(x = Timepoint, y = mean_proportion, color = Response, group = Response)) +
  geom_point(aes(size = n), position = dodge, alpha = 0.7) +
  geom_errorbar(aes(ymin = lower_ci, ymax = upper_ci), width = 0.2, position = dodge) +
  geom_line(position = dodge) + 
  facet_wrap(~ subclass.M, scales = "free_y") +  
  labs(title = "Myeloid subtype Comparing Timepoints",
       x = "Timepoint",
       y = "Proportion (Mean ± 99% CI)") +
  theme_minimal() +
  theme(legend.position = "right") +
  scale_color_manual(values = c("Responder" = "red", "Non_Responder" = "blue")) +
  
  # Left facet (e.g., CD16- Monocyte)
  geom_text(
    data = mono %>%
      filter(subclass.M == "CD16- Monocyte") %>%  # Adjust this to match the specific facet
      group_by(Response, subclass.M) %>%
      slice(1),
    aes(label = ifelse(p_value < 0.05, paste("p =", round(p_value, 3)), "")),
    hjust = -2, vjust = -5.4, size = 4, color = "red"
  ) +
  geom_text(
    data = mono %>%
      filter(subclass.M == "CD16- Monocyte") %>%  # Adjust this to match the specific facet
      group_by(Response, subclass.M) %>%
      slice(1),
    aes(label = ifelse(p_value >= 0.05, paste("p =", round(p_value, 3)), "")),
    hjust = -2, vjust = -11.2, size = 4, color = "blue"
  ) +
  
  # Right facet (e.g., CD16+ Monocyte)
  geom_text(
    data = mono %>%
      filter(subclass.M == "CD16+ Monocyte") %>%  # Adjust this to match the specific facet
      group_by(Response, subclass.M) %>%
      slice(1),
    aes(label = ifelse(p_value < 0.05, paste("p =", round(p_value, 3)), "")),
    hjust = -1.75, vjust = -18.5, size = 4, color = "red"
  ) +
  geom_text(
    data = mono %>%
      filter(subclass.M == "CD16+ Monocyte") %>%  # Adjust this to match the specific facet
      group_by(Response, subclass.M) %>%
      slice(1),
    aes(label = ifelse(p_value >= 0.05, paste("p =", round(p_value, 3)), "")),
    hjust = -1.75, vjust = -11.6, size = 4, color = "blue"
  )+
  theme(strip.text = element_text(
    size = 15, color = "black"))
