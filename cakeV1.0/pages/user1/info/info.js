// pages/user/mydatum.js

Page({

  /**
   * 页面的初始数据
   */
  data: {
    photo:'../images/tx.png',
    user:'wang',
    gender:'男',
    dateValue: '2016-10-13',
    gen: true
  },
  datePickerBindchange: function (e) {
    this.setData({
      dateValue: e.detail.value
    })
  },
  editname:function(){
    wx.navigateTo({
      url: 'editname/index',
    })
  },
  editpass:function(){
    wx.navigateTo({
      url: 'editpass/index',
    })
  },
  editgender: function () {
    var that = this;
    that.setData({
      gen: (!that.data.gen)
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 生命周期函数--监听页面加载
    showView: (options.showView == "true" ? true : false);
    gen: (options.gen == "true" ? true : false);
  },
  onChangeShowState: function () {
    var that = this;
    that.setData({
      showView: (!that.data.showView)
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