// pages/shoppingeditor/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cart : [],      // 购物车数据
    checkLength : 0,  // 选中的个数
    totalPrice : 0,   // 总价
    checked_all : false  // 全选状态
  },
  // 下拉选规格
  bindPickerChange: function (e) {
    var index = e.target.dataset.index // 单条数据索引
    var cart_ = this.data.cart         // 复制数据为设置当前数据双向绑定及更新缓存做准备
    var standard_index = e.detail.value // 取到规格索引
    cart_[index].index_ = standard_index //改变复制数据规格索引为赋值当前数据做准备
    cart_[index].standard = this.data.cart[index].cake.standards[standard_index].id //改变复制数据规格id
    cart_[index].standard_name = this.data.cart[index].cake.standards[standard_index].name //改变复制数据规格名称
    cart_[index].nowPrice = this.data.cart[index].cake.standards[standard_index].member_price //改变数字数据价格
    //console.log('picker发送选择改变，携带值为', e.detail.value)
    
    this.setData({
      cart : cart_      // 依据复制数据改变当前实例数据实现双向绑定
    })
    var totalPrice = 0
    for (var i = 0; i < this.data.cart.length; i++) {
      if (this.data.cart[i].checked == true) {
        totalPrice += parseInt(this.data.cart[i].nowPrice * this.data.cart[i].num)
      }
    }
    this.setData({
      totalPrice : totalPrice
    })
    wx.setStorageSync('cart', cart_)  // 缓存
    //console.log(wx.getStorageSync('cart'))
  },
  // 减按钮
  reduce:function(e){
    var _this = this
    var index = e.target.dataset.index   // 当前数据索引
    var num = this.data.cart[index].num  //当前购物车单条商品购买数量
    if (this.data.cart[index].num == 1){
      return false     //  防止为零  
    }else{
      var arr = this.data.cart     
      for(var i =0;i<arr.length;i++){
          if(i == index){
              arr[i].num = num-1
          }
      }
      var totalPrice = 0
      for (var i = 0; i < this.data.cart.length; i++) {
        if (this.data.cart[i].checked == true) {
          totalPrice += parseInt(this.data.cart[i].nowPrice * this.data.cart[i].num)
        }
      }
      this.setData({
          cart: arr,      //重置
          totalPrice : totalPrice
      })
      wx.setStorageSync('cart', arr)  //缓存
    }
  },
  // 加按钮
  add: function(e){
    var index = e.target.dataset.index
    var num = this.data.cart[index].num
    var arr = this.data.cart
    //console.log(arr)
    for (var i = 0; i < arr.length; i++) {
        if (i == index) {
          arr[i].num = num+1
        }
    }
    //计算价格
    var totalPrice = 0
    for (var i = 0; i < this.data.cart.length; i++) {
      if (this.data.cart[i].checked == true) {
        totalPrice += parseInt(this.data.cart[i].nowPrice * this.data.cart[i].num)
      }
    }
    this.setData({
      cart: arr,
      totalPrice : totalPrice
    })
    wx.setStorageSync('cart',arr)  //同步更新缓存
  },
  // 清空按钮
  deleteAll:function(){
    if (this.data.cart.length == 0) {
      wx.showToast({
        title: '空空如也！',
        icon: 'success',
      })
      wx.navigateTo({
        url: '/pages/member/index',
      })
      return false
    }
    var _this = this
    wx.showModal({
      title: '提示',
      content: '确定清空购物车吗？',
      success: function (res) {
        if (res.confirm) {
          for(var i = 0 ; i < _this.data.cart.length ; i++){
            _this.data.cart[i].status = true
          }
          _this.data.cart = []    //清空数据
          _this.setData({
            checkLength : 0,
            cart: [],  // 重置数据
            totalPrice: 0,
            checked_all : false
          })
          wx.setStorageSync('cart', [])  //同步更新缓存
        }
        wx.navigateTo({
          url: '/pages/order/shoppingnull/index',
        })
      }
    })
  },
  // 删除单条
  delete : function(e){
    var _this = this   // this和_this指向同一个对象 本身只存储地址！不存数据本身
    wx.showModal({
      title: '提示',
      content: '确定删除吗？',
      success: function (res) {
      
        if (res.confirm) {
          var index = e.target.dataset.index  // 确定后拿到索引
          _this.data.cart[index].status = true  //改变当前数据状态（true为隐藏）
          if(_this.data.cart[index].checked == true){
            _this.data.checkLength--    //选中长度减一
            _this.data.cart.splice(index, 1)   //删除选中，tips:请不要尝试吧这句放外面
          }else{
            _this.data.cart.splice(index, 1)   //删除选中
          }
          var totalPrice = 0        // 计算价格
          for (var i = 0; i < _this.data.cart.length; i++) {
            if (_this.data.cart[i].checked == true) {
              totalPrice += parseInt(_this.data.cart[i].nowPrice * _this.data.cart[i].num)
            }
          }
          
          if (_this.data.cart.length == _this.data.checkLength && totalPrice != 0){ //如果购物车长度和选中长度一直双向绑定全选为true
            _this.setData({
              checked_all: true
            })
          }
          _this.setData({
            cart : _this.data.cart,   // 重置数据
            totalPrice: totalPrice
          })
          wx.setStorageSync('cart', _this.data.cart)  //同步更新缓存 
          if (totalPrice == 0) {        //如果总价为0跳转到空购物车页面
            wx.navigateTo({
              url: '/pages/order/shoppingnull/index',
            })
            return false
          }
        } 
      }
    })
  },
  // 单条数据选中或取消选中
  checkboxChange : function(e){
    // console.log(e.detail.value.length)
    // console.log(this.data.cart.length)
    
    var number = 0;    // 计算当前选中长度
    for (var i = 0; i < this.data.cart.length; i++) {
      if (this.data.cart[i].checked == true) {
        number++;
      }
    }
    //console.log(this.data.cart)
    var totalPrice = 0;  // 计算价格
    for (var i = 0; i < e.detail.value.length ;i++){
      this.data.cart[e.detail.value[i]].checked = true
      totalPrice += parseInt(this.data.cart[e.detail.value[i]].nowPrice * this.data.cart[e.detail.value[i]].num)
    }
    // 更新数据选中状态，此处可以不用setData组件自带次功能，同步也没问题
    for(var i = 0 ; i < this.data.cart.length ; i++){
      var btn = 0;
      for (var j = 0; j < e.detail.value.length; j++) {
        if (i == e.detail.value[j]){
          btn = 1;
        }
      }
      this.data.cart[i].checked = btn ? true : false
    }
    this.setData({
      totalPrice: totalPrice
    })
    // 如果以前选中数量大于提交过来的状态数组长度,改变全选为false
    if(number > e.detail.value.length){
      this.setData({
        checked_all : false,
      })
    }
    // 如果提交过来数组长度与购物车总长度相等，改变全选为true
    if (e.detail.value.length == this.data.cart.length){
      this.setData({
        checked_all : true,
      })
    }
    // 取消最后一个时将全选状态改变的false
    if (e.detail.value.length == 0) {
      this.setData({
        checked_all: false,
      })
    }
    this.data.checkLength = e.detail.value.length
    wx.setStorageSync('cart', this.data.cart)  //缓存
  },
  // 全选或全不选
  checkboxAll : function(){
    var cart = this.data.cart
    console.log(this.data.cart.length)
    console.log(this.data.checkLength)

    if(this.data.checkLength != this.data.cart.length){
      var totalPrice = 0
      for(var i = 0 ; i < cart.length ;i++){
        cart[i].checked = true
        totalPrice += parseInt(cart[i].nowPrice*cart[i].num)
      }
      this.setData({
        checkLength: cart.length,
        checked_all:true,
        totalPrice:totalPrice
      })
    }else{
      for (var i = 0; i < cart.length; i++) {
        cart[i].checked = false
      }
      this.setData({
        checkLength: 0,
        checked_all: false,
        totalPrice : 0
      })
    }
    
    this.setData({
      cart: cart
    })
    wx.setStorageSync('cart', cart)  //缓存
  },
  // 预备订单
  readyToOrder: function () {
    //console.log(this.data.cart)
    if(this.data.cart.length == 0){
      wx.showToast({
        title: '空空如也！',
        icon: 'success',
      })
      wx.navigateTo({
        url: '/pages/member/index',
      })
      return false
    }
    var readyToOrder = []   // 生成预备订单数据
    for(var i = 0 ; i < this.data.cart.length ; i++){
      if(this.data.cart[i].checked){
        readyToOrder.push(this.data.cart[i])
      }  
    }
    if(readyToOrder.length == 0){
      wx.showToast({
        title: '请勾选商品，亲！',
        icon: 'success',
      })
      return false;
    }
    wx.setStorageSync('readyToOrder', readyToOrder)  //设置预备订单数据
    wx.setStorageSync('is_cart', true)  //从购物车到预备订单页面
    wx.redirectTo({
      url: '/pages/order/ordersub/index'
    })
    //console.log(readyToOrder)
    // readyToOrder.push({
    //   'standard_name': this.data.standard_name,//规格名称
    //   'nowPrice': this.data.nowPrice,//当前产品价格
    //   'cake': this.data.cakeDetails, //当前产品
    //   'cake_id': this.data.cakeDetails.id,//当前产品id
    //   'num': this.data.num,  //购买的数量
    //   'standard': this.data.standard_id //规格的id
    // })
    //wx.setStorageSync('readyToOrder', readyToOrder)  //设置预备订单数据
    // 跳转
    // wx.navigateTo({
    //   url: '/pages/order/ordersub/index'
    // })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var cart = wx.getStorageSync('cart')  //取得缓存中购物车数据
    var num = 0
    var totalPrice = 0
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].checked) {
        num++;
        totalPrice += cart[i].nowPrice * cart[i].num
      }
    }
    if (num == cart.length ) {
      this.setData({
        checked_all: true
      })
    } else {
      this.setData({
        checked_all: false
      })
    }
    this.setData({
      cart: cart,
      checkLength: num,
      totalPrice: totalPrice
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