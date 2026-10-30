#!/bin/sh
# app.html is the page fragment (also published as a Claude Artifact).
# This wraps it into standalone pages for GitHub Pages / opening locally:
#   index.html — original Create
#   chat.html  — Chat version of Create (Figma section 1028)
#   onboarding.html — welcome + sign-in flow; the other two start signed in. The switch in the demo moves between all three
cd "$(dirname "$0")" || exit 1
page() {
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
  [ "$1" = chat ] && printf "<script>window.WK_VER='chat'</script>\n"
  [ "$1" = onb ] && printf "<script>window.WK_ONB=1</script>\n"
  cat app.html
  printf '\n</html>\n'
}
page > index.html
page chat > chat.html
page onb > onboarding.html
echo "built index.html + chat.html + onboarding.html"
