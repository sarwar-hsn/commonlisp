(defun last-element (array)
    (if (null array) nil ;;if array is empty then we return nil 
        (if (null (rest array)) array ;; if the rest of the list is empty then we return the array which is solution
             (last-element (rest array))))) ;; otherwise we call the function recursively
(format t "last element of the array : ~a" (last-element (list 3 4 5 5 6)))