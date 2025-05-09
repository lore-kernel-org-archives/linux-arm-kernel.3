Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WG9PhoIBse+C4R6TgJ31lTJPeMdXVWIpUZTESVTwYc=; b=t6FT7Rk8o85/aQiyouYMsbHhiO
	ZErhnILKuIgtsGCYkJYGg+DdTU3pJb/HVtg0PxY1J3fj5k8O2cOenbQqw83W6A5PhmMmAjClKQ13A
	ah/mvzDTu2goUqLZUw2pQNwYnfK0BkBjClats2n0ynYZMDhhUNoV5ZfabTFWBEBcLnyYJVZqCs1gT
	XkFSSlzyPfbsaToFtgvIaISJcPlRZEpMzq9G0ODu7hrmqs7UQSpk2ncrw5IgfhcRB1uV2r5osVHDB
	3xpwzjkceS/i4clxGd56d2ufyiMbsY4RRi7x7aeeJHqDqjbcGg67j0z4wDh/z4H4D9SPTZCcRjujs
	4ZMPEydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL80-00000003JEp-3rGk;
	Fri, 09 May 2025 10:38:52 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKMM-00000003AJE-0UH8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9WG9PhoIBse+C4R6TgJ31lTJPeMdXVWIpUZTESVTwYc=;
	b=R3a0EcBICoJz7JwYY40n8jx1Hv09FBvgjRBY8moTBqb4YwKdcvS3NKN1SVlP6t
	y7e9jrrYMldkI3gc37tkdFHe4bngCerbeMyEo9TrbtErwHAREK1PlmoZagMSNosl
	/Ajr5WgilgophkCMwlpU+Ns5GPO2dR3ZLPahJz5WebEpI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3tweWzx1ornmlAA--.36186S3;
	Fri, 09 May 2025 17:49:12 +0800 (CST)
Date: Fri, 9 May 2025 17:49:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	linus.walleij@linaro.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH v6 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <aB3Pll3A/0XGCLlQ@dragon>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
 <20250421065139.3073232-3-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421065139.3073232-3-ping.bai@nxp.com>
X-CM-TRANSID: M88vCgD3tweWzx1ornmlAA--.36186S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Zry3Aw1UWr13GFyDGrWDXFb_yoWDAw48pr
	13AFy8Kr1qkan3Ww1vq3Wayr1xXw1UArWUWF15Xr47Ca93Ja4I9w4agr43JF9Yqrn5u3yU
	Jr1ku3W5XF9rW3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkOz3UUUUU=
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBh74Ggdz5gXawAA3p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024938_584781_01B86E55 
X-CRM114-Status: GOOD (  23.77  )
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

On Mon, Apr 21, 2025 at 02:51:38PM +0800, Jacky Bai wrote:
> Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> i.MX94 Family, create a common dtsi for the whole i.MX94 family, and the
> specific dtsi part for i.MX943.
> 
> The clock, power domain and perf index need to be used by the device nodes
> for resource reference, add them along with the dtsi support.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v6 changes:
>   - refine the indentation of edma irq property.
> 
>  - v5 changes:
>   - remove the err irq of edma node as the err irq support in driver is not
>     ready. We can add it back when the driver is ready. No impact for current
>     edma support.
> 
>  - v4 changes:
>   - reorder the cpu node compatible string property as suggested by Frank
> 
>  - v3 changes:
>   - remove the blank line
>   - add PAD config macro define as suggested by Frank Li
>   - update the device nodes compatible strings for imx94 as suggested by Krzysztof
> 
>  - v2 changes:
>   - remove the unnecessary macro define in clock header as suggested by Krzysztof
>   - split the dtsi into imx94.dtsi and imx943.dtsi
>   - use low case in the pinfunc header as Frank suggested
>   - reorder the device nodes and properties
> ---
>  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++

I forgot to ask when imx95-clock.h was first introduced.  But how will
clk drivers use these clock IDs, or will clk drivers have their own copy
of definitions?

>  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +

Same question on the power IDs.

