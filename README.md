# MORSE: International Morse Code
## morse.m
This function written in GNU Octave/Matlab language, translates a text into Morse code, as dot and dash string, binary vector or sound audio file. Giving a Morse code string as input, it translates back to the original text.

![International Morse Code](https://upload.wikimedia.org/wikipedia/commons/e/e9/International_Morse_code.png)

Examples:
```
> morse('SOS')
... --- ...
> s=morse('.-- .... .- -   .... .- - ....   --. --- -..   .-- .-. --- ..- --. .... - ..--..')
WHAT HATH GOD WROUGHT?
> morse('What Hath God Wrought?','audio')
```
The last command will play this sound:

https://github.com/beaudu/morse/assets/16031598/bde9d0b9-4072-444a-8cae-96d49fdeffce

which is the very first message sent by inventor Samuel F.B. Morse on May 24, 1844, over an experimental line from Washington, D.C., to Baltimore.

Type `doc morse` or `help morse` for syntax and options.
[![View Morse International Code on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://fr.mathworks.com/matlabcentral/fileexchange/154521-morse-international-code)

## Author
**François Beauducel**, [IPGP](www.ipgp.fr), [beaudu](https://github.com/beaudu), beauducel@ipgp.fr
