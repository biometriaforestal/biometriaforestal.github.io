(defun convert-images-in-directory (directory)
  "Convert all images in DIRECTORY to WebP format with specified options."
  (interactive "DDirectory: ")
  (let ((output-dir (expand-file-name "lowres" directory)))
    (unless (file-exists-p output-dir)
      (make-directory output-dir))
    (dolist (file (directory-files directory t "\\.[jJ][pP][eE]?[gG]\\|\\.[pP][nN][gG]\\|\\.[gG][iI][fF]$")) ; Add more extensions if needed
      (let ((output-file (expand-file-name (concat (file-name-base file) ".webp") output-dir)))
        (shell-command (format "convert %s -auto-orient -resize 1920x1080 -quality 75 %s" (shell-quote-argument file) (shell-quote-argument output-file)))))))
