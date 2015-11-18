function obj = setup(inputFile)
    % tao bien objects doc file video. Bien object doc qua tung frame
    % video, khoi tao video file to reader
    
    obj.reader = vision.VideoFileReader(inputFile);

    % tao 2 bien player video, 1 de hien thi video mau, 2 hien thi video
    % voi forground anh noi
    obj.videoPlayer = vision.VideoPlayer('Position', [20, 200, 600, 400]);
    obj.maskPlayer = vision.VideoPlayer('Position', [740, 200, 600, 400]);

    obj.blobAnalyser = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
        'AreaOutputPort', true, 'CentroidOutputPort', true, 'MinimumBlobArea', 300);
end

