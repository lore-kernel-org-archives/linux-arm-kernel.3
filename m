Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10A5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kGVvLoAJaOp26dQa+STctZZP/D+ei2d2VwEfnWjBwo=; b=dnaoWSn6atpv4YM19b4vmZP1FB
	08CgF5HjPVj0HdNoH7ImE3tZve0Rrer0Kx6dcd5ln5BovG8+4vl6N+DIYdNeVUIrNZnic5QKt/GvS
	VHoSC53W0/gRLolmZ7JV1K7J3cYmA82bVIMnqVD++VwXLN3M1RZjmE16UxrDKec2vCoNCA3GLykR3
	kmolekUK7fvXUbHBm7256FPKGXk+wNZ2QDuL3wMlCJ1wTmMOPP897V9yG64BKiyRMtpk6RvA5C4CJ
	2b5/Y6X3zKNhZQQvaHMAJSg1pjM+RxooD+QdiV+eVEnp+/7GVDvtUTdsSmWEC7c7hIezwNGKsGowp
	ON0uIKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1hZ-000000003H8-2aXO;
	Mon, 03 Mar 2025 09:03:05 +0000
Received: from mail-m19731118.qiye.163.com ([220.197.31.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1ec-000000002YL-3APZ;
	Mon, 03 Mar 2025 09:00:04 +0000
Received: from [172.16.12.12] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id cbdcb25f;
	Mon, 3 Mar 2025 16:59:50 +0800 (GMT+08:00)
Message-ID: <65706d63-18aa-41e0-81c4-4eab3d186250@rock-chips.com>
Date: Mon, 3 Mar 2025 16:59:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller support
 library
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 heiko@sntech.de, devicetree@vger.kernel.org, hjc@rock-chips.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
 <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
Content-Language: en-US
From: Yubing Zhang <yubing.zhang@rock-chips.com>
In-Reply-To: <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRofTlZNS00YSUJLTx1MHhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a955b3ba5bf03a8kunmcbdcb25f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PlE6Cio6GjIWQk9IAwE4Ky8Y
	HSMKCT5VSlVKTE9LQkJJSEJPT0JCVTMWGhIXVQIOGRIVHFUBExoVHDsJFBgQVhgTEgsIVRgUFkVZ
	V1kSC1lBWU5DVUlJVUxVSkpPWVdZCAFZQUxITUo3Bg++
DKIM-Signature: a=rsa-sha256;
	b=ijZGrXL/GvtK7VjoWcpULII9nLZ6QYjVvCmSpKIkUJkKkO8KzrlppNmqdiGJa+pTNWIIcvzWHnEv2CM9W4xfzy/uQ4PCH7aL4BdeeauyHwuh0UKdZypiAec+BclL7A2Au52C9+01H1U6dN+o0lq9WqyGZ6Kue/kGZttFRObq5QE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2kGVvLoAJaOp26dQa+STctZZP/D+ei2d2VwEfnWjBwo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_010003_351299_89DE215A 
X-CRM114-Status: GOOD (  24.57  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On 2025/3/2 2:14, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 07:30:25PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The DW DP TX Controller is compliant with the DisplayPort Specification
>> Version 1.4 with the following features:
>>
>> * DisplayPort 1.4a
>> * Main Link: 1/2/4 lanes
>> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
>> * AUX channel 1Mbps
>> * Single Stream Transport(SST)
>> * Multistream Transport (MST)
>> *Type-C support (alternate mode)
>> * HDCP 2.2, HDCP 1.3
>> * Supports up to 8/10 bits per color component
>> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
>> * Pixel clock up to 594MHz
>> * I2S, SPDIF audio interface
>>
>> Add library with common helpers to make it can be shared with
>> other SoC.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> drm/bridge: cleanup
> 
> Stray line?
> 
>>
>> ---
>>
>>   drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
>>   drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
>>   drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2155 ++++++++++++++++++++++
>>   include/drm/bridge/dw_dp.h               |   19 +
>>   4 files changed, 2182 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c

......

>> +
>> +static u8 dw_dp_voltage_max(u8 preemph)
>> +{
>> +	switch (preemph & DP_TRAIN_PRE_EMPHASIS_MASK) {
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_0:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_3;
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_1:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_2:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_1;
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_3:
>> +	default:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
>> +	}
>> +}
>> +
>> +static void dw_dp_link_get_adjustments(struct dw_dp_link *link,
>> +				       u8 status[DP_LINK_STATUS_SIZE])
>> +{
>> +	struct dw_dp_link_train_set *adjust = &link->train.adjust;
>> +	u8 v = 0;
>> +	u8 p = 0;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < link->lanes; i++) {
>> +		v = drm_dp_get_adjust_request_voltage(status, i);
>> +		p = drm_dp_get_adjust_request_pre_emphasis(status, i);
>> +		if (p >=  DP_TRAIN_PRE_EMPH_LEVEL_3) {
>> +			adjust->pre_emphasis[i] = DP_TRAIN_PRE_EMPH_LEVEL_3 >>
>> +						  DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> +			adjust->pre_max_reached[i] = true;
>> +		} else {
>> +			adjust->pre_emphasis[i] = p >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> +			adjust->pre_max_reached[i] = false;
>> +		}
>> +		v = min(v, dw_dp_voltage_max(p));
>> +		if (v >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3) {
>> +			adjust->voltage_swing[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_3 >>
>> +						   DP_TRAIN_VOLTAGE_SWING_SHIFT;
>> +			adjust->voltage_max_reached[i] = true;
>> +		} else {
>> +			adjust->voltage_swing[i] = v >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
>> +			adjust->voltage_max_reached[i] = false;
>> +		}
>> +	}
>> +}
>> +
>> +static void dw_dp_link_train_adjust(struct dw_dp_link_train *train)
>> +{
>> +	struct dw_dp_link_train_set *request = &train->request;
>> +	struct dw_dp_link_train_set *adjust = &train->adjust;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < 4; i++) {
> 
> Shouldn't it be a loop up to link->lanes?
> 
>> +		if (request->voltage_swing[i] != adjust->voltage_swing[i])
>> +			request->voltage_swing[i] = adjust->voltage_swing[i];
>> +		if (request->voltage_max_reached[i] != adjust->voltage_max_reached[i])
>> +			request->voltage_max_reached[i] = adjust->voltage_max_reached[i];
>> +	}
>> +
>> +	for (i = 0; i < 4; i++) {
>> +		if (request->pre_emphasis[i] != adjust->pre_emphasis[i])
>> +			request->pre_emphasis[i] = adjust->pre_emphasis[i];
>> +		if (request->pre_max_reached[i] != adjust->pre_max_reached[i])
>> +			request->pre_max_reached[i] = adjust->pre_max_reached[i];
> 
> Why do you need separate request and adjustment structs?
During link training cr sequence, if dprx keep the LANEx_CR_DONE bit(s) 
cleared, the request and adjustment structs are used to check the
old and new valud of ADJUST_REQUEST_LANEx_y register(s) is changed or not.

> 
>> +	}
>> +}
>> +
>> +static int dw_dp_link_clock_recovery(struct dw_dp *dp)
>> +{
>> +	struct dw_dp_link *link = &dp->link;
>> +	u8 status[DP_LINK_STATUS_SIZE];
>> +	unsigned int tries = 0;
>> +	int ret;
>> +
>> +	ret = dw_dp_link_train_set_pattern(dp, DP_TRAINING_PATTERN_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (;;) {
>> +		ret = dw_dp_link_train_update_vs_emph(dp);
>> +		if (ret)
>> +			return ret;
>> +
>> +		drm_dp_link_train_clock_recovery_delay(&dp->aux, link->dpcd);
>> +
>> +		ret = drm_dp_dpcd_read_link_status(&dp->aux, status);
>> +		if (ret < 0) {
>> +			dev_err(dp->dev, "failed to read link status: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		if (drm_dp_clock_recovery_ok(status, link->lanes)) {
>> +			link->train.clock_recovered = true;
>> +			break;
>> +		}
>> +
>> +		dw_dp_link_get_adjustments(link, status);
>> +
>> +		if (link->train.request.voltage_swing[0] ==
>> +		    link->train.adjust.voltage_swing[0])
> 
> Should this take all lanes to account? I think it might be posssible to
> drop the adjust / request split and adjust tries in
> dw_dp_link_get_adjustments() instead.
Yes, here shall compare both swing and pre-emphasis for all lanes. It's 
a good idea to drop the adjust / request split. The swing and 
pre-emphasis compare just need by cr sequence. But both cr and eq 
sequences use  dw_dp_link_get_adjustments(). It will be better to delete 
dw_dp_link_train_adjust() and add a new function to adjust tries for cr 
sequence.
> 
>> +			tries++;
>> +		else
>> +			tries = 0;
>> +
>> +		if (tries == 5)
>> +			break;
>> +
>> +		dw_dp_link_train_adjust(&link->train);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw_dp_link_channel_equalization(struct dw_dp *dp)
>> +{
>> +	struct dw_dp_link *link = &dp->link;
>> +	u8 status[DP_LINK_STATUS_SIZE], pattern;
>> +	unsigned int tries;
>> +	int ret;
>> +
>> +	if (link->caps.tps4_supported)
>> +		pattern = DP_TRAINING_PATTERN_4;
>> +	else if (link->caps.tps3_supported)
>> +		pattern = DP_TRAINING_PATTERN_3;
>> +	else
>> +		pattern = DP_TRAINING_PATTERN_2;
>> +	ret = dw_dp_link_train_set_pattern(dp, pattern);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (tries = 1; tries < 5; tries++) {
>> +		ret = dw_dp_link_train_update_vs_emph(dp);
>> +		if (ret)
>> +			return ret;
>> +
>> +		drm_dp_link_train_channel_eq_delay(&dp->aux, link->dpcd);
>> +
>> +		ret = drm_dp_dpcd_read_link_status(&dp->aux, status);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
>> +			dev_err(dp->dev, "clock recovery lost while equalizing channel\n");
>> +			link->train.clock_recovered = false;
>> +			break;
>> +		}
>> +
>> +		if (drm_dp_channel_eq_ok(status, link->lanes)) {
>> +			link->train.channel_equalized = true;
>> +			break;
>> +		}
>> +
>> +		dw_dp_link_get_adjustments(link, status);
>> +		dw_dp_link_train_adjust(&link->train);
>> +	}
>> +
>> +	return 0;
>> +}
......
>> +
>> +struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>> +			 const struct dw_dp_plat_data *plat_data);
>> +#endif /* __DW_DP__ */
>> -- 
>> 2.34.1
>>
> 


