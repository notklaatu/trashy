# Trashy

Get trashy! A **mostly** Freedesktop-compliant rubbish bin interface for the shell, written entirely in Bash.

## The sane `rm` intermediary

If you're looking at [**trashy**](http://slackermedia.info/trashy) right now, you've probably just accidentally rm'd a superImportantFile by accident. 
You're cursing God, UNIX, GNU, computers, and yourself. 
There's [little](https://www.redhat.com/sysadmin/find-lost-files-scalpel) [hope](https://www.redhat.com/sysadmin/recover-partition-files-testdisk) for your already deleted file, with ``trashy``, you'll never have to go through that ever again! 

``Trashy`` is a simple shell script that enables you to restore superImportantFile simply and painlessly. Just type:

```
trash --restore foo
```

and 'foo' is put back where it belongs.

``Trashy`` also serves as a trashcan for the command line. Issue this command:

```
trash foo bar
```

and ``trashy`` moves the files 'foo' and 'bar' to your system trash. Or type:

```
trash foo\ bar
```

to move the file 'foo bar' to your system trash.

When you're really, *really* sure that you want to nuke everything in your trash out of existence, issue the command:

```
trash --empty
```

and ``trashy`` empties your system trash.


## Why trashy?

The ``rm`` command doesn't account for human error. 
Even if you like your UNIX to be responsive and obedient, you'll still make mistakes. 
Trashy offers a buffer between you and deleted-file disasters.

``Trashy`` is Bashy, meaning that it's very portable; anything that can run BASH can run it.
You can easily install it on GNU Linux, freeBSD, and netBSD. 
It's also been tested on Solaris and Open Solaris families, and even macOS (obviously not Freedesktop-compliant, so features are missing).

Projects similar to ``trashy`` do exist. 
One, [trash-cli](https://github.com/andreafrancia/trash-cli), uses Python and offers some really neat and fancy features.
Check it out if you're on a Linux box, or if you don't mind a bit of set-up on non-Free Desktop UNIX systems.


## System Trash

``Trashy`` defines a *system trash* on Linux, BSD, and Solaris-based operating systems in accordance to the Open Desktop standard:

```
~/.local/share/Trash 
```

Because ``trashy`` uses the Open Desktop standard, you can use it alongside the usual desktop Trash. 
Files you add to your trash with ``trashy`` go to the same place as files you drag-and-drop to the Trash on your desktop.

On systems that do not not to follow the Open Desktop standard or that do not use a graphical desktop, ``trashy`` tries to conform with what is available. 
If all else fails, it uses ``$HOME/.Trash``.


## Aliases

Many of us had ``rm`` beat into our heads early on, so getting out of the habit of using it is actually really hard. 
If you find yourself using ``rm`` in spite of ``trashy``, you can ``alias rm='trashy'`` in your ``.bashrc`` file. 
This works quite well. And if you ever want to override your alias, just use:

```
\rm foo
```

or

```
/bin/rm foo
```

Simple as that.

Until you get used to typing ``trash`` instead of ``rm`` when you want to delete a file, the alias helps.


### Removing the Alias

Once you've gotten used to using ``rm`` to permanently delete something, and using ``trashy`` to move to a trash bin, delete the alias from your ``.bashrc`` file.


## Bugs

Bugs are sure to emerge under the right testing circumstances. 
Give it a go and if you find one, please report it. I can't promise I'll fix bugs immediately, but they'll definitely make my list.
Otherwise, feel free to fix a bug and send me a patch, or a merge request on Gitlab.

## What's Next: Features

The top-priority plan is to provide better handling of files not in one's home folder — that is, do not copy file to local file system to "trash" it, but use a hidden .trash dir on the remote file system (or at least provide this option).

## Contact

You can email klaatu at the domain of member dot fsf dot org.
