function tracks = update_unassigned_tracks(unassignedTracks, tracks)

    % tang so luogn frame va bien dem khong nhin thay
    for i = 1:length(unassignedTracks)
        
        index = unassignedTracks(i);
        
        tracks(index).age = tracks(index).age + 1;
        
        tracks(index).total_invisible_count = ...
            tracks(index).total_invisible_count + 1;
        
    end
    
end