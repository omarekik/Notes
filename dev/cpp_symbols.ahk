; This AutoHotkey script is designed for C++ developers using a German QWERTZ keyboard layout.
; It remaps German-specific characters (ö, ä, ü, Ö, Ä, Ü)—which are rarely used in programming—
; to frequently used C++ symbols such as {, }, [, ], \, and ~.
; These symbols are typically typed with the right hand and often require pressing multiple keys,
; such as AltGr (also with the right hand) or Ctrl + Alt with the left hand, which  interrupt typing flow,
; so this remapping improves typing efficiency and ergonomics during coding.

#Requires AutoHotkey v2.0

ö::Send("{ASC 123}")  ; ö → {
ä::Send("{ASC 125}")  ; ä → }
Ö::Send("{ASC 91}")   ; Ö → [
Ä::Send("{ASC 93}")   ; Ä → ]
ü::Send("{ASC 92}")   ; ü → \
Ü::Send("{ASC 126}")  ; Ü → ~ 
