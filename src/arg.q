// 切换到.arg的命名空间
\d .arg

// , join, https://code.kx.com/q/ref/join/
// enlist https://code.kx.com/q/ref/enlist/

// 定义函数，参数为x，y，z，返回值为x，y，z的字典，赋值给def
// Assign a 1-item list
  //
  //While enlist returns a 1-item list, if all you need to do is assign it to a name not presently defined, you can exploit the fact that foo,: does not require foo to be defined.
  //
  //
  //q)a:enlist[3]
  //q)b,:3
  //q)a~b
  //1b
  // 这里如果不声明x,y,z，那么就是有顺序的？？？
add:{def,:enlist[y]!enlist(x;z)}
//add:{def,:enlist[x]!enlist(y;z)}
//add:{def,:enlist[z]!enlist(x;y)}
// 很奇怪
add:{[a;b;c] def,:enlist[a]!enlist(b;c)}

// 1b指定了x？？？y指定了key，z指定了value？？？
// 为什么？？？
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
