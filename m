Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2627E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2ff0HaCcjmmj9KnhUdBh5w7Yu5An6vyL+EnPFzNUxM=; b=CjYbiBRyIA1oeixyzHk24i8Q2g
	qO3lclm6WWdtPsoKLBAgbUQDquUtpPbKvkzDDvnM02h9H13FCbkTZ/b58db3NQhJ6bBeQpFxMGd9K
	lBsJjPi+2kCXF+jum+WMmDOQodWNOIaMUMbLQhvoxNf/h0sKIBniZbjqcxwfg2RhnstjdnGrVbN8K
	C/Fm50CZ9fwBaThmauxoGiXfnL154X07oAx8vHWjp5vKBxfp6+QD15y0rEZaPi+47Sa6cQ/mO+AJU
	/hHe67GE0NH3KU1lFJ1hyr6lQWWvJw6ZrFwwY7vbaAQ+mVkc6gU4WttTIPVhrgAl3W4i1DAu21yk8
	Oobmcj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7j3-00000004Xlz-2L60;
	Tue, 07 Jan 2025 11:26:21 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7hk-00000004XOi-3abW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:25:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CF61101ECB24;
	Tue,  7 Jan 2025 12:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736249096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2ff0HaCcjmmj9KnhUdBh5w7Yu5An6vyL+EnPFzNUxM=;
	b=RTRWgK8MQwcxk8DstoWOZvN2/3kvry5mG8JD2y5yOxA82ctZZp6KWEPNEDoXWsNkRCxPK9
	kK1yUy0mcKomy/pLdtu34wp/qBQLj06fK3+hhFedORfXEvPglXKnhk3wDBR9/1bIrj7ArB
	OI2Gi5edckf4vOG2KjWaWu+P6f9vIbMuVDg6/v6mglbrQWFw0T4QNNTZUK1gZomy83NqsC
	ftDYnHdWjlAcmxOpSFRZzEVd6ch+K6IalzRuHt3hy9ZEradm/uQkophOkQ8lIk4uhiWbKg
	/ar4bJIYqR0nefQKmR4kFGQxyau7P4yEHom8Hnuh+rYPqpxWzm2L0EcVpS/9CA==
Message-ID: <c02d8298-28dd-4e48-8899-7316bd60dddb@denx.de>
Date: Tue, 7 Jan 2025 12:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250105190659.99941-1-marex@denx.de>
 <20250105190659.99941-2-marex@denx.de>
 <0b1c9897-2769-4ca0-9927-ac930b4c634b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0b1c9897-2769-4ca0-9927-ac930b4c634b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_032501_178457_C66783BB 
X-CRM114-Status: GOOD (  21.75  )
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

On 1/7/25 6:38 AM, Liu Ying wrote:
> On 01/06/2025, Marek Vasut wrote:
>> The dw-hdmi output_port is set to 1 in order to look for a connector
>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>> The output_port set to 1 makes the DW HDMI driver core look up the
>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>
>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>
>> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
>> the oldest commit which adds HDMI support is commit:
>>
>> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
>>
>> That already contains the HDMI connector node. Most follow up additions
>> of HDMI support to another devices has been a variation of the same commit,
>> including connector node, which is the proper way of eanbling HDMI on the
>> i.MX8MP.
>>
>> The rest should be covered by output_port_optional which should make systems
>> with DTs without HDMI connector node work, but such DTs should be updated and
>> the HDMI connector node should be added.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Stefan Agner <stefan@agner.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: No change
>> V3: - Update commit message
>>      - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>>      - Enable output_port_optional
>> V4: - Remove select DRM_DISPLAY_CONNECTOR
>> ---
>>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> index 1e7a789ec2890..3d63200e468bf 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>>   	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>>   	plat_data->priv_data = hdmi;
>>   	plat_data->phy_force_vendor = true;
>> +	plat_data->output_port = 1;
> 
> How would you keep the behaviour of the connector after adding
> DRM_BRIDGE_ATTACH_NO_CONNECTOR in display controller driver?
> dw_hdmi_connector_create() implements CEC support at least.  This was pointed
> out in v2 and v3 comments.
> 
> https://lore.kernel.org/all/vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he/
As far as I understand it, the CEC is being worked on separately already ?

