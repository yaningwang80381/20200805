%% please use the loop if there are more than one test data
%for i = 1:52
filename = strcat('C:\Users\ThinkPad\Downloads\0501_1\',num2str(i),'.npy');

[arrayShape, dataType, fortranOrder, littleEndian, totalHeaderLength, npyVersion] = readNPYheader(filename);

if fortranOrder
    f = memmapfile(filename, 'Format', {dataType, arrayShape, 'd'}, 'Offset', totalHeaderLength);
    image(f.Data.d)
else 
    f = memmapfile(filename, 'Format', {dataType, arrayShape(end:-1:1), 'd'}, 'Offset', totalHeaderLength);
    
    tmp = f.Data.d;
    img = permute(tmp, length(arrayShape):-1:1); 
    img = reshape(img,[256,256]);
    imshow(img,[])%
end
%end
