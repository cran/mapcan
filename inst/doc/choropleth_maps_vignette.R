## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  comment = "#>"
)

library(mapcan)
library(dplyr)
library(ggplot2)

## ------------------------------------------------------------------------
mapcan(boundaries = province,
       type = standard) %>%
  head()

## ------------------------------------------------------------------------
pr_map <- mapcan(boundaries = province,
       type = standard) %>%
  ggplot(aes(x = long, y = lat, group = group))
pr_map

## ----fig.width = 6, fig.height=5.5, warning = FALSE----------------------
pr_map <- pr_map +
  geom_polygon() +
  coord_fixed()
pr_map

## ----fig.width = 6, fig.height=5.5, warning = FALSE----------------------
pr_map +
  theme_mapcan() +
  ## Add a title
  ggtitle("Map of Canada with Provincial/Territorial Boundaries")

## ------------------------------------------------------------------------
pop_2017 <- mapcan::province_pop_annual %>%
  filter(year == 2017)

head(pop_2017)

## ---- warning = FALSE----------------------------------------------------
pr_geographic <- mapcan(boundaries = province,
       type = standard)


pr_geographic <- inner_join(pr_geographic, 
           pop_2017, 
           by = c("pr_english" = "province"))

## ----fig.width = 6, fig.height=5.5, warning = FALSE----------------------
pr_geographic %>%
  ggplot(aes(x = long, y = lat, group = group, fill = population)) +
  geom_polygon() +
  coord_fixed() +
  theme_mapcan() +
  scale_fill_viridis_c(name = "Population") +
  ggtitle("Canadian Population by Province")

## ------------------------------------------------------------------------
bc_ridings <- mapcan(boundaries = ridings,
       type = standard,
       province = BC)

head(bc_ridings)

## ----fig.width = 5, fig.height=5.5, warning = FALSE----------------------
ggplot(bc_ridings, aes(x = long, y = lat, group = group)) +
  geom_polygon() +
  coord_fixed() +
  theme_mapcan() +
  ggtitle("British Columbia \nFederal Electoral Ridings")

## ------------------------------------------------------------------------
bc_results <- mapcan::federal_election_results %>%
  # Restrict data to include just 2015 election results from BC
  filter(election_year == 2015 & pr_alpha == "BC")

head(bc_results)

## ------------------------------------------------------------------------
bc_ridings <- inner_join(bc_results, bc_ridings, by = "riding_code")

## ------------------------------------------------------------------------
bc_riding_map <- bc_ridings %>%
  ggplot(aes(x = long, y = lat, group = group, fill = party)) +
  geom_polygon() +
  coord_fixed() +
  theme_mapcan() +
  ggtitle("British Columbia \n2015 Federal Electoral Results")

## ----fig.width = 5, fig.height=5.5, warning = FALSE----------------------
bc_riding_map +
  scale_fill_manual(name = "Winning party",
                    values = c("blue", "springgreen3", "red", "Orange")) 


