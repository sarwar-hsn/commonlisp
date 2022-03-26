(defun fib (value)
    (if (or (equal value 2) ( < value 2) ) 1 
       (+ (fib (- value 1)) (fib (- value 2)) ) ))


(format t "first 10 fibonacci number are : ")
(dotimes (i 10) (format t "~a " (fib (+ i 1))))