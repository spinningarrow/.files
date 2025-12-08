(spoon.SpoonInstall:andUse "ClipboardTool"
  {:start true
   :hotkeys {:toggle_clipboard [["ctrl" "alt" "shift"] "P"]}
   :config {:display_max_length 40
            :frequency 1
            :show_copied_alert false
            :show_in_menubar false
            :hist_size 10}})
