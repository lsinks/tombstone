#https://www.statology.org/dplyr-pass-string-as-variable-name/

df <- data.frame(team=c('A', 'A', 'A', 'B', 'B'),
                 points=c(99, 90, 86, 88, 95),
                 assists=c(33, 28, 31, 39, 34),
                 rebounds=c(30, 28, 24, 24, 28))

my_var <- 'team'

#attempt to filter for rows where team is equal to a variable
df %>% filter(my_var == 'A')

df %>% filter(get(my_var) == 'A')

#this is exactlyt the same, but doesn't work
string_b <- "Anderson Albert A"
name_to_match <- "full_name_MI"
tombstones_middle %>% filter(get("full_name_MI") == 'Anderson Albert A')

tombstones_middle %>% filter(full_name_MI == 'Anderson Albert A')

tombstones_middle %>% filter(get(name_to_match) == 'Anderson Albert A')

df[1][[my_var]]
df[[my_var]][1]
