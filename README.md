Trashy
======

Get trashy! A [mostly] Freedesktop-compliant rubbish bin interface for the shell written entirely in BASH.

http://slackermedia.info/trashy


Introduction
-----------------

Hi! right now you're looking at trashy, the sane `rm` intermediary.
This means that you've probably just done the unthinkable:
accidentally rm'd a superImportantFile by accident and immediately
thereafter started cursing God, UNIX, GNU, computers, and yourself.

Never fear.  There is hope.

Well, not for your deleted file -- that's gone. Sorry. But if you use
`trashy`, you'll never have to go through that ever again!


Usage
--------

Trashy is a simple shell script that introduces the idea of a trashcan
for the command line.  Meaning that you can issue this command:

    trash foo bar

and the files 'foo' and 'bar' will be moved to your system trash.

or...

    trash foo\ bar

and the file 'foo bar' will be moved to your system trash.

Simple as that.

Do you need that file back? Restore it with:

    trash --restore foo

and 'foo' is put back where it belongs.

When you're really *really* sure that everything in your Trash wants
to be nuked out of existence, then issue the command:

    trash --empty

and your system trash is emptied.


System Trash
---------------

Trashy defines a *system trash* on Linux, BSD, and Solaris-based
operating systems in accordance to the Open Desktop standard:

    ~/.local/share/Trash 

On systems that do not use a graphical desktop or chooses not to
follow the Open Desktop standard, trashy tries to conform with what
is available. If all else fails, ``$HOME/.trash`` is used.

Since trashy leverages the Open Desktop standard, you can use trashy
alongside your usual Trash. File you add to your trash with trashy go
to the same place as files you add to your trash by dragging and
dropping on your desktop. It's all talking the same language.


Aliases
-----------

Most of us had `rm` beat into our heads early on, so getting out of
the habit of using it is actually really hard. If you find yourself
using `rm` in spite of trashy, you can just `alias rm='trashy'` in
your `.bashrc` file. This works quite well, in truth; and if you ever
want to override your alias, just use:

    \rm foo

or

    /bin/rm foo

Simple as that.

But until your muscle memory gets used to the idea that it's going to
be typing 'trash' instead of 'rm' when you want to delete a file, the
alias helps.


Removing the Alias
--------------------

Once you're used to using `rm` to delete permanently,
and trashy to move to a trash bin, just delete the alias from your `.bashrc` file.


Why trashy?
-----------------

The `rm` command doesn't account for human error. I like my UNIX to be
responsive and obedient as much as anyone, but sometimes I make
mistakes. Trashy offers a buffer between you and thermo nuclear war.

Trashy is BASHy, meaning that it's really really portable; anything
that can run BASH can run trashy. It can be installed easily on (and
is actively used on) GNU Linux, freeBSD, and netBSD. It has also been
tested on Solaris and Open Solaris families, and even Mac (obviously
not Freedesktop-compliant, so features are missing) OS.

It's simple, but it works well and it works on lots of systems.

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

More features are still planned; notably, better handling of files
that are not in one's home folder (that is, do not copy file to local
filesystem to "trash" it; use a hidden .trash dir on the remote file
system instead, or at least provide this option).

I can generally be contacted via klaatu at the domain of
member dot fsf dot org.
