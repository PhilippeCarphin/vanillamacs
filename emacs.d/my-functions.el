(defun vanillamacs-hello (name)
  "Make vanillamacs say hello"
  (interactive (list (read-string "What is your name (Default Richard Stallman) : " "" nil "Richard Stallman")))
  (message (concat "Hello " name "!")))
