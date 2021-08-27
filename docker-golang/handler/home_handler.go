package handler

import "net/http"

// HomeHandler sends ok response
func HomeHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("ok\n"))
}
