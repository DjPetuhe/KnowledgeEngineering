(defun New-union (x y) (No-Dublicates-Union (remove-duplicates x :from-end t) (remove-duplicates y :from-end t)))

(defun No-Dublicates-Union (x y) (let ((lst x)) (loop for i in y do (unless (find i lst) (setq lst (append lst (list i))))) lst))

(print (New-union '(a b c a c b) '(b a d a b d)))