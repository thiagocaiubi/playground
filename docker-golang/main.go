package main

import (
	"fmt"
	"net/http"
	"net/http/httputil"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		req, _ := httputil.DumpRequest(r, false)
		fmt.Print(string(req))

		fmt.Fprint(w, "ok\n")
	})

	http.ListenAndServe(":8080", nil)
}
