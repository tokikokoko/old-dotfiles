const activate = (oni) => {
   // access the Oni plugin API here
   
   // for example, unbind the default `<c-p>` action:
   oni.input.unbind("<c-p>")

   // or bind a new action:
   oni.input.bind("<c-enter>", () => alert("Pressed control enter"));
};

module.exports = {
    activate,
    // change configuration values here:
    "ui.colorscheme": "onedark",
    "sidebar.enabled": true,
    "oni.useDefaultConfig": true,
    "oni.loadInitVim": true,
    "editor.fontSize": "14px",
    "editor.fontFamily": "Ricty Diminished For Powerline",
    "editor.completions.enabled": true
}
