# MORSE: Morse International Code
This function translates a text into Morse code, as dot and dash string, binary vector or sound audio file. Giving a Morse code string as input, it translates back to the original text.

![International Morse Code](https://upload.wikimedia.org/wikipedia/commons/e/e9/International_Morse_code.png)

Examples:
```
>> morse('SOS')
... --- ...
>> s=morse('.-- .... .- -   .... .- - ....   --. --- -..   .-- .-. --- ..- --. .... - ..--..')
WHAT HATH GOD WROUGHT?
>> morse(s,'audio')
```
The last command plays this sound: <audio src="morse.ogg" controls preload></audio>, which is the very first message sent by inventor Samuel F.B. Morse on May 24, 1844, over an experimental line from Washington, D.C., to Baltimore.

Type `doc morse` or `help morse` for syntax and options.

## Author
**François Beauducel**, [IPGP](www.ipgp.fr), [beaudu](https://github.com/beaudu), beauducel@ipgp.fr
