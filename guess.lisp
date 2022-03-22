
(setf *random-state* (make-random-state t))


(defun get-input()
    (format *query-io* "Enter a num (1-10) : ")
    (force-output *query-io*)
    (read-line *query-io*))
    
(defun game-bot ()
    (let ((random-num (+ 1 (random 10))) (num-of-guess 3) )
        (format t "Try guessing the number I picked between 1 - 10. You will be given with 3 chances~%")
        (do ((guess-num nil)) ((or (equal num-of-guess 0) (equal random-num guess-num)) nil)
            (setf guess-num (parse-integer (get-input)))
            (decf num-of-guess 1)
            (if (and (not (equal random-num guess-num))(> num-of-guess 0)) (format t "You are left with ~a chances. " num-of-guess))
            (cond
            ((equal guess-num random-num)(format t "Congratulation you found the number~%"))
            ((equal num-of-guess 0) (format t "Chances over. I picked ~a. You lost the game !!!~%" random-num))
            ((> guess-num random-num) (format t "try smaller ~%"))
            ((< guess-num random-num) (format t "try bigger ~%"))))))

(game-bot)



