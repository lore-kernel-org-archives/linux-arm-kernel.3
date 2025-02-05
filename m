Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h7BTYhKIDGSovARV/kRMaz8LzJgfzBwpICZVS1kS+4=; b=wjqcN+/XYLMGjR/yZ2S7oLqLXq
	btN0IeTKOpbgBQh5x1blukttboTV8gD4nmBT9vZKxd60D1ttSsSvEAopx9rLcRh8SLnLquDqoEomx
	HBF1c806fcrRzhN+2pl5pxS52tFNaXap0fXYXhZllY/Omt8kgnmkIZAtNdrJYm8udFIUhVq3pAqmU
	hcyeGEXrhTIKy7ulvdMR8LJM+3hxERvWpaFUOIVWPj+EfA0co9I6XL0Khoi5onzjMZTJ0IljGaxp2
	gC7wmO56wt3epNEgt5RAheUj7dSFnHAxSIR9ayD1nrtCiP7UGijou6ljZaUVke4YBTJGjubl9/P4R
	9uuCDptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tff1a-00000003Jwu-3XYB;
	Wed, 05 Feb 2025 13:01:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetP-00000003HpV-2zM0;
	Wed, 05 Feb 2025 12:52:36 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so11086242a12.3;
        Wed, 05 Feb 2025 04:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759954; x=1739364754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2h7BTYhKIDGSovARV/kRMaz8LzJgfzBwpICZVS1kS+4=;
        b=j8GFGo6/0f9Z0MIDf0DThMY+XXJyrypG6WOT9doThiH6dK6qp1wpp0wunxevbsdynv
         AX7FPNwGUK3wWH9I4hP1KyL9qO3ewx8PjYOaeBvT1cBk7zv8gycpOfXiBKbnkpbkihhl
         PrManUM0/ZplnyJAjV0HhoH7W1kApCnyqbXywUxA475Xg871JSFbA2GgADUivhJCPodD
         WJ8VwOV9S719z/ltofPStzJpTMn1zjXDhZs1FwT+xw0sV88cQF/6iOHEZNL13GcDT5HY
         /g27eQoY3E1lREpTwyV7i+S9h2j1+z07e+f00MWGtjTQdj655LifKw2QHwAdp6NA/5nJ
         ShRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759954; x=1739364754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2h7BTYhKIDGSovARV/kRMaz8LzJgfzBwpICZVS1kS+4=;
        b=vozT8T4BZ5W/KvtZEF4s4RxyMmYWLtLsFQkjStgJo+4BD+iEwNPO4pzq2bialdVjrk
         xwp0yJf1wbvpmWSbG1lemibcSWeK8HZAeEP3Twaxh264zX8MkCQvOWADKo6aOvRR4QI+
         I3hPIkyoiYlyB44eE29gmZ16gR4Iu6JwI8Vni0FHxiTltA/GtAJzSmN2K1PTRuHjnzKj
         fdBTpL9StUSDgcnVdx4hnnnqvwpr8fuPkXqSNhCUFcEgGL0/f4+3/WDJAlN1RpSoV4c/
         ICovZY3pQVaxwpLJDlWjFMsuWAf5npqkQmIVuAa9RkhkKWTBrPrclmb9K+MvSXpslY5F
         5Sww==
X-Forwarded-Encrypted: i=1; AJvYcCUAozkGfObgG8N2ruQwfsSnSm7Jjhpwle3BrMfegOz1mWfDr11/aGMHdj057Fgc+MSqKTJpAP+Mb3x3@lists.infradead.org, AJvYcCUydkaJWrryr/TDXIR193xOoAGtlM06+SB1b9JH2+Hf+511OoEqqfQK8BwsNSuou3bDjvcnnm8Y8yd4u5c=@lists.infradead.org, AJvYcCVARFPbiaXqE3N6GA1aUkSwTV1c1PlpgMusVdqVdcrL+zHEvG4HkkugZcFgFLYWSnX5prYCIewW2xJevOdBvaY1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq5utE0jGVZ/Z9RMVylA1JJR8kiIlXyETUEyBbV0ZC7pbIMxBz
	aSjfGgmcfQG2mwzU3m6RYsLeLP5pRKMrds299TklIdu0gRxOd8Ch
