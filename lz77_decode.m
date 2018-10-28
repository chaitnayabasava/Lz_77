clc
clear
close all

x = input('Enter encodings : ', 's');
x = string(strsplit(x, ' '));
lz_decode(x);

function decode_string = lz_decode(encode)
    decode = [];
    decode_string = '';
    for i = 1:length(encode)
        split = strsplit(encode(i), ',');
        if(length(split)==3)
            split1 = strsplit(split(1), '(');
            split3 = strsplit(split(3), ')');
            split2 = double(split(2));
            
            for j = length(decode) + 1 - split2:length(decode) + 1 - split2 + double(split3(1)) - 1
                decode = [decode, decode(j)];
                decode_string = decode_string + decode(j);
            end
        else
            split2 = strsplit(split(2), ')');
            split1 = strsplit(split(1), '(');
            
            decode = [decode, split2(1)];
            decode_string = decode_string + split2(1);
        end
    end

    disp("Decoding : ");
    disp(decode_string);
end
