Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8ADC021A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWVlua/ySHVMeIr/pzJ7+6ofC41BpQURgsGblrbr2lM=; b=SW6pqHh5FYjbXmDkkchZ319wOY
	8SvcCJ4pH24l57IbSdFyizQstnfC8EnclxIoV/yzHXeInqnVuntSmzM+w9w+tME5ohyvYNlis+d80
	QrqwUOG3i98EvzWJR0x+8wO0WTjRM8nPS8amd1WSl1xMdUTM1WT6yYwgad9Ou7oX58Ecf7LRZsInJ
	NjOMFVrGQPZ0k7WzvxGIQ9sWBicMrk9YN4QSDn+C2w/hZaJnnfmiBIMQ/fu/0uGyJgAnfjeXIPbhd
	VtIxIJVV/0DzEEGOnuzPMFAGgWIKHYuMsJagUN46tvl144Ixfg+27YfcgKf/eZG0rQVvBqAIYil+x
	qeoNr+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAFF-000000072AU-0iC1;
	Wed, 12 Feb 2025 10:45:29 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9pP-00000006xSr-1ZVu;
	Wed, 12 Feb 2025 10:18:48 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab771575040so129834666b.1;
        Wed, 12 Feb 2025 02:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739355525; x=1739960325; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWVlua/ySHVMeIr/pzJ7+6ofC41BpQURgsGblrbr2lM=;
        b=mpFjEca4FP/tgzJTpkMiVCzbsSvS1kT1YVyPJ/aIPuQdSIgNOox2lZo4dwb3J/b0Il
         05zF9bNM7ig1uvTK/RQAUuVhduZM5okgvHUKIuI9AhUyBG2/eN+SGjPIQXIRozfCQ0Hc
         pwznfcY9+IXGVj/+l+v9I7BJjGTI5meoCUr5yzZE8Phnirwth6MZL1k0skuxxGnJnwjx
         KBEVBmwLpFOzRwPIfO9foysR/qO4eDXSk1M9Lzz1U5dZzYzB4B0pBYWQmNxz1ANfieIC
         B06TH1GKhPHcz/EiHiTqzAxUHo7cxNwblO3QyfhZ6hBnbmzIAdkFwFhXhNWcrWBy67eM
         cDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739355525; x=1739960325;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWVlua/ySHVMeIr/pzJ7+6ofC41BpQURgsGblrbr2lM=;
        b=dDhjmUyNNPvfEZz/zuwDtc4ezugEMzwXrA1xhgMlRcoabQQyqo3yZqJjcQYA5smrN6
         oeNGqoAq3458i/Vah4sfElA7L23y1hvOteYsPYHbKp7TvfcRjCIMOnbJGeQCOP9ehZII
         8z7LLHhgNPqyc7aoFEJctyoGHvHe38/jblvmcG3S2F9VfWI5T4koYO7JZigfON6pzSoZ
         GWZN9iqGzLuCOy86gXdLEcrs4a9wrRtJtO9pxzKMOlGWzXZLgJMycGq7TU6DpDcKXlPD
         a0GVFuq+2mwdtnyEBrgMOrVdPOqBoiTlxA71+uEzxPYuckkdqE5uwyBU5a/VvDLCPORx
         nhIA==
X-Forwarded-Encrypted: i=1; AJvYcCU231MAYOjlus8gl2vJyStB26Sra2hGRvF/wuH2K+EF7ZL6GHNZReZfs95SLzVUy0/H3+zKRaisGlXr@lists.infradead.org, AJvYcCUD9sTMF486UV0LvIpDCVOvAidtz/Q5IRJpm/TczYEKDr2KT/SfmfkpN2ZGHUbTTl4viQIb9EcUMl6/7rkRRDgo@lists.infradead.org, AJvYcCVhZFEoI6m44+ePcCzVAmqXrAHWV5PBTb/Y9H3apMmi3vpb/q4OpOhta8Gr4Ot2lm3CL+GlvQiVAfA0fwA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKvwIxvLoIRc3ZU8mLusgMgWIeEolUkYyn+fLvwJItp7YdPgaz
	g1opgOtktyxpFJNYa/7ixl+wjepmb6WX7I+b+If9yarS1fzi2kwv
X-Gm-Gg: ASbGncvGjKsiXskq5EVExE7ACCxuLbPSNC3dsoTG4mkGSw9pK7GGTgVv1bHngtDQGNO
	Dp0A6WW/CTIV4T0CjUc0qC+Acjj9Pj/B1YCl/JElhC5zonCnGTNUouEHWwkM+1ZEtgJU4dWBw7O
	ysOVJgemmaGH3g6iRNBKKGA57Pygii5P/YgNXQ6cW701Y3IUH77LuKlpgcA+0Kj1ClPNc7e9IsP
	3FEi4EthF5vvk+gKlSi4Z/Ne7xacQj+nKGKEiZMn42zrYfOGGVC2NoDbclIj7z9Xer+HAfxERw+
	DLkQbC0c9l8C9G4C51nOHOFvmUNdcQXbLC7D4sJtephVy58o11LVwA==
