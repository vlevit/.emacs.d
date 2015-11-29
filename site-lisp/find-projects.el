(defvar find-projects-patterns nil
  "")

(defvar find-projects-completing-read-function 'completing-read
  "")

;; (setq find-projects-completing-read-function 'ido-completing-read)
;; (setq find-projects-completing-read-function 'completing-read-default)
;; (setq find-projects-completing-read-function 'ivy-completing-read)

(defvar find-projects-action 'find-file-in-repository)
;; (setq find-projects-action 'find-file-in-repository)
;; (setq find-projects-action 'find-file-in-project)

;; (setq find-projects-action 'dired-jump)

(defun find-projects-matched-dirs (pattern)
  (cl-remove-if-not 'file-directory-p (file-expand-wildcards pattern)))

(defun find-projects ()
  "Select a project from `find-projects-patterns'"
  (interactive)
    (let* ((projects
            (cl-reduce 'append (mapcar 'find-projects-matched-dirs find-projects-patterns)))
           (selected-project
            (funcall find-projects-completing-read-function "Projects: " projects)))
      (with-temp-buffer
        (cd selected-project)
        (funcall find-projects-action))))

(provide 'find-projects)
