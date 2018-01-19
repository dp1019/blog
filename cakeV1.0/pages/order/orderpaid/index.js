// pages/order/ordersta/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    order : [],
    img: '../images/address.png',
    CouponPrice :0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(options)
    var _this = this
    wx.request({
      url: 'http://cake.com/index/Good/getOrderById/order_id/' + options.order_id,
      method: 'POST',
      dataType: 'json',
      success: function (res) {
        if (res.statusCode == 200) {
          if (res.data.code == 1) {
            _this.setData({
              order: res.data.data
            })
            console.log(_this.data.order)
          }
        }
      }
    })
    // var arr = this.data.cakes;
    // var prices = 0;
    // for (var i = 0; i < arr.length; i++) {
    //   prices += arr[i]['price'] * arr[i]['num'];
    // }
    // this.data.totalprice = prices;
    // this.setData({
    //   totalprice: this.data.totalprice
    // })
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