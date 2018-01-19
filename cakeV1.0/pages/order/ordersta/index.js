// pages/order/ordersta/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    img: '../images/address.png',
    username: '陈小姐',
    phone: '1366669999',
    address: '广东省广州市海珠区新港东路',
    time:'2017-12-01',
    timeSlot:'14:00-17:00',
    message:'多放点吃蛋糕的刀叉',
    CouponPrice:'10',
    disPrice:'345',
    cakes: [
      {
        comImg:'../images/cake3.png',
        cakename: '经典地中海蛋糕',
        spec: '2-4人分享（6寸）',
        candle: '数字蜡烛',
        price: '188',
        num: '1',
      },
      {
        comImg: '../images/cake3.png',
        cakename: '经典地中海蛋糕',
        spec: '2-4人分享（6寸）',
        candle: '数字蜡烛',
        price: '188',
        num: '1',
      }
    ],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
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