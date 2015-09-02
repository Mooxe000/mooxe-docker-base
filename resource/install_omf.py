#!/usr/bin/env python
# -*- coding: utf-8 -*-
from os import path

def get_real_path(relative_path):
    return path.realpath(
        path.join (
            path.dirname(
                path.realpath(__file__)
            ),
            relative_path
        )
    )

def handle_install_file():

    path_of_install_file = get_real_path('./install')
    lines = []

    """
    read install file
    """
    with open(path_of_install_file, 'r') as f:
        lines = f.readlines()
        for index, line in enumerate(lines):
            if 'cd $HOME' in line or \
                '[ -z ${CI+_} ]' in line:
                lines[index] = '#{line}'.format(
                    line = line
                )
        f.closed

    """
    write install file
    """
    with open(path_of_install_file, 'w') as f:
        f.write(''.join(lines))
        f.closed

handle_install_file()
