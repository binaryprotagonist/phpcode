SELECT t1.*
        FROM chats AS t1
        INNER JOIN
        (
            SELECT
                LEAST(sender_id, receiver_id) AS sender_id,
                GREATEST(sender_id, receiver_id) AS receiver_id,
                MAX(id) AS max_id
            FROM chats
            GROUP BY
                LEAST(sender_id, receiver_id),
                GREATEST(sender_id, receiver_id)
        ) AS t2
            ON LEAST(t1.sender_id, t1.receiver_id) = t2.sender_id AND
               GREATEST(t1.sender_id, t1.receiver_id) = t2.receiver_id AND
               t1.id = t2.max_id
            WHERE t1.sender_id = 44 OR t1.receiver_id = 44