>  arch/arm64/boot/dts/freescale/imx94.dtsi      | 1148 ++++++++++++
>  arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
>  5 files changed, 3102 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx94-clock.h b/arch/arm64/boot/dts/freescale/imx94-clock.h
> new file mode 100644
> index 000000000000..84ad3d53c29b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx94-clock.h
> @@ -0,0 +1,195 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2024-2025 NXP
> + */
> +
> +#ifndef __CLOCK_IMX94_H
> +#define __CLOCK_IMX94_H

Can we name it __IMX94_CLOCK_H to match the file name?

> +
> +#define IMX94_CLK_EXT				0
> +#define IMX94_CLK_32K				1
> +#define IMX94_CLK_24M				2
> +#define IMX94_CLK_FRO				3
> +#define IMX94_CLK_SYSPLL1_VCO			4
> +#define IMX94_CLK_SYSPLL1_PFD0_UNGATED		5
> +#define IMX94_CLK_SYSPLL1_PFD0			6
> +#define IMX94_CLK_SYSPLL1_PFD0_DIV2		7
> +#define IMX94_CLK_SYSPLL1_PFD1_UNGATED		8
> +#define IMX94_CLK_SYSPLL1_PFD1			9
> +#define IMX94_CLK_SYSPLL1_PFD1_DIV2		10
> +#define IMX94_CLK_SYSPLL1_PFD2_UNGATED		11
> +#define IMX94_CLK_SYSPLL1_PFD2			12
> +#define IMX94_CLK_SYSPLL1_PFD2_DIV2		13
> +#define IMX94_CLK_AUDIOPLL1_VCO			14
> +#define IMX94_CLK_AUDIOPLL1			15
> +#define IMX94_CLK_AUDIOPLL2_VCO			16
> +#define IMX94_CLK_AUDIOPLL2			17
> +#define IMX94_CLK_RESERVED18			18
> +#define IMX94_CLK_RESERVED19			19
> +#define IMX94_CLK_RESERVED20			20
> +#define IMX94_CLK_RESERVED21			21
> +#define IMX94_CLK_RESERVED22			22
> +#define IMX94_CLK_RESERVED23			23
> +#define IMX94_CLK_ENCPLL_VCO			24
> +#define IMX94_CLK_ENCPLL_PFD0_UNGATED		25
> +#define IMX94_CLK_ENCPLL_PFD0			26
> +#define IMX94_CLK_ENCPLL_PFD1_UNGATED		27
> +#define IMX94_CLK_ENCPLL_PFD1			28
> +#define IMX94_CLK_ARMPLL_VCO			29
> +#define IMX94_CLK_ARMPLL_PFD0_UNGATED		30
> +#define IMX94_CLK_ARMPLL_PFD0			31
> +#define IMX94_CLK_ARMPLL_PFD1_UNGATED		32
> +#define IMX94_CLK_ARMPLL_PFD1			33
> +#define IMX94_CLK_ARMPLL_PFD2_UNGATED		34
> +#define IMX94_CLK_ARMPLL_PFD2			35
> +#define IMX94_CLK_ARMPLL_PFD3_UNGATED		36
> +#define IMX94_CLK_ARMPLL_PFD3			37
> +#define IMX94_CLK_DRAMPLL_VCO			38
> +#define IMX94_CLK_DRAMPLL			39
> +#define IMX94_CLK_HSIOPLL_VCO			40
> +#define IMX94_CLK_HSIOPLL			41
> +#define IMX94_CLK_LDBPLL_VCO			42
> +#define IMX94_CLK_LDBPLL			43
> +#define IMX94_CLK_EXT1				44
> +#define IMX94_CLK_EXT2				45
> +

Why this newline?

