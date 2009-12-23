EL = $(shell grep -E '^[^\#]' list)

all:
	rm -f ${HOME}/.emacs.elc
	rm -f ${HOME}/.emacs.el
	cd conf.avail && cat $(EL) > ${HOME}/.emacs.el
	emacs --no-site-file -q -batch -L ~/git/emacs/site-lisp/common -L . -f batch-byte-compile ${HOME}/.emacs.el
