// pages/integral/index.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    integralCakes: [],
    showView: true,
    active: 0,
    optionNum: ''
  },
  exchange: function (e) {
    var id=e.currentTarget.id;
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
  choose: function (options) {
    var cate_id = options.target.dataset.value;
    if (cate_id == 0) {
      this.setData({
        integralCakes: app.globalData.integralCakes,
      })
    } else {
      var temps = app.globalData.integralCakes
      var arr = []
      for (var i = 0; i < temps.length; i++) {
        if (temps[i]['productcate_id'] == cate_id) {
          arr.push(temps[i])
        }
      }
      this.setData({
        integralCakes: arr
      })
    }
    this.setData({
      active: cate_id
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      cates: app.globalData.cates,
      integralCakes : app.globalData.integralCakes, 
      optionNum: (app.globalData.cates.length + 1) * 144 - 20 + "rpx"
    })
    console.log(app.globalData)
    //console.log(integralCakes)
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