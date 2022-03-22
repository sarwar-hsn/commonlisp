(defvar *object* nil)
(defun make-object ( name surname  age )
    (list :name name :surname surname :age age ))

(defun add-object (obj)
    (push obj *object*))


(add-object (make-object "sarwar" "hossain" 23 ))
(add-object (make-object "abdullah" "sakib" 13 ))

(format t "after adding the objects ~%~a" *object*)


;;(defun where (&key name surname age hobby)
;;    #'(lambda (obj)(
;;    and 
;;    (if name (equal (getf obj :name) name) t)
;;    (if surname (equal  (getf obj :surname) surname) t)
;;    (if age (equal  (getf obj :age) age) t ))))

;;(defun select (selector-fn)
;;    (mapcar selector-fn *object*))

;;(print (select (where :surname "hossain")))

(defun make-comparison-exp (field value)
    `(equal (getf obj ,field) ,value))

(defun make-comparison-list (fields)
    (loop while fields 
        collecting (make-comparison-exp (pop fields) (pop fields))))

(defmacro where (&rest fields)
    `#'(lambda (obj) 
        (and ,@(make-comparison-list fields))))

(defun select (selector-fn)
    (remove-if-not selector-fn *object*))

(print (select (where :name "sarwar" )))