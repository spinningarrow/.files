;; Show/hide Terminal.app
(hs.hotkey.bind ["cmd" "shift"] "space"
  (fn []
    (let [focused-app (hs.application.frontmostApplication)
          id "com.apple.Terminal"]
       (if (= (focused-app:bundleID) id)
         (focused-app:hide)
         (hs.application.launchOrFocusByBundleID id)))))
