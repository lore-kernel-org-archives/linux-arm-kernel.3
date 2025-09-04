Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C527FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuqZMaZEY3Ro7lOt8/v6vij9JESnmu0skXkRr3yqkBo=; b=Uo25g1ujCZFYedhybaSa4QsYIf
	XnQITqH0ukWmuTqwCT/KG4RKkMce+WacnjlNxOArNXK+dZA4e6Eom1PwF55NcdeuC/rWkKf0+Sh2H
	nDM+iXmi4rglUsrASMBQ03olWu12DiucRtDXtPyb79O+wEo4bvunfsXKLhA3DlBOfO2GVJVrrsfbt
	OzkrHtWjXS/3Mm5N9Ml5huXX8UTqioLVs21EDYDf9P13bMAg3HZJKYWwrKOZuyq0SHqC44F/g2sHt
	lf/z0E9qNq39GycTRfBh2sCsPFiEsiCP/I+ffoFUKzyGvo6ncFmqAmoWYlThAvozpfnWbXNZKRjjD
	H1knK0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnv-0000000Cudg-300d;
	Thu, 04 Sep 2025 16:27:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9zv-0000000Bslq-3yhr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:27:34 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250904132728euoutp01597682d0c69dd80340077d4674a9df32~iF1Kzr8Vm3101231012euoutp01t
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 13:27:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250904132728euoutp01597682d0c69dd80340077d4674a9df32~iF1Kzr8Vm3101231012euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756992448;
	bh=OuqZMaZEY3Ro7lOt8/v6vij9JESnmu0skXkRr3yqkBo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=D+Of34zz2dwO58oipgkskjDy0ppJoZmQXo63nqEJfv72IvnnIB8uWBGApOhhQvZdL
	 /9wTKwo+V35VsuIyoJE0tpEyKbCFcV5vWeI//gOnrow0l9jGlNCA1Lpj0D2QTZj7Ny
	 0cuZAif42CpQkC1UD2tHFGIwv7Ce89dQo4XEPPao=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904132728eucas1p110dd7341b827ecb00d326aaab1b6e052~iF1KTEFC-1354913549eucas1p1Y;
	Thu,  4 Sep 2025 13:27:28 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250904132725eusmtip10df52413ab5451a89e7ae40f97632d99~iF1H12Bu90185801858eusmtip1I;
	Thu,  4 Sep 2025 13:27:25 +0000 (GMT)
Message-ID: <4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com>
Date: Thu, 4 Sep 2025 15:27:24 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <825ff59f-0a97-49a1-a210-a7ee275364bc@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250904132728eucas1p110dd7341b827ecb00d326aaab1b6e052
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
	<20250814104753.195255-1-damon.ding@rock-chips.com>
	<a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
	<7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
	<1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
	<f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
	<a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
	<461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
	<46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>
	<ea57ca6e-4000-49f7-8e0b-899f34b7693a@samsung.com>
	<825ff59f-0a97-49a1-a210-a7ee275364bc@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062732_599120_EA6334B1 
X-CRM114-Status: GOOD (  28.17  )
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

