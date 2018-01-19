//index.js
//获取应用实例
const app = getApp()
Page({
  data: {
    positionIcon:"images/position.png",
    positionName:"广州",
    strawberryLove:"images/sLove.png",
    cates: [],
    cakes: [],
    active:0,
    optionNum: ''
    
    
  },
  toProductDetails: function () {
      wx.navigateTo({
          url: ("productDetails/index")
      })
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onLoad:function(){
    this.setData({
      cates: app.globalData.cates,
      cakes: app.globalData.cakes,
      optionNum: (app.globalData.cates.length + 1) * 144 -20 + "rpx"
    })
    console.log(this.data.cates)
  },
  choose: function (options) {
    var cate_id = options.target.dataset.value;
    if (cate_id == 0) {
      this.setData({
        cakes: app.globalData.cakes,
      })
    } else {
      var temps = app.globalData.cakes
      var arr = []
      for (var i = 0; i < temps.length; i++) {
        if (temps[i]['productcate_id'] == cate_id) {
          arr.push(temps[i])
        }
      }
      this.setData({
        cakes: arr
      })
    }
    this.setData({
      active:cate_id
    })
  },
    
})
