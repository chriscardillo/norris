# norris

If you ever wanted random Chuck Norris jokes on-demand, this is the package for you.

# How To Install

Simply install `devtools` and then use `install_github` pointing to this repo. See below:

```r
install.packages(devtools)

devtools::install_github("peppato/norris")
```
# How To Use

Get a random Chuck Norris joke with `get_random_joke()`, or get multiple random jokes with `get_multiple_randos()`.

For `get_multiple_randos()` - input the number of jokes you want, if you want!

Otherwise, use `get_numbered_joke()` with a joke number (somewhere between 1 and 558) to get a specific joke.

Utility functions `get_joke_count()` and `get_joke_categories()` are pretty pointless currently.

# Special Notes

For `get_numbered_joke()`, there are a few jokes missing (7 through 11). Maybe Chuck Norris roundhouse kicked them out of the database..
