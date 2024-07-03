# List only sub-directories in the current dir
def ldir []  {
    ls | where type == "dir"
}

# List only files in the current dir
def lfile []  {
    ls | where type == "file"
}
}
