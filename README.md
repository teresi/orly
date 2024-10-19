# O'RLY COVERS

Parody book covers.

No relation to O'Reilly Media.

Inspired by [O'Rly Generator](https://arthurbeaulieu.github.io/ORlyGenerator/) and others.

----


## USAGE

```
make
```


----

## GOALS
- print and glue the cover to a notebook
- use realistic colors and fonts
- use strange animals as the mascot


----

## DESIGN

- support arbitrary dimensions
    + functions are defined in TikZ
    + accepts inputs for the size of the cover
    + accepts inputs for the printable area since this must be larger than the cover
    + this works well, but aligning the text still needs some manual setup
- built for Midori A series notebooks
    + it lays flat
    + it's high quality paper
    + the cover is minimal which simplifies assembly
- water-resistant paper
    + 32lb Gloss Text doesn't bend well and is fragile
- combined cover as 11x17"
    + the first experiment was to print a combined cover on one sheet, then fold and glue it
    + the 7.7 Mil paper did not bend well and prevented it from laying flat
- front / back cover as 8.5x11"
    + print both documents separately, and use book tape on the spine


----

## PRINTING

I used a third party printing service for the water-resistant paper, color ink, and large format.

1) Find a FedEx printing service (not all sites support printing) (other printing services are available)
2) Select
    - Copies & Custom Documents
    - "Full Color"
    - "Water Resistant (7.7 Mil)"
4) Mail or call the site and ask for 1:1 scaling
    - otherwise they will shrink to fit
    - A5 is smaller than the printable area, there isn't anything we need in the margin
