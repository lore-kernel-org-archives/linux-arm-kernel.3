Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ED4C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5n++/8lLDY6eiu5rlsfW9KyaCjh0t8qp8UwhHkKI+E=; b=x/hd5Ntp/W43xdhqNJ+7yTLvHn
	xDV0cF6lcewnf/9sWbjHex2g9bqozHPPDMOS/qaemiYuKYpdIh65xTthM0mGZsYRkrubYuWzkJu1v
	usi/u1siWJAj50rT5238hJeeqYmRRfdewdweNt560DQqKBJx20uovdV8KTj5G36EtfeEfU7GUrjqb
	Qh10X4zsFVXEfOZ+IY0zBTHG1BvuBeq3gTeZE3Ljew0yylYFx6uo1ulbH2MznNr4NZRSzfl+qKh4H
	y3UO7quFoF6IgAfPFuYgVUFiQqIoaapHFJNqjTXCrx0W5c2qV9XBwGcdKKsj1kgQeX87m1KYy8Bob
	1ixMjjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbL-00000000CGD-3A24;
	Mon, 21 Jul 2025 16:42:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrZW-0000000HXiY-3OWx;
	Mon, 21 Jul 2025 14:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7B9A61360;
	Mon, 21 Jul 2025 14:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6275CC4CEED;
	Mon, 21 Jul 2025 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753108373;
	bh=PANE1f7CRvQHvSbKY2ZlWaepLRWCIdwtuwmCRAeOBzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enrsrjKvk9rWIhqco2b9GxcIq0lI6JGmXSjzEchw7BQ5F+05zNlrmv63QNj69SoiR
	 5lqGfAsULMXMgLdPdvotxBtwQX5u+g4FZNiPpvpueZgDe+ZKllZjzEORL4/2W1b2Al
	 znh5GM6e5bpULDGMr/UyX/Wx37YktYe+t7aL1IV17XZju8J5qpxrVsseitiKM+2L+x
	 Dmc4sm3hVaM1dI0mX0nE7McS2sG/Jfdw5W9XS/1DoqrlaZQZvf/eDCLS+ukcVaf/gV
	 /nt03bjwQLKMiPxOiAp1/ZOfZ7vof1X2JpQ3bjbwEbpz2arazvIBjr3m0YLhILx6Qc
	 xkKrdWtWxKyjg==
Date: Mon, 21 Jul 2025 09:32:52 -0500
From: Rob Herring <robh@kernel.org>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Describe MT6789
 clock controllers
Message-ID: <20250721143252.GA586001-robh@kernel.org>
References: <20250718181200.18092-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718181200.18092-1-me@adomerle.pw>
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

On Fri, Jul 18, 2025 at 10:11:59PM +0400, Arseniy Velikanov wrote:
> Add new bindings for system clocks and functional clocks on
> MediaTek MT6789.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  .../bindings/clock/mediatek,mt6789-clock.yaml |  52 +++
>  .../clock/mediatek,mt6789-sys-clock.yaml      |  47 +++
>  .../dt-bindings/clock/mediatek,mt6789-clk.h   | 390 ++++++++++++++++++
>  .../reset/mediatek,mt6789-resets.h            |  15 +
>  4 files changed, 504 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6789-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mediatek,mt6789-clk.h
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6789-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6789-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6789-clock.yaml
> new file mode 100644
> index 000000000000..93e2e7766e00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6789-clock.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt6789-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Functional Clock Controller for MT6789
> +
> +maintainers:
> +  - Arseniy Velikanov <me@adomerle.pw>
> +
> +description:
> +  The Mediatek functional clock controller provides various clocks on MT6789.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6789-afe
> +          - mediatek,mt6789-camsys
> +          - mediatek,mt6789-camsys-rawa
> +          - mediatek,mt6789-camsys-rawb
> +          - mediatek,mt6789-imgsys
> +          - mediatek,mt6789-imp-iic-wrap-c
> +          - mediatek,mt6789-imp-iic-wrap-en
> +          - mediatek,mt6789-imp-iic-wrap-n
> +          - mediatek,mt6789-imp-iic-wrap-w
> +          - mediatek,mt6789-ipesys
> +          - mediatek,mt6789-mdpsys
> +          - mediatek,mt6789-mfgcfg
> +          - mediatek,mt6789-vdecsys
> +          - mediatek,mt6789-vencsys

