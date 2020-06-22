;;; build chez scheme library

(import (chezscheme))

(map compile-library '("tools/misc.ss"
                       "tools/cli.ss"
                       "tools/core/alist.sc"
                       "tools/json.sc"
                       ))
