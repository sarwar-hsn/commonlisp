(defvar *quiz-data* nil)
(defvar *score* 0)


(defun increament-score (increment-value)
    (setf *score* (+ *score* increment-value)))
(defun create-quiz (ques options correct-answer)
    (list :question ques :options options  :correct-answer correct-answer))

(defun save-quiz-db (fileName)
    (with-open-file (out fileName :direction :if-exists :supersede) 
    (with-standard-io-syntax (print *quiz-data* out))))

(defun add-quiz (quiz)
    (push quiz *quiz-data*))


(add-quiz (create-quiz "Furkan is an ASSHOLE?" '("true" "false") 1))
(add-quiz (create-quiz "is he a motherchod ?" '("obviously" "even not selected the ans is true") 1))

(defun verify-correct (answer quiz)
    (if (equal answer (getf quiz :correct-answer )) t nil))

(defun get-answer (no-of-options)
    (let ((answer nil))
    (format *query-io* "~a" "choose your answer : ")
    (force-output *query-io*)
    (setf answer (or (parse-integer (read-line *query-io*) :junk-allowed t) 0))
    (if (or (> answer no-of-options) (< answer 0) (equal answer nil)) nil answer)))

(defun show-quiz ()
    (let ((count 1) (answer nil))
    (mapcar #'(lambda (quiz)
    (format t "~%~a : ~a ~%"(first quiz) (second quiz))
    (format t "~a:~%"  (third quiz))
    (mapcar #'(lambda (option)
    (format t " ~a. ~a~%" count option)
    (setf count (+ count 1))) (fourth quiz))
    (setf answer (get-answer (length (fourth quiz))))
    (if(not (equal (verify-correct answer quiz) nil)) 
    (increament-score 10) )
    (setf count 1)) *quiz-data*)
    (format t "~%you scored : ~a~%" *score*)))

(defun evaluation ()
    (if (< *score* 10) (format t "~a~%" "you are a dumbass")(format t "~a~%" "at lease now you know what you are")))


(show-quiz)
(evaluation)
