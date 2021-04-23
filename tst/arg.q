\l src/arg.q

x:("-host";"localhost";"-port";"5000";"-user";"root";"-pass";"sesame")
y:("-host";"localhost";"-port";"5000")
z:("-host";"localhost")

.arg.req[`host;`]
.arg.req[`port;0N]
.arg.opt[`user;enlist""]
.arg.opt[`pass;enlist""]

assert:{if[not x~y;'`$"expecting '",(-3!x),"' but found '",(-3!y),"'"]}
assert[`host`port`user`pass!(`localhost;5000;enlist"root";enlist"sesame")].arg.read x / parsing
assert[`host`port`user`pass!(`localhost;5000;enlist"";enlist"")].arg.read y           / defaulting
assert["port"]@[.arg.read;z;{x}]                                                      / signalling
