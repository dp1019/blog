// pages/product/productDetailsIntroduce.js
const app = getApp()
var WxParse = require('../../../wxParse/wxParse.js');
var util = require('../../../utils/util.js')
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cakeDetails:[],// 当前选中产品
    nowPrice: 0, // 价格
    index:0,     // APP数据重当前产品索引
    content:'',
    count:"150",
    code_number : 0,
    code_status : true,
    shopNum: 0, // 购物车商品数量
    indicatorActiveColor: "#FFFFFF",
    indicatorColor: "rgba(255,255,255,.3)",
    img:'../images/xiaolian.png',
    comment: "images/comment.png",
    specification: "2-4人（6寸）",
    
    productName: "海洋海风蛋糕",
    introduce: "images/introduce.png",
    shoping: "../images/shoping.png",
    /*购物车里面有几件商品*/
    
    imgUrls: [
      "images/banner2.png",
      "images/banner2.png",
      "images/banner2.png"
    ],
    cate: [
      {
        cateName: "包装好看"
      },{
        cateName: "好 吃"
      },{
        cateName: "物所超值"
      },{
        cateName: "有图评价"
      }
    ],
    data: [
      {
        photo: "../images/photo.png",
        name: "张大鹏",
        update_time: "2017-10-12",
        message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
        reply: ''
      },
      {
        photo: "../images/photo.png",
        name: "张大鹏",
        update_time: "2017-10-12",
        message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
        reply: "感谢你能喜欢"
      }
    ],
    intriduceDate: [
        {
            title: "海洋的风味~清新的浪漫回忆",
            flavor: "海洋风巧克力蓝莓加草莓味",
            sweetness: "60%~80%的糖份",
            crowd: "适合5~30岁的年轻人群",
            retainFreshness: "保鲜期限30天",
            material:"鸡蛋、面粉、巧克力、蓝莓、草莓"
        }
    ],
    circular: true,
    autoplay: true,
    indicatorDots: true,
  },
  toAllComment:function(){
    wx.navigateTo({
        url:'../allComment/index'
    })
  },
  goCart: function(){
    if (util.auth() === false) {
      return false
    }
    var cart = wx.getStorageSync('cart')
    if (cart.length == 0) {
      wx.navigateTo({
        url: '/pages/order/shoppingnull/index',
      })
    } else {
      wx.navigateTo({
        url: '/pages/order/shoppingeditor/index',
      })
    }
  },
  toCart:function(){
    if (util.auth() === false) {
      return false
    }
    // console.log(this.data.cakeDetails)
    // return false
    var cart = wx.getStorageSync('cart')
    if (!cart) {      // 如果购物车中为空，声明空数组
      cart = []
      var standards = [];
      for (var i = 0; i < this.data.cakeDetails.standards.length ; i++){
        standards.push(this.data.cakeDetails.standards[i].name)
      }
      cart.push({
        'standard_name': this.data.cakeDetails.standards[0].name,
        'nowPrice': this.data.nowPrice,
        'cake': this.data.cakeDetails,
        'cake_id': this.data.cakeDetails.id,
        'num': 1,
        'standard': this.data.cakeDetails.standards[0].id,
        'standards': standards,
        'index_' : 0,
        'img':this.data.cakeDetails.imgs[0]
      })
      wx.showToast({
        title: '添加成功',
        icon: 'success',
        duration: 2000
      })
    } else {        // 如果购物车里面不为空，吧当前数据加入到购物车
      var add = 1; // 防止以前已经加入过购物车
      for (var i = 0; i < cart.length; i++) {
        if (cart[i].cake_id == this.data.cakeDetails.id) {
          add = 0;
        }
      }
      
      if (add) {
        var standards = [];
        for (var i = 0; i < this.data.cakeDetails.standards.length; i++) {
          standards.push(this.data.cakeDetails.standards[i].name)
        }
        cart.push({
          'standard_name': this.data.cakeDetails.standards[0].name,
          'nowPrice': this.data.nowPrice,
          'cake': this.data.cakeDetails,
          'cake_id': this.data.cakeDetails.id,
          'num': 1,
          'standard': this.data.cakeDetails.standards[0].id,
          'standards': standards,
          'index_': 0,
          'img': this.data.cakeDetails.imgs[0]
        })
        wx.showToast({
          title: '添加成功',
          icon: 'success',
          duration: 2000
        })
      }else{
        wx.showToast({
          title: '亲！已在购物车',
          icon: 'success',
          duration: 2000
        })
      }
    }
    wx.setStorageSync('cart', cart)  //设置购物车到缓存
    this.setData({
      shopNum : cart.length
    })
    
    console.log(wx.getStorageSync('cart'))
  },
  toBuy: function (e) {
    var r = true
    wx.getSetting({
      success(res) {
        if (!res.authSetting['scope.userInfo']) {
          wx.openSetting({
            success: (res) => {
              //console.log(res)
              res.authSetting = {
                "scope.userInfo": true,
              }
            }
          })
          r = false
          return false
        } else {
          wx.getUserInfo({     // 获取用户授权
            success: function (res) {
              wx.setStorageSync('userInfos', res)
            }
          })
          console.log(1111)
          r = true
        }
      }
    })
    return false
    wx.navigateTo({
      url: '/pages/index/productDetails/index?index='+e.target.dataset.index,
    })
  },
  // toBuy : function(){
  //   var cart = wx.getStorageSync('cart')  // 取出缓存中购物车数据
  //   var readyToOrder = []   // 生成预备订单数据
  //   readyToOrder.push({
  //     'standard_name': this.data.cakeDetails.standards[0].name,
  //     'nowPrice': this.data.nowPrice,
  //     'index': this.data.index,
  //     'cake': this.data.cakeDetails,
  //     'cake_id': this.data.cakeDetails.id,
  //     'num': 1,
  //     'standard': this.data.cakeDetails.standards[0].id
  //   })
  //   wx.setStorageSync('readyToOrder', readyToOrder)  //设置预备订单数据
  //   if(!cart){      // 如果购物车中为空，声明空数组
  //     cart = []
  //     cart.push({
  //       'standard_name':this.data.cakeDetails.standards[0].name,
  //       'nowPrice':this.data.nowPrice,
  //       'index': this.data.index,
  //       'cake': this.data.cakeDetails,
  //       'cake_id': this.data.cakeDetails.id,
  //       'num': 1,
  //       'standard': this.data.cakeDetails.standards[0].id
  //     })
  //   }else{        // 如果购物车里面不为空，吧当前数据加入到购物车
  //     var add = 1; // 防止以前已经加入过购物车
  //     for (var i = 0; i < cart.length; i++) {
  //       if (cart[i].index == this.data.index) {
  //         add = 0;
  //       }
  //     }
  //     if (add) {
  //       cart.push({
  //         'standard_name': this.data.cakeDetails.standards[0].name,
  //         'nowPrice': this.data.nowPrice,
  //         'index': this.data.index,
  //         'cake': this.data.cakeDetails,
  //         'cake_id':this.data.cakeDetails.id,
  //         'num': 1,
  //         'standard': this.data.cakeDetails.standards[0].id
  //       })
  //     }
  //   }
    
  //   wx.setStorageSync('cart', cart)  //设置购物车到缓存
  //   //console.log(wx.getStorageSync('cart'))
  //   wx.navigateTo({
  //     url: '/pages/order/ordersub/index'
  //   })
  // },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(wx.getStorageSync('userInfos'))
    //console.log(app.globalData.cakes[options.index])
    var bool = true;
    if(app.globalData.cakes[options.index].codes.length != 0){
      bool = false;
    }
    //var carts = wx.getStorageSync('cart')
    this.setData({
      index:options.index,
      cakeDetails: app.globalData.cakes[options.index],
      nowPrice: app.globalData.cakes[options.index].standards[0].member_price,
      code_number : app.globalData.cakes[options.index].codes.length,
      code_status : bool,
      //shopNum: carts.length
    });
    //console.log(this.data.code_status)
    var that = this;
    WxParse.wxParse('content', 'html', app.globalData.cakes[options.index].content, that, 25);
    //console.log(this.data.content)
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
    var carts = wx.getStorageSync('cart')
    this.setData({
      shopNum: carts.length
    });
    // console.log(options)
    // var bool = true;
    // if (app.globalData.cakes[options.index].codes.length != 0) {
    //   bool = false;
    // }
    // var carts = wx.getStorageSync('cart')
    // this.setData({
    //   index: options.index,
    //   cakeDetails: app.globalData.cakes[options.index],
    //   nowPrice: app.globalData.cakes[options.index].standards[0].member_price,
    //   code_number: app.globalData.cakes[options.index].codes.length,
    //   code_status: bool,
    //   shopNum: carts.length
    // });
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