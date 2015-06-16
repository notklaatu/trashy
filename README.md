Trashy
======

Get trashy! A [mostly] Freedesktop-compliant rubbish bin interface for the shell written entirely in BASH.

http://slackermedia.info/trashy


Introduction
-----------------

Hi! right now you're looking at trashy, the sane rm intermediary.
This means that you've probably just done the unthinkable:
accidentally rm'd a super important file by accident and immediately
thereafter started cursing God, UNIX, GNU, computers, and yourself.

Never fear.  There is hope.

Well, not for your deleted file -- that's gone.  Sorry.  But from
now on, you'll never have to go through that ever again!


Usage
--------

Trashy is a simple shell script that introduces the idea of a trash
can for the command line.  Meaning that you can issue this command:

    trash foo bar

and the files 'foo' and 'bar' will be moved to your system trash.

or...

    trash foo\ bar

and the file 'foo bar' will be moved to your system trash.

Simple as that.  When you're really really sure that everything in
your Trash wants to be nuked out of existence, then you can
issue the command:

    trash --empty

and your system trash will be emptied.


System Trash
---------------

Trashy defines a *system trash* on Linux, BSD, and Solaris-based
operating systems in accordance to the Open Desktop standard:

    ~/.local/share/Trash 

On systems that do not use a desktop, trashy simply creates a ``~/.trash``
folder (unless you sometimes use a desktop, in which case your
desktop's trash will be continued to be used).

On systems that do have a desktop but do not follow the Open Desktop
standard, trashy tries to conform with what they do use. If all else
fails, ``~/.trash`` is used.


Aliases
-----------

To help myself ease into the concept of the trash command, I literally
had to alias ``rm`` to trash for a while.  This works quite well, in
truth; and if you ever want to override your alias, simply use:

    \rm foo

or

    /bin/rm foo

Simple as that.

But until your muscle memory gets used to the idea that it's going to
be typing 'trash' instead of 'rm' when you want to delete a file, the
alias helps.  To have an alias installed along with trashy, simple
uncomment the alias block in the install.sh script.


Ditching the Alias
-----------------------

Eventually it will become tedious to you to work around the ``trash``
command every time you really really do want to ``rm`` a file.  At that
point, you'll probably want to get rid of the alias.

Personally, I maintain an ``rm='rm -i'`` alias in ``~/.bash_aliases`` just to
avoid any initial mishaps.

And then eventually I got rid of any aliasing so that the commands
were all really what they appeared to be.  rm to delete permanently,
trash to move to a trash bin.  It WILL take a while, if you're used to
rm, so do account for that.


Why trashy?
-----------------

Trashy is BASHy, meaning that it's really really portable.  It can be
installed easily on GNU Linux, freeBSD/netBSD/DragonFlyBSD, Illumos,
and even Mac OS X (obviously not Freedesktop-compliant).

It's simple, but it works well and it works on lots of systems.
That's good enough for me.

Similar projects do exist. The one I know about uses Python and has some
really neat and fancy features. Check it out if you're on a Linux box
or if you don't mind a bit of set-up on non Free Desktop UNIX systems.

https://github.com/andreafrancia/trash-cli


Bugs
-----

I've ironed a lot of them, actually. Trashy has gotten a lot better
since its original implementation. I am sure there are many bugs that
could be revealed under the right testing circumstances, so give it a
go and let me know what you find. I can't promise I'll fix them
immediately, but they'll definitely make my list.

More features are still planned; notably, a built in --restore
function, and better handling of files that are not in one's home
folder.

I can generally be contacted via klaatu at the domain of
member dot fsf dot org.
