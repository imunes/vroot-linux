#!/bin/sh

run_dir='/run/quagga'
mkdir -p $run_dir
chown quagga:quagga $run_dir

init_file='/etc/init.d/quagga'
if  [ -f $init_file ]; then
    $init_file start
fi

zebra -dP0

for f in rip ripng ospf ospf6; do
    grep -q "router $f\$" $1 && ${f}d -dP0 
done

for f in bgp isis; do
    grep -q "router $f .*\$" $1 && ${f}d -dP0
done

vtysh << __END__
conf term
`cat $1`
__END__
