function varargout=morse(x,varargin)
%MORSE International Morse Code
%   MORSE(TEXT) displays the string TEXT in Morse Code, using characters 
%   dot, dash and space.
%
%   MORSE(TEXT,'audio') plays the sound in Morse Code when no output 
%   argument is given (if the computer has audio). Function uses default
%   800Hz sin-wave signal with 0.1s interval unit, 8kHz frequency sampling.
%
%   [Y,FS]=MORSE(TEXT,'audio') returns audio data Y and sample rate FS (in
%   Hz). Audio sequence can be played using sound(Y,FS) or written as audio
%   file using audiowrite(FILENAME,Y,FS).
%
%   MORSE(TEXT,'binary') returns the Morse Code as numerical vector 
%   containing values of 0 or 1, each element corresponds to a unit length.
%
%   MORSE(CODE) will decode the Morse Code string CODE, interpreting dots,
%   dashes and spaces. One space between letters, at least 2 spaces between 
%   words. MORSE(CODE,'decode') forces the decode mode if the CODE string 
%   contains unvalid characters.
%
%
%   Reference: https://en.wikipedia.org/wiki/Morse_code
%
%   Author: Fran�ois Beauducel
%   Created: 2023-06-17
%   Updated: 2023-06-20

% table of characters
d = { ...
    ' ',' ';
    'A','.-';
    'B','-...';
    'C','-.-.';
    'D','-..';
    'E','.';
    'F','..-.';
    'G','--.';
    'H','....';
    'I','..';
    'J','.---';
    'K','-.-';
    'L','.-..';
    'M','--';
    'N','-.';
    'O','---';
    'P','.--.';
    'Q','--.-';
    'R','.-.';
    'S','...';
    'T','-';
    'U','..-';
    'V','...-';
    'W','.--';
    'X','-..-';
    'Y','-.--';
    'Z','--..';
    '0','-----';
    '1','.---';
    '2','..---';
    '3','...--';
    '4','....-';
    '5','.....';
    '6','-....';
    '7','--...';
    '8','---..';
    '9','----.';
    '.','.-.-.-';
    ',','--..--';
    '?','..--..';
    '''','.----.';
    '!','-.-.--';
};

% sound constants
tone = 800; % tone frequency (Hz)
unit = 0.1; % unit duration (s)
fs = 8000; % sampling rate (Hz), must be multiple of tone to avoid gliches

% options
bin = any(strcmpi(varargin,'binary'));
wav = any(strcmpi(varargin,'audio'));
inv = isempty(regexp(x,'[^-. ]','once')) || any(strcmpi(varargin,'decode'));

if ~inv
    % converts text string in Morse code cell array
    [~,kb] = ismember(upper(x(:)),d(:,1));

    % any unknown character replaced by space
    kb(kb<1) = 1;

    % makes Morse code string
    s = strjoin(d(kb,2),' ');
else
    xx = strsplit(x,'\s\s+','DelimiterType','regularexpression'); % split the words
    s = cell(1,length(xx));
    for n = 1:length(xx)
        [ka,kb] = ismember(strsplit(xx{n},' '),d(:,2)); % search for letters
        kb(kb<1) = []; % unknown sequences are ignored
        ss = repmat(' ',1,length(ka));
        ss(ka) = char(d{kb,1});
        s{n} = ss;
    end
    s = strjoin(s); % appends the words
end
    
if bin || wav
    b = strrep(s,'.','10'); % dot is 1 unit length + 1 unit space
    b = strrep(b,'-','1110'); % dash is 3 units length + 1 unit space
    b = strrep(b,'   ','0000000'); % space between words is 7 units
    b = strrep(b,' ','00'); % space beween letters is 3 units (1 already added)
    w = logical(str2num(b(:))');
    if wav
        y = bin2wav(w,fs,tone,unit);
    end
end

if nargout > 0
    if wav
        varargout{1} = y;
        varargout{2} = fs;
    elseif bin
        varargout{1} = w;
    else
        varargout{1} = s;
    end
else
    if wav
        sound(y,fs);
    elseif bin
        disp(b)
    else
        disp(s)
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = bin2wav(x,fs,tone,unit)
% makes an audio signal from x

n = round(unit*fs); % number of samples in a unit
m = length(x); % number of units
y = zeros(n,m); % makes a matrix of flat signal
s = linspace(0,2*pi*tone*unit,n+1)';
y(:,x) = repmat(sin(s(1:end-1)),1,sum(x));
y = y(:);
