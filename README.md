# `traceRy` a tracery implementation in R

Tracery is a neat way of generating text from JSON files. I didn't write it but you can find out more [here](https://www.github.com/galaxykate/tracery). You can use tracery to make bots with [cheapbotsdonequick](http://cheapbotsdonequick.com). I do that a lot, so I thought it would be nice to have something written in R that I can use to check that my bots work (also because I'm goofy and I don't understand javascript).

## A quick example

`traceRy` comes with some properly formatted JSON to help you get started but let's start with something really simple to begin with...


```r
my_json <- '{

   "origin": ["Today I saw a #bird#"],
   "bird": ["mallard", "gannet", "swan", "puffin"]

}
'
# write that out to a temporary file
tmp <- tempfile()
writeLines(my_json, tmp)
```

with this simple story we can generate stuff...


```r
# load traceRy
library(traceRy)
# load the JSON
jason <- read_tracery(tmp)
# write a story
make_tracery(jason)
```

```
## [1] "Today I saw a mallard"
```

Okay, well that was cute, but what about something more fancy?



```r
my_json <- '{

   "origin": ["Today I saw a #bird##andsome#"],
   "bird": ["mallard", "gannet", "swan", "puffin"],
   "andsome": ["", " and some #bird.s#"]

}
'
tmp <- tempfile()
writeLines(my_json, tmp)
jason <- read_tracery(tmp)

set.seed(23)
make_tracery(jason)
```

```
## [1] "Today I saw a swan"
```

```r
make_tracery(jason)
```

```
## [1] "Today I saw a gannet and some puffins"
```

Maybe sometimes we get really excited...



```r
my_json <- '{

   "origin": ["Today I saw a #bird##andsome#"],
   "bird": ["mallard", "gannet", "swan", "puffin"],
   "andsome": ["", " and some #bird.s#", " and some #bird.s.capitalize#"]

}
'
tmp <- tempfile()
writeLines(my_json, tmp)
jason <- read_tracery(tmp)

set.seed(12)
make_tracery(jason)
```

```
## [1] "Today I saw a mallard and some PUFFINS"
```

Okay that's probably enough for now...


