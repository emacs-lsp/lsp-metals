lsp-metals
=========

<img align="right" width="64" alt="metals_logo" src="images/logo.png">

[![CI](https://github.com/emacs-lsp/lsp-metals/workflows/CI/badge.svg)](https://github.com/emacs-lsp/lsp-metals/actions)
[![Gitter](https://badges.gitter.im/emacs-lsp/lsp-mode.svg)](https://gitter.im/emacs-lsp/lsp-mode)

Emacs Scala IDE using [lsp-mode](https://github.com/emacs-lsp/lsp-mode) to connect to [Metals](https://scalameta.org/metals).

## Quickstart

An example to setup `lsp-metals` using `use-package`:

```elisp
(use-package lsp-metals
  :ensure t
  :custom
  ;; Metals claims to support range formatting by default but it supports range
  ;; formatting of multiline strings only. You might want to disable it so that
  ;; emacs can use indentation provided by scala-mode.
  (lsp-metals-server-args '("-J-Dmetals.allow-multiline-string-formatting=off"))
  :hook ((scala-mode . lsp)
         ;; Optional: run scalafix rules on the current buffer before saving
         ;; requires metals >= v0.11.7.
         (scala-mode . lsp-metals-run-scalafix-rules-on-save)))
```
