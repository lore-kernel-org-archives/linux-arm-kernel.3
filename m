Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB1BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bwZX8NaNeCjNz5xtFo8tTrg/X/6uhvhX7RQ2Ckv/pw=; b=zLVeI+blx32UujbGc4LkjMIQcb
	IjulVSYPYaLHmveV+Iek5KODRA6KVZ14SBXTk4iRgDrHuN5mwZV1ZOJXU40/scdMby8Nuf+E5QenZ
	zgVWa5HI6e9mM2F7taM25R1AXBVN+tTkaqG2fbCfGn4ixUxveOj8w3xLosngIjCkdAPSSeYfH/2RT
	+SqRLh2DxE3VpTY81/mvjYjaSXEW3WX2N8lhYmtof81V1v7diaPDcmvGdlPLMTyrbO6dlzin3cZ1c
	pdnyZf7DmuKPSak8aBUtm7EIFNl7SgDbjrhrwPO5e3DCQumITph6qmvXjzj6+Jbqk8d5AdnxtHNxi
	wqSJ6Pfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDd8j-0000000FKd4-2R3y;
	Tue, 28 Oct 2025 06:25:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDd8i-0000000FKch-0RUV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Oct 2025 06:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/bwZX8NaNeCjNz5xtFo8tTrg/X/6uhvhX7RQ2Ckv/pw=; b=ThYk1SdlSwM9d3SOrAx1dx2AkX
	dKOx8QObyTRtTewPaDW08N6QG2VfJYjStlfUz4K4b/hn2EGQgCrTEYvFodBrxKombPVLgPEVMBBI9
	wZw1fkLn2sZD9c8Yl4O2Oj1Rg/KFhfhXCNNcvYvSiX2qEVpRIakPIyldA0FvFHCiVoZdBTF+Y86EE
	X7HdSwuBV4Ln9ot54Hu0v4hAPQVTv+Gj0S3soqsd67M4zkcpub+11lM3vDy+7t/5LJWNv4BL+4o5d
	qs5u335mf1JMa7Kq0nZX1b/7GDsqej0Bk1yLeQtI3C6rZdfJ0wver/sj9QdjUZl2VqTb7xMtp0HaE
	XaLe5ihQ==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcGr-00000003jLr-2sy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 05:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/bwZX8NaNeCjNz5xtFo8tTrg/X/6uhvhX7RQ2Ckv/pw=; b=DzpX4aL2ITM/2aTmP4HaOK3Skk
	wTcJ89CRbii5D/gvPXFoKNH5Ab8K7X8773FNTdXsHUY7Drthck2gkZIFWLJO9pNh+z0wZJZqm4Cuh
	E3iUhLZiFJQ8xQysNymfEPT96bzPdRhOU0dd3Nuut8Z459Zz0xLn+OQID2z0MtFXFJflKKQXRt3UT
	M1WxICLWC3tkgyuohcLxdPpSzwLOChJ0inZiXFu1isLMkEWE/D3kN31ytbxWXMiRnMC+RVBwm3s/f
	Etbagn0/Unb064upBEmBd5HffwW3zmgeZnkLKunyWs6NiF8JmF1UY1Qv+9tB2yobUfGrHssH9SlwT
	1avj86Ew==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46904 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vDd7h-00000009FJT-023f;
	Tue, 28 Oct 2025 07:23:59 +0100
Message-ID: <658fa62e-cc80-436a-9812-c67b0dc8de03@norik.com>
Date: Tue, 28 Oct 2025 07:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag
 overlay
To: Frank Li <Frank.li@nxp.com>, Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>
 <aPuO+FCeeIFv3bQm@alb3rt0-ThinkPad-P15-Gen-1>
 <aPuvYwwG5N84MwGA@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <aPuvYwwG5N84MwGA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_052926_064531_C11C0320 
X-CRM114-Status: GOOD (  14.51  )
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

Hi both,

On 24. 10. 25 18:54, Frank Li wrote:
> On Fri, Oct 24, 2025 at 04:36:40PM +0200, Alberto Merciai wrote:
>> On Fri, Oct 24, 2025 at 09:30:31AM -0400, Frank Li wrote:
>>> On Tue, Oct 07, 2025 at 10:40:27AM +0200, Primoz Fiser wrote:
>>>> Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
>>>>
>>>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>>>> ---
>>>>  arch/arm64/boot/dts/freescale/Makefile        |  2 ++
>>>>  .../freescale/imx93-phyboard-nash-jtag.dtso   | 26 +++++++++++++++++++
>>>>  2 files changed, 28 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>>>> index 525ef180481d..c72a6fdc5412 100644
>>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>>> @@ -356,10 +356,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>>>>
>>>> +imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>>>>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
>>>>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>>>>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>>>>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>>>> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
>>>> new file mode 100644
>>>> index 000000000000..4744eabf95f3
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
>>>> @@ -0,0 +1,26 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
>>>> + * Author: Primoz Fiser <primoz.fiser@norik.com>
>>>> + */
>>>> +
>>>> +#include "imx93-pinfunc.h"
>>>> +
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +
>>>> +&gpio2 {
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&pinctrl_jtag>;
>>>> +};
>>>
>>> Use gpio to set pinctrl to no-gpio mode is strange. I am not sure if there
>>> are better method, but at need comments here to show why have to do that.
>>>
>>
>> In old imx6 platform we use pinctrl_hog for that purpose, is not?
> 
> It'd better than gpio, but I am not sure if pinctrl_hog still be supported
> because I have not seen it for the long time.
> 

I am OK with both suggestions:

1) adding an explanation comment
2) Using pinctrl_hog method

Personally however, I would prefer method 1) since it would be better in
this case because base customer dts can already contain default
pinctrl_hog which would be overwritten by this overlay.

Not that common, but can still happen.

What do you suggest for v2?

BR,
Primoz

> Frank
>>
>>> Frank
>>>> +
>>>> +&iomuxc {
>>>> +	pinctrl_jtag: jtaggrp {
>>>> +		fsl,pins = <
>>>> +			MX93_PAD_GPIO_IO24__JTAG_MUX_TDO	0x31e
>>>> +			MX93_PAD_GPIO_IO25__JTAG_MUX_TCK	0x31e
>>>> +			MX93_PAD_GPIO_IO26__JTAG_MUX_TDI	0x31e
>>>> +			MX93_PAD_GPIO_IO27__JTAG_MUX_TMS	0x31e
>>>> +		>;
>>>> +	};
>>>> +};
>>>> --
>>>> 2.34.1
>>>>
>>>

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


