[![Build Status](https://travis-ci.org/micahyoung/railsrc.svg?branch=master)](https://travis-ci.org/micahyoung/railsrc)
# Hybrid railsrc / rails app template

## What is this?

This is my hybrid railsrc and app template, including several of my preferred defaults.

## Instructions
```bash
git clone https://github.com/micahyoung/railsrc.git my_dir

# then 
rails new ~/Code/Ruby/weblog --rc=my_dir/railsrc --template=my_dir/railsrc

# or to use globally 
mv my_dir/railsrc ~/.railsrc
rails new ~/Code/Ruby/weblog  # it just works!
```

## Why?

I, like most devs, have a sensible set of defaults for my projects. `rails new` restricts some options to the rc file (or command-line), while some options are only available from a templates. This hacks around that by putting both in one place.
