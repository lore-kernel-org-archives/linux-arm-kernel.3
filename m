Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B74E9905B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSaNZqWfDxbNZ57v4AyAy7Xb4S5mgUBeo3DUPCIrdgs=; b=mS0E8WisV9E40n/tWB8jHkPpal
	h2lU6FTqr0z8aKY2Unq/pMTK/nlQG2RJ7Gau+pF8WYsgkV1uPWIUeh8hHkEjNGRQknk/K5ioolCD9
	/Q+lxFuxU5DCLPf7VCD3LwOD8nPA0A7WdVDyb1gCkDayEvsSVHsNzS9bR1wywgOY9dmkykm8zJWWt
	kWthdfYH+1hQpyCFFrFL210bWJGlfZDAYepYxdHwBkC+fRr6k4poJfXIPr2d6Pj/F6yKkJP0wHhr9
	vCSaPBca7XCJMAfeucMi+XqG9dKKAHFC0xCRmv/Tgy/bVfya4amcwaO1C26tjcoIDllhYpB84g9Xo
	ga5BMrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7bV-0000000BrZe-171w;
	Fri, 10 Apr 2026 08:52:41 +0000
Received: from mail-m1973192.qiye.163.com ([220.197.31.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7bR-0000000BrY9-3SeW;
	Fri, 10 Apr 2026 08:52:39 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a3da4ce0;
	Fri, 10 Apr 2026 16:52:20 +0800 (GMT+08:00)
Message-ID: <39a86d7c-59fc-4849-aa60-d9bc62632143@rock-chips.com>
Date: Fri, 10 Apr 2026 16:52:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 11/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, victor.liu@nxp.com, Frank.Li@nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 alim.akhtar@samsung.com, dmitry.baryshkov@oss.qualcomm.com,
 nicolas.frattaroli@collabora.com, dianders@chromium.org,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-12-damon.ding@rock-chips.com>
 <DHPB0K9AHVR3.33XQ35I1GV96N@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DHPB0K9AHVR3.33XQ35I1GV96N@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d7697996f03a3kunm160a3efe4d69e3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhoZS1ZPThhOS0NCTBhKSRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=NJ6nulOPfjZxPerehJRi5Y1NtCkBNPQwbAOOZphJjJqnZQcUBEd6latzMr86rU+hU3micX3Am0ufud/JcsO2wZP15qN8f5tMbYTB87QgUiVssfv/m8UjSY7qseEQ8LpNcoVD048hBzWuFmWesLnasRDM/50ymJR67Px+yh4i2+0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FSaNZqWfDxbNZ57v4AyAy7Xb4S5mgUBeo3DUPCIrdgs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_015238_378342_3EB0F099 
X-CRM114-Status: GOOD (  17.23  )
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

On 4/10/2026 3:41 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Thu Apr 9, 2026 at 8:52 AM CEST, Damon Ding wrote:
>> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
>> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
>> side, as the private &drm_connector is no longer created.
>>
>> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
>> are replaced by the corresponding &drm_bridge_funcs APIs:
>>
>> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
>> analogix_dp_detect()       -> analogix_dp_bridge_detect()
>> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>>                                analogix_dp_bridge_edid_read()
>>
>> Additionally, the compatibilities of Analogix DP bridge based on whether
>> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
>> supported; If not (the next bridge is a 'monitor' or a bridge chip),
>> OP_EDID and OP_DETECT are supported.
>>
>> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
>> analogix_dp_probe(), because the type of next bridge (the panel, monitor
>> or bridge chip) can only be determined after the probe process has fully
>> completed.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588
> 
> I noticed two issues, sorry I haven't catched them before...
> 
>> @@ -1580,7 +1533,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>>
>>   int analogix_dp_start_crc(struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp;
>> +	struct drm_bridge *bridge;
>>
>>   	if (!connector->state->crtc) {
>>   		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
>> @@ -1588,13 +1542,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
>>   		return -EINVAL;
>>   	}
>>
>> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
>> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
>> +		return -EINVAL;
>> +
>> +	dp = to_dp(bridge);
>> +
>>   	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>>   }
> 
> drm_bridge_chain_get_first_bridge() takes a reference, you must call
> drm_bridge_put(bridge) before returning. Given there are two return paths I
> suggest:
> 
> -	struct drm_bridge *bridge;
> 
> -	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	struct drm_bridge *bridge __free(drm_bridge_put) =
> +		drm_bridge_chain_get_first_bridge(connector->encoder);
> 
>>   EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>>
>>   int analogix_dp_stop_crc(struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp;
>> +	struct drm_bridge *bridge;
>> +
>> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
>> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
>> +		return -EINVAL;
>> +
>> +	dp = to_dp(bridge);
>>
>>   	return drm_dp_stop_crc(&dp->aux);
>>   }
> 
> Same here:
> 
> -	struct drm_bridge *bridge;
> 
> -	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	struct drm_bridge *bridge __free(drm-bridge_put) =
> +		drm_bridge_chain_get_first_bridge(connector->encoder);
> 
> With the above two changes you can add to v14:
> 
> +Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 

Ah, your previous commit added this nice reference handling. Thanks for 
the kind review.

I'll fix it in v14.

Best regards,
Damon


