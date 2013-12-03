# $FreeBSD: src/share/skel/dot.cshrc,v 1.14.10.1.4.1 2010/06/14 02:09:06 kensmith Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA

# A righteous umask
umask 22

setenv GOOS freebsd
setenv GOARCH 386
setenv GOROOT /usr/local/go
set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin $GOROOT/bin)

setenv	EDITOR	vim
setenv	PAGER	more
setenv	BLOCKSIZE	K

setenv	LC_CTYPE zh_TW.Big5

if ($?prompt) then
	# An interactive shell -- set some stuff up
	if ($?WINDOW) then
		set prompt = "%B%{^[[32m%}%n%{^[[m%}@%{^[[34m%}%m%{^[[m%}:[%{^[[33m%}%~%{^[[m%}][$WINDOW]>"
		else
	set prompt = "%B%{^[[32m%}%n%{^[[m%}@%{^[[34m%}%m%{^[[m%}:[%{^[[33m%}%~%{^[[m%}]>"
	endif
	set filec
	set history = 100
	set savehist = 100
	set autolist
	set ignoreeof
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif
