;; Easily set high input volume
(hs.hotkey.bind ["ctrl" "alt" "shift"] "I"
  (fn []
    (local (success result err) (hs.osascript.applescript "set volume input volume 95"))
    (if success
      (hs.alert.show "Microphone volume set to 95%")
      (hs.alert.show "Error setting microphone volume"))))

;; Handle mailto links and copy to clipboard
(set hs.urlevent.mailtoCallback
  (fn [scheme host params fullURL]
    (local url (string.gsub fullURL "mailto:" ""))
    (local urlWithoutQuery (string.match url "([^?]*)"))
    (hs.pasteboard.setContents urlWithoutQuery)
    (local params (. (hs.http.urlParts url) :queryItems))
    (local subject
      (if params
        (let [matching-params
              (icollect [_ param (ipairs params)]
                (when (= (. param 1) "subject")
                  (. param 2)))]
          (or (. matching-params 1) ""))
        ""))
    (hs.alert.show (.. urlWithoutQuery "\n" subject))))

;; Clipboard helper
(spoon.SpoonInstall:andUse "ClipboardTool"
  {:start true
   :hotkeys {:toggle_clipboard [["ctrl" "alt" "shift"] "P"]}
   :config {:display_max_length 40
            :frequency 1
            :show_copied_alert false
            :show_in_menubar false
            :hist_size 10}})
