(defun find_longest_path (edges)
    (let (
        (pathes (let ((p (make-hash-table))) (dolist (edge edges) (push (cadr edge) (gethash (car edge) p nil)) p) p))
        (longest_path nil))
        (defun deep-first-search (vertex &optional (cur_path nil) (visited (make-hash-table)))
            (push vertex cur_path)
            (setf (gethash vertex visited) t)
            (if (> (length cur_path) (length longest_path))
                (setf longest_path (copy-list cur_path)))
            (dolist (adjacent (gethash vertex pathes))
                (unless (gethash adjacent visited)
                    (deep-first-search adjacent cur_path visited)))
                (pop cur_path)
            (setf (gethash vertex visited) nil)
        )
        (maphash #'(lambda (vertex _) (deep-first-search vertex)) pathes)
        (reverse longest_path)
    )
)

(print (find_longest_path '((a b) (a c) (b c) (c d))))

(print (find_longest_path '((b c) (c f) (d c) (e d) (f b) (a e))))