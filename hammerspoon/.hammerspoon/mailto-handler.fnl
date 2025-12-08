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
