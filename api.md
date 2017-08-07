[TOC]

# API

---

## 前端h5预约

### 预约列表页

**简要描述：**

- 预约列表页

**请求URL：**
- `/orderajax/list `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|shopName |否 |string |门店   |
|level | 否  |string | 职位    |
|service     |否  |string | 验证码    |
|page| 否| int | 当前页码|
|size| 否| int | 每页显示多少条|
 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
    "result": {
        "list": [
    		{
    			"id": 1,
    			"name": "meili",
    			"shop_name": "东田造型",
    			"level": "高级发型师",
    			"service": [
    				"烫发", "染发", "剪发"
    			],
    			"diposit": 10,
    			"pic": "http://acewill/pics/mieli.png"
    		}
    	],
    	"page": {
    		"totalItems": 10,
    		"currentPage": 1,
    		"size": 10
    	}
    }
  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|id |int   |发型师ID |
|name |string   |发型师姓名 |
|shop_name |string   |门店名称 |
|level |string   |发型师职位 |
|service |array   |服务分类["烫发", "染发", "剪发"] |
|diposit |int   |预付押金 |
|pic |string   |头像 |
|totalItems |int  |总数量 |
|currentPage |int   |当前页 |
|size |int   |每页显示数量 |


 **备注**

 前端客户h5预约列表的api

---

### 预约门店列表

**简要描述：**

- 预约门店列表

**请求URL：**
- `/orderajax/shoplist `

**请求方式：**
- GET

**参数：**

无

 **返回示例**

```
  {
    "errcode": 0,
    "errmsg": "success",
    "result": {
        "list": [
            {
                "shop_id": 1,
                "shop_name": "东田造型",
                "levels": [
                    {
                        "level_id": 12
                        "level": "高级总监",
                        "service": ["剪发", "烫发"]
                    },
                    {
                        "level_id": 13
                        "level": "中级总监",
                        "service": ["剪发", "烫发"]
                    }
                ]
            }
        ]
    }

  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|shop_id |int   |门店ID |
|shop_name |string   |门店名称 |
|levels| array| 所有职位|
|level_id | int | 职位ID |
|level | string | 职位 |
|service |array   |服务分类["烫发", "染发", "剪发"] |


 **备注**
前端h5，所有门店列表，用来筛选美发师

---

### 员工(美发师)详情

**简要描述：**

- 员工详情

**请求URL：**
- `/orderajax/detail `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|id|是  |int |员工id  |

 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
    "result": {
		"id": 1,
		"name": "meili",
		"shop_name": "东田造型",
		"level": "高级发型师",
		"service": [
			"烫发", "染发", "剪发"
		],
		"diposit": 10,
		"pic": "http://acewill/pics/mieli.png",
		"order_time": "今天: 18:00",
		"desc": "木北造型长了健康就看就看就看就看就看就看就看接口就"
	}
  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|id |int   |发型师ID |
|name |string   |发型师姓名 |
|shop_name |string   |门店名称 |
|level |string   |发型师职位 |
|service |array   |服务分类["烫发", "染发", "剪发"] |
|diposit |int   |预付押金 |
|pic |string   |头像 |
|order_time |string   |预约时间 |
|desc |string   |详情描述 |


 **备注**
 美发师员工详情页

 ---

### 订单

#### 提交订单

**简要描述：**

- 提交订单

**请求URL：**
- ` orderajax/submit `

**请求方式：**
- POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|id|是  |string |员工id  |
|order_time|是  |string |预约时间  |
|name|是  |string |预约人  |
|tel|是  |string |手机号  |
|remark|否  |string |备注  |
|diposit|否  |int |实付款  |
 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
	"result": {
		"order_id": "1234556666"
	}
  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
| order_id| string | 订单id |

 **备注**

---

#### 支付

**简要描述：**

- 支付

**请求URL：**
- `/orderajax/payment`

**请求方式：**
-  POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
| order_id | 是 | string | 订单id |
| amount | 是 | int | 付款金额 |

 **返回示例**

```
  {
    "errcode": 0,
    "errmsg": "success"
  }
```

 **返回参数说明**

 无

 **备注**
微信支付

---

####  我的订单

**简要描述：**

- 我的订单

**请求URL：**
- `/orderajax/orderlist `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|page | 否| int | 当前页|
|size | 否| int | 每页显示条数|

 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
    "result": {
        "list": [
    		{
    			"id": 1,
    			"status": "代付款",
    			"hairdresser": "李毅",
    			"level": "总监发型师",
    			"pic": "http://acewill/meli.png",
    			"diposit": 10
    		}
    	],
    	page: {
    		totalItems: 100,
    		currentPage: 1,
    		size: 10
    	}
    }
  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
| id | string| 订单号|
| status | int | 1: 代付款, 2: 未接单, 3: 已取消(退款中,退款失败, 退款成功), 4: 已完成, 5: 已接单, 6: 已关闭|
| hairdresser | string| 员工名称|
| level | string| 职位|
| pic | string| 头像|
| diposit | int| 预付款|
| totalItems | int| 总订单数|
| currentPage | int| 当前页|
| size | int| 每页显示多少条|

 **备注**
前端h5，订单列表

---

#### 订单详情

**简要描述：**

- 订单详情

**请求URL：**
- `orderajax/order/detail `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|order_id|是  |string |订单id |

 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
	"result": {
		"order_id": 1,
		"create_time": "2016-12-06 12:12:12",
		"hairdresser": "李毅",
		"level": "总监发型师",
		"pic": "http://acewill/meli.png",
		"diposit": 10,
		"status": 1,
		"remark": "晚点到",
		"reason": "临时有事，不能按时到店",
		"address": "朝阳三里屯",
		"order_time": "07月06日 周四 16: 00",
		"tel": "11111111111",
		"code": "1759"
	}
  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
| order_id | string| 订单号|
| create_time | string| 订单创建时间|
| status | int | 1: 代付款, 2: 未接单, 3: 已取消(退款中,退款失败, 退款成功), 4: 已完成, 5: 已接单, 6: 已关闭|
| hairdresser | string| 员工名称|
| level | string| 职位|
| pic | string| 头像|
| diposit | int| 预付款|
| remark | string| 备注|
| reason | string| 退款理由|
| address | string| 地址|
| order_time | string| 预约时间|
| tel | string| 电话|
| code | string| 预约码|

 **备注**
订单详情

---


---

## 前端美发师h5

### 美发师登录

**简要描述：**

- 美发师登录

**请求URL：**
- ` /orderajax/login `

**请求方式：**
- POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|tel|是  |string | 手机号 |
|captach|是  |string | 验证码 |


 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
	"result": {

	}
  }
```

 **返回参数说明**
