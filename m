Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D5DD262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNjlojsuLc/0qqBmkSGfSv2S8AoQ/r1bdzmISLpgJLY=; b=hNnV9OjizZH9RYFbmaOU5vror7
	UDlZOMuQnMm2pAA/D6dXYr5NcSYpU6RFyKFul/0M/5Cds6WK23azA0E4EB8FV8O9Bxl6lRl6bc9bT
	2JxnTwtCOm6dcctuQ0W9/7Nt72HcMV5xNieGTA1wVwGo9RoynK+kKRmEv3IQTCV3pWbQtB/wBAhdq
	sVVffy3lUMY+0btluIzO+weChpmxzB+efw7FgJFF6sbKLdyTdDYiC+3lVvMXpqs8R18iZU2uZrqua
	lv0Enp82wAkLK61V37kdACtXGU7DEX9zsl/vseqq1E+3PYLC8QMpcWXW2uEvw21MPMEYkioM7DElv
	fitgOBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSek-000000051B7-3gj9;
	Wed, 21 Jan 2026 07:29:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSeh-000000051AK-49vq;
	Wed, 21 Jan 2026 07:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768980567;
	bh=y9D3zqOejeIC2P8tmWoOAr1ltSyPEHTu0gBB47fi4ug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YHYrUhgVC1vHXdcaY3HihyQx+tBgkuUUdlEAI2+72KKq+GGPJqj7KWqnWCC/oIgKH
	 ua5tenLHessM0e8TIIN2bCc3nWb0HbniAIje+zJpnqbZzeuY2cPbznzeTY5etBi63h
	 /UM6oHIuIxzi8iUcdOsl+uEJCY/8BJYABuzUPNiaIWqWhT9tH/yL/eW3lM9h9PhVZw
	 sg0a9CIMfmZVdjogcx2sxIfBR+wlsdY9R5cfRyoPRSLoUhUL1APQpmA6gNIsueyeaT
	 4snc9MZHu285Eglwca5hxbq3Y6QgPN4DFN0dhkB27+DMnYQGBUYJUV29oKoJ56wUwS
	 ghI4u1cADgb7Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C16517E0342;
	Wed, 21 Jan 2026 08:29:26 +0100 (CET)
Message-ID: <2c0bbe6e-3328-438f-b9ab-8fe84fa87912@collabora.com>
Date: Wed, 21 Jan 2026 08:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fixup! media: synopsys: add driver for the designware mipi csi-2
 receiver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
 <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
 <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
 <aXAKHMjwVpWYUmp7@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aXAKHMjwVpWYUmp7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_232932_257898_2B2E73BB 
X-CRM114-Status: GOOD (  20.77  )
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

Hi Sakari,

On 1/21/26 00:05, Sakari Ailus wrote:
> Hi Michael,
> 
> On Tue, Jan 20, 2026 at 08:35:17PM +0100, Michael Riesch wrote:
>> Make smatch happy by adding braces around the initialization in switch
>> cases.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>> @Sakari could you try the following patch? I think this should solve the
>> issues with smatch/sparse you mentioned off-list.
> 
> I don't know what went wrong but this won't apply.
> 
> Instead I made the following changes:

Yep, these are fine. Thank you very much for doing the fixup!

Best regards,
Michael

> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 29119a1a8d38..170346ae1a59 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -237,10 +237,8 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  
>  	switch (csi2->bus_type) {
>  	case V4L2_MBUS_CSI2_DPHY:
> -		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -
>  		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
> -								 lanes, cfg);
> +								 lanes, &opts.mipi_dphy);
>  		if (ret)
>  			return ret;
>  
> @@ -294,14 +292,12 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
>  
>  	switch (code->pad) {
>  	case DW_MIPI_CSI2RX_PAD_SRC:
> -		const struct v4l2_mbus_framefmt *sink_fmt;
> -
>  		if (code->index)
>  			return -EINVAL;
>  
> -		sink_fmt = v4l2_subdev_state_get_format(
> -			sd_state, DW_MIPI_CSI2RX_PAD_SINK);
> -		code->code = sink_fmt->code;
> +		code->code =
> +			v4l2_subdev_state_get_format(sd_state,
> +						     DW_MIPI_CSI2RX_PAD_SINK)->code;
>  
>  		return 0;
>  	case DW_MIPI_CSI2RX_PAD_SINK:
> 


