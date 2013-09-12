(require 'multiple-cursors)

(defun my-create-fake-cursor ()
  (interactive)
  (if (not (mc/all-fake-cursors (point) (1+ (point))))
      (mc/create-fake-cursor-at-point)
    (mc/remove-fake-cursor (car (mc/all-fake-cursors (point) (1+ (point)))))
    (mc/maybe-multiple-cursors-mode)))


(global-set-key (kbd "M-4") 'my-create-fake-cursor)

(provide 'my-multiple-cursors)
