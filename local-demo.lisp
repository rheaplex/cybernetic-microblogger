;; local-demo.lisp -  Print possible artworks to the console periodically.
;; Copyright (C) 2009  Rob Myers rob@robmyers.org
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; This isn't part of the main cybernetic package

;; So we just fake out the package

(cl:defpackage #:cybernetic
  (:use #:common-lisp)
  (:export generate-description)) 

;; Then load the generators

(load "cybernetic")

;; And loop printing descriptions to the console ever 5-60s

(loop
     do (format t "~a~%" (cybernetic:generate-description))
     do (sleep (+ 5 (random 55))))
