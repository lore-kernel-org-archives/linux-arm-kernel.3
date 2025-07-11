Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB24C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugJYj+exyps/6wR5MX4czRxtXgkmuqVMFOJv2QPxESU=; b=SkJsYl8HobsbRR+jgbma59QIss
	+m3FZTfKP+y+x3Hu8EGrneqFRDkjy3YVq7RV1HLEbZGZGJQUWEuWlC/BMIpQ/an/wtVcKl9S38zKl
	gwmVzrU3f50NZ/7KHHmJa1zxZmeqwFVJCroMNkd95TH866H1Ce0gCb+v49njC7RE28daHiZb+8grg
	P8rcKMMYG8FYmclHzF4BxfDMEzRD1sMpdRu/q7Vdh+e3Epo3xDYP6VcBCNYEMkZ0NZWXDyyyDEx8c
	cUFI4BT/sLuA8wPrUicfiz1uPJVTEAdKjfNdXq/2vuGkcH9A+TnUIF8PQ6qTQ+VECPHjR0sNDSmuD
	Ur/ADfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9JY-0000000EBlV-1lEU;
	Fri, 11 Jul 2025 08:41:05 +0000
Received: from mail-m49214.qiye.163.com ([45.254.49.214])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8WU-0000000E29B-46Qw;
	Fri, 11 Jul 2025 07:50:24 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1baf32046;
	Fri, 11 Jul 2025 15:50:18 +0800 (GMT+08:00)
Message-ID: <84b8fe6e-0d33-42a9-9f8f-ed10998429e8@rock-chips.com>
Date: Fri, 11 Jul 2025 15:50:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-13-damon.ding@rock-chips.com>
 <6140569.FjKLVJYuhi@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6140569.FjKLVJYuhi@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIeS1YYSUJKSUpMQkgfTxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f876b52003a3kunm13db4e75f3c74a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6GCo*KjE2Lx8SUSk5EgEj
	C08wCj5VSlVKTE5JSUlLSUlLTEJNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPT0lMNwY+
DKIM-Signature: a=rsa-sha256;
	b=f3ABdV+J9ZF4Xh4dDg/WOg07CApS5rihUgUFAvDfOc0Q3Sk0KKlc5dUnKK0B8PkH67LddM3XLMInqreiNp6Iq4k45NkImv8eCKuNN/9Qarq/wNQ452zop5AwY0dB2gNx8FzkKokv0WlZypir9qZ2d0Pl+UxU4dsxr9HRKS+eZqs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ugJYj+exyps/6wR5MX4czRxtXgkmuqVMFOJv2QPxESU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_005023_210870_B76748FE 
X-CRM114-Status: GOOD (  16.44  )
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

Hi Heiko,

On 2025/7/10 4:11, Heiko Stübner wrote:
> Am Mittwoch, 9. Juli 2025, 09:01:39 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Remove &analogix_dp_device.connector and change
>>    &analogix_dp_device.bridge from a pointer to an instance.
>> - Apply devm_drm_bridge_alloc() to allocate &analogix_dp_device that
>>    contains &drm_bridge.
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ------
>>
>> Changes in v2:
>> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>>    DRM_BRIDGE_OP_EDID.
>> - Add analogix_dp_bridge_edid_read().
>> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>>    patches.
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 169 ++++++++----------
>>   .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
>>   2 files changed, 80 insertions(+), 93 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index abc64cc17e4c..fb510e55ef06 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -23,6 +23,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_edid.h>
>> @@ -948,23 +949,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>>   }
>>   
>> -static int analogix_dp_get_modes(struct drm_connector *connector)
>> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> -	const struct drm_edid *drm_edid;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	int num_modes = 0;
>>   
>>   	if (dp->plat_data->panel) {
>>   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> 
> here is one example where a panel_bridge would help :-)
> 
> I.e. I'd think without it the code would need some sort of
> 
>    	if (dp->plat_data->bridge) {
>    		num_modes += drm_bridge_get_modes(dp->plat_data->bridge, connector);
> 
> thing?
> 

Oh, the handling of bridge here is indeed not well thought out. I will 
implement the panel-bridge in the next version.

>> -	} else {
>> -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>> -
>> -		drm_edid_connector_update(&dp->connector, drm_edid);
>> -
>> -		if (drm_edid) {
>> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
>> -			drm_edid_free(drm_edid);
>> -		}
>>   	}
>>   
>>   	if (dp->plat_data->get_modes)
> 

Best regards,
Damon


