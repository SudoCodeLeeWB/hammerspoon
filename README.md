
# Hammerspoon Application Handler

This project enhances Hammerspoon's functionality with two primary use cases: opening new application instances and finding/opening files based on file extensions. This can be particularly useful for improving your macOS workflow.

## Use Cases

### 1. Opening New Application Instances

**Syntax:** `new: <application name>`

- **Description:** This command attempts to open a new instance of the specified application.
- **Behavior:**
  - If the application supports multiple windows (as indicated by the "New Window" option in the macOS dock), a new window is created and focused.
  - If the application does not support new instances, it will focus the already open window instead.

### 2. Finding and Opening Files

**Syntax:** `find: <path>, <file name>`

- **Description:** This command allows for file browsing and opening, starting from your home directory.
- **Path Autocompletion:**
  - When typing the `<path>`, a dropdown will suggest directories within the current entered path, similar to terminal directory autocompletion.
  - Use the `Tab` key to switch focus from the input textbox to the dropdown.
  - Once a directory is selected, the path autocompletion will repeat until a `,` is entered.
  - After the `,`, only files within the current directory will be listed. Use the `Tab` key again to switch to the dropdown and select the desired file.

- **Opening Files:** The file will open based on its extension, following macOS's default file association rules (similar to Finder).

## Installation

1. Clone this repository to your local machine.
2. Install Hammerspoon if you haven't already from [Hammerspoon.org](https://www.hammerspoon.org/).
3. Add the provided `.lua` file to your Hammerspoon configuration folder (`~/.hammerspoon/`).
4. **Important:** To allow the script to access your file system, you must grant Hammerspoon **Full Disk Access** in macOS:
   - Open **System Preferences** → **Security & Privacy** → **Privacy** tab.
   - Select **Full Disk Access** from the list on the left.
   - Add **Hammerspoon** to the list by clicking the "+" button and selecting the Hammerspoon app.
5. Reload Hammerspoon to activate the functionality.

## How It Works

This script uses Hammerspoon to automate the process of creating new windows for supported applications or opening files by extension. It improves productivity by providing autocompletion for directory and file navigation, making it easier to find and open files without relying solely on Finder.
