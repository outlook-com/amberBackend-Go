package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"testing"

	"github.com/hoisie/mustache"
)

func TestMain(m *testing.M) {
	template, err := mustache.ParseFile("AmberTemplate.html.ms")
	if err != nil {
		panic(err)
	} else {
		var handler = amberHandler{charTemplate: template, error404: "<!doctype html><html><head><meta charset='utf-8'><title>404 Error</title></head><body>Character Not Found</body></html>", error415: "<!doctype html><html><head><meta charset='utf-8'><title>Unsupported Media Type</title></head><body>This server only supports returning Amber characters, which cannot contain periods.</body></html>"}

		http.Handle("/", &handler)

		go http.ListenAndServe(":8083", nil)
	}
	os.Exit(m.Run())
}

func TestBackend(t *testing.T) {
	resp, err := http.Get("http://localhost:8083/Trevor")

	if err != nil {
		fmt.Println("Failed to get:", err)
		t.FailNow()
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		t.FailNow()
	}

	dat, err := ioutil.ReadFile("Trevor.html")
	if err != nil {
		t.FailNow()
	}

	if !bytes.Equal(dat, body) {
		t.FailNow()
	}
}