X-Google-Smtp-Source: AGHT+IHXhHYBhp/jwxugJOxSy8fbHAg4RaSJF+XHK6rh7pamhtjknOPXD7Wlf+ulQuEN06XXx7/uPg==
X-Received: by 2002:a17:907:2cc5:b0:ab7:d1d0:1a84 with SMTP id a640c23a62f3a-ab7f2e8a301mr221194166b.4.1739355525335;
        Wed, 12 Feb 2025 02:18:45 -0800 (PST)
Received: from smtpclient.apple (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d6acd8f1sm381126966b.50.2025.02.12.02.18.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2025 02:18:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: sunxi-ng: add compatibles
 for V853
From: =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
In-Reply-To: <20250211210215.GA1160917-robh@kernel.org>
Date: Wed, 12 Feb 2025 11:18:32 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B18CA59-65CE-4C7A-A9A6-769157BB73A9@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-4-szemzo.andras@gmail.com>
 <20250211210215.GA1160917-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_021847_460353_83B41F2F 
X-CRM114-Status: GOOD (  16.40  )
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

Thanks for your review, I=E2=80=99ll change and explain it better.

> On 11 Feb 2025, at 22:02, Rob Herring <robh@kernel.org> wrote:
>=20
> On Wed, Feb 05, 2025 at 01:52:18PM +0100, Andras Szemzo wrote:
>> V853 has 2 CCUs, add compatible strings for it.
>>=20
>> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
>> ---
>> .../clock/allwinner,sun4i-a10-ccu.yaml        |   3 +
>> .../clock/allwinner,sun8i-v853-ccu.h          | 132 =
++++++++++++++++++
>> .../clock/allwinner,sun8i-v853-r-ccu.h        |  16 +++
>> .../reset/allwinner,sun8i-v853-ccu.h          |  60 ++++++++
>> .../reset/allwinner,sun8i-v853-r-ccu.h        |  14 ++
>> 5 files changed, 225 insertions(+)
>> create mode 100644 =
include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>> create mode 100644 =
include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>> create mode 100644 =
include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>> create mode 100644 =
include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml =
b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
>> index 1690b9d99c3d..9369d62284ed 100644
>> --- =
a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
>> +++ =
b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
>> @@ -33,6 +33,8 @@ properties:
>>       - allwinner,sun8i-r40-ccu
>>       - allwinner,sun8i-v3-ccu
>>       - allwinner,sun8i-v3s-ccu
>> +      - allwinner,sun8i-v853-ccu
>> +      - allwinner,sun8i-v853-r-ccu
>=20
> Please explain the difference between these in the commit message.
>=20
>>       - allwinner,sun9i-a80-ccu
>>       - allwinner,sun20i-d1-ccu
>>       - allwinner,sun20i-d1-r-ccu
>> @@ -103,6 +105,7 @@ else:
>>       compatible:
>>         enum:
>>           - allwinner,sun20i-d1-ccu
>> +          - allwinner,sun8i-v853-ccu
>>           - allwinner,sun50i-a100-ccu
>>           - allwinner,sun50i-h6-ccu
>>           - allwinner,sun50i-h616-ccu
>> diff --git a/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h =
b/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>> new file mode 100644
>> index 000000000000..cf56c168e1cd
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>> @@ -0,0 +1,132 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> Dual license.
>=20
>> +/*
>> + * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V85X_CCU_H_
>> +#define _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V85X_CCU_H_
>> +
>> +#define CLK_OSC12M		0
>> +#define CLK_PLL_CPU		1
>> +#define CLK_PLL_DDR		2
>> +#define CLK_PLL_PERIPH_4X	3
>> +#define CLK_PLL_PERIPH_2X	4
>> +#define CLK_PLL_PERIPH_800M	5
>> +#define CLK_PLL_PERIPH_480M	6
>> +#define CLK_PLL_PERIPH_600M	7
>> +#define CLK_PLL_PERIPH_400M	8
>> +#define CLK_PLL_PERIPH_300M	9
>> +#define CLK_PLL_PERIPH_200M	10
>> +#define CLK_PLL_PERIPH_160M	11
>> +#define CLK_PLL_PERIPH_150M	12
>> +#define CLK_PLL_VIDEO_4X	13
>> +#define CLK_PLL_VIDEO_2X	14
>> +#define CLK_PLL_VIDEO_1X	15
>> +#define CLK_PLL_CSI_4X		16
>> +#define CLK_PLL_AUDIO_DIV2	17
>> +#define CLK_PLL_AUDIO_DIV5	18
>> +#define CLK_PLL_AUDIO_4X	19
>> +#define CLK_PLL_AUDIO_1X	20
>> +#define CLK_PLL_NPU_4X		21
>> +#define CLK_CPU			22
>> +#define CLK_CPU_AXI		23
>> +#define CLK_CPU_APB		24
>> +#define CLK_AHB			25
>> +#define CLK_APB0		26
>> +#define CLK_APB1		27
>> +#define CLK_MBUS		28
>> +#define CLK_DE			29
>> +#define CLK_BUS_DE		30
>> +#define CLK_G2D			31
>> +#define CLK_BUS_G2D		32
>> +#define CLK_CE			33
>> +#define CLK_BUS_CE		34
>> +#define CLK_VE			35
>> +#define CLK_BUS_VE		36
>> +#define CLK_NPU			37
>> +#define CLK_BUS_NPU		38
>> +#define CLK_BUS_DMA		39
>> +#define CLK_BUS_MSGBOX0		40
>> +#define CLK_BUS_MSGBOX1		41
>> +#define CLK_BUS_SPINLOCK	42
>> +#define CLK_BUS_HSTIMER		43
>> +#define CLK_AVS			44
>> +#define CLK_BUS_DBG		45
>> +#define CLK_BUS_PWM		46
>> +#define CLK_BUS_IOMMU		47
>> +#define CLK_DRAM		48
>> +#define CLK_MBUS_DMA		49
>> +#define CLK_MBUS_VE		50
>> +#define CLK_MBUS_CE		51
>> +#define CLK_MBUS_CSI		52
>> +#define CLK_MBUS_ISP		53
>> +#define CLK_MBUS_G2D		54
>> +#define CLK_BUS_DRAM		55
>> +#define CLK_MMC0		56
>> +#define CLK_MMC1		57
>> +#define CLK_MMC2		58
>> +#define CLK_BUS_MMC0		59
>> +#define CLK_BUS_MMC1		60
>> +#define CLK_BUS_MMC2		61
>> +#define CLK_BUS_UART0		62
>> +#define CLK_BUS_UART1		63
>> +#define CLK_BUS_UART2		64
>> +#define CLK_BUS_UART3		65
>> +#define CLK_BUS_I2C0		66
>> +#define CLK_BUS_I2C1		67
>> +#define CLK_BUS_I2C2		68
>> +#define CLK_BUS_I2C3		69
>> +#define CLK_BUS_I2C4		70
>> +#define CLK_SPI0		71
>> +#define CLK_SPI1		72
>> +#define CLK_SPI2		73
>> +#define CLK_SPI3		74
>> +#define CLK_BUS_SPI0		75
>> +#define CLK_BUS_SPI1		76
>> +#define CLK_BUS_SPI2		77
>> +#define CLK_BUS_SPI3		78
>> +#define CLK_SPIF		79
>> +#define CLK_BUS_SPIF		80
>> +#define CLK_EMAC_25M		81
>> +#define CLK_BUS_EMAC		82
>> +#define CLK_BUS_GPADC		83
>> +#define CLK_BUS_THS		84
>> +#define CLK_I2S0		85
>> +#define CLK_I2S1		86
>> +#define CLK_BUS_I2S0		87
>> +#define CLK_BUS_I2S1		88
>> +#define CLK_DMIC		89
>> +#define CLK_BUS_DMIC		90
>> +#define CLK_AUDIO_CODEC_DAC	91
>> +#define CLK_AUDIO_CODEC_ADC	92
>> +#define CLK_BUS_AUDIO_CODEC	93
>> +#define CLK_USB_OHCI		94
>> +#define CLK_BUS_OHCI		95
>> +#define CLK_BUS_EHCI		96
>> +#define CLK_BUS_OTG		97
>> +#define CLK_BUS_DPSS_TOP	98
>> +#define CLK_MIPI_DSI		99
>> +#define CLK_BUS_MIPI_DSI	100
>> +#define CLK_TCON_LCD		101
>> +#define CLK_BUS_TCON_LCD	102
>> +#define CLK_CSI_TOP		103
>> +#define CLK_CSI_MCLK0		104
>> +#define CLK_CSI_MCLK1		105
>> +#define CLK_CSI_MCLK2		106
>> +#define CLK_BUS_CSI		107
>> +#define CLK_BUS_WIEGAND		108
>> +#define CLK_RISCV		109
>> +#define CLK_RISCV_AXI		110
>> +#define CLK_RISCV_CORE_GATE	111
>> +#define CLK_RISCV_CFG_GATE	112
>> +#define CLK_FANOUT_24M		113
>> +#define CLK_FANOUT_12M		114
>> +#define CLK_FANOUT_16M		115
>> +#define CLK_FANOUT_25M		116
>> +#define CLK_FANOUT_27M		117
>> +#define CLK_FANOUT_PCLK		118
>> +#define CLK_FANOUT0		119
>> +#define CLK_FANOUT1		120
>> +#define CLK_FANOUT2		121
>> +
>> +#endif
>> diff --git a/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h =
b/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>> new file mode 100644
>> index 000000000000..48fe598b7bd8
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2025 Andras Szemzo <szemzo.andras@gmail.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V853_R_CCU_H_
>> +#define _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V853_R_CCU_H_
>> +
>> +#define CLK_R_AHB		0
>> +#define CLK_R_APB0		1
>> +#define CLK_BUS_R_TWD		2
>> +#define CLK_BUS_R_PPU		3
>> +#define CLK_BUS_R_RTC		4
>> +#define CLK_BUS_R_CPUCFG	5
>> +
>> +#endif
>> diff --git a/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h =
b/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>> new file mode 100644
>> index 000000000000..e258117518aa
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>> @@ -0,0 +1,60 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_RST_ALLWINNER_SUN8I_V85X_CCU_H_
>> +#define _DT_BINDINGS_RST_ALLWINNER_SUN8I_V85X_CCU_H_
>> +
>> +#define RST_MBUS		0
>> +#define RST_BUS_DE		1
>> +#define RST_BUS_G2D		2
>> +#define RST_BUS_CE		3
>> +#define RST_BUS_VE		4
>> +#define RST_BUS_NPU		5
>> +#define RST_BUS_DMA		6
>> +#define RST_BUS_MSGBOX0		7
>> +#define RST_BUS_MSGBOX1		8
>> +#define RST_BUS_SPINLOCK	9
>> +#define RST_BUS_HSTIMER		10
>> +#define RST_BUS_DBG		11
>> +#define RST_BUS_PWM		12
>> +#define RST_BUS_DRAM		13
>> +#define RST_BUS_MMC0		14
>> +#define RST_BUS_MMC1		15
>> +#define RST_BUS_MMC2		16
>> +#define RST_BUS_UART0		17
>> +#define RST_BUS_UART1		18
>> +#define RST_BUS_UART2		19
>> +#define RST_BUS_UART3		20
>> +#define RST_BUS_I2C0		21
>> +#define RST_BUS_I2C1		22
>> +#define RST_BUS_I2C2		23
>> +#define RST_BUS_I2C3		24
>> +#define RST_BUS_I2C4		25
>> +#define RST_BUS_SPI0		26
>> +#define RST_BUS_SPI1		27
>> +#define RST_BUS_SPI2		28
>> +#define RST_BUS_SPI3		29
>> +#define RST_BUS_SPIF		30
>> +#define RST_BUS_EMAC		31
>> +#define RST_BUS_GPADC		32
>> +#define RST_BUS_THS		33
>> +#define RST_BUS_I2S0		34
>> +#define RST_BUS_I2S1		35
>> +#define RST_BUS_DMIC		36
>> +#define RST_BUS_AUDIO_CODEC	37
>> +#define RST_USB_PHY		38
>> +#define RST_BUS_OHCI		39
>> +#define RST_BUS_EHCI		40
>> +#define RST_BUS_OTG		41
>> +#define RST_BUS_DPSS_TOP	42
>> +#define RST_BUS_MIPI_DSI	43
>> +#define RST_BUS_TCON_LCD	44
>> +#define RST_BUS_CSI		45
>> +#define RST_BUS_WIEGAND		46
>> +#define RST_RISCV_SYS_APB	47
>> +#define RST_RISCV_SOFT		48
>> +#define RST_RISCV_CFG		49
>> +
>> +#endif
>> diff --git a/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h =
b/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
>> new file mode 100644
>> index 000000000000..57629d635115
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2025 Andras Szemzo <szemzo.andras@gmail.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_RST_ALLWINNER_SUN8I_V853_R_CCU_H_
>> +#define _DT_BINDINGS_RST_ALLWINNER_SUN8I_V853_R_CCU_H_
>> +
>> +#define RST_BUS_R_TWD		0
>> +#define RST_BUS_R_PPU		1
>> +#define RST_BUS_R_RTC		2
>> +#define RST_BUS_R_CPUCFG	3
>> +
>> +#endif
>> --=20
>> 2.39.5
>>=20


