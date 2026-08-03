package i18n

import (
	"encoding/json"
	"os"
	"path/filepath"

	"github.com/nicksnyder/go-i18n/v2/i18n"
	"golang.org/x/text/language"
)

var Bundle *i18n.Bundle

func Init(basePath string) error {
	Bundle = i18n.NewBundle(language.English)
	Bundle.RegisterUnmarshalFunc("json", json.Unmarshal)

	files := []string{"en.json","fr.json","es.json","zh-CN.json","ru.json","it.json","ar.json","ko.json","ja.json"}
	for _, f := range files {
		p := filepath.Join(basePath, f)
		if _, err := os.Stat(p); err == nil {
			if _, err := Bundle.LoadMessageFile(p); err != nil {
				return err
			}
		}
	}
	return nil
}

func Localize(lang, id string, data map[string]interface{}) string {
	loc := i18n.NewLocalizer(Bundle, lang)
	msg, err := loc.Localize(&i18n.LocalizeConfig{MessageID: id, TemplateData: data})
	if err != nil {
		// fallback to ID
		return id
	}
	return msg
}
