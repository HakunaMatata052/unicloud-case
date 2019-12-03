<template>
	<view calss="container">
		<view class="video-content">
			<video
				id="myVideo"
				style="width:100%;height:1280upx;"
				src="../../static/huaxue.mp4"
				@error="videoErrorCallback"
				:danmu-list="danmuList"
				enable-danmu
				danmu-btn
				controls
			></video>
		</view>
		<view class="danmu-content">
			
				<input v-model="danmuValue" type="text" placeholder="在此处输入弹幕内容" />
			
			
				<button @click="sendDanmu" class="action-btn">发送弹幕</button>
			
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			src: '',
			danmuList: [
				{
					text: '第 1s 出现的弹幕',
					color: '#ff0000',
					time: 1
				},
				{
					text: '第 3s 出现的弹幕',
					color: '#ff00ff',
					time: 3
				}
			],
			danmuValue: ''
		};
	},
	onReady: function(res) {
		// #ifndef MP-ALIPAY
		this.videoContext = uni.createVideoContext('myVideo');
		// #endif
	},
	methods: {
		sendDanmu: function() {
			this.videoContext.sendDanmu({
				text: this.danmuValue,
				color: this.getRandomColor()
			});
			this.danmuValue = '';
		},
		videoErrorCallback: function(e) {
			uni.showModal({
				content: e.target.errMsg,
				showCancel: false
			});
		},
		getRandomColor: function() {
			const rgb = [];
			for (let i = 0; i < 3; ++i) {
				let color = Math.floor(Math.random() * 256).toString(16);
				color = color.length == 1 ? '0' + color : color;
				rgb.push(color);
			}
			return '#' + rgb.join('');
		}
	}
};
</script>

<style lang="scss">
.container {
	display: flex;
	flex-direction: column;
	width: 100%;
	.video-content {
		width: 100%;
	}
	
}
</style>
