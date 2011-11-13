#!/usr/bin/env python

import os
from os.path import join
import errno

# Program variables
home = os.path.expanduser('~')
dotfiles = 'dotfiles'


# The dictionary of links to be created and targets.
# Link names are relative to users home.
# Targets are a tuple (dir,ans) where ans is the standard answer.
# Target dirs are relative to the dotfiles dir.
linkdict = { '.vimrc' : ('vimconf/vimrc','y'),
             '.vim' : ('vimconf/vim','y'),
             '.zshrc' : ('zshconf/zshrc','y'),
             '.latexmkrc' : ('latexmkrc','y'),
             '.xinputrc' : ('xinputrc','y'),
             '.zope-external-edit' : ('zope-external-edit','n'),
             '.Xdefaults' : ('Xdefaults','n')
         }


# Dictionaty for prompt inputs
ansdict = { 'y' : True,
            'n' : False
        }


# Format the default choices
def format_choices(link):
    ret = []
    for c in ['y','n']:
        if c is linkdict[link][1]:
            ret.append(c.upper())
        else:
            ret.append(c)
    return '/'.join(ret)


# Prompt for input, returns true or false
def prompt(link):
    target = join(home, dotfiles, linkdict[link][0])
    choices = format_choices(link)
    ans = raw_input('Create %s to %s? [%s] ' % (link, target, choices))
    if ans.lower() is '':
        return ansdict[linkdict[link][1]]
    elif ans.lower() in ansdict.keys():
        return ansdict[ans.lower()]
    else:
        print 'Invalid selection, try again.'
        return prompt(link)


# Create the symbolic link to the target.
def create_symlink(link):
    linkpath = os.path.join(home,link)
    targetpath = os.path.join(home, dotfiles, linkdict[link][0])
    try:
        os.symlink(targetpath, linkpath)
    except OSError as e:
        if e.errno is errno.EEXIST:
            print "File %s exists!" % linkpath
            print "Remove or rename existing file."
        elif e.errno is errno.EACCESS:
            print "Cannot create symlink %s!" % linkpath
            print "Permission error!"
        else:
            print "Some error happened."
            raise
        return False
    else:
        return True


# Run this thing
def main():
    for link in linkdict:
        make_link = prompt(link)
        made_link = False
        if make_link:
            made_link = create_symlink(link)

        if make_link and made_link:
            print 'Success.'
        else:
            print "Skipping..."
        print ''


msg = """
dotfiles setup utility
Very simple, just answer the questions.
If at any time you want to abort use C-c and enjoy the exceptions.

"""


if __name__ == '__main__':
    print msg
    main()
