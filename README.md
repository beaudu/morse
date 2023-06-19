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
The last command plays [this sound](morse.ogg).
