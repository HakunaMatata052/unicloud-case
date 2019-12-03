<template>
	<view class="container">
		<view class="user-info">
			<view class="userface"><image class="face-image" :src="userInfo.face || '/static/missing-face.png'"></image></view>
			<view class="username">calvin</view>
			<view class="count-content">
				<label class="info-items">{{ userInfo.fansCounts }} 粉丝</label>
				<label class="info-items">{{ userInfo.followCounts }} 关注</label>
				<label class="info-items">{{ userInfo.receiveLikeCounts }} 获赞</label>
			</view>
		</view>
		<view>
			<view class="navbar">
				<view v-for="(item, index) in navlist" class="nav-item" :key="index" :class="{ current: tabCurrentIndex === index }" @click="tabClick(index)">{{ item.text }}</view>
			</view>
			<swiper :current="tabCurrentIndex" class="swiper-box" duration="300" @change="changeTab">
				<swiper-item class="tab-content" v-for="(tabItem, tabIndex) in navList" :key="tabIndex">
					<scroll-view class="list-scroll-content" scroll-y @scrolltolower="loadData">
						<empty v-if="tabItem.loaded === true && tabItem.orderList.length === 0"></empty>
						<view class="video-item" v-for="(item, index) in tabItem.videoList" :key="index">
							<navigator url="'pages/videoInfo/videoInfo?videoId' + item.id">
								<view>
									<view class="back-image"><image></image></view>
									<view class="desc">
										<view class="faceName">
											<image class="myface" ></image>
											<view class="nickname"></view>
										</view>
										<view class="title"></view>
									</view>
								</view>
							</navigator>
						</view>
					</scroll-view>
				</swiper-item>
			</swiper>
		</view>
	</view>
</template>

<script>
import empty from '@/components/empty';
export default {
	components: {
		empty
	},
	data() {
		return {
			submiting: false,
			tabCurrentIndex: 0,
			navlist: [
				{
					state: 0,
					text: '作品',
					loadingType: 'more',
					pageNo: 1,
					videoList: []
				},
				{
					state: 0,
					text: '收藏',
					loadingType: 'more',
					pageNo: 1,
					videoList: []
				},
				{
					state: 0,
					text: '关注',
					loadingType: 'more',
					pageNo: 1,
					videoList: []
				}
			]
		};
	},
	onLoad() {},
	methods: {}
};
</script>

<style lang="scss">
.user-info {
	height: 240upx;
	padding: 50upx 30upx 0;
	position: relative;
	.userface {
		height: 80upx;
		display: flex;
		align-items: center;
		position: relative;
		.face-image {
			width: 80upx;
			height: 80upx;
			border: 5upx solid #fff;
			border-radius: 50%;
			margin-left: 40upx;
		}
	}
	.username {
		font-size: $font-lg + 4upx;
		color: $font-color-dark;
		margin-left: 35upx;
	}
	.count-content {
		display: flex;
		flex-direction: row;
		margin: 10px 30px 10px 10px;
		.info-items {
			margin-rigth: 20px;
			font-size: $font-lg - 4upx;
			color: #8f8f94;
		}
	}
}
.navbar {
		display: flex;
		height: 40px;
		padding: 0 5px;
		background: #fff;
		box-shadow: 0 1px 5px rgba(0, 0, 0, .06);
		position: relative;
		z-index: 10;

		.nav-item {
			flex: 1;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100%;
			font-size: 15px;
			color: $font-color-dark;
			position: relative;

			&.current {
				color: $base-color;

				&:after {
					content: '';
					position: absolute;
					left: 50%;
					bottom: 0;
					transform: translateX(-50%);
					width: 44px;
					height: 0;
					border-bottom: 2px solid $base-color;
				}
			}
		}
	}

	.swiper-box {
		height: calc(100% - 40px);
	}
	
	.list-scroll-content {
		height: 100%;
	}
	.video-item {
		display: flex;
		flex-direction: column;
		padding-left: 30upx;
		background: #fff;
		margin-top: 16upx;
		.back-image {
			display: block;
			background-color: #fff;
		}
		.desc {
			margin-top: -40rpx;
			margin-bottom: 10rpx;
			display: flex;
			align-items: center;
			.faceName {
				display: flex;
				flex-direction: column;
				align-items: center;
				margin-left: 10px;
				.myface {
					display: block;
					width: 60rpx;
					height: 60rpx;
					border-radius: 30rpx;
					margin-top: 10rpx;
					margin-right: 20rpx;
				}
				.nickname {
					font-size: 20rpx;
					margin-top: 6rpx;
					margin-right: 20rpx;
					color: darkgray;
				}
			}
			.title {
				font-size: 30rpx;
				margin-top: 10rpx;
				margin-left: 20rpx;
				width: 600rpx;
			}
		}
	}

</style>
