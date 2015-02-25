#Tutorial
#### Sample code for the illustration of ggplot2
#### Ramon Saccilotto, 2010-12-08
### install & load ggplot library
install.packages("ggplot2")
library("ggplot2")
### show info about the data
head(diamonds)
head(mtcars)

help(diamonds)
help(mtcars)
### comparison qplot vs ggplot

qplot(clarity, data=diamonds, fill=cut, geom="bar")
# ggplot histogram -> same output
ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar()
### how to use qplot
# scatterplot
qplot(wt, mpg, data=mtcars)
# transform input data with functions
qplot(log(wt),mpg - 10, data=mtcars)
# add aesthetic mapping (hint: how does mapping work)
qplot(wt, mpg, data=mtcars, color=qsec)
# change size of points (hint: color/colour, hint: set aesthetic/mapping)
qplot(wt, mpg, data=mtcars, color=qsec, size=3)
qplot(wt, mpg, data=mtcars, colour=qsec, size=I(3))
# use alpha blending
qplot(wt, mpg, data=mtcars, alpha=qsec)
# continuous scale vs. discrete scale
head(mtcars)
qplot(wt, mpg, data=mtcars, colour=cyl)
levels(mtcars$cyl)
qplot(wt, mpg, data=mtcars, colour=factor(cyl))
# use different aesthetic mappings
qplot(wt, mpg, data=mtcars,shape=factor(cyl))
qplot(wt, mpg, data=mtcars, size=qsec)
# combine mappings (hint: hollow points, geom-concept, legend combination)
qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb))
qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb), shape=I(1))
qplot(wt, mpg, data=mtcars, size=qsec, shape=factor(cyl), geom="point")
qplot(wt, mpg, data=mtcars, size=factor(cyl), geom="point")
# bar-plot
qplot(factor(cyl), data=mtcars, geom="bar")
# flip plot by 90°
qplot(factor(cyl), data=mtcars, geom="bar") +
  coord_flip()
# difference between fill/color bars
qplot(factor(cyl), data=mtcars, geom="bar", fill=factor(cyl))
qplot(factor(cyl), data=mtcars, geom="bar", colour=factor(cyl))
# fill by variable
qplot(factor(cyl), data=mtcars, geom="bar",fill=factor(gear))
# use different display of bars (stacked, dodged, identity)
head(diamonds)
qplot(clarity, data=diamonds, geom="bar", fill=cut, position="stack")
qplot(clarity, data=diamonds, geom="bar", fill=cut,position="dodge")
qplot(clarity, data=diamonds, geom="bar", fill=cut,position="fill")
qplot(clarity, data=diamonds, geom="bar", fill=cut,position="identity")
qplot(clarity, data=diamonds,geom="freqpoly", group=cut, colour=cut,position="identity")
qplot(clarity, data=diamonds,geom="freqpoly", group=cut, colour=cut,position="stack")


qplot(Sepal.Length, Petal.Length, data = iris, color = Species)
qplot(carat, price, data = diamonds, colour = clarity)
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
qplot(age, circumference, data = Orange, geom = "line",
      colour = Tree,
      main = "How does orange tree circumference vary with age?")
qplot(age, circumference, data = Orange, geom = c("point", "line"), colour = Tree)
qplot(clarity, data=diamonds, fill=cut, geom="bar")
qplot(wt, mpg, data=mtcars)
