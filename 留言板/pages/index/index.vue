<template>
	<view class="content">
		<!-- 留言提交模块 -->
		<view class="input_box">
			<textarea  placeholder="请输入要留言的内容" v-model="list.content" class="textarea border" />
			<input type="text" placeholder="请输入用户名:" v-model="list.name" class="input border" />
			<button type="submit" @click="Add">提交</button>
		</view>
		<!-- 留言列表 -->
		<view class="list">
			<view class="item" v-for="(item,index) in listData" :key="index">
				<view class="word">
					<view class="user_name">{{item.name}}</view>
					<view class="content">{{item.content}}</view>
				</view>
				<view class="delete" @click="remove(item._id)">删除</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data () {
			return {
				list: {
					name:"",
					content:""
				},
				listData:[
					{
						name:"",
						content:"",
						_id:""
					}
				]
			}
		},
		
		onLoad() {
			this.get_data()
		},
		methods: {
			Add() {
				let data = this.list;
				uniCloud.callFunction({
					name:'add',
					data:data
				}).then((res)=>{
					this.get_data()
				})
			},
			// 查询
			get_data() {
				uniCloud.callFunction({
					name:'get'
				}).then((res)=>{
					this.listData = res.result.data
				})
			},
			
			// 删除
			remove(id) {
				uniCloud.callFunction({
					name:'remove',
					data:{id}
				}).then((res)=>{
					this.get_data()
				})
			}
			
		}
	}
</script>

<style lang="scss">
	.border {
		border-style: solid;
		border-width: 1px;
		border-color: #eeeeee;
	}
	.input {
		padding: 6rpx 8rpx;
		height: 42px;
		margin: 10rpx;
	}
	.submit {
		width: 400upx;
		margin-left: 175rpx;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	.delete {
		background-color: #dddddd;
		color: #ffffff;
		width: 40rpx;
		line-height: 50rpx;
		height: 50rpx;
		text-align: center;
		width: 80rpx;
		font-size: 30rpx;
		border-radius: 6px;
	}
	.list {
		width: 750rpx;
	}
	.input_box {
		width: 750rpx;
		background-color: #ffffff;
		margin-bottom: 6px;
	}
	.textarea {
		width: 730rpx;
		padding: 10rpx;
		margin: 10rpx;
	}
	.item {
		@extend .border;
		border-radius: 16px;
		border-color: #eeeeee;
		padding: 4px 8px;
		margin: 5px;
		display: flex;
		flex-wrap: nowrap;
		flex-direction: row;
		align-items: center;
	}
	.logo {
		width: 100rpx;
		height: 100rpx;
		border-radius: 100px;
	}
	.word {
		padding: 20rpx;
		flex: 1;
		justify-content: space-around;
	}
	.user_name {
		font-size: 28upx;
		color: #007aff;
	}
	.content {
		font-size: 38upx;
		color: #666666;
	}
</style>
