Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A722CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQqtJyNfbYnJRIw/BGD/cND3AGmHGHL0thx41Mcmirc=; b=dZ4lr6Rx7HiM1YNyskKfAVJl4Q
	M7XeAUUOeVVv80K+x/I94wH5M3tfAIs/XBdMHUJwpayPSB5bd43xTYHcG2DtW88qOpfoNs12n6cCk
	zSyK5J8C3nx61gO/8LIF76ISVFZoWpfrZUzjgh24baHYgdWtmN5oclFn+p7GrkLIypTSoiqf+1TFR
	Mjy1g/5qXWwnWvLVH7UxRocVRuNdN6Neqmos9b8ICC0kNutAguJr+6IOVLsWHy6aKl/zu66LiRRtA
	J075RctszIgzFau5uonOfUCaUAMIaKoOovjV5uUspoURlvABwr3fDQXEqft1M9m38qb8N31Owwcmm
	uIC480rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gUD-00000006knU-1hAD;
	Thu, 25 Sep 2025 07:33:53 +0000
Received: from mail-m49200.qiye.163.com ([45.254.49.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gUA-00000006kki-1uLB;
	Thu, 25 Sep 2025 07:33:52 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2404c7a9b;
	Thu, 25 Sep 2025 15:33:45 +0800 (GMT+08:00)
Message-ID: <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
Date: Thu, 25 Sep 2025 15:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
 <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997fcadceb03a3kunmf428ea61f44a4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5MHlZDTEhJGE5IQ04dTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RMeFRgwK/u9gvsfKikZ6QJa4SgufBJayFB0NijJ2dZPIYudWTPVknCf/RSzoR9Eb42n56CnuehVerhBm3oRxFYvPPN3Lie/WVYt7wWFD0QMNUuCgPHo9Rn+IUxAofGpqUs0SnaLkyd7qtyJfB3cCp7JWz3XnclQfDza1rydM3V4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=IQqtJyNfbYnJRIw/BGD/cND3AGmHGHL0thx41Mcmirc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_003351_060040_F6E12D8A 
X-CRM114-Status: GOOD (  22.94  )
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

On 9/25/2025 11:37 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
>> Hi Dmitry,
>>
>> On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
>>>> Apply drm_bridge_connector helper for Analogix DP driver.
>>>>
>>>> The following changes have been made:
>>>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>>>     and &drm_connector_helper_funcs.
>>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>>     &analogix_dp_plat_data.attach.
>>>> - Remove &analogix_dp_device.connector.
>>>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>>>     &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>>>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>>>     &drm_bridge_funcs.edid_read().
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ------
>>>>
>>>> Changes in v2:
>>>> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>>>>     DRM_BRIDGE_OP_EDID.
>>>> - Add analogix_dp_bridge_edid_read().
>>>> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>>>>     patches.
>>>>
>>>> Changes in v3:
>>>> - Rebase with the new devm_drm_bridge_alloc() related commit
>>>>     48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
>>>>     API").
>>>> - Expand the commit message.
>>>> - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
>>>>     bridge is available.
>>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>>     &analogix_dp_plat_data.attach.
>>>> - In order to decouple the connector driver and the bridge driver, move
>>>>     the bridge connector initilization to the Rockchip and Exynos sides.
>>>>
>>>> Changes in v4:
>>>> - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
>>>>     &drm_connector.
>>>> - Rename the &analogix_dp_plat_data.bridge to
>>>>     &analogix_dp_plat_data.next_bridge.
>>>>
>>>> Changes in v5:
>>>> - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>>     for next bridge attachment of Exynos side.
>>>> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>>>>     the downstream device is a panel, a bridge or neither.
>>>> - Remove the calls to &analogix_dp_plat_data.get_modes().
>>>> ---
>>>>    .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
>>>>    .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>>>>    drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
>>>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
>>>>    include/drm/bridge/analogix_dp.h              |   3 +-
>>>>    5 files changed, 95 insertions(+), 96 deletions(-)
>>>>
>>>> @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>>>>    int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>>>    {
>>>> +	struct drm_bridge *bridge = &dp->bridge;
>>>>    	int ret;
>>>>    	dp->drm_dev = drm_dev;
>>>> @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>>>    		return ret;
>>>>    	}
>>>> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>>>> +	if (dp->plat_data->panel)
>>>> +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
>>>> +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
>>>> +	else if (dp->plat_data->next_bridge)
>>>> +		/* If the next is a bridge, the supported operations depend on the next bridge */
>>>> +		bridge->ops = 0;
>>>
>>> And what if the next bridge is dp_connector without a separate HPD pin?
>>
>> This case was indeed not taken into account.
>>
>> If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
>> return connector_status_connected in analogix_dp_bridge_detect(). This
>> ensures the connection status remains connected for both the dp-connector
>> and the bridges without DRM_BRIDGE_OP_DETECT.
> 
> Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
> to stop preferring OP_EDID bridges over OP_MODES if the latter one is
> enountered later in the chain. In other words inside
> drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
> and vice versa. This way you can always declare OP_EDID here (after
> converting to panel bridge) and then letting panel's OP_MODES take over
> mode declaration. Would you please include such a patch in the next
> iteration?
> 

I see. Following your suggestions, the logic will be:

1.If the later bridge declares OP_MODES and 
&drm_bridge_connector.bridge_edid already exists, the 
&drm_bridge_connector.bridge_edid should be set to NULL.
2.If the later bridge declares OP_EDID and 
&drm_bridge_connector.bridge_modes already exists, the 
&drm_bridge_connector.bridge_modes should be set to NULL.
3.If the later bridge declares both OP_EDID and OP_MODES, set 
&drm_bridge_connector.bridge_modes and &drm_bridge_connector.bridge_edid 
to it(preserving the existing behavior).

I will add a new commit with necessary code comments to implement this 
in v6.

>>
>>>
>>>> +	else
>>>> +		/* In DP mode, the EDID parsing and HPD detection should be supported */
>>>> +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>>> +
>>>> +	bridge->of_node = dp->dev->of_node;
>>>> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
>>>> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>>> +	if (ret)
>>>> +		goto err_unregister_aux;
>>>> +
>>>> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
>>>>    	if (ret) {
>>>>    		DRM_ERROR("failed to create bridge (%d)\n", ret);
>>>>    		goto err_unregister_aux;
>>>
>>

Best regards,
Damon


