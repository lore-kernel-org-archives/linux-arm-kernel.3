Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FE0F01834
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oLQK3K1u/LQIFMEvz6NyX8bZuv/C7XzIhoI4ItTIkY=; b=4FBoifgF7qfGGfHuJavbKRUbO3
	Ywyo/8Ck+zO0DVLiKR242aB0kE5dXHQs6eteFzvMsSC2tzqtOz6vescewE4WH1x6BaJq+srPXckzk
	9w3FzZmYWRIRp+PatDz5EYlNkmiBXAtlTsnj0GJcMeA6JWIKQg8ZBqq/oKdKVeq/sRc4Vz8XPh/jV
	q4muvcXrECYeDMqpwlQyYZ3JTggEamsD5WzxbfvqLloe9+s4FhuNxf0UAufDl6YCqiamsaJPGDhDL
	XMciwbiwEDSiAZSrgkwuIcMKtI6XjZa2zQhUEyt1k8QswOxfqTd7AoboD6Le7GJtJrZHEvNLJF6sd
	mEwJAgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUhL-00000003hJm-3FRO;
	Fri, 06 Mar 2026 12:54:31 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUhI-00000003hFv-2Xhd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:54:29 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 20:54:21 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 20:54:21 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 6 Mar 2026 20:54:08 +0800
