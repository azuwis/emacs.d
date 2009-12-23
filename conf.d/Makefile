all:
	rm -f ${HOME}/.emacs.elc
	rm -f ${HOME}/.emacs.el
	cat [0-9][0-9]*.el > ${HOME}/.emacs.el
	emacs --no-site-file -q -batch -eval "(add-to-list 'load-path \"~/git/emacs/site-lisp/common/\")" -f batch-byte-compile ${HOME}/.emacs.el