> +#define IMX94_CLK_ADC				46
> +#define IMX94_CLK_BUSAON			47
> +#define IMX94_CLK_CAN1				48
> +#define IMX94_CLK_GLITCHFILTER			49
> +#define IMX94_CLK_GPT1				50
> +#define IMX94_CLK_I3C1SLOW			51
> +#define IMX94_CLK_LPI2C1			52
> +#define IMX94_CLK_LPI2C2			53
> +#define IMX94_CLK_LPSPI1			54
> +#define IMX94_CLK_LPSPI2			55
> +#define IMX94_CLK_LPTMR1			56
> +#define IMX94_CLK_LPUART1			57
> +#define IMX94_CLK_LPUART2			58
> +#define IMX94_CLK_M33				59
> +#define IMX94_CLK_M33SYSTICK			60
> +#define IMX94_CLK_PDM				61
> +#define IMX94_CLK_SAI1				62
> +#define IMX94_CLK_TPM2				63
> +#define IMX94_CLK_A55				64
> +#define IMX94_CLK_A55MTRBUS			65
> +#define IMX94_CLK_A55PERIPH			66
> +#define IMX94_CLK_DRAMALT			67
> +#define IMX94_CLK_DRAMAPB			68
> +#define IMX94_CLK_DISPAPB			69
> +#define IMX94_CLK_DISPAXI			70
> +#define IMX94_CLK_DISPPIX			71
> +#define IMX94_CLK_HSIOACSCAN480M		72
> +#define IMX94_CLK_HSIOACSCAN80M			73
> +#define IMX94_CLK_HSIO				74
> +#define IMX94_CLK_HSIOPCIEAUX			75
> +#define IMX94_CLK_HSIOPCIETEST160M		76
> +#define IMX94_CLK_HSIOPCIETEST400M		77
> +#define IMX94_CLK_HSIOPCIETEST500M		78
> +#define IMX94_CLK_HSIOPCIETEST50M		79
> +#define IMX94_CLK_HSIOUSBTEST60M		80
> +#define IMX94_CLK_BUSM70			81
> +#define IMX94_CLK_M70				82
> +#define IMX94_CLK_M70SYSTICK			83
> +#define IMX94_CLK_BUSM71			84
> +#define IMX94_CLK_M71				85
> +#define IMX94_CLK_M71SYSTICK			86
> +#define IMX94_CLK_BUSNETCMIX			87
> +#define IMX94_CLK_ECAT				88
> +#define IMX94_CLK_ENET				89
> +#define IMX94_CLK_ENETPHYTEST200M		90
> +#define IMX94_CLK_ENETPHYTEST500M		91
> +#define IMX94_CLK_ENETPHYTEST667M		92
> +#define IMX94_CLK_ENETREF			93
> +#define IMX94_CLK_ENETTIMER1			94
> +#define IMX94_CLK_ENETTIMER2			95
> +#define IMX94_CLK_ENETTIMER3			96
> +#define IMX94_CLK_FLEXIO3			97
> +#define IMX94_CLK_FLEXIO4			98
> +#define IMX94_CLK_M33SYNC			99
> +#define IMX94_CLK_M33SYNCSYSTICK		100
> +#define IMX94_CLK_MAC0				101
> +#define IMX94_CLK_MAC1				102
> +#define IMX94_CLK_MAC2				103
> +#define IMX94_CLK_MAC3				104
> +#define IMX94_CLK_MAC4				105
> +#define IMX94_CLK_MAC5				106
> +#define IMX94_CLK_NOCAPB			107
> +#define IMX94_CLK_NOC				108
> +#define IMX94_CLK_NPUAPB			109
> +#define IMX94_CLK_NPU				110
> +#define IMX94_CLK_CCMCKO1			111
> +#define IMX94_CLK_CCMCKO2			112
> +#define IMX94_CLK_CCMCKO3			113
> +#define IMX94_CLK_CCMCKO4			114
> +#define IMX94_CLK_BISS				115
> +#define IMX94_CLK_BUSWAKEUP			116
> +#define IMX94_CLK_CAN2				117
> +#define IMX94_CLK_CAN3				118
> +#define IMX94_CLK_CAN4				119
> +#define IMX94_CLK_CAN5				120
> +#define IMX94_CLK_ENDAT21			121
> +#define IMX94_CLK_ENDAT22			122
> +#define IMX94_CLK_ENDAT31FAST			123
> +#define IMX94_CLK_ENDAT31SLOW			124
> +#define IMX94_CLK_FLEXIO1			125
> +#define IMX94_CLK_FLEXIO2			126
> +#define IMX94_CLK_GPT2				127
> +#define IMX94_CLK_GPT3				128
> +#define IMX94_CLK_GPT4				129
> +#define IMX94_CLK_HIPERFACE1			130
> +#define IMX94_CLK_HIPERFACE1SYNC		131
> +#define IMX94_CLK_HIPERFACE2			132
> +#define IMX94_CLK_HIPERFACE2SYNC		133
> +#define IMX94_CLK_I3C2SLOW			134
> +#define IMX94_CLK_LPI2C3			135
> +#define IMX94_CLK_LPI2C4			136
> +#define IMX94_CLK_LPI2C5			137
> +#define IMX94_CLK_LPI2C6			138
> +#define IMX94_CLK_LPI2C7			139
> +#define IMX94_CLK_LPI2C8			140
> +#define IMX94_CLK_LPSPI3			141
> +#define IMX94_CLK_LPSPI4			142
> +#define IMX94_CLK_LPSPI5			143
> +#define IMX94_CLK_LPSPI6			144
> +#define IMX94_CLK_LPSPI7			145
> +#define IMX94_CLK_LPSPI8			146
> +#define IMX94_CLK_LPTMR2			147
> +#define IMX94_CLK_LPUART10			148
> +#define IMX94_CLK_LPUART11			149
> +#define IMX94_CLK_LPUART12			150
> +#define IMX94_CLK_LPUART3			151
> +#define IMX94_CLK_LPUART4			152
> +#define IMX94_CLK_LPUART5			153
> +#define IMX94_CLK_LPUART6			154
> +#define IMX94_CLK_LPUART7			155
> +#define IMX94_CLK_LPUART8			156
> +#define IMX94_CLK_LPUART9			157
> +#define IMX94_CLK_SAI2				158
> +#define IMX94_CLK_SAI3				159
> +#define IMX94_CLK_SAI4				160
> +#define IMX94_CLK_SWOTRACE			161
> +#define IMX94_CLK_TPM4				162
> +#define IMX94_CLK_TPM5				163
> +#define IMX94_CLK_TPM6				164
> +#define IMX94_CLK_USBPHYBURUNIN			165
> +#define IMX94_CLK_USDHC1			166
> +#define IMX94_CLK_USDHC2			167
> +#define IMX94_CLK_USDHC3			168
> +#define IMX94_CLK_V2XPK				169
> +#define IMX94_CLK_WAKEUPAXI			170
> +#define IMX94_CLK_XSPISLVROOT			171
> +#define IMX94_CLK_XSPI1				172
> +#define IMX94_CLK_XSPI2				173
> +

