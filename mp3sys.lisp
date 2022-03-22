(defvar *db* nil)

(defun make-cd (title artist rating ripped)
    (list :title title :artist artist :rating rating :ripped ripped)
    )

(defun promt-read (promt)
    (format *query-io* "~a : " promt)
    (force-output *query-io*)
    (read-line *query-io*))

(defun add-record (cd)
    (push cd *db*))

(defun promt-for-cd ()
    (make-cd 
        (promt-read "title")
        (promt-read "artist")
        (or (parse-integer :junk (promt-read "rating") :junk-allowed t) 0)
        (y-or-n-p "ripped ")))
    
(defun add-cds ()
    (loop (add-record (promt-for-cd))
        (if(not (y-or-n-p "add another "))(return))))


;(add-cds)

(defun save-db (filename)
    (with-open-file 
        (out filename :direction :output :if-exists :supersede)
        (with-standard-io-syntax (print *db* out)) ))

;(save-db "~/track.db")

(defun load-db (filename)
    (with-open-file (in filename :direction :input) 
    (with-standard-io-syntax (setf *db* (read in)))))
(load-db "~/track.db")


(defun print-db ()
    (dolist (cd *db*) 
        (format t "~{~a:~10t~a~% ~}" cd)
        (format t "~%")))

(print-db)


(defun select-by-artist (artist)
    (remove-if-not #'(lambda (cd) (equal artist (getf cd :artist))) *db*))

;(print (select-by-artist "duman"))


;;it generates lambda function based on parameter
(defun where (&key title artist rating (ripped nil ripped-p))
    #'(lambda (cd) (
        and
        (if title (equal (getf cd :title) title) t)
        (if artist (equal (getf cd :artist) artist) t)
        (if rating (equal (getf cd :rating) rating) t)
        (if ripped-p (equal (getf cd :ripped) ripped) t))))

(defun select (selector-fn)
    (remove-if-not selector-fn *db*))
;(print (select (where :artist "warfaze" :title "rupkotha")))

(defparameter *testlist* (list 34 23 21 44 24 56 43 32))



;;mapcar goes through the list - when select row is true it updates the row - then write the content of the row to db
(defun update (select &key  artist title rating (ripped nil ripped-p))    
    (setf *db* (mapcar #'(lambda (row) (
        when (funcall select row)
            (if title (setf (getf row :title) title))
            (if artist (setf (getf row :artist) artist))
            (if rating (setf (getf row :rating) rating)))
            row) *db*)) )
(update (where :title "rupkotha") :title "oki doki" :artist "sarwar" :rating 4.5 )

;;(print *db*)

;;(defun dummy (&key title artist rating)
;;;    #'(lambda (cd) (not (and 
;;;    (if title (equal title (getf cd :title)) t)
;;;   (if artist (equal artist (getf cd :artist)) t)
;;;    (if rating (equal rating (getf cd :rating)) t))
;;;    )))

;;;(defun delete_row(selector)
;;;     (remove-if-not selector *db*)) 

;;;(print (delete_row (dummy :artist "sarwar")))
;;;remove if is the complement of remove-if-not


(defun remove-entry (select)
    (remove-if select *db*))

;(print (remove-entry (where :artist "tuhin")))


