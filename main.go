package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
)

const DEFAULT_PORT = 8080

func main() {
	var port int = DEFAULT_PORT
	var err error

	sport := os.Getenv("PORT")

	if sport != "" {
		port, err = strconv.Atoi(sport)

		if err != nil {
			panic(err)
		}
	}

	log.Printf("Running server on:%d", port)

	http.HandleFunc("/", rootHandler)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi there %s!", r.URL.Path[1:])
	log.Println("served request.")
}

func checkErr(err error) {
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
