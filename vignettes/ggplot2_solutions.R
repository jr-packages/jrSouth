## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache= TRUE, results = "show")

## ---- , message = FALSE, echo = TRUE-------------------------------------
library("ggplot2")

## ---- , echo = TRUE------------------------------------------------------
data(okcupid, package = "jrSouth")

## ---- , fig.keep='none', echo = TRUE-------------------------------------
# alpha makes the points transparent
ggplot(data = okcupid) + 
  geom_point(aes(x = age, y = height), alpha = 0.2)

## ---- , fig.keep='none', echo = TRUE-------------------------------------
g = ggplot(data = okcupid)
g1 = g + geom_point(aes(x = age, y = height), alpha = 0.2)

## ---- , fig.keep='none', echo = TRUE-------------------------------------
g1

## ------------------------------------------------------------------------
# this gives an error

## ---- , fig.keep='none', echo = TRUE-------------------------------------
g + geom_point(aes(x = age, y = height, colour = sex))

## ---- , fig.keep='none', echo = TRUE-------------------------------------
g + geom_bar(aes(x = body_type))

## ---- , fig.keep='none'--------------------------------------------------
g + geom_bar(aes(x = body_type)) + 
  xlab("Body Type") + 
  ylab("Total")

## ---- , fig.keep='none'--------------------------------------------------
# What happens if you only have colour or only fill?
g + geom_bar(aes(x = body_type, colour = sex, fill = sex))

## ---- , fig.keep='none'--------------------------------------------------
g + geom_bar(aes(x = body_type, colour = sex, fill = sex)) + 
  coord_flip()

## ---- , fig.keep='none', echo = TRUE-------------------------------------
g + geom_bar(aes(x = body_type, colour = sex, fill = sex), position = "dodge") + 
  coord_flip()

## ---- , fig.keep = "none"------------------------------------------------
g + geom_bar(aes(x = body_type, colour = sex, fill = sex), position = "fill") + 
  coord_flip()
# puts the values on a common scale (all sum to 1)

## ---- , echo = TRUE, out.width="70%"-------------------------------------
g = ggplot(okcupid) 
g + geom_boxplot(aes(x = 1, y = age))

## ------------------------------------------------------------------------
g + geom_boxplot(aes(x = smokes, y = age))

## ---- echo=FALSE, message=FALSE, fig.keep='none'-------------------------
data(mpg, package="ggplot2")
# mpg$drv = as.character(mpg$drv)
# mpg[mpg$drv == "f",]$drv = "Front"
# mpg[mpg$drv == "r",]$drv = "Rear"
# mpg[mpg$drv == "4",]$drv = "4wd"
# mpg$drv = factor(mpg$drv,
#    levels = c("Front", "Rear", "4wd"))

g = ggplot(data=mpg, aes(x=displ, y=hwy))
g1 = g + geom_point() + stat_smooth(linetype=2) +
  xlab("Displacement") + ylab("Highway mpg")
g2 = g + geom_point() + stat_smooth(aes(colour=drv))

## ---- out.width='0.5\\textwidth', message=FALSE, label = "F1", fig.cap = "Graphics for section 1", echo = FALSE, fig.keep='all'----
g1

## ---- message=FALSE, echo = TRUE-----------------------------------------
library("ggplot2")

## ---- results='hide', echo = TRUE----------------------------------------
data(mpg, package="ggplot2")
dim(mpg)

## ---- fig.keep='none', tidy=FALSE, echo = TRUE---------------------------
ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point() + xlab("Displacement")

## ---- label = "F2", out.width='0.5\\textwidth', echo=FALSE, message=FALSE, fig.cap="Graphics for section 1", fig.keep='all'----
g2

## ---- message=FALSE, fig.keep='none'-------------------------------------
g1 = g + geom_point() + stat_smooth(linetype=2) +
  xlab("Displacement") + ylab("Highway mpg")

## ---- message=FALSE, eval = FALSE----------------------------------------
#  g2 = g + geom_point() + stat_smooth(aes(colour=drv))

