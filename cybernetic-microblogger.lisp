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

;; The microblogging function

(defun microblog-cybernetic-and-quit ()
  (initialise-cybernetic)
  (when (< (length sb-ext:*posix-argv*) 2)
    (format t "Pass username and password as the 1st and 2nd arguments.~%")
    (sb-ext:quit))
  (setf twit::*source* "cybernetic")
  (setf twit::*base-url* "http://identi.ca/api")
  (setf twit:*username* (second sb-ext:*posix-argv*))
  (setf twit:*password* (third sb-ext:*posix-argv*))
  
  (twit:login t)
  (twit:update (generate-description))
  (finalise-cybernetic)
  (sb-ext:quit))
