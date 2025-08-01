Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2914DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9x8Ec9LqYxjlsIq9QX2+GlbJmlsFGHKebmzlUeQHiE=; b=TCO+w59hUy058GOWqCQ/rVeXwh
	sHc0yOzFGvpSa7JMNREbGZUGRWA2NwHH2YEW1/i/iSQaChYygU45PTGLVdrMjbBFvC9OPRJbydvF6
	7gTg4xqBQDm3FYZvG3ky4KhoeQXpeeY2sCgde1jXWwTVKHfeCSdfI2d17OW06t73WMzePS994XDy2
	wZZwQSDUsvM16J6s0JIXCz1Sw9dZb9dTl+WsPu9zEqMsTpWGl7YFfulXnblbo+Cz6qYAcMxnovTlJ
	tqWmwt+K4/Y85uTyTaNANuhloB4/1XjV92eVg4u2UZqmEFT77pNWv2Z1R7aHnPRbpFIYTppAADbgd
	kmG+jkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpkh-000000066Qs-2G0z;
	Fri, 01 Aug 2025 13:24:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpd1-000000065Wd-2kMY;
	Fri, 01 Aug 2025 13:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054214;
	bh=KXWB/BbVESzaULTtNNY4Nclu2iCefeG1Uv0TWkv7OIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IwsF/Bg4ucxHBGMXzMqLVvfhcy0AZ5pDjNci7u3wImdZ1heyjZ3DN593B4NCoI4ol
	 4dR5RMjjIPkPR2BgVRCtKyDOzEd4EwXKo2JNvhAn0ENhsiYDNwFMxQSDg/elCWnHgh
	 ujOaZ9qrH2+Et7Y4RpYffzJmntFEg2IOq8QFMlmg54PtBg464KCz66DxuWadduMrBp
	 PGcbh8OvvaDpdzSj6AldS3LrbjezfKUO8JhOa8BDQTHVCy427ZEUzijgDO+SM5DN+O
	 aPefURvHBuvLbJqx8jX7xMNF0IATzcTUjntWv5xAdeg+bbJIbSx4ix6lEtt6vUzhx5
	 jFI878MOtI8MA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E6DE17E0FFA;
	Fri,  1 Aug 2025 15:16:53 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 15:16:50 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-nio-12l: add PMIC and
 GPIO keys support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-2-d0840f85d2c8@collabora.com>
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
X-CRM114-CacheID: sfid-20250801_061655_840325_CADD9CEA 
X-CRM114-Status: GOOD (  12.65  )
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

Add support for PMIC and GPIO keys on the Radxa NIO 12L board:
Declare a gpio-keys node for the Volume Up button using GPIO106.
Add the corresponding pin configuration in the pinctrl node.
Add a mediatek,mt6359-keys subnode under the PMIC to handle the
power and home buttons exposed by the MT6359.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 329c60cc6a6be0b4be8c0b8bb033b32d35302804..fd596e2298285361ad7c2fb828feec598d75a73e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -8,6 +8,7 @@
 #include "mt8195.dtsi"
 #include "mt6359.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
@@ -60,6 +61,18 @@ backlight: backlight {
 		status = "disabled";
 	};
 
+	keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		button-volume-up {
+			wakeup-source;
+			debounce-interval = <100>;
+			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
+			label = "volume_up";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -626,6 +639,14 @@ pins-txd {
 		};
 	};
 
+	gpio_key_pins: gpio-keys-pins {
+		pins {
+			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
@@ -880,6 +901,21 @@ &pciephy {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6359keys: keys {
+		compatible = "mediatek,mt6359-keys";
+		mediatek,long-press-mode = <1>;
+		power-off-time-sec = <0>;
+
+		power-key {
+			linux,keycodes = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		home {
+			linux,keycodes = <KEY_HOME>;
+		};
+	};
 };
 
 &scp {

-- 
2.50.1


