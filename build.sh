#!/bin/sh
# app.html is the page fragment (also published as a Claude Artifact).
# This wraps it into standalone pages for GitHub Pages / opening locally:
#   index.html — original Create
#   chat.html  — Chat version of Create (Figma section 1028)
#   onboarding.html / chat-onboarding.html — the same two, starting from the welcome + sign-in flow
#   (the others start signed in). The switch in the demo moves between all four
#   1105.html — board "mobile1105 v.0", from app-1105.html (old pages stay as they were)
#   1110.html — board "1109 V1.1", from app-1110.html (self-contained, no WK_VER switch)
#   me.html   — the 4 Me versions (boards "1118" final + exploration), from app-me.html; screens in media/me/
#   play.html — play & comment, portrait (board "1117 create" P1–P10), from app-play.html; screens in media/play/
#   me1119.html — Me with physics 3D stickers + Edit stickers list + Library + Edit avatar (board "1119 Me"), from app-me1119.html; media/me1119/
#   1122.html — launch version, all tabs (board "1122 V0.0"), from app-1122.html; screens in media/1122/
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
  case "$1" in chat*|1105) printf "<script>window.WK_VER='chat'</script>\n" ;; esac
  case "$1" in *onb) printf "<script>window.WK_ONB=1</script>\n" ;; esac
  case "$1" in 1105) cat app-1105.html ;; 1110) cat app-1110.html ;; me) cat app-me.html ;; play) cat app-play.html ;; me1119) cat app-me1119.html ;; 1122) cat app-1122.html ;; *) cat app.html ;; esac
  printf '\n</html>\n'
}
page > index.html
page chat > chat.html
page onb > onboarding.html
page chat-onb > chat-onboarding.html
# 1105.html — the latest board (Figma section "mobile1105 v.0"), built from app-1105.html.
# One page; the onboarding toggle in the left panel switches it in place (#onboarding)
page 1105 > 1105.html
# 1110.html — Figma section "1109 V1.1": new card, Home with temp links, minimizing tab bar
page 1110 > 1110.html
# me.html — Me page, 4 versions (final 1118 + ME-B / ME-C / ME-D), #f #b #c #d picks one
page me > me.html
# play.html — play & comment user journey, portrait; #1–#10 opens a step
page play > play.html
# me1119.html — board "1119 Me": stickers fall in, tap to toss; #edit #lib #a1–#a4 open a screen
page me1119 > me1119.html
# 1122.html — board "1122 V0.0": the launch version, all tabs; #top #libG #createP #earn … open a screen
page 1122 > 1122.html
echo "built index.html + chat.html + onboarding.html + chat-onboarding.html + 1105.html + 1110.html + me.html + play.html + me1119.html + 1122.html"
