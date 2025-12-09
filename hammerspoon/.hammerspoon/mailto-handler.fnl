;; Copy mailto links to clipboard
(set hs.urlevent.mailtoCallback
  (fn [scheme host params full-url]
    (let [url (string.gsub full-url "mailto:" "")
          url-without-query (string.match url "([^?]*)")
          params (. (hs.http.urlParts url) :queryItems)
          subject (if params
                    (let [matching-params
                          (icollect [_ param (ipairs params)]
                            (when (= (. param 1) "subject")
                              (. param 2)))]
                      (or (. matching-params 1) ""))
                    "(no subject)")]
      (hs.pasteboard.setContents url-without-query)
      (hs.alert.show (.. url-without-query "\n" subject)))))
