<template>
<view class="content">
	<!--音频选择 -->
	<view class="title">
		背景音乐
	</view>
	<view class="audio-container">
		<radio-group name="audioId">
				<view v-for="(audioItem, audioIndex) in audioList" :key="audioIndex" class="audio-item">
					<view class="audio">
						<audio style="justify-content: center" :src="audioItem.url" :poster="audioItem.image" :name="audioItem.name" :author="audioItem.author" :action="action" controls></audio>
					</view>
					<view class="radio">	
						<radio style="justify-content: center" value="audioItem.id"  color="#fa436a"/>
					</view>
					
				</view>
		</radio-group>
		
	</view>
	<!-- 视频标题 -->
	<view class="title">
		输入标题
	</view>
	<view class="input-container">
		
		<input class="uni-input" confirm-type="search" placeholder="请输入video标题" />
	</view>
	<!-- 提交按钮 -->
	<view class="button-container">
		<button class="action-btn recom" plain="true">提交</button>
	</view>
</view>
	
		
</template>

<script>
	export default {
		data(){
			return {
				action:"method: 'pause'",
				
				audioList:[
					{
						image:"https://img-cdn-qiniu.dcloud.net.cn/uniapp/audio/music.jpg",
						url:"https://img-cdn-qiniu.dcloud.net.cn/uniapp/audio/music.mp3",
						author:'许巍',
						name:'此时此刻',
						controls: true
					},
					{
						image:"https://img-cdn-qiniu.dcloud.net.cn/uniapp/audio/music.jpg",
						url:"http://ws.stream.qqmusic.qq.com/M500001VfvsJ21xFqb.mp3?guid=ffffffff82def4af4b12b3cd9337d5e7&uin=346897220&vkey=6292F51E1E384E06DCBDC9AB7C49FD713D632D313AC4858BACB8DDD29067D3C601481D36E62053BF8DFEAF74C0A5CCFADD6471160CAF3E6A&fromtag=46",
						author:'许巍',
						name:'此时此刻',
						controls: true
					},
					{
						image:"https://img-cdn-qiniu.dcloud.net.cn/uniapp/audio/music.jpg",
						url:"http://ws.stream.qqmusic.qq.com/M500001VfvsJ21xFqb.mp3?guid=ffffffff82def4af4b12b3cd9337d5e7&uin=346897220&vkey=6292F51E1E384E06DCBDC9AB7C49FD713D632D313AC4858BACB8DDD29067D3C601481D36E62053BF8DFEAF74C0A5CCFADD6471160CAF3E6A&fromtag=46",
						author:'许巍',
						name:'此时此刻',
						controls: true
					},
					{
						image:"https://img-cdn-qiniu.dcloud.net.cn/uniapp/audio/music.jpg",
						url:"http://ws.stream.qqmusic.qq.com/M500001VfvsJ21xFqb.mp3?guid=ffffffff82def4af4b12b3cd9337d5e7&uin=346897220&vkey=6292F51E1E384E06DCBDC9AB7C49FD713D632D313AC4858BACB8DDD29067D3C601481D36E62053BF8DFEAF74C0A5CCFADD6471160CAF3E6A&fromtag=46",
						author:'许巍',
						name:'此时此刻',
						controls: true
					}
					
				]
			}
			
		}
	}
	
</script>

<style lang='scss'>
.title {
	color:#fa436a;
	margin-bottom: 3upx;
	font-weight: bold;
	font-size: 30upx;
}
.audio-container {
	
	display: flex;
	flex-direction: column;
	margin-left: 5%;
	
	.audio-item {
		display:flex;
		flex-wrap: nowrap;
		
		.audio {
			width: 85%;
		}
		
		.radio {
			display: flex;
			Align-items:center;
		}
	}
		
}
.input-container {
	margin-left: 5%;
	
}
.button-container {
	margin-top:30upx;
	.action-btn{
		width: 160upx;
		height: 60upx;
		margin: 0;
		margin-left: 24upx;
		padding: 0;
		border-color: $base-color;
		text-align: center;
		line-height: 60upx;
		font-size: $font-sm + 2upx;
		color: $font-color-dark;
		background: #fff;
		border-radius: 100px;
		&:after{
			border-radius: 100px;
		}
		&.recom{
			background: #fff9f9;
			color: $base-color;
			&:after{
				border-color: #f7bcc8;
			}
		}
	}
}
</style>
