Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F95E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 22:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkIGZmwhg2neLO1jlUwO1QbcyyIDvbzGZHUYB0DXWPU=; b=s1YinPukZXnLoR5yHaoSp40jFC
	lYIwdYq7kZHgcM/m4JShePzorj0oePIayVlhsDmE+qlD9C+inOqpkKKNfRcmwwdBNpuhwI4cUbszc
	bnZFDL0FQd8RQksSfEv+JK9nLtd3kNjrqXWVq4OSarEfVtM7tCys/xxjDjPbbde8I0O2Lj3gh+2V2
	gvmc606WjT81b2Sz3L9haU58L64OHr45xYuSyFD/KD79MJ6/5ntPZMX9X154cU+SPjmPaME3sVxNJ
	NxgTM5UwVNQwttQW8iZNTA054Ke6DLmOHqVrul7H8UWyC8B9MHNb0looT44JqfZDk7u/kWOfuP3gq
	37WZZ+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSO97-00000005wmP-2SLm;
	Mon, 30 Dec 2024 22:21:57 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSO7v-00000005wfM-2VA8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 22:20:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB5AC1048559D;
	Mon, 30 Dec 2024 23:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735597236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkIGZmwhg2neLO1jlUwO1QbcyyIDvbzGZHUYB0DXWPU=;
	b=dyQOCkC4zi2h/jh5Ubd0KW/ctVjjgO4bGU9YuZTP8ctxhxTBD6csQLevHwAQYl7FC3dBCb
	6wBhxmoe1dwJ3PUCNY3gXTJ7+GJRdAp1HMAlnoY8CyHJ24yajJmEXg9F+sFxeaHvqNbA6P
	fSLpfCkD66+q+/x9SWstwflEeQCLgYyLUsp/50WoX7mDC7Qf/713MONCsthuFyr21rjxL7
	Ur43H5ZfZxKZSAWrJLbICm7DSP2ziuoUZ1cJWWz1wPol8wyjnxwX50DItUlT1m+8LPniod
	feGIPFmfY2J1C+tqmozb2M0aW32P2kU7wKbzKn4Raelww25K+UXM5orsgLLaeg==
Message-ID: <defff8a2-4123-42cb-9099-445b209eb2f0@denx.de>
Date: Mon, 30 Dec 2024 22:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
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
References: <20241224014701.253490-1-marex@denx.de>
 <0140bb0c-35f0-4a5e-b100-32e09bc8c617@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0140bb0c-35f0-4a5e-b100-32e09bc8c617@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_142043_798464_BD1A670E 
X-CRM114-Status: GOOD (  10.39  )
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

On 12/30/24 7:57 AM, Liu Ying wrote:

[...]

>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
>> index 9a480c6abb856..d8e9fbf75edbb 100644
>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>   config DRM_IMX8MP_HDMI_PVI
>>   	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>   	depends on OF
>> +	select DRM_DISPLAY_CONNECTOR
> 
> Select it for DRM_IMX8MP_DW_HDMI_BRIDGE instead?
> Furthermore, if yes, should it be even selected for DRM_DW_HDMI instead?
> 
> I'm not sure if this is needed to be selected though, since only DRM_MESON is
> selecting it while CONFIG_DRM_DISPLAY_CONNECTOR is enabled in multiple
> defconfig files(like arch/arm/configs/multi_v7_defconfig).

It is necessary to update existing .config .

[...]