These can all just be added to mediatek,syscon.yaml.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@11210000 {
> +        compatible = "mediatek,mt6789-afe";
> +        reg = <0x11210000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
> new file mode 100644
> index 000000000000..471d64f4f629
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt6789-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Clock Controller for MT6789
> +
> +maintainers:
> +  - Arseniy Velikanov <me@adomerle.pw>
> +
> +description:
> +  The Mediatek system clock controller provides various clocks and system configuration

Wrap lines at 80 char.

> +  like reset and bus protection on MT6789.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6789-apmixedsys
> +          - mediatek,mt6789-topckgen
> +          - mediatek,mt6789-infracfg-ao
> +          - mediatek,mt6789-mcusys
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg

#clock-cells and #reset-cells shouldn't be optional. The h/w either 
has clocks and resets or it doesn't. If these blocks don't have either 
then they go in syscon.yaml. 

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@c530000 {
> +        compatible = "mediatek,mt6789-mcusys", "syscon";
> +        reg = <0xc530000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/mediatek,mt6789-clk.h b/include/dt-bindings/clock/mediatek,mt6789-clk.h
> new file mode 100644
> index 000000000000..72bc97f0fd8e
> --- /dev/null
> +++ b/include/dt-bindings/clock/mediatek,mt6789-clk.h
> @@ -0,0 +1,390 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2025 Arseniy Velikanov <me@adomerle.pw>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_MT6789_H
> +#define _DT_BINDINGS_CLK_MT6789_H
> +
> +#define CLK_MCU_ARMPLL_LL_SEL	0
> +#define CLK_MCU_ARMPLL_BL_SEL	1
> +#define CLK_MCU_ARMPLL_BUS_SEL	2
> +
> +#define CLK_APMIXED_ARMPLL_LL	0
> +#define CLK_APMIXED_ARMPLL_BL0	1
> +#define CLK_APMIXED_CCIPLL	2
> +#define CLK_APMIXED_MPLL	3
> +#define CLK_APMIXED_MAINPLL	4
> +#define CLK_APMIXED_UNIVPLL	5
> +#define CLK_APMIXED_MSDCPLL	6
> +#define CLK_APMIXED_MMPLL	7
> +#define CLK_APMIXED_NPUPLL	8
> +#define CLK_APMIXED_MFGPLL	9
> +#define CLK_APMIXED_TVDPLL	10
> +#define CLK_APMIXED_APLL1	11
> +#define CLK_APMIXED_APLL2	12
> +#define CLK_APMIXED_USBPLL	13
> +
> +#define CLK_TOP_MFGPLL	0
> +#define CLK_TOP_MAINPLL_D4	1
> +#define CLK_TOP_MAINPLL_D4_D2	2
> +#define CLK_TOP_MAINPLL_D4_D4	3
> +#define CLK_TOP_MAINPLL_D4_D8	4
> +#define CLK_TOP_MAINPLL_D4_D16	5
> +#define CLK_TOP_MAINPLL_D5	6
> +#define CLK_TOP_MAINPLL_D5_D2	7
> +#define CLK_TOP_MAINPLL_D5_D4	8
> +#define CLK_TOP_MAINPLL_D5_D8	9
> +#define CLK_TOP_MAINPLL_D6	10
> +#define CLK_TOP_MAINPLL_D6_D2	11
> +#define CLK_TOP_MAINPLL_D6_D4	12
> +#define CLK_TOP_MAINPLL_D7	13
> +#define CLK_TOP_MAINPLL_D7_D2	14
> +#define CLK_TOP_MAINPLL_D7_D4	15
> +#define CLK_TOP_MAINPLL_D7_D8	16
> +#define CLK_TOP_MAINPLL_D9	17
> +#define CLK_TOP_UNIVPLL_D4	18
> +#define CLK_TOP_UNIVPLL_D4_D2	19
> +#define CLK_TOP_UNIVPLL_D4_D4	20
> +#define CLK_TOP_UNIVPLL_D4_D8	21
> +#define CLK_TOP_UNIVPLL_D5	22
> +#define CLK_TOP_UNIVPLL_D5_D2	23
> +#define CLK_TOP_UNIVPLL_D5_D4	24
> +#define CLK_TOP_UNIVPLL_D6	25
> +#define CLK_TOP_UNIVPLL_D6_D2	26
> +#define CLK_TOP_UNIVPLL_D6_D4	27
> +#define CLK_TOP_UNIVPLL_D6_D8	28
> +#define CLK_TOP_UNIVPLL_D6_D16	29
> +#define CLK_TOP_UNIVPLL_D7	30
> +#define CLK_TOP_UNIVPLL_192M_D2	31
> +#define CLK_TOP_UNIVPLL_192M_D4	32
> +#define CLK_TOP_UNIVPLL_192M_D8	33
> +#define CLK_TOP_UNIVPLL_192M_D16	34
> +#define CLK_TOP_UNIVPLL_192M_D32	35
> +#define CLK_TOP_APLL1	36
> +#define CLK_TOP_APLL1_D2	37
> +#define CLK_TOP_APLL1_D4	38
> +#define CLK_TOP_APLL1_D8	39
> +#define CLK_TOP_APLL2	94
> +#define CLK_TOP_APLL2_D2	40
> +#define CLK_TOP_APLL2_D4	41
> +#define CLK_TOP_APLL2_D8	42
> +#define CLK_TOP_MMPLL_D4_D2	43
> +#define CLK_TOP_MMPLL_D5_D2	44
> +#define CLK_TOP_MMPLL_D6	45
> +#define CLK_TOP_MMPLL_D6_D2	46
> +#define CLK_TOP_MMPLL_D7	47
> +#define CLK_TOP_MMPLL_D9	48
> +#define CLK_TOP_NPUPLL	49
> +#define CLK_TOP_TVDPLL	50
> +#define CLK_TOP_MSDCPLL	51
> +#define CLK_TOP_MSDCPLL_D2	52
> +#define CLK_TOP_MSDCPLL_D4	53
> +#define CLK_TOP_CLKRTC	54
> +#define CLK_TOP_TCK_26M_MX9	55
> +#define CLK_TOP_F26M_CK_D2	56
> +#define CLK_TOP_OSC_D2	57
> +#define CLK_TOP_OSC_D4	58
> +#define CLK_TOP_OSC_D8	59
> +#define CLK_TOP_OSC_D16	60
> +#define CLK_TOP_OSC_D10	61
> +#define CLK_TOP_OSC_D20	62
> +#define CLK_TOP_F26M	63
> +#define CLK_TOP_AXI	64
> +#define CLK_TOP_DISP	65
> +#define CLK_TOP_MDP	66
> +#define CLK_TOP_IMG1	67
> +#define CLK_TOP_IPE	68
> +#define CLK_TOP_CAM	69
> +#define CLK_TOP_MFG_REF	70
> +#define CLK_TOP_MFG_PLL	71
> +#define CLK_TOP_UART	72
> +#define CLK_TOP_SPI	73
> +#define CLK_TOP_MSDC50_0	74
> +#define CLK_TOP_MSDC30_1	75
> +#define CLK_TOP_AUDIO	76
> +#define CLK_TOP_PWRAP_ULPOSC	77
> +#define CLK_TOP_DISP_PWM	78
> +#define CLK_TOP_USB_TOP	79
> +#define CLK_TOP_I2C	80
> +#define CLK_TOP_AUD_ENGEN1	81
> +#define CLK_TOP_AUD_ENGEN2	82
> +#define CLK_TOP_AES_UFSFDE	83
> +#define CLK_TOP_UFS	84
> +#define CLK_TOP_DPMAIF_MAIN	85
> +#define CLK_TOP_VENC	86
> +#define CLK_TOP_VDEC	87
> +#define CLK_TOP_CAMTM	88
> +#define CLK_TOP_PWM	89
> +#define CLK_TOP_AUDIO_H	90
> +#define CLK_TOP_DSI_OCC	91
> +#define CLK_TOP_I2C_PSEUDO	92
> +#define CLK_TOP_APDMA	93
> +#define CLK_TOP_AXI_SEL 95
> +#define CLK_TOP_SPM_SEL 96
> +#define CLK_TOP_SCP_SEL 97
> +#define CLK_TOP_BUS_AXIMEM_SEL	98
> +#define CLK_TOP_DISP_SEL	99
> +#define CLK_TOP_MDP_SEL	100
> +#define CLK_TOP_IMG1_SEL 101
> +#define CLK_TOP_IPE_SEL 102
> +#define CLK_TOP_CAM_SEL  103
> +#define CLK_TOP_MFG_REF_SEL	104
> +#define CLK_TOP_MFG_PLL_SEL	105
> +#define CLK_TOP_CAMTG_SEL	106
> +#define CLK_TOP_CAMTG2_SEL	107
> +#define CLK_TOP_CAMTG3_SEL	108
> +#define CLK_TOP_CAMTG4_SEL	109
> +#define CLK_TOP_CAMTG5_SEL	110
> +#define CLK_TOP_CAMTG6_SEL	111
> +#define CLK_TOP_UART_SEL	112
> +#define CLK_TOP_SPI_SEL	113
> +#define CLK_TOP_MSDC50_0_HCLK_SEL	114
> +#define CLK_TOP_MSDC50_0_SEL	115
> +#define CLK_TOP_MSDC30_1_SEL	116
> +#define CLK_TOP_AUDIO_SEL	117
> +#define CLK_TOP_AUD_INTBUS_SEL	118
> +#define CLK_TOP_PWRAP_ULPOSC_SEL	119
> +#define CLK_TOP_ATB_SEL	120
> +#define CLK_TOP_SSPM_SEL	121
> +#define CLK_TOP_SCAM_SEL	122
> +#define CLK_TOP_DISP_PWM_SEL	123
> +#define CLK_TOP_USB_TOP_SEL	124
> +#define CLK_TOP_I2C_SEL	125
> +#define CLK_TOP_SENINF_SEL	126
> +#define CLK_TOP_SENINF1_SEL	127
> +#define CLK_TOP_SENINF2_SEL	128
> +#define CLK_TOP_SENINF3_SEL	129
> +#define CLK_TOP_DXCC_SEL	130
> +#define CLK_TOP_AUD_ENGEN1_SEL	131
> +#define CLK_TOP_AUD_ENGEN2_SEL	132
> +#define CLK_TOP_AES_UFSFDE_SEL	133
> +#define CLK_TOP_UFS_SEL	134
> +#define CLK_TOP_AUD_1_SEL	135
> +#define CLK_TOP_AUD_2_SEL	136
> +#define CLK_TOP_DPMAIF_MAIN_SEL	137
> +#define CLK_TOP_VENC_SEL	138
> +#define CLK_TOP_VDEC_SEL	139
> +#define CLK_TOP_CAMTM_SEL	140
> +#define CLK_TOP_PWM_SEL	141
> +#define CLK_TOP_AUDIO_H_SEL	142
> +#define CLK_TOP_SPMI_MST_SEL	143
> +#define CLK_TOP_DVFSRC_SEL	144
> +#define CLK_TOP_AES_MSDCFDE_SEL	145
> +#define CLK_TOP_MCUPM_SEL	146
> +#define CLK_TOP_DSI_OCC_SEL	147
> +#define CLK_TOP_APLL_I2S0_MCK_SEL	148
> +#define CLK_TOP_APLL_I2S1_MCK_SEL	149
> +#define CLK_TOP_APLL_I2S2_MCK_SEL	150
> +#define CLK_TOP_APLL_I2S3_MCK_SEL	151
> +#define CLK_TOP_APLL_I2S4_MCK_SEL	152
> +#define CLK_TOP_APLL_I2S5_MCK_SEL	153
> +#define CLK_TOP_APLL_I2S6_MCK_SEL	154
> +#define CLK_TOP_APLL_I2S7_MCK_SEL	155
> +#define CLK_TOP_APLL_I2S8_MCK_SEL	156
> +#define CLK_TOP_APLL_I2S9_MCK_SEL	157
> +#define CLK_TOP_APLL12_CK_DIV0	158
> +#define CLK_TOP_APLL12_CK_DIV1	159
> +#define CLK_TOP_APLL12_CK_DIV2	160
> +#define CLK_TOP_APLL12_CK_DIV3	161
> +#define CLK_TOP_APLL12_CK_DIV4	162
> +#define CLK_TOP_APLL12_CK_DIVB	163
> +#define CLK_TOP_APLL12_CK_DIV5	164
> +#define CLK_TOP_APLL12_CK_DIV6	165
> +#define CLK_TOP_APLL12_CK_DIV7	166
> +#define CLK_TOP_APLL12_CK_DIV8	167
> +#define CLK_TOP_APLL12_CK_DIV9	168
> +
> +/* INFRACFG_AO */
> +#define CLK_IFRAO_PMIC_TMR	0
> +#define CLK_IFRAO_PMIC_AP	1
> +#define CLK_IFRAO_GCE	2
> +#define CLK_IFRAO_GCE2	3
> +#define CLK_IFRAO_THERM	4
> +#define CLK_IFRAO_I2C_PSEUDO	5
> +#define CLK_IFRAO_APDMA_PSEUDO	6
> +#define CLK_IFRAO_PWM_HCLK	7
> +#define CLK_IFRAO_PWM1	8
> +#define CLK_IFRAO_PWM2	9
> +#define CLK_IFRAO_PWM3	10
> +#define CLK_IFRAO_PWM4	11
> +#define CLK_IFRAO_PWM	12
> +#define CLK_IFRAO_UART0	13
> +#define CLK_IFRAO_UART1	14
> +#define CLK_IFRAO_UART2	15
> +#define CLK_IFRAO_UART3	16
> +#define CLK_IFRAO_GCE_26M	17
> +#define CLK_IFRAO_BTIF	18
> +#define CLK_IFRAO_SPI0	19
> +#define CLK_IFRAO_MSDC0	20
> +#define CLK_IFRAO_MSDC1	21
> +#define CLK_IFRAO_MSDC0_SRC	22
> +#define CLK_IFRAO_AUXADC	23
> +#define CLK_IFRAO_CPUM	24
> +#define CLK_IFRAO_CCIF1_AP	25
> +#define CLK_IFRAO_CCIF1_MD	26
> +#define CLK_IFRAO_AUXADC_MD	27
> +#define CLK_IFRAO_MSDC1_SRC	28
> +#define CLK_IFRAO_MSDC0_AES	29
> +#define CLK_IFRAO_CCIF_AP	30
> +#define CLK_IFRAO_DEBUGSYS	31
> +#define CLK_IFRAO_AUDIO	32
> +#define CLK_IFRAO_CCIF_MD	33
> +#define CLK_IFRAO_SSUSB	34
> +#define CLK_IFRAO_DISP_PWM	35
> +#define CLK_IFRAO_CLDMA_BCLK	36
> +#define CLK_IFRAO_AUDIO_26M_BCLK	37
> +#define CLK_IFRAO_SPI1	38
> +#define CLK_IFRAO_SPI2	39
> +#define CLK_IFRAO_SPI3	40
> +#define CLK_IFRAO_UNIPRO_SYSCLK	41
> +#define CLK_IFRAO_UNIPRO_TICK	42
> +#define CLK_IFRAO_UFS_SAP_BCLK	43
> +#define CLK_IFRAO_SPI4	44
> +#define CLK_IFRAO_SPI5	45
> +#define CLK_IFRAO_CQ_DMA	46
> +#define CLK_IFRAO_UFS	47
> +#define CLK_IFRAO_UFS_AES	48
> +#define CLK_IFRAO_AP_MSDC0	49
> +#define CLK_IFRAO_MD_MSDC0	50
> +#define CLK_IFRAO_CCIF5_MD	51
> +#define CLK_IFRAO_CCIF2_AP	52
> +#define CLK_IFRAO_CCIF2_MD	53
> +#define CLK_IFRAO_FBIST2FPC	54
> +#define CLK_IFRAO_DPMAIF_MAIN	55
> +#define CLK_IFRAO_CCIF4_AP	56
> +#define CLK_IFRAO_CCIF4_MD	57
> +#define CLK_IFRAO_SPI6_CK	58
> +#define CLK_IFRAO_SPI7_CK	59
> +#define CLK_IFRAO_66MP_BUS_MCLK_CKP	60
> +#define CLK_IFRAO_AP_DMA	61
> +
> +#define CLK_IMP_IIC_WRAP_C_I2C3	0
> +#define CLK_IMP_IIC_WRAP_C_I2C5	1
> +#define CLK_IMP_IIC_WRAP_C_I2C6	2
> +
> +#define CLK_IMP_IIC_WRAP_W_I2C0	0
> +#define CLK_IMP_IIC_WRAP_W_I2C1	1
> +
> +#define CLK_IMP_IIC_WRAP_N_I2C7	0
> +
> +#define CLK_IMP_IIC_WRAP_EN_I2C2	0
> +#define CLK_IMP_IIC_WRAP_EN_I2C4	1
> +#define CLK_IMP_IIC_WRAP_EN_I2C8	2
> +#define CLK_IMP_IIC_WRAP_EN_I2C9	3
> +
> +#define CLK_AFE_AFE	0
> +#define CLK_AFE_22M	1
> +#define CLK_AFE_24M	2
> +#define CLK_AFE_APLL2_TUNER	3
> +#define CLK_AFE_APLL_TUNER	4
> +#define CLK_AFE_ADC	5
> +#define CLK_AFE_DAC	6
> +#define CLK_AFE_DAC_PREDIS	7
> +#define CLK_AFE_TML	8
> +#define CLK_AFE_NLE	9
> +#define CLK_AFE_I2S1_BCLK	10
> +#define CLK_AFE_I2S2_BCLK	11
> +#define CLK_AFE_I2S3_BCLK	12
> +#define CLK_AFE_I2S4_BCLK	13
> +#define CLK_AFE_GENERAL3_ASRC	14
> +#define CLK_AFE_CONNSYS_I2S_ASRC	15
> +#define CLK_AFE_GENERAL1_ASRC	16
> +#define CLK_AFE_GENERAL2_ASRC	17
> +#define CLK_AFE_DAC_HIRES	18
> +#define CLK_AFE_ADC_HIRES	19
> +#define CLK_AFE_ADC_HIRES_TML	20
> +
> +#define CLK_MFGCFG_BG3D	0
> +
> +#define CLK_MM_DISP_MUTEX0	0
> +#define CLK_MM_APB_BUS	1
> +#define CLK_MM_DISP_OVL0	2
> +#define CLK_MM_DISP_RDMA0	3
> +#define CLK_MM_DISP_OVL0_2L	4
> +#define CLK_MM_DISP_WDMA0	5
> +#define CLK_MM_DISP_RSZ0	6
> +#define CLK_MM_DISP_AAL0	7
> +#define CLK_MM_DISP_CCORR0	8
> +#define CLK_MM_DISP_COLOR0	9
> +#define CLK_MM_SMI_INFRA	10
> +#define CLK_MM_DISP_DSC_WRAP0	11
> +#define CLK_MM_DISP_GAMMA0	12
> +#define CLK_MM_DISP_POSTMASK0	13
> +#define CLK_MM_DISP_DITHER0	14
> +#define CLK_MM_SMI_COMMON	15
> +#define CLK_MM_DSI0	16
> +#define CLK_MM_DISP_FAKE_ENG0	17
> +#define CLK_MM_DISP_FAKE_ENG1	18
> +#define CLK_MM_SMI_GALS	19
> +#define CLK_MM_SMI_IOMMU	20
> +#define CLK_MM_DSI0_DSI_CK_DOMAIN	21
> +#define CLK_MM_DISP_26M	22
> +
> +#define CLK_IMGSYS_LARB9	0
> +#define CLK_IMGSYS_LARB10	1
> +#define CLK_IMGSYS_DIP	2
> +#define CLK_IMGSYS_GALS	3
> +
> +#define CLK_VDE2_LARB1_CKEN	0
> +#define CLK_VDE2_LAT_CKEN	1
> +#define CLK_VDE2_LAT_ACTIVE	2
> +#define CLK_VDE2_LAT_CKEN_ENG	3
> +#define CLK_VDE2_MINI_MDP_CKEN_CFG_RG	4
> +#define CLK_VDE2_VDEC_CKEN	5
> +#define CLK_VDE2_VDEC_ACTIVE	6
> +#define CLK_VDE2_VDEC_CKEN_ENG	7
> +
> +#define CLK_VEN1_CKE0_LARB	0
> +#define CLK_VEN1_CKE1_VENC	1
> +#define CLK_VEN1_CKE2_JPGENC	2
> +#define CLK_VEN1_CKE5_GALS	3
> +
> +#define CLK_CAM_M_LARB13	0
> +#define CLK_CAM_M_LARB14	1
> +#define CLK_CAM_M_CAM	2
> +#define CLK_CAM_M_CAMTG	3
> +#define CLK_CAM_M_SENINF	4
> +#define CLK_CAM_M_CAMSV1	5
> +#define CLK_CAM_M_CAMSV2	6
> +#define CLK_CAM_M_CAMSV3	7
> +#define CLK_CAM_M_MRAW0	8
> +#define CLK_CAM_M_FAKE_ENG	9
> +#define CLK_CAM_M_CAM2MM_GALS	10
> +
> +#define CLK_CAM_RA_LARBX	0
> +#define CLK_CAM_RA_CAM	1
> +#define CLK_CAM_RA_CAMTG	2
> +
> +#define CLK_CAM_RB_LARBX	0
> +#define CLK_CAM_RB_CAM	1
> +#define CLK_CAM_RB_CAMTG	2
> +
> +#define CLK_IPE_LARB19	0
> +#define CLK_IPE_LARB20	1
> +#define CLK_IPE_SMI_SUBCOM	2
> +#define CLK_IPE_FD	3
> +#define CLK_IPE_FE	4
> +#define CLK_IPE_RSC	5
> +#define CLK_IPE_DPE	6
> +#define CLK_IPE_GALS	7
> +
> +#define CLK_MDP_RDMA0	0
> +#define CLK_MDP_TDSHP0	1
> +#define CLK_MDP_IMG_DL_ASYNC0	2
> +#define CLK_MDP_IMG_DL_ASYNC1	3
> +#define CLK_MDP_SMI0	4
> +#define CLK_MDP_APB_BUS	5
> +#define CLK_MDP_WROT0	6
> +#define CLK_MDP_RSZ0	7
> +#define CLK_MDP_HDR0	8
> +#define CLK_MDP_MUTEX0	9
> +#define CLK_MDP_WROT1	10
> +#define CLK_MDP_RSZ1	11
> +#define CLK_MDP_FAKE_ENG0	12
> +#define CLK_MDP_AAL0	13
> +#define CLK_MDP_IMG_DL_RELAY0_ASYNC0	14
> +#define CLK_MDP_IMG_DL_RELAY1_ASYNC1	15
> +
> +#endif /* _DT_BINDINGS_CLK_MT6789_H */
> diff --git a/include/dt-bindings/reset/mediatek,mt6789-resets.h b/include/dt-bindings/reset/mediatek,mt6789-resets.h
> new file mode 100644
> index 000000000000..b2a9890eee61
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6789-resets.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025 Arseniy Velikanov <me@adomerle.pw>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6789
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT6789
> +
> +/* INFRA resets */
> +#define MT6789_INFRA_RST0_LVTS_AP_SWRST		0
> +#define MT6789_INFRA_RST1_UFSHCI_SWRST		1
> +#define MT6789_INFRA_RST2_UNIPRO_SWRST		2
> +#define MT6789_INFRA_RST3_UFS_CRYPTO_SWRST	3
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6789 */
> -- 
> 2.50.0
> 

