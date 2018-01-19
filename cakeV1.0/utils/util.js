const formatTime = date => {
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  const hour = date.getHours()
  const minute = date.getMinutes()
  const second = date.getSeconds()

  return [year, month, day].map(formatNumber).join('/') + ' ' + [hour, minute, second].map(formatNumber).join(':')
}
// 自定义
const formatTime1 = date => {
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  const hour = date.getHours()
  const minute = date.getMinutes()
  const second = date.getSeconds()

  return [year, month, day].map(formatNumber).join('-')
}

const auth = function(){
  var result = false
  wx.getSetting({
    success(res) {
      //console.log(result)
      if (!res.authSetting['scope.userInfo']) {
        wx.openSetting({
          success: (res) => {
            //console.log(res)
            res.authSetting = {
              "scope.userInfo": true,
            }
          }
        })
        result = false
      }else{
        console.log(111)
        wx.getUserInfo({     // 获取用户授权
          success: function (res) {
            wx.setStorageSync('userInfos', res)
          }
        })
        result = true
      }
    }
  })
  console.log(result)
  return result
}

const formatNumber = n => {
  n = n.toString()
  return n[1] ? n : '0' + n
}

module.exports = {
  formatTime: formatTime,
  formatTime1 : formatTime1,  // 自己注册一个
  auth : auth
}
