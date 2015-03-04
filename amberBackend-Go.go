package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"math"
	"net/http"
	"strconv"
	"strings"

	"github.com/hoisie/mustache"
)

type amberHandler struct {
	charTemplate *mustache.Template
	error404     string
	error415     string
}

func main() {
	serveAmber(8082)
}

func serveAmber(port int) {
	fmt.Println(port)
	template, err := mustache.ParseFile("AmberTemplate.html.ms")
	if err != nil {
		panic(err)
	} else {
		var handler = amberHandler{charTemplate: template, error404: "<!doctype html><html><head><meta charset='utf-8'><title>404 Error</title></head><body>Character Not Found</body></html>", error415: "<!doctype html><html><head><meta charset='utf-8'><title>Unsupported Media Type</title></head><body>This server only supports returning Amber characters, which cannot contain periods.</body></html>"}

		http.Handle("/", &handler)

		log.Fatal(http.ListenAndServe(":"+strconv.Itoa(port), nil))
	}
}

func (h *amberHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	var pathComponents = strings.Split(r.URL.Path, "/")
	var filename = pathComponents[len(pathComponents)-1]

	if strings.Contains(filename, ".") {
		pic, picErr := ioutil.ReadFile(filename)
		if picErr != nil {
			w.WriteHeader(415)
			w.Write([]byte(h.error415))
		} else {
			w.Write(pic)
		}
	} else {
		dat, err := ioutil.ReadFile(filename + ".json")
		if err != nil {
			w.WriteHeader(404)
			w.Write([]byte(h.error404))
		} else {
			var f interface{}
			err = json.Unmarshal(dat, &f)
			if err != nil {
				panic(err)
			}

			m := f.(map[string]interface{})
			attributeAuction := m["attributeAuction"].(map[string]interface{})

			for k, v := range attributeAuction {
				value := v.(float64)
				if strings.Contains(k, "Rank") {
					var rank string
					switch {
					case value < -2 && value > -4:
						rank = "Human"
					case value < -1 && value > -3:
						rank = "Demon"
					case value < 0 && value > -1:
						rank = "Chaos"
					case value == 0:
						rank = "Amber"
					default:
						var postfix = "th"
						var numString string
						if value-math.Floor(value) < 0.01 {
							var intValue = int(value)
							switch intValue {
							case 1:
								postfix = "st"
							case 2:
								postfix = "nd"
							case 3:
								postfix = "rd"
							}
							numString = strconv.Itoa(intValue)
						} else {
							numString = strconv.FormatFloat(value, 'f', 1, 64)
						}
						rank = numString + postfix
					}

					attributeAuction[k] = rank
				}
			}

			oldBioString := m["bio"].(string)
			bio := strings.Replace(oldBioString, "\n", "<br />", -1)
			m["bio"] = bio
			var result = h.charTemplate.Render(m)
			w.Write([]byte(result))
		}
	}
}
