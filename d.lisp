(defun triangle (n )
    (let ((space-num (- n 1)))
        (do ((i 0)) ((equal i n) nil)
            (do ((j 0 (incf j 1))) ((equal j space-num) nil)
                (format t " ~2t"))
            (do ((k 0 (incf k)))((equal k (+ 1 (* 2 i))) nil)
                (format t "*~2t"))
            (decf space-num 1)
            (format t "~%")
            (incf i))))
;(triangle 2)



(defun head (size)
    (let ((ratios 6/4))
        (dotimes (j 5)
            (format t "~a" (if (equal j 4) "*" " ")))
        (format t "~%")
        (do ((i 0 (incf i)))((equal (- size 1) i) nil ) ; i -> size
            (do ((j 0 (incf j)))((equal j 3) nil ) 
                (format t " "))
            (do ((j 0 (incf j)))((equal j 3) nil)
                (format t "~a" (if (or (equal j 0) (equal j 2) (equal i 0) (equal i 1)) "*" " ")))
                (format t "~%"))))

(defun balls (size)
    (let ((ratios 6/4))
        (do ((i 2 (decf i)) (k 5 (incf k 2))) ((equal i 0) nil )
            (dotimes (j i)
                (format t " "))
            (dotimes (j k)
                (format t "~a" (if (or (equal j 0) (equal j (- k 1))) "*" " ") ))
            (format t "~%"))
        (do ((i 0 (incf i)) (k 4 (decf k 2)) (l 0 (incf l 3)) (m 5 (decf m 3))) ((equal i 2) nil)
            (dotimes (j i)
                (format t " "))
            (dotimes (j k)
                (format t "~a" (if (or (equal j 0 ) (equal j (- k 1))) "*" " ")))
            (dotimes (j l)
                (format t " "))
            (dotimes (j m)
                (format t "~a" (if  (or (and (equal j 0) (equal m 2)) (or (equal j 1) (equal j (- m 1)))) "*" " " )))
                (format t "~%"))
        ))

(defun dick (size)
    (head size)
    (balls 5))   


(defun menu ()
    (format t "~10t------Welcome to Dick Analyzer-------~%~%"))

(defun user-input(promt)
    (format *query-io* "~a : " promt)
    (force-output *query-io*)
    (read-line *query-io*))




(defun program-bot ()
    (menu)
    (do ((input nil)) ((equal input t) nil)
        (setf input (user-input "Enter your name"))
        (if (or (equal (string-upcase input) (or "swr" ))
                (equal (string-upcase input) (or "FURKORN" ))
                (equal (string-upcase input) (or "FK" ))
                (equal (string-upcase input) (or "SINGHAD" ))) 
        (progn (format t "~%Your dick analysis is done~%size of your dick is too small to show~%But here is the zoomed version~%")
            (dick 7)) (format t "~%You are not in our database yet !~%"))
        (setf input (y-or-n-p "please fuck of by saying "))))

(program-bot)