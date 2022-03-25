(defparameter *array* (list 22 11 23 44 32))

(format t "built-in reverse : ~a~%" (reverse *array*))



(defun custom-reverse-helper (list result)
    (if (null list) result ;; if we reach the end then return result
        (custom-reverse-helper (rest list) (cons (first list) result)))) ;; otherwise calling the function
                                                                        ;;recursively and building result using cons cell

(defun custom-reverse (array)   
    (custom-reverse-helper *array* ()))
(format t "~a" (custom-reverse *array*))