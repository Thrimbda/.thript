(library (tools cli)
  (export
    run-silent
    command-exist?
    with-command)
  (import (chezscheme) (tools misc))

  (define (run-silent command)
    (let ((joined
            (cond
              ((string? command) command)
              ((list? (string-join command " ")))
              (else
                (error 'run-silent "the command is not a valid string")))))
      (if (string? joined)
          (system (string-append command " >/dev/null"))
          (error 'run-silent (format "the command ~a is not a valid string" command)))))

  (define (command-exist? command)
    (not (eq? (run-silent command) 127)))

  ;; denotes 
  (define (with-command command . args)
    (if (command-exist? command)
        (run-silent (string-append command " " (string-join args " ")))
        (error 'with-command (format "Error: ~a is not installed" command))))
  )
