
---

# `convert9000 (or con)` – A Universal CLI File Conversion Interface

`con` is a **zsh script** that acts as a **unified interface layer** between the user and various file conversion programs. Instead of learning a new command for each tool, you use one simple syntax — and `con` takes care of the rest.

It will even **prompt you to install any missing dependencies** automatically, making free, open-source, offline, and maximally ergonomic filetype conversion effortless.

---

##  Features

* **One syntax for everything** – no more hunting down obscure tool options
* **Automatic dependency detection & install prompts** – so you can focus on your work
* **Offline, open-source tools first** – no cloud lock-in
* **Simple defaults** – makes the most obvious conversion easy
* *(Coming soon)* **Globs & regex support** for batch conversions

---

## 🚀 Usage

```bash
con inputFile.any outputFile.other
```

That’s it. `con` figures out which backend program to call for you.

Examples:

```bash
con photo.png photo.jpg
con report.docx report.pdf
```

---

## 🎯 Philosophy

`con` isn’t trying to cover every single possible way you might need to convert a file.
Its goal is to make **the default, most obvious conversion path simple and uniform**.

If you need advanced tuning or exotic conversions, you can still call the underlying tools directly.

---

## 🗓 Roadmap

* ✅ Single-file conversions
* 🔜 Glob/regex support for batch conversion
* 🔜 More built-in filetype mappings

---

## 🤝 Contributing

Requests for additional filetypes or features are **welcome** — open an issue or discussion.
Pull requests are also **encouraged**!

---

## 📜 License

[MIT](LICENSE)
