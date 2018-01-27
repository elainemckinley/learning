(ns foo.core
  (:require [clj-http.client :as client]))

(defn -main
  "Prints your IP address."
  [& args]
  (println (apply str
                (:body (client/get "http://ipecho.net/plain")))))
