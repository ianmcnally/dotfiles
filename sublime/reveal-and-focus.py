# Move to /Packages/User
# exposes command: reveal_and_focus
# for use in key commands
import sublime, sublime_plugin

class RevealAndFocusCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("reveal_in_side_bar")
        self.window.run_command("focus_side_bar")
