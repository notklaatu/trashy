AUTOMAKE_OPTIONS = foreign subdir-objects
dist_bin_SCRIPTS = bin/trashy
dist_man_MANS = man/trashy.8
EXTRA_DIST = slackware/trashy.info slackware/doinst.sh slackware/slack-desc slackware/trashy.SlackBuild slackware/trashy.spec

all-am: trashy

trashy: bin/trashy

if LINUX
	@sed -i "s|__BASKETVAR__|~/.local/share/Trash|" bin/$@
else
	@sed -i "s|__BASKETVAR__|~/.Trash|" bin/$@
endif

	@sed -i "s|__VERNUMVAR__|@PACKAGE_VERSION@|" bin/$@

nuke:
	@rm config.status configure config.log
	@rm Makefile 
	@rm -r autom4te.cache/
	@rm aclocal.m4 
	@rm compile install-sh missing Makefile.in
	@rm config.guess
	@rm config.sub
