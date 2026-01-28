Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCAFD3569C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jIrqsj2Nh3iGNSUyq5PuPCyhX+QW/RhBsq96O3pBXM=; b=KluJQVMzq8LvtJ5lcJ6k1i6w9e
	IpILbbFKNDKYcLuznx/uKFBB7NMglIzYisSbgnQGE0TZNbfbZllvcy8gYIbDxYw2gdkiscuI6dkKD
	kDStduU9w669zUBGVNtM21SM16a6ItGvWf7HHEOIL75YqA7DYVrtr2O98/CWi+5t1A03yqcqADV+t
	v2Dvrx3eOG69SJvpMV2YBxkm/ZyYBOt2bDZy/QYEoOJkI57Ubq4DldlDYa29t80Q0sfX7QamSd7L+
	UVVTbzNkn22gWR5c2BO3ONEh0JGXRAGNEKut5B9T6jd5AXYn5qiaUqi30AQvQ71fvx9XLchCHBUvf
	ZAtARybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2b0-0000000FoiI-1k8y;
	Wed, 28 Jan 2026 10:16:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2ay-0000000Fohy-1OP4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C5E341A64;
	Wed, 28 Jan 2026 10:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DABC4CEF1;
	Wed, 28 Jan 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769595379;
	bh=az6OHhEqj0x3WtC1hkJi6Kf+VtZtDMKobZlfHmsgHCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h34Pw9BZjRy5q8tBWVy6+B/ir10apTllfPOwNUHNjklV8dM9TY8JZ0W7C6KH5DfNc
	 qHY89XZdazvpUAtyuT+TWgcCJdSYU/aTsSW+8/SQCHSxjp78T6jXcSYFz6tksEoV1Q
	 ZaZ0xE5K4pDVxBhdjUqUxEyVgTXRzYYpNV4kppUtBzCl5XDgXh4S68ZCuGH0HXrM+f
	 44+ni7K2n1kUdkVixIcbS/3mPv6sC+BTmS2c8lpxg2wxl9G8J2GNgoAxg/SPToupzq
	 gSzHudx2gEBdQb08NlNtjEQD5xBJ1dBO+ljKju12sdFj6H7WnrtnI+TQ4ZHOatpTsg
	 17QwHCDXk+EeA==
Message-ID: <37133829-da88-4ea6-a58e-fcb4cc7f7c12@kernel.org>
Date: Wed, 28 Jan 2026 11:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK
 board support
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>,
 "matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>,
 "y.moog@phytec.de" <y.moog@phytec.de>,
 "josua@solid-run.com" <josua@solid-run.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 "primoz.fiser@norik.com" <primoz.fiser@norik.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-3-sherry.sun@nxp.com>
 <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
 <VI0PR04MB12114EDD17C2F37A3AE7D61089293A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <VI0PR04MB12114EDD17C2F37A3AE7D61089293A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_021620_433443_D1946859 
X-CRM114-Status: GOOD (  13.40  )
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

On 26/01/2026 03:52, Sherry Sun wrote:
>> Subject: Re: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless
>> EVK board support
>>
>> On Fri, Jan 23, 2026 at 10:44:48AM +0800, Sherry Sun wrote:
>>> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
>>> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the
>>> i.MX93 Wireless SiP basically reuse the i.MX93 11x11 EVK board, with
>>> some minor functional and pin connection differences.
>>>
>>> Here are the detailed differences between i.MX93 Wireless EVK and
>>> i.MX93
>>> 11x11 EVK board.
>>>
>>> Function differences:
>>> Function	i.MX93W EVK			i.MX93 EVK
>>> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
>>> MQS		N				Y
>>> PDM MIC		N				Y
>>> M.2		N				Y
>>> RPi 40-pin HDR	Limited support(pin conflict) 	Y
>>>
>>> Pin connection differences:
>>> Function  Signal name	i.MX93W EVK		i.MX93 EVK
>>> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08
>> (spi3.PCS0)
>>> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
>>> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
>>> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
>>> 	  SPI_INT	CCM_CLKO1		on-board IO expander
>>> 	  NB_WAKE_IN	PDM_CLK			on-module IO
>> expander
>>> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO
>> expander
>>> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO
>> expander
>>> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
>>> 	  PDn		GPIO_IO29		on-module IO expander
>>> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO
>> expander
>>> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
>>> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
>>> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
>>>
>>> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
>>> ---
>>>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>>>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73
>>> ++++++++++++++++++++
>>>  2 files changed, 74 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile
>>> b/arch/arm64/boot/dts/freescale/Makefile
>>> index 700bab4d3e60..d0ea746c59b8 100644
>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>> @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-
>> i3c.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>>> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb diff --git
>>> a/arch/arm64/boot/dts/freescale/imx93w-evk.dts
>>> b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
>>> new file mode 100644
>>> index 000000000000..f09587dc74f6
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
>>> @@ -0,0 +1,73 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright 2026 NXP
>>> + */
>>> +
>>> +#include "imx93-11x11-evk.dts"
>>> +
>>> +/ {
>>> +	model = "NXP i.MX93W EVK board";
>>> +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
>>> +
>>> +	/delete-node/ regulator-m2-pwr;
>>
>> If you remove nodes then clearly you do not share a common design, thus
>> you should not include other DTSI... and definitely even more confusing to
>> include other DTS.
> 
> Hi Krzysztof,
> Ok, it seems I should mark these nodes as disabled instead of delete them, will fix, thanks!

Still wrong. How component present in the board can be missing in the
same time? You included other DTS for a reason which means this board
grows on the previous design.

Best regards,
Krzysztof

