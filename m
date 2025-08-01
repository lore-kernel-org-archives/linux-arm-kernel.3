Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF607C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyCtBthOa4/en76MJdLouuLqRL/ucaS7sXV6V94hGBM=; b=ZBjgxZEUfdoCwGXPmhF3njIhsg
	ZGdxVceTxdnEKasul5x7FSL0nfavHYfY41F8FJab770YaGKlW29wSuDXp7yKqvJsV/daGna5UwHeP
	jz3T4qlJiQZrmj3mieM6CJ6zOLCySKV/MIbXrBe3HS9IXcdR7ODJCRMB1iVEPbtnMbsFhNie1f2Ig
	McPRKP/8Mpo0OAXMpHMgdOSZ+ta2t/pM0EXzkuy8VgXcONmhIUjOmpo8HoQDKGNZsZfTXy3QDGXx+
	RfY4Pc63hZ+Wdy+e4D49px614cCNOw6TrvQwyFRfh12O95BKen4UsLb62joxsyPy+mBh9eQEFKIDT
	0j4zGHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpnG-000000066jq-37XB;
	Fri, 01 Aug 2025 13:27:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpd2-000000065X6-17ga;
	Fri, 01 Aug 2025 13:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054214;
	bh=8dchQqi4TIXOkNjmPENd+y2u2n3RjTnFEQP+olfB+Xs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRHanWdpElEYhuQM6x/oecXJEwYMmV3QA5K+YiepFDMRKXLxMZIxmDjTzUk/J/RbJ
	 R1Kd0VxPCYsgLdrLk+DJCh9USPbSP4J7wsD3EBJ53Eau6pstXjomdV9zzeK+O6O7Hw
	 NMUjQS+3HLw5joqFVz5K6r6ppXNkXAZC3IhKiv6XWCt9I+uCbrEAbEjptxkqE7cESL
	 Xzd3ZKtE7qSqdxFTFassl3WwCGEmg0V1bAubUnjcGVeahR+bt7TcuFIRYHiWBRdfD4
	 q+cs6V0ejX8zYqZ54U0S8/NQlRGM8gRiFTb4F5pzU7F3S50WRwZrWhRCppv6McA3LR
	 1AXz6yZRzfpqw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53A5917E129D;
	Fri,  1 Aug 2025 15:16:54 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 15:16:51 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support for
 blue and red LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-3-d0840f85d2c8@collabora.com>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_061656_457833_A385892A 
X-CRM114-Status: GOOD (  11.46  )
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

The Radxa NIO 12L board has an RGB LED, of which only red and blue
are controllable.

Red and blue LEDs: no need to choose, both are enabled.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index fd596e2298285361ad7c2fb828feec598d75a73e..12288ad4d2932b7f78c96c0efe366a046721f919 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
 #include <dt-bindings/spmi/spmi.h>
@@ -73,6 +74,28 @@ button-volume-up {
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&gpio_leds_pins>;
+		pinctrl-names = "default";
+
+		/*
+		 * This board has a RGB LED, of which only R and B
+		 * are controllable.
+		 */
+		led-0 {
+			label = "rgb-blue";
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			label = "rgb-red";
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -647,6 +670,14 @@ pins {
 		};
 	};
 
+	gpio_leds_pins: gpio-leds-pins {
+		pins {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>,
+				 <PINMUX_GPIO7__FUNC_GPIO7>;
+			output-low;
+		};
+	};
+
 	i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,

-- 
2.50.1


