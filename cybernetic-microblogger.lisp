;; cybernetic-microblogger.lisp -  The main generate-and-blog code.
;; Copyright (C) 2009  Rob Myers rob@robmyers.org
;;
;; This file is part of cybernetic-microblogger.
;;
;; cybernetic-microblogger is free software; you can redistribute it and/or 
;; modify it under the terms of the GNU General Public License as published 
;; by the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.
;;
;; cybernetic-microblogger is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(in-package #:cybernetic)

(defclass cybernetic-microblogger (microblog-bot:microblog-bot)
  ())


(defmethod respond-to-mention ((bot cybernetic-microblogger) mention)
  "Respond to the mention by plugging the source."
  (ignore-errors
      (cl-twit:update (format nil "@~a Hi! You can see my source code here - http://robmyers.org/git/?p=cybernetic-microblogger.git" 
			      (cl-twit:user-screen-name 
			       (cl-twit:status-user mention))))))

(defmethod periodic-task ((bot cybernetic-microblogger))
  "Dent a possible artwork."
    (twit:update (generate-description)))
       
(defun run-microblog-bot (user password)
  (setf *random-state* (make-random-state t))
  (microblog-bot:set-microblog-service "http://identi.ca/api" "cybernetic")
  (let ((bot (make-instance 'cybernetic-microblogger
			    :nickname user	    
			    :password password
			    :ignore '("cybercritic"))))
    (microblog-bot:run-bot bot)))

(defun run ()
  "Configure and run the bot."
  (assert (>= (length sb-ext:*posix-argv*) 2))
  (run-microblog-bot (second sb-ext:*posix-argv*) (third sb-ext:*posix-argv*)))