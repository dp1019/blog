//app.js
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    
    // 绑定商品数据
    var _this = this;
    wx.request({
      url: 'http://cake.com/index/good/index', //接口
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: res => {
        var integralCakes = []
        for (var i = 0; i < res.data.cakes.length; i++) {
          res.data.cakes[i].imgs = res.data.cakes[i].photo.split('|')
          if (res.data.cakes[i].integral != 0) {
            integralCakes.push(res.data.cakes[i])
          }
        }
        this.globalData.cakes = res.data.cakes
        this.globalData.cates = res.data.cates
        this.globalData.integralCakes = integralCakes
      }
    })
    wx.checkSession({
      success: function () {
        //session 未过期，并且在本生命周期一直有效
      },
      fail: function () {
        wx.login({
          success: function (res) {
            if (res.code) {
              wx.request({
                url: 'http://cake.com/index/member/login',
                data: {
                  code: res.code
                },
                success: function (data) {
                  wx.setStorageSync('openid', data.data.openid) // 保存openid
                  wx.getUserInfo({     // 获取用户授权
                    success: function (res) {
                     wx.setStorageSync('userInfos', res)
                    }
                  })
                }
              })
            } else {
              console.log('获取用户登录态失败！' + res.errMsg)
            }
          }
        })
      }
    })
    
    //
    
 
    // 获取用户信息
    // wx.getSetting({
    //   success: res => {
        
    //     if (res.authSetting['scope.userInfo']) {
    //       // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
    //       wx.getUserInfo({
    //         success: res => {
    //           console.log(11111);
    //           // 可以将 res 发送给后台解码出 unionId
    //           this.globalData.userInfo = res.userInfo
    //           // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
    //           // 所以此处加入 callback 以防止这种情况
    //           if (this.userInfoReadyCallback) {
    //             this.userInfoReadyCallback(res)
    //           }
    //         }
    //       })
    //     }else{
    //       wx.authorize({
    //         scope: 'scope.userInfo',
    //         success() {
    //           var _this = this
    //           wx.getUserInfo({
    //             success: res => {
    //                console.log(res)
    //                console.log(_this)
    //                return false
    //                 // 可以将 res 发送给后台解码出 unionId
    //                 _this.globalData.userInfo = res.userInfo
    //                 // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
    //                 // 所以此处加入 callback 以防止这种情况
    //                 if (_this.userInfoReadyCallback) {
    //                   _this.userInfoReadyCallback(res)
    //                 }
    //               }
    //             })
    //           // 用户已经同意小程序使用录音功能，后续调用 wx.startRecord 接口不会弹窗询问
    //           //wx.startRecord()
    //         }
    //       })
    //     }
    //   }
    // })
  },
  globalData: {
    userInfo: null,
    cakes: [],
    cates: [],
    integralCakes: []
  }
})