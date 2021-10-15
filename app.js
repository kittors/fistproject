const express = require('express');
//创建WEB服务器
const app = express();
// const mysql = require('mysql');
//引入路由
const userRouter = require('./routes/user.js');
const productRouter = require('./routes/product.js');

// console.log(userRouter);

//设置端口
app.listen(8080, () => {
	console.log('web服务器连接成功');
});
//将所有的post请求数据转为对象
app.use(express.urlencoded({
	extended: false //是否使用第三方的查询字符串,false使用qs,true使用querystring
}));
//使用路由,添加前缀
app.use('/v1/users', userRouter);
app.use('/v1/products', productRouter);

app.use((err, req, res, next) => {
	console.log(err);//打印路由传过来的错误
	res.status(500).send({
		code: 500,
		msg: '服务器错误'
	});
});
