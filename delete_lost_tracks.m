function tracks = delete_lost_tracks(tracks)
    if isempty(tracks)
        return;
    end
% Chu thich:
% ham nay cua chung toi se xoa nhung track nao ma co so invisible (khong
% nhin thay track nay) trong mot so luong nhieu frame lien tiep.
% nhac lai: chi so age la so luong frame ke tu luc track nay duoc phat hien

    invisibleTooLong = 20;
    ageMIN = 8;

    % Compute the fraction of the track's age for which it was visible.
    ages = [tracks(:).age];
    
    total_VisibleCounts = [tracks(:).total_visible_count];
    
    visibible_rate = total_VisibleCounts ./ ages;

    % Find the indices of 'lost' tracks.
    lost_Inds = (ages < ageMIN & visibible_rate < 0.6) | ...
        [tracks(:).total_invisible_count] >= invisibleTooLong;

    % Delete lost tracks.
    tracks = tracks(~lost_Inds);
end