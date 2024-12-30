Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B080E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MA8xyqbIBeJ0Pwy7IN+375Ka0H3nD/YtEWmgaypqI4=; b=rjM9o1F3rLr15d2pfs+1AIDFTe
	qnYOlNgUDPDt+lB9qQJrTEWEMj/LYmFtbFeUvVQ7tFEfCBIMYtEbzwiLrVFvrFbcEpdtgLeJwy3dG
	gz6sh56iyRd02nDK4B05cFO6f8rN7/lSKHRniBkuSVN/DGT35FtuNNlQw6zkn2IpPZc1Lr6gp0Vqp
	P4XimvGGhs4xa7H225MYmygi33+EaKiw5OklL6sHslaWKYC1ZqtTCKKQI7/Mbk1SPmHk7YLFCZxLK
	gN0vHpyFduASWmKDyu6swLHK5aRGggFV8mQKTjfVUwvlb9NzibeM/msTxhThM2dzVGMXIU+PgRJTe
	ofZGaDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSOAI-00000005wxo-0tDO;
	Mon, 30 Dec 2024 22:23:10 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSO7w-00000005wfP-08gS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 22:20:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FDC9104855A1;
	Mon, 30 Dec 2024 23:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735597240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MA8xyqbIBeJ0Pwy7IN+375Ka0H3nD/YtEWmgaypqI4=;
	b=QomD+4/h4aDrfaPORZZL2G3oQZCoYjRspDHcJvk04g+LbLGwYe7lX/Ut9k/DT6VCCf47ZI
	030uCoCI4B4gbmrw/dcQP2UvmPNs/FcyI0811H4EOugYTVcXoo5wB9DjyyV1giQmkR2t29
	KupnLhochVeXxE1HGeJ/3/5qTcIQ7LJvkufaTVv0izwku1hiElU1kgiWi56IBvycnu0uyC
	k5zteYbB943Z3kKYhnUFm7uBRpK4aFiSL7rHQOk5+779jflb1aPDEgoCUtQl1hra0R+wf7
	St0dscX7LILf/ZiqCd6IjfPZVKtrdtite3eM/TUGZoh+HtbbydA5eCKmSDjQhw==
Message-ID: <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
Date: Mon, 30 Dec 2024 22:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Ying Liu <victor.liu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_142044_362639_3E6A4375 
X-CRM114-Status: GOOD (  21.83  )
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

On 12/30/24 8:04 AM, Ying Liu wrote:
> On 12/26/2024, Marek Vasut wrote:
>> On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
>>>> The dw-hdmi output_port is set to 1 in order to look for a connector
>>>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> working.
>>>> The output_port set to 1 makes the DW HDMI driver core look up the
>>>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>>>
>>>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>> Cc: Liu Ying <victor.liu@nxp.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Stefan Agner <stefan@agner.ch>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: imx@lists.linux.dev
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> ---
>>>> V2: No change
>>>> ---
>>>>    drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>>>>    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>>>>    2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
>> b/drivers/gpu/drm/bridge/imx/Kconfig
>>>> index 9a480c6abb856..d8e9fbf75edbb 100644
>>>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>>>> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>>>    config DRM_IMX8MP_HDMI_PVI
>>>>    	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>>>    	depends on OF
>>>> +	select DRM_DISPLAY_CONNECTOR
>>>>    	help
>>>>    	  Choose this to enable support for the internal HDMI TX Parallel
>>>>    	  Video Interface found on the Freescale i.MX8MP SoC.
>>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> index 1e7a789ec2890..4ebae5ad072ad 100644
>>>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
>> platform_device *pdev)
>>>>    	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>>>>    	plat_data->priv_data = hdmi;
>>>>    	plat_data->phy_force_vendor = true;
>>>> +	plat_data->output_port = 1;
>>>
>>> Quoting my feedback to a similar Liu's patch:
>>>
>>> This will break compatibility with older DT files, which don't have
>>> output port. I think you need to add output_port_optional flag to
>>> dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
>>> is set, but there is no remote node.
>> Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
>> support is commit:
>>
>> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
>> TQMa8MPxL/MBa8MPxL")
>>
>> That already contains the HDMI connector node. Every follow up addition
>> of HDMI to another device has been a copy of the same commit, with
>> connector, so I think it is safe to say, no upstream DT is going to be
>> broken by this change. Do we care about hypothetical downstream DTs
>> which may be missing the connector ?
> 
> These have no HDMI connector nodes:
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
Huh, I missed those, thanks.

Would it be OK with you to fix those DTs up and add the missing 
connector, rather than introduce some optional port workaround for them ?

