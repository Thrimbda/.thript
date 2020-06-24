(library (tools cli)
  (export
    run-silent
    command-exist?
    with-command
    ls
    ll)
  (import (chezscheme) (tools misc))

  (define (run-silent command)
    (let ((joined
            (cond
              ((string? command) command)
              ((list? (string-join command " ")))
              (else
                (error 'run-silent "the command is not a valid string")))))
      (if (string? joined)
          (system (string-append command " &>/dev/null"))
          (error 'run-silent (format "the command ~s is not a valid string" command)))))

  (define (command-exist? command)
    (not (eq? (run-silent command) 127)))

  ;; denotes 
  (define (with-command command . args)
    (if (command-exist? command)
        (run-silent (string-append command " " (string-join args " ")))
        (error 'with-command (format "Error: ~s is not installed" command))))

  (define ls
    (case-lambda
      [()
       (directory-list (cd))]
      [(path)
       (if (string? path)
           (if (file-directory? path)
               (directory-list path)
               '(path))
           (error 'ls (format "Error: ~s is not type of string" path)))
       ]
      ;; TODO: multiple path support using hashtable (or pair, or record).
      [paths
       (if (list? paths)
           (map directory-list paths)
           (error 'ls (format "Error: ~s is not type of string" paths)))
       ]
    ))

  (define (ll path)
    (define (show-path-permission path)
      (define (show-premission permission)
        (if (fixnum? permission)
            (let* ([bits (zip-with-index (dec->bin permission))]
                   ;; optimize this
                   [chars (list->vector '("r" "w" "x"))]
                   [perm-string (string-join
                                 (map (lambda (item)
                                        (if (fxzero? (car item))
                                            "-"
                                            ;; 3 means the length of the permission vector,
                                            ;; its suitable for the permission never changes
                                            (vector-ref chars (modulo (cdr item) 3)))) bits))])
              (if (file-directory? path)
                  (begin
                    (display perm-string)
                    (string-append "d" perm-string))
                  (string-append "-" perm-string)))
            (error 'show-permission (format "Error: ~s is not type of fixnum" permission))))
      (show-premission (get-mode path)))

    ;; foreign function to get a file's owner
    (define (show-file-change-time path)
      (date-and-time (time-utc->date (file-modification-time path))))

    (let ([sub-paths (ls path)])
      (map (lambda (sub-path) (string-append (string-join (list (show-path-permission sub-path) (show-file-change-time sub-path) sub-path) "\t") "\n")) (sort string<? sub-paths))))
  )
