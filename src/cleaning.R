library(readr)
library(lubridate)
library(xts)

# Get yearly data about high waters in the Veneze lagoon.
# We clean the data and combine it to get a final dataset


# Data from http://www.comune.venezia.it/archivio/25419
# From 1983, when "Centro Previsioni e Segnalazioni Maree" started to take measures
# In year 2002 they changed the location where level is measured

# leap-years: 1984, 1988, 1992, 1996, 2000, 2004, 2008, 2012, 2016
# standar year => 24*365 = 8760 observations per year
# leap-year => 24*366 = 8784 observations per year

############################################
###### Data loading
############################################

# parse_date("1-gen-83",  locale=locale("it"), format="%d-%b-%y")
data_1983 <- read_delim("../input/Punta_Salute_1983.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

# from 1984 to 2000 this is the format

data_1984 <- read_delim("../input/Punta_Salute_1984.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                          col_names=c("date", "time", "level"),
                          skip=1,
                        n_max=24*366)

data_1985 <- read_delim("../input/Punta_Salute_1985.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1986 <- read_delim("../input/Punta_Salute_1986.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1987 <- read_delim("../input/Punta_Salute_1987.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1988 <- read_delim("../input/Punta_Salute_1988.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1989 <- read_delim("../input/Punta_Salute_1989.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1990 <- read_delim("../input/Punta_Salute_1990.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1991 <- read_delim("../input/Punta_Salute_1991.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1992 <- read_delim("../input/Punta_Salute_1992.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1993 <- read_delim("../input/Punta_Salute_1993.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1994 <- read_delim("../input/Punta_Salute_1994.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1995 <- read_delim("../input/Punta_Salute_1995.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1996 <- read_delim("../input/Punta_Salute_1996.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1997 <- read_delim("../input/Punta_Salute_1997.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number(),
                          col_skip(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1998 <- read_delim("../input/Punta_Salute_1998.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_1999 <- read_delim("../input/Punta_Salute_1999.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number(),
                          col_skip(),
                          col_skip(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

data_2000 <- read_delim("../input/Punta_Salute_2000.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number(),
                          col_skip(),
                          col_skip(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*366)

# from 2001 to 2006 this is the format
data_2001 <- read_delim("../input/Punta_Salute_2001.csv", delim=";", locale=locale("it"), 
                        col_types = cols_only(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number(),
                          col_skip(),
                          col_skip(),
                          col_skip()),
                          col_names=c("date", "time", "level"),
                          skip=1,
                        n_max=24*365)

data_2002 <- read_delim("../input/Punta_Salute_2002.csv", delim=";", locale=locale("it"), 
                        col_types = cols_only(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number(),
                          col_skip(),
                          col_skip(),
                          col_skip()),
                          col_names=c("date", "time", "level"),
                          skip=1,
                        n_max=24*365)

data_2003 <- read_delim("../input/Punta_Salute_2003.csv", delim=";", locale=locale("it"), 
                        col_types = cols_only(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number(),
                          col_skip(),
                          col_skip(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

data_2004 <- read_delim("../input/Punta_Salute_2004.csv", delim=";", locale=locale("it"), 
                        col_types = cols_only(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_2005 <- read_delim("../input/Punta_Salute_2005.csv", delim=";", locale=locale("it"), 
                        col_types = cols_only(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

data_2006 <- read_delim("../input/Punta_Salute_2006.csv", delim=";", locale=locale("it"), 
                        col_types = cols_only(
                          col_date("%d-%b-%y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)
# 2007 format

data_2007 <- read_delim("../input/Punta_Salute_2007.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%y"),
                          col_time("%H.%M"),
                          col_number(),
                          col_skip(),
                          col_skip(),
                          col_skip(),
                          col_skip(),
                          col_skip(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

# 2008 to 2009 format
data_2008 <- read_delim("../input/Punta_Salute_2008.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_2009 <- read_delim("../input/Punta_Salute_2009.csv", delim=";", locale=locale("it"), 
                        col_types = cols(
                          col_date("%d-%b-%y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

# 2010 to 2015 format

data_2010 <- read_delim("../input/Punta_Salute_2010.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%Y"),
                          col_time("%H.%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_2011 <- read_delim("../input/Punta_Salute_2011.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%Y"),
                          col_time("%H:%M"),
                          col_number(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

data_2012 <- read_delim("../input/Punta_Salute_2012.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%Y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1)

data_2013 <- read_delim("../input/Punta_Salute_2013.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%Y"),
                          col_time("%H:%M"),
                          col_number(),
                          col_skip()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

data_2014 <- read_delim("../input/Punta_Salute_2014.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%Y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

data_2015 <- read_delim("../input/Punta_Salute_2015.csv", delim=";", 
                        col_types = cols_only(
                          col_date("%d/%m/%Y"),
                          col_time("%H:%M"),
                          col_number()),
                        col_names=c("date", "time", "level"),
                        skip=1,
                        n_max=24*365)

############################################
###### Data verification
############################################

data_years <- 1983:2015
tt <- list(data_1983, data_1984, data_1985, data_1986, data_1987, data_1988, data_1989, data_1990,
           data_1991, data_1992, data_1993, data_1994, data_1995, data_1996, data_1997, data_1998,
           data_1999, data_2000, data_2001, data_2002, data_2003, data_2004, data_2005, data_2006,
           data_2007, data_2008, data_2009, data_2010, data_2011, data_2012, data_2013, data_2014,
           data_2015)

names(tt) <- as.character(data_years)

# we check the first and the last record of each year are the expected ones.
sapply(names(tt), function(d) head(tt[[d]]["time"],1)==3600 && head(tt[[d]]["date"],1)==paste0(d,'-1-1'))
sapply(names(tt), function(d) tail(tt[[d]]["time"],1)==0 && tail(tt[[d]]["date"],1)==paste0(as.integer(d)+1,'-1-1'))


# we check the number of records per year (24*number_of_days) with the stimated ones (be careful with leap years)
sapply(names(tt), function(d) nrow(tt[[d]])==ifelse(leap_year(as.integer(d)), 24*366, 24*365)) 
sapply(names(tt), function(d) nrow(tt[[d]])==ifelse(leap_year(as.integer(d)), 24*366, 24*365)) 

# we check NA values. It looks like there aren't any one.
sapply(tt, anyNA)

############################################
###### Data combination
############################################

# we combine all the data in a dataset
result_tmp <- do.call(rbind, tt)

result <- data.frame(datetime= (result_tmp$date + seconds(result_tmp$time)),
                     level=result_tmp$level)



result_xts <- xts(order.by=(result_tmp$date + seconds(result_tmp$time)),
                      x=result_tmp$level)
attr(result_xts, 'frequency') <- 24
#decompose(as.ts(result_xts))

# we save as xts 
write.zoo(result_xts, file="../output/venezia_xts.csv", col.names=c("Datetime", "level"))

# we save as csv
write.csv(result, file="../output/venezia.csv", row.names = FALSE)

