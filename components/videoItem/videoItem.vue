<template>
	<view class="video-content">
		<view class="user-container">
			<view class="user-icon"></view>
			<view class="user-name"></view>
		</view>
		<view class="desc-container"></view>
		<view class="picture-container"></view>
	</view>
</template>

<script></script>

<style lang="scss">
.video-content {
	display: flex;
	flex-direction: column;
	background-color: #fff;
	margin-bottom: 10upx;
	.user-container {
		display: flex;
		flex-wrap: nowrap;
		.user-icon {
			width: 100upx;
			height: 100upx;
			border-radius: 50%;
		}
		.user-name {
			align-items: center;
			padding-left: 20upx;
			box-sizing: border-box;
		}
	}
	.desc-container {
		display: block;
		margin: 20upx 30upx;
		word-break: break-all;
	}
	.picture-container {
		padding: 0 30upx 30upx;
		box-sizing: border-box;
		display: flex;
		justify-content: flex-start;
		flex-wrap: wrap;
	}
}
</style>
