Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2896BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEJXYdE6sHQ3QcQ35RAz+8iw/E6lQ+J+vzPB9e0z0ZE=; b=iOQl90csp5kA82PXec49CJnz9y
	ESL0DqvSJc8Oe7f9VPCrfIuI3sOFF6pj1S87qjrQiQ7EUqO9zqiiV9xNw+JCujJ/JbWwAvpJ/XUdw
	uARA8ZUoLcYQAgO3s8TaQ+nlWeQO2ulvIq2NP4cjZfsPJsI7RJxgEo14eTZPkzLZgg1X6aET7lHA4
	obBRewadYAbizXWgXPGwBay+unLa+FS6GWivqfNQaN1tG3NxvgsamVDM3pNuMuhjZJgouabSIAlms
	KkD4dJt8nDN4IjxeXxX7xbLKnbA/APqdwWjzSuhGIZhEewCl1azCpC6fZYKlTBx29HQvilc91p7HW
	crosGUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7ZJ-00000008qbA-0PJB;
	Fri, 25 Jul 2025 01:49:53 +0000
Received: from mail-m49213.qiye.163.com ([45.254.49.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7Wp-00000008qLB-1dvo;
	Fri, 25 Jul 2025 01:47:21 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d2fe2f3d;
	Fri, 25 Jul 2025 09:47:11 +0800 (GMT+08:00)
Message-ID: <0c923b86-e050-4152-abdb-81c05d40c013@rock-chips.com>
Date: Fri, 25 Jul 2025 09:47:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply
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
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-9-damon.ding@rock-chips.com>
 <10694296.nUPlyArG6x@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <10694296.nUPlyArG6x@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f434c8003a3kunm70577913ca0a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxJT1ZPT04YHkkfT0hCHUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=JhBX+8167OtvqHOcu3utBjwzc4uAfcAN6HBMT77ismrywSVOMfk/yJYxo/6Q41/e0eZSW7SmdIYOVGZWDlTIO1gIBtLe91LlUIVo3A8nwIlzt4GezJEw/7GAtyL58OhQ+ics3bwVS1iUyf0R1VpNrWU5SpZUv6p4Z4y6yiMaqnY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uEJXYdE6sHQ3QcQ35RAz+8iw/E6lQ+J+vzPB9e0z0ZE=;
	h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_kTakW7JjryuX/AmUDtQemwAhscXZcteF2ErvzJrxulFvolGm/tSnVEyS7nT3Vzl94marjEgixW46uQ5JSpxfEuzxPDKrdZhW5Js57PMhhC1PYFEjJNu51pFYd81rZtUR7I0Un733I3A8eSvV+zRnvQbhR0kH516cZQQMWibkOizeB8o0Hs4plvX9IFj4QCCx4BW3sniFYva40eZkLpngDOxYX9E0WB8rsm/jwA5aE1M0Y26pq+HCH1VVN2qLlwzR633Xgjq61kKcf767w9sDjA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_184719_928128_3E786DA1 
X-CRM114-Status: GOOD (  11.24  )
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

On 2025/7/24 21:00, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 24. Juli 2025, 10:02:58 Mitteleuropäische Sommerzeit schrieb Damon Ding:
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
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
>>   static enum drm_connector_status
>> -analogix_dp_detect(struct drm_connector *connector, bool force)
>> +analogix_dp_bridge_detect(struct drm_bridge *bridge)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	enum drm_connector_status status = connector_status_disconnected;
>>   
>>   	if (dp->plat_data->panel)
> 
> this needs an update to
> 
>   static enum drm_connector_status
> -analogix_dp_bridge_detect(struct drm_bridge *bridge)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> 
> to follow Andy's patch [0] that got already applied to drm-misc-next
> 
> Heiko
> 
> 
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5d156a9c3d5ea3dbec192121259dee2c2f938fa1
> 
> 
> 

I will update it in the next version.

Best regards,
Damon


