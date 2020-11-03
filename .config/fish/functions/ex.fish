function ex
if test -f $argv
switch $argv
case "*.tar.bz2"
tar xjf $argv
case "*.tar.gz"
tar xzf $argv
case "*.bz2"
bunzip2 $argv
case "*.rar"
unrar x $argv
case "*.gz"
gunzip $argv
case "*.tar"
tar xf $argv
case "*.tbz2"
tar xjf $argv
case "*.tgz"
tar xzf $argv
case "*.zip"
unzip $argv
case "*.Z"
uncompress $argv
case "*.7z"
7z x $argv
case "*.deb"
ar x $argv
case "*.tar.xz"
tar xf $argv
case "*.tar.zst"
unzstd $1
case "*"
echo $argv cannot be extracted using ex
end
else
echo $argv is not a valid file
end
end
