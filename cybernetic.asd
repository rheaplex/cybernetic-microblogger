;; cybernetic.asd -  The asdf system definition for cybernetic-microblogger.
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

(require :asdf)

(in-package #:asdf)

(asdf:defsystem #:cybernetic
    :serial t
    :depends-on (#:cl-twit #:microblog-bot)
    :components
    ((:file "packages")
     (:file "cybernetic")
     (:file "cybernetic-microblogger")))
