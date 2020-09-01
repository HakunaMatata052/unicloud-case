<template>
	<view class="content">
		<image class="logo" src="/static/logo.png"></image>
		<view class="text-area">
			<button type="primary" size="default" open-type="getUserInfo" @getuserinfo="loginByWeixin">微信一键登录</button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title: 'Hello'
			}
		},
		onLoad() {

		},
		methods: {
			getWeixinCode() {
				return new Promise((resolve, reject) => {
					uni.login({
						provider: 'weixin',
						success(res) {
							console.log('----------------')
							console.log(res);
							resolve(res.code)
						},
						fail(err) {
							console.log('----------------')
							console.log(err);
							reject(new Error('微信登录失败'))
						}
					})
				})
			},
			loginByWeixin() {
				this.getWeixinCode().then((code) => {
					return uniCloud.callFunction({
						name: 'user-center',
						data: {
							action: 'loginByWeixin',
							params: {
								code,
							}
						}
					})
				}).then((res) => {
					uni.showModal({
						showCancel: false,
						content: JSON.stringify(res.result)
					})
					if (res.result.code === 0) {
						uni.setStorageSync('uni_id_token', res.result.token)
						uni.setStorageSync('uni_id_token_expired', res.result.tokenExpired)
					}
				}).catch((e) => {
					console.error(e)
					uni.showModal({
						showCancel: false,
						content: '微信登录失败，请稍后再试'
					})
				})
			},
		}
	}
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.logo {
		height: 200rpx;
		width: 200rpx;
		margin-top: 200rpx;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50rpx;
	}

	.text-area {
		display: flex;
		justify-content: center;
	}

	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
</style>
