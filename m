Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0BEFCD93
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKAr0WWTEFr13YAjpGH8NXZDOYNtjsEXrTQWXZpSIFg=; b=2j4xjJ/BLCZ0yc8hYyCS3i5sV6
	pZ7Jf5Aq0tC+DaMD3DB9+DvJGXK+MAdWcU1Q2lpQHXEWuFTQDw7mdBKUwksj8pdQzNIQFmn725ft9
	iN6dZiS/rME605DYhv8EhMzg0lde3t1TOZSr8Z84ct7AK6lG+7qPA6/gBdsdjCmmu2KufsCgGtLZm
	XtkrflRhd71iG6aSUBmv9547qCYlVrvXJjXDv8Q64sWQSaUm4dtLQXe+vLoagxvV7tGzxa5BBf93o
	eWAmeiBIOzZUWlm9Ky/lIdbzf04gik3aYRYipSR62V5TT6EjhSuiNuwgXGf2mc/stEMQ3JQRzMLwQ
	sub4ypEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYjt-00000007BuY-42NX;
	Mon, 09 Mar 2026 11:25:33 +0000
Received: from mail-m32122.qiye.163.com ([220.197.32.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYjp-00000007Bta-2m8b;
	Mon, 09 Mar 2026 11:25:32 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3642c56b9;
	Mon, 9 Mar 2026 19:25:13 +0800 (GMT+08:00)
Message-ID: <b08028a2-a721-404f-aa37-2d5460b42f94@rock-chips.com>
Date: Mon, 9 Mar 2026 19:25:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/15] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
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
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-10-damon.ding@rock-chips.com>
 <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9cd25814c503a3kunmc0cb66ec2d5790
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpIHVZMShlCQxlDHx5JTx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Qc0YmiyBZee1Hk/fjhMP8HZRU/TFbXqGI15R8Nhb//1EjA0Vul81HEuf9DHIcX4+WMbFCJhaxhBQ0j4oiM5ISbiA7Za0bqazftO58tnWo3jv3QUmPQugIxhXN8V6z++BD9Sl0ShB06AP3Q4K/+O+oYpdJQ8n1KH9J/gJ61nTHAA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=eKAr0WWTEFr13YAjpGH8NXZDOYNtjsEXrTQWXZpSIFg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_042530_993145_75A42A80 
X-CRM114-Status: GOOD (  16.42  )
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

On 3/3/2026 5:42 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>> - Remove unnecessary parameter struct drm_connector* for callback
>>    &analogix_dp_plat_data.attach.
>> - Remove &analogix_dp_device.connector.
>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>    &drm_bridge_funcs.edid_read().
>> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>>    binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
>                               ^
> 
> Do you mean "!DRM_BRIDGE_ATTACH_NO_CONNECTOR" here (i.e. missing '!')?
> 
> Also, unsuppported -> unsupported (typo)
> 

Will fix in v10.

>>    in analogix_dp_bridge_attach().
>> - Set &drm_bridge.ops according to different cases.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
> 
> I had a quick look, looks good overall, for the moment I have only a
> question, see below.
> 
> I aim at reviewing this patch in depth, but it's not an easy one to
> digest. Would it be feasible to split it in smaller logical steps? If it
> is, please do, it would be very helpful for reviewing.

Yes, this commit will be split into several smaller ones in v10.

> 
>> @@ -1532,6 +1481,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>>
>>   int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>   {
>> +	struct drm_bridge *bridge = &dp->bridge;
>>   	int ret;
>>
>>   	dp->drm_dev = drm_dev;
>> @@ -1545,7 +1495,18 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>   		return ret;
>>   	}
>>
>> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>> +	if (dp->plat_data->panel)
>> +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
>> +	else
>> +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>> +
>> +	bridge->of_node = dp->dev->of_node;
>> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
>> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> 
> Can devm_drm_bridge_add() be added to analogix_dp_probe() instead?

Will do in v10.

> 
>> +	if (ret)
>> +		goto err_unregister_aux;
>> +
>> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   	if (ret) {
>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
>>   		goto err_unregister_aux;

Best regards,
Damon


