// pages/user/index.js
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    member:0,
    coupon:10,
    points:2000,
    boult:'./images/002.png',
    myphone:'400-222-1111',
    myworking:'09:00 - 18:00',
    isbinding:1
  },
  unbindPhone:function(){
    wx.navigateTo({
      url: 'phone/unbind/index',
    })
  },
  bindPhone: function () {
    wx.navigateTo({
      url: 'phone/index'
    })
  },
  bindMyDatum:function(){
    wx.navigateTo({
      url: '../user/info/info',
    })
  },
  bindquestions:function(){
    wx.navigateTo({
      url: 'question/index',
    })
  },
  bindintegral:function(){
    wx.navigateTo({
      url: '../integral/index',
    })
  },
  bindintegrals: function () {
    wx.navigateTo({
      url: 'integral/index',
    })
  },
  bindmymember:function(){
    wx.navigateTo({
      url: 'mymember/index',
    })
  },
  bindaddress: function(){
    wx.navigateTo({
      url: 'address/selected/addressChoice',
    })
  },
  bindshoping: function () {
    wx.navigateTo({
      url: '../order/shoppingeditor/index',
    })
  },
  bindCoupon:function(){
    wx.navigateTo({
      url: '../mine/coupon/index',
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse) {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })  
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })  
        }
        
      })
      console.log(app.globalData)
    }
  },
  getUserInfo: function (e) {
    console.log(e);
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
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