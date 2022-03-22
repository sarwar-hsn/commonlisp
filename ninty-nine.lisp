;;P01 (*) Find the last box of a list.
;;Example:
;;* (my-last '(a b c d))
;;(D)

;first approach
;;(defun my-last (list-item)
;;    (last list-item))

;recursive approach
(defun my-last (items)
    (if (null items) nil 
        (if (null (rest items)) items 
            (my-last (rest items)))))
(format t "1.~a~%" (my-last '(a b c d)))


;;P02 (*) Find the last but one box of a list.
;;Example:
;;* (my-but-last '(a b c d))
;;(C D)

(defun my-but-last (lambda-list)
    (setf lambda-list (reverse lambda-list))
    (reverse (list (first lambda-list) (second lambda-list))))
(format t "2. ~a~%" (my-but-last '(a b c d)))


(defvar *list* '("2" "4" "6" "4"))
(defun swap (x y _list)
    (cond ((null _list) _list)
          ((not (null _list)) 
            (if (equal (first _list) x) 
                (setf (first _list) y)) 
            (swap x y (rest _list)))))

(format t "before : ~a~%" *list*)
(swap "4" "10" *list*)
(format t "after : ~a~%" *list*)