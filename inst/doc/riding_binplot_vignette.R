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
fed_2015 <- federal_election_results %>%
  filter(election_year == 2015) %>%
  dplyr::select(riding_code, party)

## ------------------------------------------------------------------------
fed_2015 %>%
  sample_n(10)

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
fed_2015_bins <- fed_2015 %>%
  riding_binplot(value_col = party, 
                 continuous = FALSE) +
  ggtitle("Tile grid map of 2015 federal election results")
fed_2015_bins

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
fed_2015_bins <- fed_2015_bins +
  theme_mapcan()

fed_2015_bins

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
fed_2015_bins +
  scale_fill_manual(name = "Party",
                    values = c("mediumturquoise", "blue", "springgreen3", "red", "orange"))

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
fed_2015 %>%
  riding_binplot(value = party, 
                 continuous = FALSE,
                 arrange = TRUE) + 
  theme_mapcan() + 
  scale_fill_manual(name = "Party",
                    values = c("mediumturquoise", "blue", "springgreen3", "red", "orange")) +
  ggtitle("Tile grid map of 2015 federal election results")

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
fed_2015_cloropleth <- mapcan(boundaries = ridings, type = standard)

left_join(fed_2015_cloropleth, fed_2015, by = "riding_code") %>%
  ggplot(aes(long, lat, group = group, fill = party)) +
  geom_polygon() + 
  coord_fixed() + 
  scale_fill_manual(name = "Party",
                    values = c("mediumturquoise", "blue", "springgreen3", "red", "orange")) +
  ggtitle("Tile grid map of 2015 federal election results") +
  theme_mapcan()


## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
federal_election_results %>%
  filter(election_year == 2015) %>%
  riding_binplot(value = voter_turnout,
                 continuous = TRUE) +
  ggtitle("Tile grid map of 2015 federal election voter turnout")

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
federal_election_results %>%
  filter(election_year == 2015) %>%
  riding_binplot(value = voter_turnout,
                 continuous = TRUE) +
  theme_mapcan() +
  ggtitle("Tile grid map of 2015 federal election voter turnout")

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
federal_election_results %>%
  filter(election_year == 2015) %>%
  riding_binplot(value = voter_turnout,
                 continuous = TRUE,
                 arrange = TRUE) +
  theme_mapcan() +
  ggtitle("Tile grid map of 2015 federal election voter turnout")

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
federal_election_results %>%
  filter(election_year == 2015) %>%
  riding_binplot(value = voter_turnout,
                 continuous = TRUE,
                 arrange = TRUE,
                 shape = "hexagon") +
  theme_mapcan() +
  ggtitle("Hexagon grid map of 2015 federal election voter turnout")

## ----fig.width = 8, fig.height=4, warning = FALSE------------------------
riding_binplot(quebec_provincial_results,
               value_col = party,
               riding_col = riding_code, 
               continuous = FALSE, 
               provincial = TRUE,
               province = QC,
               shape = "hexagon") +
  theme_mapcan() +
  scale_fill_manual(name = "Winning party", 
                    values = c("deepskyblue1", "red","royalblue4",  "orange")) +
  ggtitle("Hexagon grid map of 2018 Quebec provincial election results")

