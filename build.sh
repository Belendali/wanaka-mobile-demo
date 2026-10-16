#!/bin/sh
# app.html is the page fragment (also published as a Claude Artifact).
# This wraps it into a standalone index.html for GitHub Pages / opening locally.
cd "$(dirname "$0")" || exit 1
{
  cat <<'HEAD'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#140E10">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<style>:root{padding-top:env(safe-area-inset-top);padding-bottom:env(safe-area-inset-bottom)}img{max-width:100%}[hidden]{display:none!important}</style>
HEAD
  cat app.html
  printf '\n</html>\n'
} > index.html
echo "built index.html"
