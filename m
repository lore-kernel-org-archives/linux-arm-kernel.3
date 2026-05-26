Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B52CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQ+OHMp99D8xoRZvJBBEvxSuLKoEVBXtdAFFTNEa6Rw=; b=IEJ9VAVtjzxV50UROgtrP2tXIR
	zm/Q3i+tE/fNa9DV003I31ChMDtWvQxR/TTgPkgrv/NCFaAi7tbtuj66r3a+KTygUFAQKXumX9QxY
	RMN1AeAOR95bn3qOSV0pEvr+nDOGoL6DxnduO2hj0K+fIFu0Y7itxzjNfb3NkDvH4kwcfdQEXDM5g
	9nC/uXBJ5iOhttxZDqhLTFZKHoN5aI3S72eCYSXnYOqFXmaqZs22lv0trWQjYDDDQN2cf1lt8xUWy
	MNQn3/i4mpF0SHuSguKfl6trxiz9GXpJMP3kkCYYOzr29EmGp3VzgAY+kdBg6Q2GN+jm21ckyXwHP
	wnAN1o8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr0b-00000001veH-3Of4;
	Tue, 26 May 2026 12:35:45 +0000
Received: from mail-m816.xmail.ntesmail.com ([156.224.81.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr0Y-00000001vdC-2mus;
	Tue, 26 May 2026 12:35:44 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fe38e512;
	Tue, 26 May 2026 20:35:31 +0800 (GMT+08:00)
Message-ID: <00565241-3962-4418-8711-859dc98dba13@rock-chips.com>
Date: Tue, 26 May 2026 20:35:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/bridge: analogix_dp: Add support for optional
 data-lanes mapping
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260525094731.121380-1-damon.ding@rock-chips.com>
 <20260525094731.121380-3-damon.ding@rock-chips.com>
 <177979727057.297330.10691183273720133245.b4-review@b4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <177979727057.297330.10691183273720133245.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e6448786d03a8kunm591ab7c8b8886b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHktNVhhKTRhCH0gaHxoaTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Mri3/IGcBzNc+G9t8s5zfRoweaS3NFeHeZAVbKn66fIdfriaFiCCbSNgVT9cecYd24uwwupB6hn52vIM91IrI4Vc2uMrMpQwV1SrQ8zA1M2u2YsdZRT9h1lZC4z+ANp/d5pgObI9xFP5vO798m9/dNx7HD/Gkg8btotIad81iTk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=oQ+OHMp99D8xoRZvJBBEvxSuLKoEVBXtdAFFTNEa6Rw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_053543_291719_06E8579E 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Luca,

On 5/26/2026 8:07 PM, Luca Ceresoli wrote:
> On Mon, 25 May 2026 17:47:31 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> 
> Hello Damon,
> 
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 8cf6b73bceac..d53ab25bc57b 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>> [ ... skip 11 lines ... ]
>> +	int ret, i;
>> +
>> +	memcpy(video_info->lane_map, map, sizeof(map));
>> +
>> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
>> +						   video_info->max_lane_count);
> 
> Should num_lanes be > 4, the buffers could overflow. I realize it should
> not happen, but analogix_dp_dt_parse_pdata() can set max_lane_count from
> the device tree, so a bogus dtb could cause such overflow.
> 
> Perhaps you should just (in a separate patch) error out in
> analogix_dp_dt_parse_pdata() to prevent this. And maybe even adding an
> BUG_ON(lane_count > 4) here.
> 
> Otherwise LGTM.
> 

Thank you for the review.

I think it would be a better idea to add a separate patch to validate 
the max_link_rate and max_lane_count values for Exynos DP.

I checked the Exynos DP related DTS files:
- The maximum value of samsung,lane-count is 4
- The maximum value of samsung,link-rate is 0x0a, which corresponds to 
the HBR lane rate.

Could Marek please help confirm if we can set these as the upper limits 
for the checks?

Best regards,
Damon


