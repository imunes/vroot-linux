#!/bin/sh

run_dir='/run/frr'
mkdir -p $run_dir
chown frr:frr $run_dir

conf_dir='/etc/frr'
for f in rip ripng ospf ospf6; do
	grep -q "router $f\$" $1 && sed -i'' "s/${f}d=no/${f}d=yes/" $conf_dir/daemons
done

for f in bgp isis; do
	grep -q "router $f .*\$" $1 && sed -i'' "s/${f}d=no/${f}d=yes/" $conf_dir/daemons
done

init_file='/etc/init.d/frr'
if [ -f $init_file ]; then
	if test -z "$(pgrep frr)"; then
		$init_file restart
	fi
fi

vtysh << __END__
conf term
`cat $1`
__END__
