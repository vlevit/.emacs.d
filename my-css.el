(defun my-css-mode-hook ()
  (setq css-indent-offset 2)
  (rainbow-mode 1))

(require 'hexrgb)

(defun hex-to-rgb-region (start end)
  "Print number of lines and characters in the region."
  (interactive "r")
  (if (use-region-p)
      (let ((hex-color (buffer-substring start end)))
        (if (hexrgb-rgb-hex-string-p hex-color)
            (progn
              (delete-region start end)
              (insert (format "rgb(%d, %d, %d)"
                        (floor (* 256 (hexrgb-red hex-color)))
                        (floor (* 256 (hexrgb-green hex-color)))
                        (floor (* 256 (hexrgb-blue hex-color))))))
          (error "Not a hex color string: %s" hex-color)))))

(add-hook 'css-mode-hook 'my-css-mode-hook)

(provide 'my-css)