Subject: [PATCH RFC v2 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc1-pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260306-pinctrl-single-bit-v2-2-79918cfab641@aspeedtech.com>
References: <20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com>
In-Reply-To: <20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772801661; l=10309;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=9YoaDc4MTY1miTm6XRQY4DQNEaLG7/OOW3BpDR1VbAk=;
 b=GZXMIXLes3KepDLW3OwtIQXgkAyqYbyDJAFzH1kfQrsgnVgYNePKKA7rZj0yWABOM0WFEX/iJ
 AMEpRpKTnVABanI8YULtt366oSbzk9EDmJMoH7zx4YCDPY4B5wAlOq3
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_045428_657107_BF6ED7AE 
X-CRM114-Status: UNSURE (   8.16  )
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

SoC1 in the AST2700 integrates its own pin controller responsible for
pin multiplexing and pin configuration.

The controller manages various peripheral functions such as eSPI, LPC,
VPI, SD, UART, I2C, I3C, PWM and others through SCU registers.

The binding reuses the standard pinmux and generic pin configuration
schemas and does not introduce custom Devicetree properties.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       | 449 +++++++++++++++++++++
 1 file changed, 449 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
new file mode 100644
index 000000000000..be7e82b3e866
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
@@ -0,0 +1,449 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC1 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC1.
+
+  The SoC1 pin controller manages pin functions including eSPI, LPC and I2C,
+  among others.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc1-pinctrl
+
+patternProperties:
+  '-state$':
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - ADC0
+          - ADC1
+          - ADC10
+          - ADC11
+          - ADC12
+          - ADC13
+          - ADC14
+          - ADC15
+          - ADC2
+          - ADC3
+          - ADC4
+          - ADC5
+          - ADC6
+          - ADC7
+          - ADC8
+          - ADC9
+          - AUXPWRGOOD0
+          - AUXPWRGOOD1
+          - CANBUS
+          - DSGPM1
+          - ESPI0
+          - ESPI1
+          - FSI0
+          - FSI1
+          - FSI2
+          - FSI3
+          - FWQSPI
+          - FWSPIABR
+          - FWWPN
+          - HBLED
+          - I2C0
+          - I2C1
+          - I2C10
+          - I2C11
+          - I2C12
+          - I2C13
+          - I2C14
+          - I2C15
+          - I2C2
+          - I2C3
+          - I2C4
+          - I2C5
+          - I2C6
+          - I2C7
+          - I2C8
+          - I2C9
+          - I2CF0
+          - I2CF1
+          - I2CF2
+          - I3C0
+          - I3C1
+          - I3C10
+          - I3C11
+          - I3C12
+          - I3C13
+          - I3C14
+          - I3C15
+          - I3C2
+          - I3C3
+          - I3C4
+          - I3C5
+          - I3C6
+          - I3C7
+          - I3C8
+          - I3C9
+          - JTAGM1
+          - LPC0
+          - LPC1
+          - LTPI
+          - MACLINK0
+          - MACLINK1
+          - MACLINK2
+          - MDIO0
+          - MDIO1
+          - MDIO2
+          - OSCCLK
+          - PCIERC
+          - PWM0
+          - PWM1
+          - PWM10
+          - PWM11
+          - PWM12
+          - PWM13
+          - PWM14
+          - PWM15
+          - PWM2
+          - PWM3
+          - PWM4
+          - PWM5
+          - PWM6
+          - PWM7
+          - PWM8
+          - PWM9
+          - QSPI0
+          - QSPI1
+          - QSPI2
+          - RGMII0
+          - RGMII1
+          - RMII0
+          - RMII0RCKO
+          - RMII1
+          - RMII1RCKO
+          - SALT0
+          - SALT1
+          - SALT10
+          - SALT11
+          - SALT12
+          - SALT13
+          - SALT14
+          - SALT15
+          - SALT2
+          - SALT3
+          - SALT4
+          - SALT5
+          - SALT6
+          - SALT7
+          - SALT8
+          - SALT9
+          - SD
+          - SGMII
+          - SGPM0
+          - SGPM1
+          - SGPS
+          - SIOONCTRLN0
+          - SIOONCTRLN1
+          - SIOPBIN0
+          - SIOPBIN1
+          - SIOPBON0
+          - SIOPBON1
+          - SIOPWREQN0
+          - SIOPWREQN1
+          - SIOPWRGD1
+          - SIOS3N0
+          - SIOS3N1
+          - SIOS5N0
+          - SIOS5N1
+          - SIOSCIN0
+          - SIOSCIN1
+          - SMON0
+          - SMON1
+          - SPI0
+          - SPI0ABR
+          - SPI0CS1
+          - SPI0WPN
+          - SPI1
+          - SPI1ABR
+          - SPI1CS1
+          - SPI1WPN
+          - SPI2
+          - SPI2CS1
+          - TACH0
+          - TACH1
+          - TACH10
+          - TACH11
+          - TACH12
+          - TACH13
+          - TACH14
+          - TACH15
+          - TACH2
+          - TACH3
+          - TACH4
+          - TACH5
+          - TACH6
+          - TACH7
+          - TACH8
+          - TACH9
+          - THRU0
+          - THRU1
+          - THRU2
+          - THRU3
+          - UART0
+          - UART1
+          - UART10
+          - UART11
+          - UART2
+          - UART3
+          - UART5
+          - UART6
+          - UART7
+          - UART8
+          - UART9
+          - USB2C
+          - USB2D
+          - USBUART
+          - VGA
+          - VPI
+          - WDTRST0N
+          - WDTRST1N
+          - WDTRST2N
+          - WDTRST3N
+          - WDTRST4N
+          - WDTRST5N
+          - WDTRST6N
+          - WDTRST7N
+
+      groups:
+        enum:
+          - ADC0
+          - ADC1
+          - ADC10
+          - ADC11
+          - ADC12
+          - ADC13
+          - ADC14
+          - ADC15
+          - ADC2
+          - ADC3
+          - ADC4
+          - ADC5
+          - ADC6
+          - ADC7
+          - ADC8
+          - ADC9
+          - AUXPWRGOOD0
+          - AUXPWRGOOD1
+          - CANBUS
+          - DI2C0
+          - DI2C1
+          - DI2C10
+          - DI2C11
+          - DI2C12
+          - DI2C13
+          - DI2C14
+          - DI2C15
+          - DI2C2
+          - DI2C3
+          - DI2C8
+          - DI2C9
+          - DSGPM1
+          - ESPI0
+          - ESPI1
+          - FSI0
+          - FSI1
+          - FSI2
+          - FSI3
+          - FWQSPI
+          - FWSPIABR
+          - FWWPN
+          - HBLED
+          - HVI3C0
+          - HVI3C1
+          - HVI3C12
+          - HVI3C13
+          - HVI3C14
+          - HVI3C15
+          - HVI3C2
+          - HVI3C3
+          - I2C0
+          - I2C1
+          - I2C10
+          - I2C11
+          - I2C12
+          - I2C13
+          - I2C14
+          - I2C15
+          - I2C2
+          - I2C3
+          - I2C4
+          - I2C5
+          - I2C6
+          - I2C7
+          - I2C8
+          - I2C9
+          - I2CF0
+          - I2CF1
+          - I2CF2
+          - I3C10
+          - I3C11
+          - I3C4
+          - I3C5
+          - I3C6
+          - I3C7
+          - I3C8
+          - I3C9
+          - JTAGM1
+          - LPC0
+          - LPC1
+          - LTPI
+          - MACLINK0
+          - MACLINK1
+          - MACLINK2
+          - MDIO0
+          - MDIO1
+          - MDIO2
+          - OSCCLK
+          - PE2SGRSTN
+          - PWM0
+          - PWM1
+          - PWM10
+          - PWM11
+          - PWM12
+          - PWM13
+          - PWM14
+          - PWM15
+          - PWM2
+          - PWM3
+          - PWM4
+          - PWM5
+          - PWM6
+          - PWM7
+          - PWM8
+          - PWM9
+          - QSPI0
+          - QSPI1
+          - QSPI2
+          - RGMII0
+          - RGMII1
+          - RMII0
+          - RMII0RCKO
+          - RMII1
+          - RMII1RCKO
+          - SALT0
+          - SALT1
+          - SALT10
+          - SALT11
+          - SALT12
+          - SALT13
+          - SALT14
+          - SALT15
+          - SALT2
+          - SALT3
+          - SALT4
+          - SALT5
+          - SALT6
+          - SALT7
+          - SALT8
+          - SALT9
+          - SD
+          - SGMII
+          - SGPM0
+          - SGPM1
+          - SGPS
+          - SIOONCTRLN0
+          - SIOONCTRLN1
+          - SIOPBIN0
+          - SIOPBIN1
+          - SIOPBON0
+          - SIOPBON1
+          - SIOPWREQN0
+          - SIOPWREQN1
+          - SIOPWRGD1
+          - SIOS3N0
+          - SIOS3N1
+          - SIOS5N0
+          - SIOS5N1
+          - SIOSCIN0
+          - SIOSCIN1
+          - SMON0
+          - SMON1
+          - SPI0
+          - SPI0ABR
+          - SPI0CS1
+          - SPI0WPN
+          - SPI1
+          - SPI1ABR
+          - SPI1CS1
+          - SPI1WPN
+          - SPI2
+          - SPI2CS1
+          - TACH0
+          - TACH1
+          - TACH10
+          - TACH11
+          - TACH12
+          - TACH13
+          - TACH14
+          - TACH15
+          - TACH2
+          - TACH3
+          - TACH4
+          - TACH5
+          - TACH6
+          - TACH7
+          - TACH8
+          - TACH9
+          - THRU0
+          - THRU1
+          - THRU2
+          - THRU3
+          - UART0
+          - UART1
+          - UART10
+          - UART11
+          - UART2
+          - UART3
+          - UART5
+          - UART6
+          - UART7
+          - UART8
+          - UART9
+          - USB2CD
+          - USB2CH
+          - USB2CU
+          - USB2CUD
+          - USB2DD
+          - USB2DH
+          - USBUART
+          - VGA
+          - VPI
+          - WDTRST0N
+          - WDTRST1N
+          - WDTRST2N
+          - WDTRST3N
+          - WDTRST4N
+          - WDTRST5N
+          - WDTRST6N
+          - WDTRST7N
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false

-- 
2.34.1


