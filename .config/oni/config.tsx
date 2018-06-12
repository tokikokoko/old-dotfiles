import * as React from "path/to/react"
import * as Oni from "path/to/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    oni.input.unbind("<C-p>")
    oni.input.unbind("<S-C-p>")
    const isNormalMode =
        () => oni.editors.activeEditor.mode === "normal"
    oni.input.bind("<C-:>", "commands.show", isNormalMode)
}

export const configration = {
    activate,
    "autoClosingPairs.enabled": false,
    "commandline.mode": false,
    "editor.errors.slideOnForce": false,
    "editor.fontFamily": "Cica, Dejavu Sans Mono, MS Gothic",
    "editor.fontLigatures": false,
    "editor.fontSize": "12px",
    "editor.linePadding": 1,
    "editor.quickInfo.enabled": false,
    "editor.scrollBar.visible": false,
    "oni.loadInitVim": true,
    "oni.hideMenu": true,
    "oni.useDefaultConfig": false,
    "sidebar.enabled": false,
    "statusbar.enabled": false,
    "tabs.mode": "native",
    "ui.animations.enabled": true,
    "ui.colorscheme": "solarized8_light",
    "ui.fontSmoothing": "auto",
}
