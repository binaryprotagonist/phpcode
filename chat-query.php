SELECT t1.id as chat_id , t1.ad_id , IF(sender_id = $user_id , receiver_id , sender_id ) as user_id , users.name as user_name , users.profile_image , users.is_online , users.last_seen , ads.title , t1.message , ad_images.name as ad_image , t1.created_at as time FROM `chats` as t1 INNER JOIN (SELECT MAX(id) as max_id FROM `chats` GROUP BY ad_id) as t2 ON t1.id = t2.max_id JOIN `users` ON IF(sender_id = 44 , receiver_id , sender_id ) = users.id JOIN `ads` ON t1.ad_id = ads.id JOIN `ad_images` ON t1.ad_id = ad_images.ad_id where t1.sender_id = $user_id OR t1.receiver_id = $user_id ORDER BY t2.max_id DESC
