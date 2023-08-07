
#https://rstudio.github.io/leaflet/showhide.html#:~:text=Groups%20and%20Layer%20IDs%20may,shared%20labels%20to%20many%20items.

quakes <- quakes %>%
  dplyr::mutate(mag.level = cut(mag,c(3,4,5,6),
                                labels = c('>3 & <=4', '>4 & <=5', '>5 & <=6')))

quakes.df <- split(quakes, quakes$mag.level)

l <- leaflet() %>% addTiles()

names(quakes.df) %>%
  purrr::walk( function(df) {
    l <<- l %>%
      addMarkers(data=quakes.df[[df]],
                 lng=~long, lat=~lat,
                 label=~as.character(mag),
                 popup=~as.character(mag),
                 group = df,
                 clusterOptions = markerClusterOptions(removeOutsideVisibleBounds = F),
                 labelOptions = labelOptions(noHide = F,
                                             direction = 'auto'))
  })

l %>%
  addLayersControl(
    overlayGroups = names(quakes.df),
    options = layersControlOptions(collapsed = FALSE)
  )
