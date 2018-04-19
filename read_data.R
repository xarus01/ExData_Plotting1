## Read data from txt file
t <- read.table('./household_power_consumption.txt', header=TRUE, sep=';', na.strings = '?', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

t$Date <- as.Date(t$Date, '%d/%m/%Y')
t <- subset(t,Date >= as.Date('2007-2-1') & Date <= as.Date('2007-2-2'))

## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, 'DateTime')

## Remove Date and Time column
t <- t[ ,!(names(t) %in% c('Date','Time'))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)
