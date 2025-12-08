(hs.hotkey.bind ["ctrl" "alt" "shift"] "I"
  (fn []
    (local (success result err) (hs.osascript.applescript "set volume input volume 95"))
    (if success
      (hs.alert.show "Microphone volume set to 95%")
      (hs.alert.show "Error setting microphone volume"))))
