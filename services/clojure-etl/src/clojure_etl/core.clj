(ns clojure-etl.core
  (:gen-class)
  (:require [ring.adapter.jetty :refer [run-jetty]]))

(defn handler [_]
  {:status 200
   :headers {"Content-Type" "text/plain"}
   :body "Clojure ETL Service"})

(defn -main [& _]
  (let [port 3013]
    (println "Clojure ETL Service running on port" port)
    (run-jetty handler {:port port})))