无

 **备注**
美发师登录接口

---

### 手机验证码

**简要描述：**

- 手机验证码

**请求URL：**
- `/orderajax/login/capcha `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|tel|是  |string | 手机号 |


 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success"
  }
```

 **返回参数说明**

 无

 **备注**
	请求手机号验证码，发送短信

---

### 美发师订单

#### 美发师预约订单

**简要描述：**

- 美发师预约订单

**请求URL：**
- ` orderajax/hairdresser/orderlist `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|page|否  | int | 当前页 |
|size| 否| int |每页显示多少条|
|status| 是  | int | 订单状态 |



 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
    "result": {
        "list": [
    		{
    			"order_id": 1213,
    			"order_time": "今天 07/11 13:00",
    			"name": "李毅",
    			"tel": "12345678910",
    			"diposit": 10,
    			"pay_time": "2016-12-05 12:00:00",
    			"status": 1
    		}
    	],
    	"page": {
    		"totalItems": 100,
    		"currentPage": 1,
    		"size": 10
    	}        
    }

```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
| order_id |  string| 订单号 |
| order_time |  string | 预约时间 |
| name |  string| 预约人 |
| tel |  string| 电话 |
| diposit |  int | 预付金额 |
| pay_time |  string| 付款时间 |
| status |  int | 订单状态 1: 退款成功, 2: 退款失败 |
| totalItems|int| 订单总数|
| currentPage|int| 当前页|
| size|int| 每页显示条数|




 **备注**

---

#### 美发师是否接单

**简要描述：**

- 美发师是否接单

**请求URL：**
- `/orderajax/hairdresser/order/accept `

**请求方式：**
- POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
| status |是  | int | 0: 取消订单, 1: 接单 |


 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success"
  }
```

 **返回参数说明**


 **备注**

 ---

#### 预约码验证

**简要描述：**

-  预约码验证

**请求URL：**
- `/orderajax/hairdresser/order/code `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
| code |是  | int | 预约码 |


 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success"
  }
```

 **返回参数说明**
 无

 **备注**

 ---

### 预约时间

####  获取时间

**简要描述：**

-  获取时间  

**请求URL：**
- `/orderajax/hairdresser/schedule`

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |


 **返回示例**

```
  {
    "errcode": 0,
	"errmsg": "success",
    "result": {
        "list": [
            {
                "day": "今天",
                "date": "07/05",
                "time": [
                    {
                        status: 1,
                        time: "09:00"
                    },
                    {
                        status: 0,
                        time: "09:00"
                    }
                ]
            },
            {
                "day": "明天",
                "date": "07/06",
                "time": [
                    {
                        status: 1,
                        time: "09:00"
                    },
                    {
                        status: 0,
                        time: "09:00"
                    }
                ]
            },
            {
                "day": "周一",
                "date": "07/07",
                "times": [
                    {
                        status: 1,
                        time: "09:00"
                    },
                    {
                        status: 0,
                        time: "09:00"
                    }
                ]
            }
        ]
    }

  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----    |
| day | string | 星期|
| date | string | 日期 |
| times | array | 时间集合 |
| status | int | 状态: 0: 不可选, 1: 可选|
| time | string| 时间 |
 **备注**
 获取美发师的时间schedule, 如果没设置就返回后台设置的时间，如果设置了就返回美发师自己定制的时间

 ---

 ####  设置时间

**简要描述：**

-  设置时间  

**请求URL：**
- `/orderajax/hairdresser/schedule `

**请求方式：**
- POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
| week | 是 | array | 星期 |
| range_date | 是 | array | 时间段 |


 **返回示例**

```
  {
    "errcode": 0,
    "errmsg": "success"
  }
```

 **返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----    |
| week | array |["周一", "周二", "周日"]|
| range_date | array | [{"start": "09:00", "end": "18:00"},{"start": "09:00", "end": "18:00"}]|

 **备注**

 ---

 ####  删除时间设置

**简要描述：**

-  删除时间设置  

**请求URL：**
- `/orderajax/hairdresser/schedule/delete `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
| id | 是 | int | 时间设置项的id |

 **返回示例**

```
  {
    "errcode": 0,
    "errmsg": "success"
  }
```

 **返回参数说明**
无
 **备注**
