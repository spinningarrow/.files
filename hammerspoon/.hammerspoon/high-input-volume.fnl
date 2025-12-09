;; Easily set high input volume
(hs.hotkey.bind ["ctrl" "alt" "shift"] "I"
  (fn []
    (let [[success result error] [(hs.osascript.applescript "set volume input volume 95")]]
      (if success
        (hs.alert.show "Microphone volume set to 95%")
        (hs.alert.show "Error setting microphone volume")))))
