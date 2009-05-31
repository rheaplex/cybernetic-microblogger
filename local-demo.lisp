;; local-demo.lisp -  Print possible artworks to the console periodically.
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