On 04.09.2025 05:19, Damon Ding wrote:
> On 9/1/2025 6:25 PM, Marek Szyprowski wrote:
>> On 01.09.2025 05:41, Damon Ding wrote:
>>> On 8/29/2025 4:23 PM, Marek Szyprowski wrote:
>>>> On 29.08.2025 10:08, Damon Ding wrote:
>>>>> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>>>>>> On 15.08.2025 04:59, Damon Ding wrote:
>>>>>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>>>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>>>>>> PATCH 1 is a small format optimization for struct
>>>>>>>>>> analogid_dp_device.
>>>>>>>>>> PATCH 2 is to perform mode setting in
>>>>>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector 
>>>>>>>>>> helper.
>>>>>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix
>>>>>>>>>> side.
>>>>>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>>>>> ...
>>>>>>
>>>>>
>>>>> Could you please provide the related DTS file for the test? I will
>>>>> also try to find out the reason for this unexpected issue. ;-)
>>>>
>>>> Unfortunately I didn't find enough time to debug this further. The 
>>>> above
>>>> log is from Samsung Snow Chromebook,
>>>> arch/arm/boot/dts/samsung/exynos5250-snow.dts
>>>>
>>>>
>>>
>>> I compare the differences in the following display path before and
>>> after this patch series:
>>>
>>> exynos_dp -> nxp-ptn3460 -> panel "auo,b116xw03"
>>>
>>> The issue is likely caused by the &drm_connector_funcs.detect()
>>> related logic. Before this patch series, the nxp-ptn3460 connector is
>>> always connector_status_connected because there is not available
>>> &drm_connector_funcs.detect(). After it, the DRM_BRIDGE_OP_DETECT flag
>>> make the connection status depend on analogix_dp_bridge_detect().
>>>
>>> Could you please add the following patches additionally and try again?
>>> (Not the final solution, just validation)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index a93ff8f0a468..355911c47354 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -1491,9 +1491,11 @@ int analogix_dp_bind(struct analogix_dp_device
>>> *dp, struct drm_device *drm_dev)
>>>                  }
>>>          }
>>>
>>> -       bridge->ops = DRM_BRIDGE_OP_DETECT |
>>> -                     DRM_BRIDGE_OP_EDID |
>>> +       bridge->ops = DRM_BRIDGE_OP_EDID |
>>>                        DRM_BRIDGE_OP_MODES;
>>> +       if (drm_bridge_is_panel(dp->plat_data->next_bridge))
>>> +               bridge->ops |= DRM_BRIDGE_OP_DETECT;
>>> +
>>>          bridge->of_node = dp->dev->of_node;
>>>          bridge->type = DRM_MODE_CONNECTOR_eDP;
>>>          ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>
>> It is better. Now the display panel is detected and reported to
>> userspace, but it looks that something is not properly initialized,
>> because there is garbage instead of the proper picture.
>>
>
> I simulated the display path mentioned above on my RK3588S EVB1 Board.
> To my slight surprise, it displayed normally with the reported 
> connector type DRM_MODE_CONNECTOR_LVDS. ;-)
>
> The modifications included:
> 1.Synchronized the Analogix DP ralated DT configurations with Samsung 
> Snow Chromebook.
> 2.Skipped the I2C transfers and GPIO operations in nxp-ptn3460 driver.
> 3.Set the EDID to that of eDP Panel LP079QX1-SP0V forcibly.
>
> Additionally, I added debug logs to verify whether the functions in 
> ptn3460_bridge_funcs were actually called.
>
> Did you encounter any unexpected logs during your investigation? I'd 
> like to perform additional tests on this issue. :-)


Okay, I've finally went to the office and tested manually all 3 
Chromebook boards witch use exynos-dp based display hardware. Previously 
I only did the remote tests and observed result on a webcam, which was 
not directed directly at the tested displays, so I only saw the glare 
from the display panel.

The results are as follows:

1. Snow (arch/arm/boot/dts/samsung/exynos5250-snow.dts) - exynos-dp -> 
nxp-ptn3460 1366x768 lvds panel - works fine with the above mentioned 
change.

2. Peach-Pit (arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts) - 
exynos-dp -> parade,ps8625 -> auo,b116xw03 1366x768 lvds panel - 
displays garbage, this was the only board I previously was able to see 
partially on the webcam.

3. Peach-Pi (arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts) - 
exynos-dp -> auo,b133htn01 1920x1080 edp panel - also displays garbage.

Then I found why both Peach boards displays garbage on boot - the 
framebuffer emulation is initialized for 1024x786 resolution, which is 
not handled by those panels. This is a bit strange, because the 
connector implemented by the panel reports proper native mode to drm and 
userspace. 'modetest -c' shows the right resolution. Also when I run 
'modetest -s' with the panel's native resolution then the test pattern 
is correctly displayed on all three boards.


Then I've played a bit with the analogix code and it looks that this 
1024x768 mode is some kind default mode which comes from 
analogix_dp_bridge_edid_read() function, which has been introduced by 
this patchset. When I removed DRM_BRIDGE_OP_EDID flag from bridge->ops, 
then I got it finally working again properly on all three boards. I hope 
this helps fixing this issue.



Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


