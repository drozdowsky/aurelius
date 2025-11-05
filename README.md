# Aurelius

Read the Word of *Marcus Aurelius* from **Meditations** in your terminal.


## Usage

    usage: ./aurelius [flags] [reference...]

      -l      list books
      -W      no line wrap
      -h      show help

      Reference types:
          <Book>
              Individual book
          <Book>:<Chapter>
              Individual chapter of a book
          <Book>:<Chapter>:<Verse>[,<Verse>]...
              Individual verse(s) of a specific chapter of a book
          <Book>:<Chapter>-<Chapter>
              Range of chapters in a book
          <Book>:<Chapter>:<Verse>-<Verse>
              Range of verses in a book chapter
          <Book>:<Chapter>:<Verse>-<Chapter>:<Verse>
              Range of chapters and verses in a book

          /<Search>
              All verses that match a pattern
          <Book>/<Search>
              All verses in a book that match a pattern
          <Book>:<Chapter>/<Search>
              All verses in a chapter of a book that match a pattern

## Build

aurelius can be built by cloning the repository and then running make:
```sh
    cd aurelius
    sudo make install
```

## Simple command to have random Marcus Eurelius quote in your terminal
```sh
#!/bin/sh
# git clone https://github.com/drozdowsky/aurelius
# Read the Word of Marcus Aurelius from Meditations in your terminal.
#
FILE=~/Builds/aurelius/aurelius.tsv
if [ ! -f $FILE ]; then
    mkdir -p ~/Builds && cd ~/Builds && \
    git clone https://github.com/drozdowsky/aurelius
fi

sort --random-sort "$FILE" | head -n 1 | awk 'BEGIN {FS="\t"}; {print $6}' | fold -w 80 -s
```

## License

Public domain
