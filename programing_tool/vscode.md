# vscode setting
```
{
    "python.linting.flake8Enabled": true,
    "python.formatting.provider": "yapf",
    "python.linting.pylintArgs": [
        "--load-plugins",
        "pylint_django",
    ],
    "files.exclude": {
        "*.metadata": true, 
        "*.settings": true,
        "**/*.pyc": true,
        "**/__pycache__/**": true,
        "frontend/dist/**": true,
        "frontend/node_modules/**": true
    },
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.snippetSuggestions": "top",
    "window.zoomLevel": -1,
    "workbench.iconTheme": "vscode-great-icons",
    "editor.renderWhitespace": "all",
    "editor.renderControlCharacters": true,
    "editor.renderIndentGuides": true,
    "editor.formatOnPaste": true,
    "workbench.statusBar.feedback.visible": false,
    "explorer.confirmDelete": false,
    "files.eol": "\n",
    "workbench.colorTheme": "Monokai",
    "[php]": {},
    "autoDocstring.docstringFormat": "google",
    "python.linting.flake8Args": [
        "--max-line-length=120"
    ]
}
```
