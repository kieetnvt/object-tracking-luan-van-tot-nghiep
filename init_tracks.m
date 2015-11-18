function tracks = init_tracks()

% ***********************************************************************
% Chúng tôi t?o m?t m?ng tracks, ch?a các track, m?i track dùng ?? bi?u
% di?n 1 ??i t??ng chuy?n ??ng trong video v?i các thu?c tính nh? sau:
% ***********************************************************************
% Attributes: 
%  id  -- id c?a track
% bbox -- h?p bao ?óng hi?n t?i c?a v?t th? chuy?n ??ng
% kalman_filter -- là thu?c tính ?? theo dõi ???ng ?i
% age  -- t?ng s? frame mà ??m ???c t? lúc v?t th? ???c tracking
% total_visible_count -- t?ng s? frame mà t?i ?ó v?t th? xu?t hi?n
% consecutiveInvisibleCount -- t?ng s? frame liên ti?p v?t th? không còn
% xu?t hi?n.
% ***********************************************************************

tracks = struct(...
        'id', {}, ...
        'bbox', {}, ...
        'kalman_filter', {}, ...
        'age', {}, ...
        'total_visible_count', {}, ...
        'total_invisible_count', {});

end