;;; easy-color-faces.el --- collection of convenient color faces -*- lexical-binding: t -*-

;; Author: Alexander Chan
;; Maintainer: Alexander Chan
;; Keywords: easy-color color faces


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; Provides set of convenient color faces as well as the light and dim versions.

;;; Code:

(defgroup easy-color nil
  "Set of convenient colors helpers."
  :group 'convenience
  :prefix "easy-color-")

(defcustom easy-color-theme-function-alist '()
  "Map of theme to function for configurating `easy-color` faces."
  :type '(alist :key-type symbol
                :value-type function)
  :group 'easy-color)

(defun easy-color-load-theme (theme)
  "Call color load THEME function in`easy-colors-theme-function-alist`."
  (interactive
   (list (completing-read
          "Choose theme: "
          (mapcar #'symbol-name
                  (mapcar 'car easy-color-theme-function-alist)))))
  (let* ((key (if (stringp theme) (intern theme) theme))
         (fn (cdr (assoc key easy-color-theme-function-alist))))
    (unless (null fn)
      (funcall fn))))

(defun easy-color-darken (hex-string percentage)
  "Darken HEX-STRING color by reducing its RGB values by a PERCENTAGE."
  ;; Convert hex string to RGB components
  (let ((red (string-to-number (substring hex-string 1 3) 16))
        (green (string-to-number (substring hex-string 3 5) 16))
        (blue (string-to-number (substring hex-string 5 7) 16)))
    ;; Reduce each component by the given percentage
    (setq red   (truncate (* red   (/ (- 100 percentage) 100.0))))
    (setq green (truncate (* green (/ (- 100 percentage) 100.0))))
    (setq blue  (truncate (* blue  (/ (- 100 percentage) 100.0))))
    ;; Ensure the values are within the valid range [0, 255]
    (setq red   (max 0 (min 255 red)))
    (setq green (max 0 (min 255 green)))
    (setq blue  (max 0 (min 255 blue)))
    ;; Convert the modified RGB values back to hex format
    (format "#%02x%02x%02x" red green blue)))

(defun easy-color-brighten (hex-string percentage)
  "Brighten HEX-STRING color by increasing its RGB values by a PERCENTAGE."
  ;; Convert hex string to RGB components
  (let ((red (string-to-number (substring hex-string 1 3) 16))
        (green (string-to-number (substring hex-string 3 5) 16))
        (blue (string-to-number (substring hex-string 5 7) 16)))
    ;; Reduce each component by the given percentage
    (setq red   (truncate (* red   (/ (+ 100 percentage) 100.0))))
    (setq green (truncate (* green (/ (+ 100 percentage) 100.0))))
    (setq blue  (truncate (* blue  (/ (+ 100 percentage) 100.0))))
    ;; Ensure the values are within the valid range [0, 255]
    (setq red   (max 0 (min 255 red)))
    (setq green (max 0 (min 255 green)))
    (setq blue  (max 0 (min 255 blue)))
    ;; Convert the modified RGB values back to hex format
    (format "#%02x%02x%02x" red green blue)))

(defcustom easy-color-yellow-l "#eedd82"
  "Easy color light yellow."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-yellow "#cd950c"
  "Easy color yellow."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-yellow-d "#8b814c"
  "Easy color dark yellow."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-orange-l "#ffb90f"
  "Easy color light orange."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-orange "#cd950c"
  "Easy color orange."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-orange-d "#8b6508"
  "Easy color dark orange."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-red-l "#ff3030"
  "Easy color light red."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-red "#cd2626"
  "Easy color red."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-red-d "#8b1a1a"
  "Easy color dark red."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-magenta-l "#ff6eb4"
  "Easy color light magenta."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-magenta "#cd6090"
  "Easy color magenta."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-magenta-d "#8b3a62"
  "Easy color dark magenta."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-blue-l "#487bff"
  "Easy color light blue."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-blue "#3a5fcd"
  "Easy color blue."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-blue-d "#27408b"
  "Easy color dark blue."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-green-l "#00ff7f"
  "Easy color light green."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-green "#00cd66"
  "Easy color green."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-green-d "#008b45"
  "Easy color dark green."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-cyan-l "#00bfff"
  "Easy color light cyan."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-cyan "#009acd"
  "Easy color cyan."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-cyan-d "#00688b"
  "Easy color dark cyan."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-violet-l "#bf3eff"
  "Easy color light violet."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-violet "#9a32cd"
  "Easy color violet."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-violet-d "#68228b"
  "Easy color dark violet."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-gray-l "#d3d3d3"
  "Easy color light gray."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-gray "#808080"
  "Easy color for gray."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-gray-d "#696969"
  "Face for dark gray."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-white "#f5f5f5"
  "Easy color white."
  :type 'string
  :group 'easy-color)

(defcustom easy-color-black "#050505"
  "Easy color black."
  :type 'string
  :group 'easy-color)

(defgroup easy-color-faces nil
  "Collection of faces for text colors."
  :group 'easy-color
  :group 'faces
  :prefix "easy-color-faces-")

(defface easy-color-faces-yellow-l
  `((t :foreground ,easy-color-yellow-l))
  "Face for light yellow."
  :group 'easy-color-faces)

(defface easy-color-faces-yellow
  `((t :foreground ,easy-color-yellow))
  "Face for yellow."
  :group 'easy-color-faces)

(defface easy-color-faces-yellow-d
  `((t :foreground ,easy-color-yellow-d))
  "Face for dark yellow."
  :group 'easy-color-faces)

(defface easy-color-faces-orange-l
  `((t :foreground ,easy-color-orange-l))
  "Face for light orange."
  :group 'easy-color-faces)

(defface easy-color-faces-orange
  `((t :foreground ,easy-color-orange))
  "Face for orange."
  :group 'easy-color-faces)

(defface easy-color-faces-orange-d
  `((t :foreground ,easy-color-orange-d))
  "Face for dark orange."
  :group 'easy-color-faces)

(defface easy-color-faces-red-l
  `((t :foreground ,easy-color-red-l))
  "Face for light red."
  :group 'easy-color-faces)

(defface easy-color-faces-red
  `((t :foreground ,easy-color-red))
  "Face for red."
  :group 'easy-color-faces)

(defface easy-color-faces-red-d
  `((t :foreground ,easy-color-red-d))
  "Face for dark red."
  :group 'easy-color-faces)

(defface easy-color-faces-magenta-l
  `((t :foreground ,easy-color-magenta-l))
  "Face for light magenta."
  :group 'easy-color-faces)

(defface easy-color-faces-magenta
  `((t :foreground ,easy-color-magenta))
  "Face for magenta."
  :group 'easy-color-faces)

(defface easy-color-faces-magenta-d
  `((t :foreground ,easy-color-magenta-d))
  "Face for dark magenta."
  :group 'easy-color-faces)

(defface easy-color-faces-blue-l
  `((t :foreground ,easy-color-blue-l))
  "Face for light blue."
  :group 'easy-color-faces)

(defface easy-color-faces-blue
  `((t :foreground ,easy-color-blue))
  "Face for blue."
  :group 'easy-color-faces)

(defface easy-color-faces-blue-d
  `((t :foreground ,easy-color-blue-d))
  "Face for dark blue."
  :group 'easy-color-faces)

(defface easy-color-faces-green-l
  `((t :foreground ,easy-color-green-l))
  "Face for light green."
  :group 'easy-color-faces)

(defface easy-color-faces-green
  `((t :foreground ,easy-color-green))
  "Face for green."
  :group 'easy-color-faces)

(defface easy-color-faces-green-d
  `((t :foreground ,easy-color-green-d))
  "Face for dark green."
  :group 'easy-color-faces)

(defface easy-color-faces-cyan-l
  `((t :foreground ,easy-color-cyan-l))
  "Face for light cyan."
  :group 'easy-color-faces)

(defface easy-color-faces-cyan
  `((t :foreground ,easy-color-cyan))
  "Face for cyan."
  :group 'easy-color-faces)

(defface easy-color-faces-cyan-d
  `((t :foreground ,easy-color-cyan-d))
  "Face for dark cyan."
  :group 'easy-color-faces)

(defface easy-color-faces-violet-l
  `((t :foreground ,easy-color-violet-l))
  "Face for light violet."
  :group 'easy-color-faces)

(defface easy-color-faces-violet
  `((t :foreground ,easy-color-violet))
  "Face for violet."
  :group 'easy-color-faces)

(defface easy-color-faces-violet-d
  `((t :foreground ,easy-color-violet-d))
  "Face for dark violet."
  :group 'easy-color-faces)

(defface easy-color-faces-gray-l
  `((t :foreground ,easy-color-gray-l))
  "Face for light gray."
  :group 'easy-color-faces)

(defface easy-color-faces-gray
  `((t :foreground ,easy-color-gray))
  "Face for gray."
  :group 'easy-color-faces)

(defface easy-color-faces-gray-d
  `((t :foreground ,easy-color-gray-d))
  "Face for dark gray."
  :group 'easy-color-faces)

(defface easy-color-faces-white
  `((t :foreground ,easy-color-white))
  "Face for white."
  :group 'easy-color-faces)

(defface easy-color-faces-black
  `((t :foreground ,easy-color-black))
  "Face for black."
  :group 'easy-color-faces)

(defun easy-color-faces-set-colors (color-name color-value)
  "Convenience function for setting easy colors.
Set COLOR-NAME and dim/light variants using COLOR-VALUE."
  (set-face-attribute (intern (format "easy-color-faces-%s-l" color-name)) nil
                      :foreground (easy-color-brighten color-value 25))
  (set-face-attribute (intern (format "easy-color-faces-%s" color-name)) nil
                      :foreground color-value)
  (set-face-attribute (intern (format "easy-color-faces-%s-d" color-name)) nil
                      :foreground (easy-color-darken color-value 25)))

(defun easy-color-faces-default-theme-function ()
  "Default easy colors faces `easy-color-load-theme` function."
  (set-face-attribute 'easy-color-faces-yellow nil :foreground easy-color-yellow)
  (set-face-attribute 'easy-color-faces-yellow-l nil :foreground easy-color-yellow-l)
  (set-face-attribute 'easy-color-faces-yellow-d nil :foreground easy-color-yellow-d)

  (set-face-attribute 'easy-color-faces-orange nil :foreground easy-color-orange)
  (set-face-attribute 'easy-color-faces-orange-l nil :foreground easy-color-orange-l)
  (set-face-attribute 'easy-color-faces-orange-d nil :foreground easy-color-orange-d)

  (set-face-attribute 'easy-color-faces-red nil :foreground easy-color-red)
  (set-face-attribute 'easy-color-faces-red-l nil :foreground easy-color-red-l)
  (set-face-attribute 'easy-color-faces-red-d nil :foreground easy-color-red-d)

  (set-face-attribute 'easy-color-faces-magenta nil :foreground easy-color-magenta)
  (set-face-attribute 'easy-color-faces-magenta-l nil :foreground easy-color-magenta-l)
  (set-face-attribute 'easy-color-faces-magenta-d nil :foreground easy-color-magenta-d)

  (set-face-attribute 'easy-color-faces-blue nil :foreground easy-color-blue)
  (set-face-attribute 'easy-color-faces-blue-l nil :foreground easy-color-blue-l)
  (set-face-attribute 'easy-color-faces-blue-d nil :foreground easy-color-blue-d)

  (set-face-attribute 'easy-color-faces-green nil :foreground easy-color-green)
  (set-face-attribute 'easy-color-faces-green-l nil :foreground easy-color-green-l)
  (set-face-attribute 'easy-color-faces-green-d nil :foreground easy-color-green-d)

  (set-face-attribute 'easy-color-faces-cyan nil :foreground easy-color-cyan)
  (set-face-attribute 'easy-color-faces-cyan-l nil :foreground easy-color-cyan-l)
  (set-face-attribute 'easy-color-faces-cyan-d nil :foreground easy-color-cyan-d)

  (set-face-attribute 'easy-color-faces-violet nil :foreground easy-color-violet)
  (set-face-attribute 'easy-color-faces-violet-l nil :foreground easy-color-violet-l)
  (set-face-attribute 'easy-color-faces-violet-d nil :foreground easy-color-violet-d)

  (set-face-attribute 'easy-color-faces-gray nil :foreground easy-color-gray)
  (set-face-attribute 'easy-color-faces-gray-l nil :foreground easy-color-gray-l)
  (set-face-attribute 'easy-color-faces-gray-d nil :foreground easy-color-gray-d)

  (set-face-attribute 'easy-color-faces-white nil :foreground easy-color-white)
  (set-face-attribute 'easy-color-faces-black nil :foreground easy-color-black))

(add-to-list 'easy-color-theme-function-alist '(default . easy-color-faces-default-theme-function))

(provide 'easy-color-faces)

;;; easy-color-faces.el ends here
