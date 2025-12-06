Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A188D3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 05:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcDxCT/vnr2dTxZ7y5r6e88qG/0XM0v8Hk5zok5szB8=; b=zqpF+EOKTDIgR/LKFE6llrp6LK
	KTjlIXpZmCea7/Jrty8CAbwpks/auh8lgj1DYg/Invl7tmHC6+QzwySRBfgHxvcv9uZB5pUkba1tM
	3Vujvzw8i18yZDoZMuEQo72cz57IMVBuoT8mQiYl9lzOo4KDd1Dl5hzUnv5ukfZaaClGWvXWmdDSD
	liDPzbD/kTnMj9o9Pl3dzK7Y/jp0RfriV3IV/EhE2OzhWjPT4UssskUdIY7B/eHYuYYcGLRnOoqOp
	vp2Ck/rr9AEGnqpLALuj9gHH3wMlgUZH16Tmi/BLIAu8v1xOS4NTpR1eWONZr8r5EkJXEO/pHUjFg
	ni0TCHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXZ-0000000AdHZ-0Syx;
	Sat, 06 Dec 2025 05:09:05 +0000
Received: from mail-m15597.qiye.163.com ([101.71.155.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXS-0000000AdBf-1aal;
	Sat, 06 Dec 2025 05:09:01 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a6f;
	Sat, 6 Dec 2025 13:08:53 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v2 6/8] dt-bindings: pinctrl: Add header for Rockchip RK3506 RMIO
Date: Sat,  6 Dec 2025 13:08:42 +0800
Message-Id: <20251206050844.402958-7-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206050844.402958-1-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2101e1a09d8kunmae94618c4ed3eaf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhhNTlZMGh1MSEJCTk9NTUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Kb8TLkq1VYYEi5HZUftNqJWCUIeHSXocCTRrgo8kcUJ0OpwF42usAMDns9nwJ/LsXGWVpHG2x3YiSO+pnYkQ6tKDBJ429orJhIlDs7P7ohrsj93ll0A7qWNm0eaUXUWTKb6ru02BJQCMh0Blxc0zvTgFAMdWsdbsTd2FvxbPJWY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gcDxCT/vnr2dTxZ7y5r6e88qG/0XM0v8Hk5zok5szB8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210858_679449_D5F6076D 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Add header file with constants for RMIO pin and function IDs for the
Rockchip RK3506 SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../pinctrl/rockchip,rk3506-rmio.h            | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
new file mode 100644
index 000000000000..5d39690a0b28
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+
+/* RMIO pins definetion */
+#define RMIO_PIN0				0
+#define RMIO_PIN1				1
+#define RMIO_PIN2				2
+#define RMIO_PIN3				3
+#define RMIO_PIN4				4
+#define RMIO_PIN5				5
+#define RMIO_PIN6				6
+#define RMIO_PIN7				7
+#define RMIO_PIN8				8
+#define RMIO_PIN9				9
+#define RMIO_PIN10				10
+#define RMIO_PIN11				11
+#define RMIO_PIN12				12
+#define RMIO_PIN13				13
+#define RMIO_PIN14				14
+#define RMIO_PIN15				15
+#define RMIO_PIN16				16
+#define RMIO_PIN17				17
+#define RMIO_PIN18				18
+#define RMIO_PIN19				19
+#define RMIO_PIN20				20
+#define RMIO_PIN21				21
+#define RMIO_PIN22				22
+#define RMIO_PIN23				23
+#define RMIO_PIN24				24
+#define RMIO_PIN25				25
+#define RMIO_PIN26				26
+#define RMIO_PIN27				27
+#define RMIO_PIN28				28
+#define RMIO_PIN29				29
+#define RMIO_PIN30				30
+#define RMIO_PIN31				31
+
+/* RMIO function definetion */
+#define RMIO_UART1_TX			1
+#define RMIO_UART1_RX			2
+#define RMIO_UART2_TX			3
+#define RMIO_UART2_RX			4
+#define RMIO_UART3_TX			5
+#define RMIO_UART3_RX			6
+#define RMIO_UART3_CTSN			7
+#define RMIO_UART3_RTSN			8
+#define RMIO_UART4_TX			9
+#define RMIO_UART4_RX			10
+#define RMIO_UART4_CTSN			11
+#define RMIO_UART4_RTSN			12
+#define RMIO_MIPITE			13
+#define RMIO_CLK_32K			14
+#define RMIO_I2C0_SCL			15
+#define RMIO_I2C0_SDA			16
+#define RMIO_I2C1_SCL			17
+#define RMIO_I2C1_SDA			18
+#define RMIO_I2C2_SCL			19
+#define RMIO_I2C2_SDA			20
+#define RMIO_PDM_CLK0			21
+#define RMIO_PDM_SDI0			22
+#define RMIO_PDM_SDI1			23
+#define RMIO_PDM_SDI2			24
+#define RMIO_PDM_SDI3			25
+#define RMIO_CAN1_TX			26
+#define RMIO_CAN1_RX			27
+#define RMIO_CAN0_TX			28
+#define RMIO_CAN0_RX			29
+#define RMIO_PWM0_CH0			30
+#define RMIO_PWM0_CH1			31
+#define RMIO_PWM0_CH2			32
+#define RMIO_PWM0_CH3			33
+#define RMIO_PWM1_CH0			34
+#define RMIO_PWM1_CH1			35
+#define RMIO_PWM1_CH2			36
+#define RMIO_PWM1_CH3			37
+#define RMIO_PWM1_CH4			38
+#define RMIO_PWM1_CH5			39
+#define RMIO_PWM1_CH6			40
+#define RMIO_PWM1_CH7			41
+#define RMIO_TOUCH_KEY_DRIVE		42
+#define RMIO_TOUCH_KEY_IN0		43
+#define RMIO_TOUCH_KEY_IN1		44
+#define RMIO_TOUCH_KEY_IN2		45
+#define RMIO_TOUCH_KEY_IN3		46
+#define RMIO_TOUCH_KEY_IN4		47
+#define RMIO_TOUCH_KEY_IN5		48
+#define RMIO_TOUCH_KEY_IN6		49
+#define RMIO_TOUCH_KEY_IN7		50
+#define RMIO_SAI0_MCLK			51
+#define RMIO_SAI0_SCLK			52
+#define RMIO_SAI0_LRCK			53
+#define RMIO_SAI0_SDI0			54
+#define RMIO_SAI0_SDI1			55
+#define RMIO_SAI0_SDI2			56
+#define RMIO_SAI0_SDI3			57
+#define RMIO_SAI0_SDO			58
+#define RMIO_SAI1_MCLK			59
+#define RMIO_SAI1_SCLK			60
+#define RMIO_SAI1_LRCK			61
+#define RMIO_SAI1_SDI			62
+#define RMIO_SAI1_SDO0			63
+#define RMIO_SAI1_SDO1			64
+#define RMIO_SAI1_SDO2			65
+#define RMIO_SAI1_SDO3			66
+#define RMIO_SPI0_CLK			67
+#define RMIO_SPI0_MOSI			68
+#define RMIO_SPI0_MISO			69
+#define RMIO_SPI0_CSN0			70
+#define RMIO_SPI0_CSN1			71
+#define RMIO_SPI1_CLK			72
+#define RMIO_SPI1_MOSI			73
+#define RMIO_SPI1_MISO			74
+#define RMIO_SPI1_CSN0			75
+#define RMIO_SPI1_CSN1			76
+#define RMIO_WDT_TSADC_SHUT		77
+#define RMIO_PMU_SLEEP			78
+#define RMIO_CORE_POWER_OFF		79
+#define RMIO_SPDIF_TX			80
+#define RMIO_SPDIF_RX			81
+#define RMIO_PWM1_BIP_CNTR_A0		82
+#define RMIO_PWM1_BIP_CNTR_A1		83
+#define RMIO_PWM1_BIP_CNTR_A2		84
+#define RMIO_PWM1_BIP_CNTR_A3		85
+#define RMIO_PWM1_BIP_CNTR_A4		86
+#define RMIO_PWM1_BIP_CNTR_A5		87
+#define RMIO_PWM1_BIP_CNTR_B0		88
+#define RMIO_PWM1_BIP_CNTR_B1		89
+#define RMIO_PWM1_BIP_CNTR_B2		90
+#define RMIO_PWM1_BIP_CNTR_B3		91
+#define RMIO_PWM1_BIP_CNTR_B4		92
+#define RMIO_PWM1_BIP_CNTR_B5		93
+#define RMIO_PDM_CLK1			94
+#define RMIO_ETH_RMII0_PPSCLK		95
+#define RMIO_ETH_RMII0_PPSTRIG		96
+#define RMIO_ETH_RMII1_PPSCLK		97
+#define RMIO_ETH_RMII1_PPSTRIG		98
+
+#endif /* __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H */
-- 
2.34.1


