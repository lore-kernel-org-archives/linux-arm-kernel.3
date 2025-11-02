Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFm7eiCIYsEt1LADD+pGz2W73e0ELKXIO4tKK1fzlbU=; b=Y6X+RpfR6W6tl8IPcxzS7mOHZb
	aJXtFm8wW/Huek61LxDIKemw6WDbEc138HByB0Ft/cShA8VSu2PcMRXqCqlZH/IhrQbqlj3bfuzOF
	XZ7beVFiXOanZZkN1iHY5QAM/5yHgx3ZwjijNXknCFSfJ2Ge2DxyFc+CRdsDj4zM/79IGC2WDyNZj
	5E+k7VUEoxzGPmHOQav52MQ2dy+x90iG82eunfa8I1IIQV0Vefp8HaScGAsQPgl/yvuQpchMU0RF3
	wyb6zg5CN1/0X/bunR6MbL/ebhx4A6tHi9OFAgWvxF6KSjb/Sd9kD2TratuP8r5kwSyxT24LnZL5W
	M0eAodGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbfw-00000008gPM-19PH;
	Sun, 02 Nov 2025 17:15:32 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbfu-00000008gO1-0Scx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:15:31 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d01Z55FGKz9svb;
	Sun,  2 Nov 2025 18:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762103725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFm7eiCIYsEt1LADD+pGz2W73e0ELKXIO4tKK1fzlbU=;
	b=quS86mGp30ZHlr7CTGngypnx4gV9dzF8e8MJ567F4mkRLGwosDGo2diTDI1SE3L5/Hzz61
	PFFBtsU7Y/21wRRAOSZ7OjwGebDCj6XIw3Qz2s7J6PCZqoVc9cgy57jOgwAMGIWPGV0yaE
	t4r0argx5VoTZ8a+0xFCMXyVtWQRXDdmx5kh3P8BYmU6TrOjoE2z54T2NYvEu7GXIZWYQL
	zbo1t3nBof8VNXvy5mqAMtitXVjQcsmfvtsMx5TPrtUKTI+5+vuH88kMldWrAQmNiur8FE
	rtBjrV3FxW4kw4zQ4mCV1QwHdT9QuDcX96+oScfd88wxvdAVJIzpVoTaFOexXQ==
Message-ID: <ad7c080f-38e3-4579-8cd8-148df7769826@mailbox.org>
Date: Sun, 2 Nov 2025 17:33:16 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Ying Liu <victor.liu@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
 <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
 <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
 <e0507800-7e86-4fbb-95cb-e64d8cca1e49@mailbox.org>
 <AM7PR04MB70466BF64A1CD8EB01D2DD9C98F5A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <AM7PR04MB70466BF64A1CD8EB01D2DD9C98F5A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7f4bcc52baaa7a7d700
X-MBO-RS-META: z1oqdk571amguuwo8hkt3n46j3h64r98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_091530_297624_91C068D3 
X-CRM114-Status: GOOD (  33.05  )
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

On 10/20/25 4:15 AM, Ying Liu wrote:

Hello Liu,

>>>> I wanted to put this whole thing on the list first, before I start splitting it
>> up.
>>>>
>>>> For starters, I think I can send these separately:
>>>
>>> Before discussing how to split, a bigger question is that is it fine to
>>> support both i.MX8qxp DC and i.MX95 DC in the same imx8_dc_drm
>> module?
>>> Separate modules look more reasonable to me, considering the fact that
>>> there are quite a lot difference between the two DCs.
>>
>> (maybe I do not quite understand your suggestion with "separate module",
>> I assume this means entirely duplicate driver, is that correct? I
>> operate with that assumption in the text below.)
> 
> I'd expect separate modules: the existing imx8_dc_drm(which can be
> modprobe'd) and something like imx95_dc_drm.  I wouldn't call them
> *entirely* duplicated drivers since I mentioned common part of the DCs
> could be wrapped as helpers in an additional module(something like
> imx_dc_drm_common).

How would this look if everything is built into the kernel ?

>> This series indicates that the functional units in the DC are basically
>> identical, with the majority of changes being register base addresses of
>> the whole DC and an odd bit or register offset here and there. Most of
>> the code can be reused, as can be seen in the first half of the series.
> 
> The major differences between the i.MX95 and i.MX8qxp DCs are
> different components in Display Engines(especially the additional
> Domain Blend Unit in i.MX95 DC)

This seems to be one component in the whole pipeline, with links going 
into it. Those links are already in place. Maybe I am not seeing the 
specialty of this particular DB component ?

> plus i.MX8qxp DC's capability
> to connect with the prefetch engines(DPRC & PRG).

Isn't the prefetch engine only a bit of register configuration, that can 
be abstracted out ?

> Both would
> have significant impact on how we implement the drivers.  We'll
> certainly end up having different implementations for callbacks to
> enable/disable CRTCs or update/disable planes.

It doesn't seem they have to be entirely different so far, do they ?

> The sort of minor difference is in Pixel Engine(including Blit Engine)
> where FethUnit types and numbers are different plus different numbers
> of Scaler Engine.  I'd expect logics to allocate FetchUnits for planes can be
> implemented in the imx_dc_drm_common module

This part is fine, but ultimately, it would have to be possible to build 
both the MX8Q and MX95 drivers into the kernel too. And then there would 
have to be some logic to deal with that, likely based on driver data, as 
it is done here.

>> The addition of iMX95 into the iMX8QXP DC also does not seem to be
>> making the driver in any way more complicated.
> 
> Disagree. The addition would introduce quite a few i.MX95 or i.MX8qxp
> DC specific code branches due to the differences mentioned above.

This does not need to be the case, see the first half of this series ?

> I'd say i.MX95 DC support could be in drivers/gpu/drm/imx/dc, but it
> needs to be in a separate module like again imx95_dc_drm.
> 
> This makes feel that the debate here becomes kind of similar to what
> we did for single mxsfb module vs  mxsfb + imx_lcdif separate modules...

The mxsfb (the old iMX23 LCDIF) and lcdifv3 (the new iMX8MP/iMXRT LCDIF) 
are entirely different hardware IPs, the former is from SigmaTel , the 
later is from somewhere else, right ?

>> What would be the benefit of having duplicate driver for IP that is
>> basically identical, for i.MX95 ?
> 
> Cleaner driver implementation and easier to maintain.  I don’t want
> to test both i.MX95 and i.MX8qxp platforms when only either
> i.MX95 DC specific or i.MX8qxp DC specific code is changed.
> 
> But again, they won't be entirely duplicated drivers.  Common
> part could be shared between the drivers with software techniques,
> like the imx_dc_drm_common module mentioned above.
Please have a look at the first part of this patchset, there do not seem 
to be that many new or complex branches.

