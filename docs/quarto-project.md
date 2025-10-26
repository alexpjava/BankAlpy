# 📘 Project Documentation with Quarto

## 🌐 What is Quarto?

[**Quarto**](https://quarto.org/) is an open-source scientific and technical publishing system that lets you create documents, presentations, and websites from **Markdown (`.md`)** or **Quarto (`.qmd`)** files.

It’s designed for **reproducible documentation**, meaning you can mix code, text, and output (such as charts or tables) in a single file — perfect for technical projects, reports, and developer documentation.

---

## ⚙️ How Quarto Works

Quarto processes `.qmd` or `.md` files and converts them into a final format such as **HTML, PDF, Word, or slides**.  
It’s similar to Markdown, but more powerful thanks to its **YAML header** and **built-in rendering engine**.

### 🧩 Basic Structure of a `.qmd` File

```markdown
---
title: "My Project Documentation"
author: "Teoria BankAlpy"
format: html
---

# Introduction

This is a Quarto document.  
You can write Markdown text, include images, and even run code blocks.

```{python}
print("Hello from Python!")
```
```

### 🔍 Explanation

* The `---` section at the top is called the **YAML header**.  
  It defines metadata (title, author, format, etc.).
* Below the header, you write **regular Markdown**, but you can also embed code blocks with `{}` to execute them dynamically.

---

## 🛠 How to Render Your Documentation

### 1. Install Quarto

You can [download Quarto](https://quarto.org/docs/get-started/) for your system or install it via terminal:

```bash
# macOS or Linux
brew install quarto

# Windows (PowerShell)
winget install quarto
```

### 2. Render Your Files

To convert a `.qmd` or `.md` file into an HTML page:

```bash
quarto render myfile.qmd
```

You’ll get an output file (like `myfile.html`) in the same directory.

If your project contains multiple files, Quarto can automatically build the entire site:

```bash
quarto preview
```

This command launches a local web server and updates the site automatically when you modify files.

---

## 🌍 Publishing a Website with Quarto

You can publish your documentation as a **static website** directly from your repository.

### Example Project Structure

```
project/
├── index.qmd
├── setup.qmd
├── architecture.qmd
├── uml.qmd
└── _quarto.yml
```

The `_quarto.yml` file defines how your site is organized:

```yaml
project:
  type: website

website:
  title: "BankAlpy Project"
  navbar:
    left:
      - text: "Setup"
        href: setup.qmd
      - text: "Architecture"
        href: architecture.qmd
      - text: "UML"
        href: uml.qmd
```

Then, to publish your site:

```bash
quarto publish gh-pages
```

---

## ✅ Benefits of Quarto

* Write once, publish anywhere (**HTML, PDF, DOCX, Reveal.js slides, etc.**)
* Combine **Markdown + Code + Output** in one file.
* Automatically generate professional websites and docs.
* Integrates with **R, Python, Julia, and Observable JS**.
* Perfect for **developer documentation** and **data-driven reports**.