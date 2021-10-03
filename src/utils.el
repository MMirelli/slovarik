(defun backup-user-wordlists(dir)
  "It backups the user wordlists so that user data is not lost when running tests. 
   This is needed, as user wordlists management procedures strongly rely on side-effects."
  
  )

(defun slovarik-load-tests()
  "Wrapper for loading tests."
  (load-files-in-directory (format "%s/src/tests" slovarik-home))
  )

(defun load-files-in-directory(dir)
  "It loads all the files in a given directory. Useful for tests loading"
  ;; remove / from the dir name
  (let ((dir (string-remove-suffix "/" dir)))
    (message (format "%s"
		     (mapcar
		      (lambda(fn) nil nil (if (and (not (equal fn "."))
						   (not (equal fn ".."))
						   (not (string-suffix-p "~" fn)))
					      ;; load file
					      (load (format "%s/%s" dir fn))
					    ;; else noop
					    nil))
		      ;; files in directory
		      (directory-files dir))))) )
