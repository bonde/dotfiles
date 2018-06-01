function ls --description 'List contents of directory'
  set -l param --color=auto

  set param $param --hide="*.pyc" --hide="__pycache__*" -F

  if [ $hidden_count -ge $file_count ]
    set param $param -a
  end

  if isatty 1
    set param $param --indicator-style=classify
  end
  command ls $param $argv
end