And this?

> +#define IMX94_CLK_SEL_EXT			174
> +#define IMX94_CLK_SEL_A55C0			175
> +#define IMX94_CLK_SEL_A55C1			176
> +#define IMX94_CLK_SEL_A55C2			177
> +#define IMX94_CLK_SEL_A55C3			178
> +#define IMX94_CLK_SEL_A55P			179
> +#define IMX94_CLK_SEL_DRAM			180
> +#define IMX94_CLK_SEL_TEMPSENSE			181
> +#define IMX94_CLK_NPU_CGC			182
> +
> +#endif /* __CLOCK_IMX94_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx94-pinfunc.h b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
> new file mode 100644
> index 000000000000..00255db89185
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
> @@ -0,0 +1,1570 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright 2024-2025 NXP
> + */
> +
> +#ifndef __DTS_IMX94_PINFUNC_H
> +#define __DTS_IMX94_PINFUNC_H

<snip>

> +#endif /* __DTS_IMX94_PINFUNC_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx94-power.h b/arch/arm64/boot/dts/freescale/imx94-power.h
> new file mode 100644
> index 000000000000..282167494a1d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx94-power.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + *  Copyright 2024-2025 NXP
> + */
> +
> +#ifndef __IMX94_POWER_H__
> +#define __IMX94_POWER_H__

Other headers in this patch use pattern of __XXX_YYY_H.  Can we get them
all aligned?

Shawn


