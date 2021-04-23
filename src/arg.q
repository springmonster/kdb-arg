\d .arg

add:{def,:enlist[y]!enlist(x;z)}
req:add[1b;;] / required
opt:add[0b;;] / optional

read:{(key d:.Q.opt x){if[not y in x;'y]}/:where def[;0];.Q.def[def[;1];d]}

\
Usage:

  Add default types and values for required and optional arguments; signal
  the omission of a required arguments.

  q -host localhost -port 5000 -user root -pass sesame

  .arg.req[`host;`]         / required -host argument, cast to symbol
  .arg.req[`port;0N]        / required -port argument, cast to long
  .arg.opt[`user;enlist""]  / optional -user argument, default to empty string
  .arg.opt[`pass;enlist""]  / optional -pass argument, default to empty string

  q).arg.read .z.x
  host| `localhost
  port| 5000
  user| ,"root"
  pass| ,"sesame"  
