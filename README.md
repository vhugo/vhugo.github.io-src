# Personal website of Victor Alves

## Requirements

- [GNU make](https://www.gnu.org/software/make/manual/make.html)
- [pandoc](https://pandoc.org/)
- [jpegoptim](https://www.kokkonen.net/tjko/src/man/jpegoptim.txt)

On Arch:

```sh
sudo pacman -Sy pandoc jpegoptim
```

On Mac:

```sh
brew install pandoc jpegoptim
```

On Android (via Termux):

```sh
pkg install make pandoc jpegoptim
```

## Usage

```sh
# clone this repository
> git clone https://github.com/vhugo/vhugo.github.io-src.git

# change to the repo's directory
> cd vhugo.github.io-src

# run make default's recipes
> make
```

### New or edit a page

```sh
# edit a markdown page
> nvim ./content/pages/new-page.md

# run make default's recipes
> make

# open the html in the browser
> open ./site/new-page.html
```
