const express = require('express');
//添加路由
const r = express.Router();
// const mysql = require('mysql');
//1.注册用户(post /reg)
//接口地址:http://127.0.0.1:8080/v1/user/reg
//请求方式:post
//添加链接池
const pool = require('../pool.js');
// console.log(pool);

r.post('/reg', (req, res, next) => {
	//1.1获取post传递的(body)的参数
	var obj = req.body;
	console.log(obj);
	//1.2判断各项是否为空
	if (!obj.uname) { //用户名为空
		res.send({
			code: 401,
			msg: '用户名不能为空'
		});
		return; //阻止往后执行
	}
	//验证各项是否为空
	if (!obj.upwd) { //用户密码为空
		res.send({
			code: 402,
			msg: '用户密码不能为空'
		});
		return;
	}
	if (!obj.email) { //用户密码为空
		res.send({
			code: 403,
			msg: '用户邮箱不能为空'
		});
		return;
	}
	if (!obj.phone) { //手机号码为空
		res.send({
			code: 404,
			msg: '用户手机号不能为空'
		});
		return;
	}
	//验证手机号码格式
	//如果格式错误
	var p = /^1[3-9]\d{9}$/;
	if (!p.test(obj.phone)) {
		res.send({
			code: 405,
			msg: '手机号码格式错误'
		});
		return;
	}
	//1.3执行SQL命令
	pool.query('insert into xz_user set ?', [obj], (err, result) => {
		if (err) {
			next(err);
			return;
		}
		console.log(result);
		res.send({
			code: 200,
			msg: '注册成功'
		});
	});
});
//注册结束
//2.用户登录(post /login)
r.post('/login', (req, res, next) => {
	var obj = req.body;
	console.log(obj);
	if (!obj.uname) {
		res.send({
			code: 402,
			msg: '用户名不能为空'
		});
		return;
	}
	if (!obj.upwd) {
		res.send({
			code: 403,
			msg: '密码不能为空'
		});
		return;
	}
	pool.query('select * from xz_user where uname = ? and upwd = ?', [obj.uname, obj.upwd], (err, result) => {
		if (err) {
			next(err);
			return;
		}

		if (result.length === 0) { //每一个空数组的比较比较的是地址,每一个空数组地址不同,但是可以通过数组的长度来判断是否是空数组,数组的长度为0则是空数组
			res.send({
				code: 201,
				msg: '登录失败'
			});
		} else {
			res.send({
				code: 200,
				msg: '登录成功'
			});

		};
	});
});


//用户删除路由
r.delete('/:uid', (req, res, next) => {


	pool.query('delete from xz_user where uid = ?', [req.params.uid], (err, result) => {
		if (err) {
			next(err);
			return;
		}
		if (result.affectedRows === 1) {
			res.send({
				code: 200,
				msg: '删除成功'
			});

		} else {
			res.send({
				code: 201,
				msg: '删除失败'
			});
		}

	});

});
//用户修改路由
//修改用户(put /)
//接口地址:http://127.0.0.1:8080/v1/users
//请求方法:put
r.put('/', (req, res, next) => {
	//4.1获取post(body)传递参数
	var obj = req.body;
	console.log(obj);
	//判断各项是否为空
	var i = 400; //状态码初始化
	for (var k in obj) {
		i++;
		//k属性名 obj[k]属性值
		//console.log(k,obj[k]);
		//如果属性值为空,提示属性名这项不能为空
		if (!obj[k]) {
			res.send({
				code: i,
				msg: k + '不能为空'
			});
			return;
		}
	}
	pool.query('update xz_user set? where uid = ?', [obj, obj.uid], (err, result) => {
		if (err) {
			next(err);
			return;
		}
		console.log(result);
		//结果是对象,如果对象下的affectedRows为0说明修改失败,否则修改成功
		if (result.affectedRows === 0) {
			res.send({
				code: 201,
				msg: '修改失败'
			});
		} else {
			res.send({
				code: 200,
				msg: '修改成功'
			});
		}

	})

});


// 导出路由器对象
module.exports = r;
