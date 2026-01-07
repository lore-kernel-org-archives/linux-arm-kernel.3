Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA226CF6BE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG1ve9KKgO4Stoa/EGMqCZSP6qpS5GUgHSKbTxkyq9Q=; b=iBDlTOalLznEmNPcHvh2s6PG0V
	BZK+MSweCeG30mrhuAwIl0Gnf7VQV2gyLlKVSSRzeuY7cb3I1CcSHPJFNKr3Z/D2sl4+2anJZ4pkX
	4wXm6xAs88ajboeYloLkrtA+RaTP2tpI1CWfVhiFdAyxLVHunPif31uWJNXzODlWUvPgTSIVWA3Qj
	mlYkPs8XzHT4wRM36904QwgdlLXYr1pRByorQDimQDs9jQhrxrMhAHSoLT7/Es3KZOtMCWj3mlIyc
	iiB23dDc9mNSisi05GTxZvRiyMKYfYupCF2OiScl8/yTQNOFgmWq/Qh/0au/txKV68DAmKSESrnux
	X2Ri3dTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJQ6-0000000E57B-06Ok;
	Wed, 07 Jan 2026 02:37:10 +0000
Received: from mail-m49212.qiye.163.com ([45.254.49.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJQ2-0000000E55H-2cVF;
	Wed, 07 Jan 2026 02:37:08 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fbef9ce3;
	Wed, 7 Jan 2026 10:36:57 +0800 (GMT+08:00)
Message-ID: <f644a5ab-5dd1-4f4e-b2e9-3585dec81a96@rock-chips.com>
Date: Wed, 7 Jan 2026 10:36:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 04/18] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.next_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-5-damon.ding@rock-chips.com>
 <DFCCU8AN0GZQ.2CYTKKV40JYLI@bootlin.com>
 <187b2c32-5a10-4555-8d49-cf1ee86a8eaa@rock-chips.com>
Content-Language: en-US
In-Reply-To: <187b2c32-5a10-4555-8d49-cf1ee86a8eaa@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b965081fc03a3kunme7026636f3fcd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5DHlYdTEofSRpLSklPH0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=XTc3ywoNaUASUctvi7aqpNtFJToV3y76ir90mhINcT3SspMUdeAXdYHXWAhULkBokH/TOTyxAl1xgR5zUham/P2R2/bTWNZKibwHhve030/J2UcGgRkWDPAlabHxczeZ0+/YEt8YtK3jl3yaUXGchACliUpEFdyJR41n+ftMllA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XG1ve9KKgO4Stoa/EGMqCZSP6qpS5GUgHSKbTxkyq9Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_183707_174876_94A5C18C 
X-CRM114-Status: GOOD (  19.90  )
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

On 1/4/2026 10:51 AM, Damon Ding wrote:
> Hi Luca,
> 
> On 12/31/2025 7:11 PM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>> In order to move the panel/bridge parsing and attachmenet to the
>>> Analogix side, add component struct drm_bridge *next_bridge to
>>> platform data struct analogix_dp_plat_data.
>>>
>>> The movement makes sense because the panel/bridge should logically
>>> be positioned behind the Analogix bridge in the display pipeline.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - Rename the &analogix_dp_plat_data.bridge to
>>>    &analogix_dp_plat_data.next_bridge
>>> ---
>>>   include/drm/bridge/analogix_dp.h | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/ 
>>> analogix_dp.h
>>> index cf17646c1310..582357c20640 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum 
>>> analogix_dp_devtype type)
>>>   struct analogix_dp_plat_data {
>>>       enum analogix_dp_devtype dev_type;
>>>       struct drm_panel *panel;
>>> +    struct drm_bridge *next_bridge;
>>>       struct drm_encoder *encoder;
>>>       struct drm_connector *connector;
>>>       bool skip_connector;
>>
>> It took a while to understand why you are adding the next_bridge 
>> pointer in
>> struct analogix_dp_plat_data instead of struct analogix_dp_device, 
>> where it
>> would be more natural. I found an answer in patch 16: with current 
>> code you
>> need to place next_bridge in struct analogix_dp_plat_data because it is
>> used by user drivers to attach, and those drivers have no access to 
>> struct
>> analogix_dp_device. However patch 16 (which looks a very good cleanup 
>> BTW)
>> next_bridge can be moved to struct analogix_dp_device.
>>
>> So I'd suggest to move patch 16 before this one if it easily doable, so
>> that you can introduce next_bridge in struct analogix_dp_device from the
>> beginning. Should that be impossible, you can send a separate patch to 
>> move
>> next_bridge, after patch 16.
>>
>>
> 
> Thanks for your nice suggestion! After patch 16, bridge attachment is 
> unified to the Analogix side, which acts as a common bridge driver for 
> both the Rockchip and Exynos sides, so moving next_bridge there makes 
> perfect sense. I will add a separate patch to move next_bridge in v9.
> 
> 

My apologies for reversing the plan to move next_bridge to the Analogix 
side in v9 -- I only considered the Rockchip side before.

When I tried modifying the code based on your suggestion, I found it 
better to keep &analogix_plat_data.next_bridge as is. This is because 
the Exynos side needs to maintain compatibility with the legacy method 
of parsing panels and bridges, so the next bridge isn't always parsed by 
the common Analogix side driver.

This patch series has been pending for ages, and I'm even a bit fuzzy on 
the details myself. ;-)

Best regards,
Damon


