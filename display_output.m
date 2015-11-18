function display_output(obj, frame, mask, tracks)
    % chuyen frame va anh nen mask ve dinh dang RGB.
    frame = im2uint8(frame);
    
    mask = uint8(repmat(mask, [1, 1, 3])) .* 255;

    minVisibleCount = 8;
    
    if ~isempty(tracks)
        
        % cac phat hien ve su nhieu co xu huong thoi gian song ngan. va
        % chung toi chi hien thi tracks nao co so luong nhin thay lon hon
        % diem MIN dinh truoc cua cac frames
        reliableTrackInds = [tracks(:).total_visible_count] > minVisibleCount;
        
        reliableTracks = tracks(reliableTrackInds);

        % tai day. Chung toi se hien thi doi tuong, neu doi tuong do khong
        % dc phat hien trong frame hien tai thi se hien thi bounding box du
        % doan doi tuong do
        if ~isempty(reliableTracks)
            length_reliable_track = length(reliableTracks);
            
%             disble predicted
            for j=1:length_reliable_track
                if reliableTracks(j).total_invisible_count == 0

                    bboxes = cat(1, reliableTracks(j).bbox);

                    ids = int32([reliableTracks(j).id]);

                    labels = cellstr(int2str(ids'));

                    frame = insertObjectAnnotation(frame, 'rectangle', ...
                            bboxes, labels, 'Color', {'green'}, 'TextColor', 'black');
                    mask = insertObjectAnnotation(mask, 'rectangle', ...
                        bboxes, labels, 'Color', {'red'}, 'TextColor', 'white');    
                end
            end
            
%             show predicted
%             bboxes = cat(1, reliableTracks.bbox); 
%             ids = int32([reliableTracks(:).id]);
%             labels = cellstr(int2str(ids'));
%             predictedTrackInds = ...
%                 [reliableTracks(:).total_invisible_count] > 0;
%             isPredicted = cell(size(labels));             
%             isPredicted(predictedTrackInds) = {' predicted'};
%             labels = strcat(labels, isPredicted);
%             
%                    frame = insertObjectAnnotation(frame, 'rectangle', ...
%                         bboxes, labels, 'Color', {'green'}, 'TextColor', 'black');
% 
%               
%                     mask = insertObjectAnnotation(mask, 'rectangle', ...
%                         bboxes, labels, 'Color', {'red'}, 'TextColor', 'white');
            
        end
    end
    obj.maskPlayer.step(mask);
    obj.videoPlayer.step(frame);
end