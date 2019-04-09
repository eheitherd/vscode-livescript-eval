# LiveScript Eval
Evaluate selected LiveScript code.

[![Build Status][build-img]][build-url]
[![GitHub license][license-img]][license-url]

![LiveScript Eval Sample](./sample.gif)

## Features

* Evaluates selected LiveScript code.
* If evaluation result is a function, re-evaluate it with input arguments.
* Supports re-evaluation of curried functions.
* Evaluation in the context of Visual Studio Code.

## Usage

1. Open or create a LiveScript source file
1. Select code which you want to evaluate
1. Press `Ctrl(Cmd)+K Ctrl(Cmd)+E` or<br>Execute from command palette (See below)
  1. Press `F1` or `Ctrl(Cmd)+Shift+P`
  1. Type `lie`
  1. pick `LiveScript Eval`

[build-img]: https://travis-ci.org/eheitherd/vscode-livescript-eval.svg?branch=master
[build-url]: https://travis-ci.org/eheitherd/vscode-livescript-eval
[license-img]: https://img.shields.io/badge/license-MIT-blue.svg
[license-url]: https://raw.githubusercontent.com/eheitherd/vscode-livescript-eval/master/LICENSE
