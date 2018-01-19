// pages/order/ordersub/index.js
var util = require('../../../utils/util.js')
const date = util.formatTime1(new Date)
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    picker2Value: '',
    picker2Range: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120],
    picker3Value: '需要',
    picker3Range: ['需要', '不需要'],
    readyToOrder : [],
    img:'../images/address.png',
    dateValue:date,
    picker1Value: 0,
    picker1Range: ['14:00-17:00', '09:00-12:00'],
    totalprice:0,
    message : '',
    code_id : 2, 
    addressList:[], //当前用户的所有收货地址 二位数组 待完成
    list : [], // 为静态页面提供可选地址
    address: 0,   // 索引值
  },
  datePickerBindchange: function (e) {
    this.setData({
      dateValue: e.detail.value
    })
  },
  addAddress : function(e){
    wx.navigateTo({
      url: '/pages/user/address/add/addressAdd',
    })
  },
  normalPickerBindchange: function (e) {
    this.setData({
      picker1Value: e.detail.value
    })
  },
  normalPickerBindchange2: function (e) {
    this.setData({
      picker2Value: e.detail.value
    })
  },
  normalPickerBindchange3: function (e) {
    this.setData({
      picker3Value: e.detail.value
    })
  },
  // 收货地址
  normalPickerBindchange4: function (e) {
    this.setData({
      address: e.detail.value,
    })
  },
  // 获取留言
  bindKeyInput: function (e) {
    this.setData({
      message: e.detail.value
    })
  },
  toOrder:function(){
    var card = false
    if (this.data.picker3Range[this.data.picker3Value] == '需要'){
      card = true
    }
    var candle;
    if (this.data.picker2Value == ''){
      candle = 0;
    }else{
      candle = parseInt(this.data.picker2Range[this.data.picker2Value]);
    }
    var order = {
      'orderdetails': this.data.readyToOrder,
      'message' : this.data.message,
      'code_id' : this.data.code_id,
      'day' : this.data.dateValue,
      'time': this.data.picker1Range[this.data.picker1Value],
      'member_id': 1, //登录获取需修改没登录不能提交 未完
      //改变切换 未完
      'address': this.data.addressList[this.data.address].prefix_address + this.data.addressList[this.data.address].address, 
      'consignee': this.data.addressList[this.data.address].consignee,
      'receiving_telephone': this.data.addressList[this.data.address].receiving_telephone,
      'candle': candle,
      'card' : card
    }
    // console.log(wx.getStorageSync('cart'))
    //console.log(order);return false
    wx.request({
      url: 'http://cake.com/admin/order/create',
      dataType: 'json',
      method: 'POST',
      data: order,
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function (res) {
        if(res.data.code == 1){
          wx.showToast({
            title: '订单提交成功',
            icon: 'success',
          })
          if (wx.getStorageSync('is_cart')){ //如果是购物车提交删除购物车对应产品
            var arr = []
            var cart = wx.getStorageSync('cart')
            for(var i = 0 ; i < cart.length; i++){
              if(!cart[i]['checked']){
                arr.push(cart[i]);
              }
            } 
            wx.setStorageSync('cart', arr)  
          }
          wx.redirectTo({   // 到付款页面并提交单签订单id
            url: '/pages/order/orderpaid/index?order_id='+res.data.order_id,
          })
        }else{
          // 弹出错误信息
        }
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var readyToOrder = wx.getStorageSync('readyToOrder')  // 取出预备订单数据
    var total_price = 0;
    for (var i = 0; i < readyToOrder.length;i++){
      total_price += parseInt(readyToOrder[i].nowPrice * readyToOrder[i].num)
    }
    //addressList = wx.getStorageSync('userInfo').addressList
    // 这里模拟接收一个用户所有的地址
    var addressList = [
      { address: '测试地址一', consignee: 'json', receiving_telephone:'18184642584',prefix_address:'广东省广州市天河区'},
      { address: '测试地址二', consignee: 'json1', receiving_telephone: '18184642498',prefix_address:'四川成都市金牛区'},
      { address: '测试地址三', consignee: 'json2', receiving_telephone: '18184642154',prefix_address:'云南省大理市58区'}
    ]  
    var list = []
    for(var i = 0 ; i < addressList.length ; i++){
      list.push(addressList[i].address)
    }
    this.setData({
      readyToOrder: readyToOrder,
      totalprice : total_price,
      addressList : addressList,
      list : list
    })
    
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})
