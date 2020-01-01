# Dhumavati GTK Theme 
![Dhumavati GTK screnshot](https://raw.githubusercontent.com/Thomashighbaugh/Dhumavati-Theme/master/screenshot.png)
- The dark variant 
### Note: 
This GTK theme is meant to be utilized as part of my Awesome Window Manager configuration. If you use it with another window manager or desktop environment, your mileage will vary. 
- The window decorations are provided within the Awesome WM configuration as well. If used in other environments, it will default to the window decorations from the source project: Canvas GTK theme. 
- To find the aforementioned Awesome Window Manager configuration, check out my [dotfiles](https://github.com/Thomashighbaugh/dotfiles) 

## Introduction
*Dhumavati* is the tantric Hindu goddess presiding over death and the transition from life to the next stage. I chose the name because like the macabre imagery associated with the Goddess, this theme is intended to be dark and somewhat muted. 

The theme is intended to be utilized within my customized, aka 'riced', Awesome Window Manager configuration and is styled using the same pallete. The color scheme is also a custom blend of various elements from other color schemes I pieced together in crafting the ultimate desktop experience *to my particular taste and according to my particular needs*. I find dark themes to be more visually interesting and easy to view for hours and in particular tending towards cooler toned grays and blacks. 

After crafting my Awesome WM configuration, I attempted to use my usual tool for theme-ing GTK3, Oomox, which is an awesome tool even with the creepy message it puts in the comments of its generated themes. However in this case, the Oomox macros were not sufficient for my purposes as they didn't offer the same levels of control that building an Awesome WM environment from scratch did and spoiled me with. So after exploring various options derived from SCSS files, I settled on using Canvas as my basis and now you have it before you.

## Prerequisites 
To install this theme, first make sure you have the dependencies 

For Arch Linux (or its derivatives using Pacman as the package manager)
```bash 
$ sudo pacman -S --noconfirm gtk-engine-murrine gtk-engines
```

For other distros, follow your typical installation procedure and install your distros equivalent of `gtk-engine-murrine` and `gtk-engines`

## Installation

```bash 

git clone https://github.com/Thomashighbaugh/Dhumavati-Theme
cd Dhumavati-Theme
## For Local Installation
./Install

## For Systemwide Installation
sudo ./Install
```

### Installation Options 

|  OPTIONS:    | |
|:-------------|:-------------|
| -d, --dest   | destination directory (Default: $HOME/.themes) |
| -n, --name   | name (Default: Dhumavati) |
| -c, --color  | color variant(s) (standard/dark) |
| -h, --help   | Show help |

## Modification and Customization
If you would like to modify the theme to suit your taste, you can easily do so by modifying the source sass files within the src/_sass directory 

| FILE: | |
| _variables.scss | various defaults that are called within the other files |
| _colors.scss | where the colors used throughout the project are |
| gtk/_apps.scss | calls program specific styles in the app directory |
| gtk/_tabs_widgets.scss | tabular styling |
| gtk/_colors-public | applies configured colors to variables used in other files |
| gtk/_granite.scss | toolbar styling |
| gtk/_sidebar_widget.scss | sidebar styling | 
| _drawing.scss | Animations |
| _common.scss | the bulk of the styling | 

---
### Rendering Modifications
In order to make the theme reflect the changes made to the scss files, you must render these files into the css files that GTK actually works with. To do this use the parse-sass.sh command
```bash
cd Dhumavati-Theme
 ./parse-sass.sh
```
Then just run the install script again and change your GTK theme in whatever manner you normally do so and KABANG! 

## Credits
The organization of this project and a lot of the code was originally written for the [Canvas-Theme](https://github.com/vinceliuice/Canvas-theme) by [vinceliuice](https://github.com/vinceliuice/) who has made a lot of themes for GTK that I quite enjoy. I choose Canvas in part because it fits my config's aesthetic and in part because it is the least appreciated theme offered by vinceliuice and really deserves more recognition that I hope I can lend it.Modifying that theme has taught me a lot about how to style GTK with sass files, revolutionizing my understanding of how to approach themes for GTK in general and for which I am most appreciative. 
