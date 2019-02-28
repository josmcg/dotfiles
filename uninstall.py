"""
Uninstall the dotfiles, useful for development
Author: Josh McGrath
"""
import os
from os import walk, remove
from os.path import join, isfile

DONT_REMOVE = [".DS_Store"]



def collect_files(path):
    """
    get a flattened version of the file tree
    :param path: the root of the file tree
    :return: [file_path_1, file_path_2, ... file_path_n]
    """
    flat = []
    for root, _, files in walk(path):
        if ".git" in root:
            continue
        for file in files:
            flat.append(join(root, file))
    return flat


def uninstall():
    """
    entry point
    """
    home = os.getenv("HOME")
    here = "."
    files = collect_files(here)
    for file in files:
        file = list(file)
        file[0] = home
        file = "".join(file)
        if isfile(file) and file not in DONT_REMOVE:
            print(f"deleting:{file}")
            remove(file)

if __name__ == "__main__":
    uninstall()