X-Gm-Gg: ASbGncvUzaFvt+ypka2DFB4mC8L/wno4WFeS9+kt8XGjuOzM5POWgr93cRt2YTDWoqA
	kQpJeBpfHhrGtSpuMeZC9nSKc8k4T70PosorVOsApzDbW5OVqRQKWO/Dzu/WtbO71SOYNRlOtaL
	sdclok6TqY651HmVPSag3QOgHuZ92FVdH3Z/AT1qYP+2ReSV2+ojctMRd0bcz4QN2LMHRA7sHbr
	taj4W3ZYJT/mSlQyFBh7Ib2NvMu1nh1sZ4kIhIAKv00q8lV45hZQLxM1UDjityg3YK/vVOrZfHq
	j6uQCmMrDGVCr7W3obKns3oGE5vkCU54+C/tXM8iND5ZQw==
X-Google-Smtp-Source: AGHT+IGGu/7AADk3D0HpZFHZbd5mDOa9V/c+jpDgka/onZHtiRlSlj8RdhKfxdaOzwjowoHiNYitlg==
X-Received: by 2002:a05:6402:34c8:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5dcdb7295c9mr6548115a12.17.1738759953701;
        Wed, 05 Feb 2025 04:52:33 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:33 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
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
Subject: [PATCH v2 03/10] dt-bindings: clock: sunxi-ng: add compatibles for V853
Date: Wed,  5 Feb 2025 13:52:18 +0100
Message-Id: <20250205125225.1152849-4-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045235_752135_A6C43CA4 
X-CRM114-Status: GOOD (  14.67  )
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

V853 has 2 CCUs, add compatible strings for it.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   3 +
 .../clock/allwinner,sun8i-v853-ccu.h          | 132 ++++++++++++++++++
 .../clock/allwinner,sun8i-v853-r-ccu.h        |  16 +++
 .../reset/allwinner,sun8i-v853-ccu.h          |  60 ++++++++
 .../reset/allwinner,sun8i-v853-r-ccu.h        |  14 ++
 5 files changed, 225 insertions(+)
 create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
 create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
 create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
 create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..9369d62284ed 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -33,6 +33,8 @@ properties:
       - allwinner,sun8i-r40-ccu
       - allwinner,sun8i-v3-ccu
       - allwinner,sun8i-v3s-ccu
+      - allwinner,sun8i-v853-ccu
+      - allwinner,sun8i-v853-r-ccu
       - allwinner,sun9i-a80-ccu
       - allwinner,sun20i-d1-ccu
       - allwinner,sun20i-d1-r-ccu
@@ -103,6 +105,7 @@ else:
       compatible:
         enum:
           - allwinner,sun20i-d1-ccu
+          - allwinner,sun8i-v853-ccu
           - allwinner,sun50i-a100-ccu
           - allwinner,sun50i-h6-ccu
           - allwinner,sun50i-h616-ccu
