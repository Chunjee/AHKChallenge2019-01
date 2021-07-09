SetBatchLines -1 ; Go as fast as CPU will allow
#NoTrayIcon
#SingleInstance force

; Includes
#Include %A_ScriptDir%\node_modules
#Include biga.ahk\export.ahk

; inputs
inputs := [ ".- ..- - --- .... --- - -.- . -.--"
	, ".... . .-.. .--. . .-. ... / .- .-. . / .- .-- . ... --- -- ."
	, ".--- .- -. ..- .- .-. -.-- / - .-- . -. - -.-- / - .-- . -. - -.--" ]

; Map values
morseCodeArray := [{c: "A", m: ".-"}
	,{c: "B", m: "-..."}
	,{c: "C", m: "-.-."}
	,{c: "D", m: "-.."}
	,{c: "E", m: "."}
	,{c: "F", m: "..-."}
	,{c: "G", m: "--."}
	,{c: "H", m: "...."}
	,{c: "I", m: ".."}
	,{c: "J", m: ".---"}
	,{c: "K", m: "-.-"}
	,{c: "L", m: ".-.."}
	,{c: "M", m: "--"}
	,{c: "N", m: "-."}
	,{c: "O", m: "---"}
	,{c: "P", m: ".--."}
	,{c: "Q", m: "--.-"}
	,{c: "R", m: ".-."}
	,{c: "S", m: "..."}
	,{c: "T", m: "-"}
	,{c: "U", m: "..-"}
	,{c: "V", m: "..-"}
	,{c: "W", m: ".--"}
	,{c: "X", m: "-..-"}
	,{c: "Y", m: "-.--"}
	,{c: "Z", m: "--.."}
	,{c: "0", m: "-----"}
	,{c: "1", m: ".----"}
	,{c: "2", m: "..---"}
	,{c: "3", m: "...--"}
	,{c: "4", m: "....-"}
	,{c: "5", m: "....."}
	,{c: "6", m: "-...."}
	,{c: "7", m: "--..."}
	,{c: "8", m: "---.."}
	,{c: "9", m: "----."}
	,{c: " ", m: "/"}
	,"end"]


;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
; MAIN
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/

loop, % inputs.Count() {
	msgbox, % fn_decodeMorse(inputs[A_Index], morseCodeArray)
}
ExitApp


;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
; Functions
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/

fn_decodeMorse(param_string, param_mapping)
{
	A := new biga()
	outputArray := []
	array := A.split(param_string, " ")
	
	; for each character in the input string, search the map and push the **c**haracter property onto an output array
	for i, value in array {
		morseObj := A.find(param_mapping, {"m": value}) ; find the element by searching for the morse code character
		outputArray.push(morseObj.c) ; push the corrisponding **c**haracter property onto an output array
	}
	return A.join(outputArray, "") ; join the output array into a msgbox-able string
}
