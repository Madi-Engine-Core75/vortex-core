# i18n: Translations and guidelines

This folder contains machine-generated starter translations for supported locales.

Supported locales:
- en (English)
- fr (French)
- es (Spanish)
- zh-CN (Chinese Simplified)
- ru (Russian)
- it (Italian)
- ar (Arabic)
- ko (Korean)
- ja (Japanese)

Notes:
- These translations are machine-generated as a starting point. Review and correct them before shipping to production.
- To add a new key: add the message ID to i18n/en.json and provide translations in other locale files.
- The Go gateway uses github.com/nicksnyder/go-i18n/v2; initialize the bundle with apps/gateway/internal/i18n.Init("apps/gateway/i18n").
