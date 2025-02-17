[![MELPA](https://melpa.org/packages/lsp-metals-badge.svg)](https://melpa.org/#/lsp-metals)
[![MELPA Stable](https://stable.melpa.org/packages/lsp-metals-badge.svg)](https://stable.melpa.org/#/lsp-metals)

<a><img align="right" width="12%" alt="metals_logo" src="images/logo.png"></a>
# lsp-metals

[![CI](https://github.com/emacs-lsp/lsp-metals/workflows/CI/badge.svg)](https://github.com/emacs-lsp/lsp-metals/actions)
[![Gitter](https://badges.gitter.im/emacs-lsp/lsp-mode.svg)](https://gitter.im/emacs-lsp/lsp-mode)

Emacs Scala IDE using [lsp-mode](https://github.com/emacs-lsp/lsp-mode) to connect to [Metals](https://scalameta.org/metals).

## Quickstart

An example to setup `lsp-metals` using `use-package`:

```elisp
(use-package lsp-metals
  :ensure t
  :custom
  ;; You might set metals server options via -J arguments. This might not always work, for instance when
  ;; metals is installed using nix. In this case you can use JAVA_TOOL_OPTIONS environment variable.
  (lsp-metals-server-args '(;; Metals claims to support range formatting by default but it supports range
                            ;; formatting of multiline strings only. You might want to disable it so that
                            ;; emacs can use indentation provided by scala-mode.
                            "-J-Dmetals.allow-multiline-string-formatting=off"
                            ;; Enable unicode icons. But be warned that emacs might not render unicode
                            ;; correctly in all cases.
                            "-J-Dmetals.icons=unicode"))
  ;; In case you want semantic highlighting. This also has to be enabled in lsp-mode using
  ;; `lsp-semantic-tokens-enable' variable. Also you might want to disable highlighting of modifiers
  ;; setting `lsp-semantic-tokens-apply-modifiers' to `nil' because metals sends `abstract' modifier
  ;; which is mapped to `keyword' face.
  (lsp-metals-enable-semantic-highlighting t)
  :hook (scala-mode . lsp))
```
