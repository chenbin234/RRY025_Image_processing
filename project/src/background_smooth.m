function blurred_background = background_smooth(image, mask)

    % extracting rgb channels individually
    rChannel = image(:, :, 1);
    gChannel = image(:, :, 2);
    bChannel = image(:, :, 3);

    % define filter
    filter = fspecial("average", 15);

    % applying filter to the extracted matrices separately
    rChannelNew = filter2(filter, rChannel);
    gChannelNew = filter2(filter, gChannel);
    bChannelNew = filter2(filter, bChannel);

    % concatenate matrices along 3rd dimension
    outputImg = cat(3, rChannelNew, gChannelNew, bChannelNew);
    
    % convert the numeric matrix to image
    outputImg = mat2gray(outputImg);
    
    blurred_background = outputImg .* (1-mask);

%     figure
%     imshow(blurred_background)


end