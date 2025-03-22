// Copyright 2010 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build ignore

package main

import (
	"example/web-service-gin/utils"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"regexp"
	"strconv"
	"time"

	"gorm.io/gorm"
)

type Articles struct {
	gorm.Model
	Title       string
	Body        string
	Author      string
	Category    int
	PublishTime time.Time
}

func createHandler(w http.ResponseWriter, r *http.Request) {

	var article Articles
	article = Articles{Title: "create"}
	renderTemplate2(w, "create", article)
}

func viewHandler(w http.ResponseWriter, r *http.Request) {

	var article []Articles
	records := utils.Mdb.Find(&article)
	if records.Error != nil {
		log.Fatal("failed to query users")
	}

	renderTemplate(w, "view", article)
}

func editHandler(w http.ResponseWriter, r *http.Request) {
	var article Articles
	id := r.URL.Query().Get("id")
	a := utils.Mdb.Where("id=?", id).First(&article)
	if a.Error != nil {
		http.Redirect(w, r, "/view", http.StatusFound)
	}
	renderTemplate2(w, "edit", article)
}

func saveHandler(w http.ResponseWriter, r *http.Request) {
	id, _ := strconv.Atoi(r.FormValue("id"))
	title2 := r.FormValue("title")
	body := r.FormValue("body")
	author := r.FormValue("author")
	category, err := strconv.Atoi(r.FormValue("category"))
	if err != nil {
		// 如果转换出错，例如字符串不是有效的整数表示，err将不为nil
		fmt.Println("转换错误:", err)
		return
	}

	if id > 0 {
		p := Articles{Title: title2, Body: body, Author: author, Category: category}
		res1 := utils.Mdb.Model(&Articles{}).Where("id=?", id).Updates(&p)
		if res1.Error == nil {
			http.Redirect(w, r, "/view", http.StatusFound)
		} else {
			fmt.Printf("res.RowsAffected: %v\n", res1.RowsAffected)
			return
		}
	} else {
		public_time := time.Now()
		p := Articles{Title: title2, Body: body, Author: author, Category: category, PublishTime: public_time}
		res2 := utils.Mdb.Create(&p)

		if res2.Error == nil {
			http.Redirect(w, r, "/view", http.StatusFound)
		} else {
			fmt.Printf("res.RowsAffected: %v\n", res2.RowsAffected)
			return
		}
	}

}

var templates = template.Must(template.ParseFiles("edit.html", "view.html", "create.html"))

func renderTemplate(w http.ResponseWriter, tmpl string, p []Articles) {
	err := templates.ExecuteTemplate(w, tmpl+".html", p)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
func renderTemplate2(w http.ResponseWriter, tmpl string, p Articles) {
	err := templates.ExecuteTemplate(w, tmpl+".html", p)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

var validPath = regexp.MustCompile("^/(edit|save|view|create)/([a-zA-Z0-9]+)$")

func makeHandler(fn func(http.ResponseWriter, *http.Request)) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		//m := validPath.FindStringSubmatch(r.URL.Path)
		// if m == nil {
		// 	//http.NotFound(w, r)
		// 	//return
		// }
		fn(w, r)
	}
}

func main() {
	http.HandleFunc("/create", makeHandler(createHandler))
	http.HandleFunc("/view", makeHandler(viewHandler))
	http.HandleFunc("/edit", makeHandler(editHandler))
	http.HandleFunc("/save", makeHandler(saveHandler))
	utils.ConnectDB()
	log.Fatal(http.ListenAndServe(":8080", nil))
}
