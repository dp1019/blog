// pages/member/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cates: [],
    cakes: [],
    active: 0,
    showView: true
  },
exchange: function(e) {
    var id = e.currentTarget.id;
    console.log(id);
    var that = this;
    that.setData({
      showView: (!that.data.showView),
    })
  },
  cancel: function () {
    var that = this;
    that.setData({
      showView: true
    })
  },


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(app.globalData)
    this.setData({
      cates: app.globalData.cates,
      cakes: app.globalData.cakes
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