diff --git a/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h b/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
new file mode 100644
index 000000000000..cf56c168e1cd
--- /dev/null
+++ b/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V85X_CCU_H_
+#define _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V85X_CCU_H_
+
+#define CLK_OSC12M		0
+#define CLK_PLL_CPU		1
+#define CLK_PLL_DDR		2
+#define CLK_PLL_PERIPH_4X	3
+#define CLK_PLL_PERIPH_2X	4
+#define CLK_PLL_PERIPH_800M	5
+#define CLK_PLL_PERIPH_480M	6
+#define CLK_PLL_PERIPH_600M	7
+#define CLK_PLL_PERIPH_400M	8
+#define CLK_PLL_PERIPH_300M	9
+#define CLK_PLL_PERIPH_200M	10
+#define CLK_PLL_PERIPH_160M	11
+#define CLK_PLL_PERIPH_150M	12
+#define CLK_PLL_VIDEO_4X	13
+#define CLK_PLL_VIDEO_2X	14
+#define CLK_PLL_VIDEO_1X	15
+#define CLK_PLL_CSI_4X		16
+#define CLK_PLL_AUDIO_DIV2	17
+#define CLK_PLL_AUDIO_DIV5	18
+#define CLK_PLL_AUDIO_4X	19
+#define CLK_PLL_AUDIO_1X	20
+#define CLK_PLL_NPU_4X		21
+#define CLK_CPU			22
+#define CLK_CPU_AXI		23
+#define CLK_CPU_APB		24
+#define CLK_AHB			25
+#define CLK_APB0		26
+#define CLK_APB1		27
+#define CLK_MBUS		28
+#define CLK_DE			29
+#define CLK_BUS_DE		30
+#define CLK_G2D			31
+#define CLK_BUS_G2D		32
+#define CLK_CE			33
+#define CLK_BUS_CE		34
+#define CLK_VE			35
+#define CLK_BUS_VE		36
+#define CLK_NPU			37
+#define CLK_BUS_NPU		38
+#define CLK_BUS_DMA		39
+#define CLK_BUS_MSGBOX0		40
+#define CLK_BUS_MSGBOX1		41
+#define CLK_BUS_SPINLOCK	42
+#define CLK_BUS_HSTIMER		43
+#define CLK_AVS			44
+#define CLK_BUS_DBG		45
+#define CLK_BUS_PWM		46
+#define CLK_BUS_IOMMU		47
+#define CLK_DRAM		48
+#define CLK_MBUS_DMA		49
+#define CLK_MBUS_VE		50
+#define CLK_MBUS_CE		51
+#define CLK_MBUS_CSI		52
+#define CLK_MBUS_ISP		53
+#define CLK_MBUS_G2D		54
+#define CLK_BUS_DRAM		55
+#define CLK_MMC0		56
+#define CLK_MMC1		57
+#define CLK_MMC2		58
+#define CLK_BUS_MMC0		59
+#define CLK_BUS_MMC1		60
+#define CLK_BUS_MMC2		61
+#define CLK_BUS_UART0		62
+#define CLK_BUS_UART1		63
+#define CLK_BUS_UART2		64
+#define CLK_BUS_UART3		65
+#define CLK_BUS_I2C0		66
+#define CLK_BUS_I2C1		67
+#define CLK_BUS_I2C2		68
+#define CLK_BUS_I2C3		69
+#define CLK_BUS_I2C4		70
+#define CLK_SPI0		71
+#define CLK_SPI1		72
+#define CLK_SPI2		73
+#define CLK_SPI3		74
+#define CLK_BUS_SPI0		75
+#define CLK_BUS_SPI1		76
+#define CLK_BUS_SPI2		77
+#define CLK_BUS_SPI3		78
+#define CLK_SPIF		79
+#define CLK_BUS_SPIF		80
+#define CLK_EMAC_25M		81
+#define CLK_BUS_EMAC		82
+#define CLK_BUS_GPADC		83
+#define CLK_BUS_THS		84
+#define CLK_I2S0		85
+#define CLK_I2S1		86
+#define CLK_BUS_I2S0		87
+#define CLK_BUS_I2S1		88
+#define CLK_DMIC		89
+#define CLK_BUS_DMIC		90
+#define CLK_AUDIO_CODEC_DAC	91
+#define CLK_AUDIO_CODEC_ADC	92
+#define CLK_BUS_AUDIO_CODEC	93
+#define CLK_USB_OHCI		94
+#define CLK_BUS_OHCI		95
+#define CLK_BUS_EHCI		96
+#define CLK_BUS_OTG		97
+#define CLK_BUS_DPSS_TOP	98
+#define CLK_MIPI_DSI		99
+#define CLK_BUS_MIPI_DSI	100
+#define CLK_TCON_LCD		101
+#define CLK_BUS_TCON_LCD	102
+#define CLK_CSI_TOP		103
+#define CLK_CSI_MCLK0		104
+#define CLK_CSI_MCLK1		105
+#define CLK_CSI_MCLK2		106
+#define CLK_BUS_CSI		107
+#define CLK_BUS_WIEGAND		108
+#define CLK_RISCV		109
+#define CLK_RISCV_AXI		110
+#define CLK_RISCV_CORE_GATE	111
+#define CLK_RISCV_CFG_GATE	112
+#define CLK_FANOUT_24M		113
+#define CLK_FANOUT_12M		114
+#define CLK_FANOUT_16M		115
+#define CLK_FANOUT_25M		116
+#define CLK_FANOUT_27M		117
+#define CLK_FANOUT_PCLK		118
+#define CLK_FANOUT0		119
+#define CLK_FANOUT1		120
+#define CLK_FANOUT2		121
+
+#endif
diff --git a/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h b/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
new file mode 100644
index 000000000000..48fe598b7bd8
--- /dev/null
+++ b/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Andras Szemzo <szemzo.andras@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V853_R_CCU_H_
+#define _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V853_R_CCU_H_
+
+#define CLK_R_AHB		0
+#define CLK_R_APB0		1
+#define CLK_BUS_R_TWD		2
+#define CLK_BUS_R_PPU		3
+#define CLK_BUS_R_RTC		4
+#define CLK_BUS_R_CPUCFG	5
+
+#endif
diff --git a/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h b/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
new file mode 100644
index 000000000000..e258117518aa
--- /dev/null
+++ b/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RST_ALLWINNER_SUN8I_V85X_CCU_H_
+#define _DT_BINDINGS_RST_ALLWINNER_SUN8I_V85X_CCU_H_
+
+#define RST_MBUS		0
+#define RST_BUS_DE		1
+#define RST_BUS_G2D		2
+#define RST_BUS_CE		3
+#define RST_BUS_VE		4
+#define RST_BUS_NPU		5
+#define RST_BUS_DMA		6
+#define RST_BUS_MSGBOX0		7
+#define RST_BUS_MSGBOX1		8
+#define RST_BUS_SPINLOCK	9
+#define RST_BUS_HSTIMER		10
+#define RST_BUS_DBG		11
+#define RST_BUS_PWM		12
+#define RST_BUS_DRAM		13
+#define RST_BUS_MMC0		14
+#define RST_BUS_MMC1		15
+#define RST_BUS_MMC2		16
+#define RST_BUS_UART0		17
+#define RST_BUS_UART1		18
+#define RST_BUS_UART2		19
+#define RST_BUS_UART3		20
+#define RST_BUS_I2C0		21
+#define RST_BUS_I2C1		22
+#define RST_BUS_I2C2		23
+#define RST_BUS_I2C3		24
+#define RST_BUS_I2C4		25
+#define RST_BUS_SPI0		26
+#define RST_BUS_SPI1		27
+#define RST_BUS_SPI2		28
+#define RST_BUS_SPI3		29
+#define RST_BUS_SPIF		30
+#define RST_BUS_EMAC		31
+#define RST_BUS_GPADC		32
+#define RST_BUS_THS		33
+#define RST_BUS_I2S0		34
+#define RST_BUS_I2S1		35
+#define RST_BUS_DMIC		36
+#define RST_BUS_AUDIO_CODEC	37
+#define RST_USB_PHY		38
+#define RST_BUS_OHCI		39
+#define RST_BUS_EHCI		40
+#define RST_BUS_OTG		41
+#define RST_BUS_DPSS_TOP	42
+#define RST_BUS_MIPI_DSI	43
+#define RST_BUS_TCON_LCD	44
+#define RST_BUS_CSI		45
+#define RST_BUS_WIEGAND		46
+#define RST_RISCV_SYS_APB	47
+#define RST_RISCV_SOFT		48
+#define RST_RISCV_CFG		49
+
+#endif
diff --git a/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h b/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
new file mode 100644
index 000000000000..57629d635115
--- /dev/null
+++ b/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Andras Szemzo <szemzo.andras@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RST_ALLWINNER_SUN8I_V853_R_CCU_H_
+#define _DT_BINDINGS_RST_ALLWINNER_SUN8I_V853_R_CCU_H_
+
+#define RST_BUS_R_TWD		0
+#define RST_BUS_R_PPU		1
+#define RST_BUS_R_RTC		2
+#define RST_BUS_R_CPUCFG	3
+
+#endif
-- 
2.39.5


