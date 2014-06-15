#! /bin/sh

# author  : xie yiming, mydearxym@gmail.com mydearxym@qq.com
# license : GPL
# created : 2014-06-15


cmd=$(which tmux)
session=rails
proj_dir="/Users/xieyiming/code/test_new"

if [ -z $cmd ]; then
  echo "dude, there is no tmux on your machine"
  exit 1
fi

$cmd kill-session -t rails 
# if rails already exit, it will be duplicate , so it's ok
echo "create your favor tumx env..."
$cmd new-session -s $session -d 

$cmd has -t $session
# $cmd has -t "not_exist"

if [ $? == 0 ]; then

	$cmd neww -n "zeus" -c $proj_dir -t $session
	$cmd neww -n "server" -c $proj_dir -t $session
	$cmd neww -n "console $ log" -c $proj_dir -t $session
	$cmd splitw -h -p 50 -c $proj_dir -t $session

	$cmd neww -n "routes" -c $proj_dir -t $session

fi

echo "config done!"
$cmd att -t $session
exit 0



