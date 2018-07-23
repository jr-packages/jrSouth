## ----echo=FALSE----------------------------------------------------------
results = "hide"; echo = FALSE

## ----setup, include=FALSE, cache=FALSE----------
library(knitr)
library(ggplot2)
opts_knit$set(out.format = "latex")
knit_theme$set(knit_theme$get("greyscale0"))

options(replace.assign=FALSE,width=50)

opts_chunk$set(fig.path='knitr_figure/graphics-',
               cache.path='knitr_cache/graphics-',
               fig.align='center',
               dev='png', fig.width=5, fig.height=5,
               fig.show='hold', cache=FALSE, par=TRUE)
knit_hooks$set(crop=hook_pdfcrop)

knit_hooks$set(par=function(before, options, envir){
    if (before && options$fig.show!='none') {
        par(mar=c(3,3,2,1),cex.lab=.95,cex.axis=.9,
            mgp=c(2,.7,0),tcl=-.01, las=1)
}}, crop=hook_pdfcrop)

## ----echo=FALSE---------------------------------
data(aphids, package = "jrSouth")

## ----message=FALSE------------------------------
data(mpg, package = "ggplot2")

## ----tidy=FALSE---------------------------------
g = ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point()

## ----fig.keep='none', message=FALSE-------------
g + stat_smooth(aes(colour=drv))

## ----eval=FALSE---------------------------------
#  mpg[mpg$drv == "4",]$drv = "4wd"
#  mpg[mpg$drv == "f",]$drv = "Front"
#  mpg[mpg$drv == "r",]$drv = "Rear"

## -----------------------------------------------
##Reload the data just to make sure
data(mpg, package="ggplot2")
mpg$drv = factor(mpg$drv, labels = c("4wd", "Front", "Rear"))

## ----tidy=FALSE---------------------------------
mpg$drv = factor(mpg$drv,
                 levels = c("Front", "Rear", "4wd"))

## ----eval=FALSE, tidy=FALSE---------------------
#   + xlab("Time")

## ----fig.keep='none', tidy=FALSE, echo=echo, results=results----
##Code for figure 1
aphids$Block = factor(aphids$Block)
aphids$Water = factor(aphids$Water,
                      levels=c("Low", "Medium", "High"))
ga = ggplot(data=aphids) +
  geom_point(aes(Time, Aphids, colour=Block)) +
  facet_grid(Nitrogen ~ Water) +
  geom_line(aes(Time, Aphids, colour=Block)) +
  theme_bw()

print(ga)

## ----eval=FALSE---------------------------------
#  library(jrSouth)
#  vignette("ggplot2_solutions2", package="jrSouth")

