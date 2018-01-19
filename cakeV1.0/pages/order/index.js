// pages/order/index.js

Page({

  /**
   * 页面的初始数据
   */
  data: {
    cakes:[
      { 
        id: 16,
        ordernum:615151256,
        product:[
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size:'2-4人分享（6寸）',
            original: 118.00,
            bestowed: '数字蜡烛',
            num:1
          },
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size: '1-2人分享（4寸）',
            original: 88.00,
            bestowed: '数字蜡烛',
            num:2
          },
        ],
        totalprice: 0,
        condition:1,
      },
      {
        id: 16,
        ordernum: 615151256,
        product: [
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size: '8-10人分享（10寸）',
            original: 418.00,
            bestowed: '数字蜡烛',
            num: 1
          },
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size: '2-4人分享（6寸）',
            original: 118.00,
            bestowed: '数字蜡烛',
            num: 1
          },
        ],
        totalprice: 0,
        condition: 2,
      },
      {
        id: 16,
        ordernum: 615151256,
        product: [
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size: '4-6人分享（8寸）',
            original: 218.00,
            bestowed: '数字蜡烛',
            num: 1
          },
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size: '2-4人分享（6寸）',
            original: 118.00,
            bestowed: '数字蜡烛',
            num: 3
          },
        ],
        totalprice: 0,
        condition: 3,
      },
      {
        id: 16,
        ordernum: 615151256,
        product: [
          {
            commodityimg: 'images/tu.png',
            commodityname: "经典地中海蛋糕",
            size: '2-4人分享（6寸）',
            original: 128.00,
            bestowed: '数字蜡烛',
            num: 2
          },
          
        ],
        totalprice:0,
        condition: 4,
      },
    
    ],
    
    showView: true,
    active_number: 0,
    
  },
  //全部订单
  choose: function (option) {
    var cate_id = 0;
    var cate_id = option.target.dataset.value;
    if (cate_id == 0) {
      this.setData({
        cake: this.data.cakes,
        active_number: cate_id
      })
    } else {
      var temps = this.data.cakes
      var arr = []
      for (var i = 0; i < temps.length; i++) {
        if (temps[i]['condition'] == cate_id) {
          arr.push(temps[i])
        }
      }
      this.setData({
        cake: arr,
        active_number: cate_id
      })
    }
    
  },
  
  // 马上支付
  paid: function () {
    wx.navigateTo({
      url: '../order/ordersub/index'
    })
  },
  // 取消订单
  cancelpaid: function (e) {
    var id = e.currentTarget.id;
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
  determine:function(){

  },
  // 催单
  reminders: function () {
    wx.navigateTo({
      url: ''
    })
  },
  // 马上评论
  commentnow: function () {
    wx.navigateTo({
      url: '../order/comment'
    })
  },
  // 查看评论
  seecomment: function () {
    wx.navigateTo({
      url: '../product/'
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    /////获取每一笔订单的总价
    var all = this.data.cakes;
    var products = [];
    for( var i=0 ;i<all.length;i++){
      products.push(all[i]['product'])
    }
    var price = [];
    for(var k=0;k<products.length;k++){
      var prices = 0;
      for(var j = 0;j<products[k].length;j++){
        prices += products[k][j]['original'] * products[k][j]['num'];
      }
      price.push(prices);
    }
    for(var i=0 ;i<all.length;i++){
      all[i]['totalprice']=price[i]
    }
    
    this.setData({
      cake: this.data.cakes,
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