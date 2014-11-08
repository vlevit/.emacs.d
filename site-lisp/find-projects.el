(defvar find-projects-dirs nil)

(defun find-projects ()
  "Select a project from `find-projects-dirs'"
  (interactive)
  (let ((rel-dirs nil)
        (dirs-alist nil))
    (dolist (project-dir find-projects-dirs)
      (let* ((base-dir (expand-file-name project-dir))
             (full-dirs (cl-remove-if-not 'file-directory-p (directory-files base-dir t "^[^.]"))))
        (unless (s-ends-with? base-dir "/")
          (setq base-dir (concat base-dir "/")))
        (dolist (full-dir full-dirs)
          (let ((rel-dir (substring full-dir (length base-dir))))
            (add-to-list 'rel-dirs rel-dir)
            (add-to-list 'dirs-alist (cons rel-dir full-dir))))))
    (let ((selected-dir (ido-completing-read "Projects: " rel-dirs))
          (directory default-directory))
      (with-temp-buffer
        (cd (cdr (assoc selected-dir dirs-alist)))
        (find-file-in-repository)))))

(provide 'find-projects)
