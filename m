Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880EACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkHS7KzC7a7ejpfgvPuV/t+CjfjC9KbZFBsMzO2XOcE=; b=40tj+E4Y/morwAmfquBIIH8C/l
	h8vFCo2SgpiqjID8ZN89Vn1rQYKcBw50Mamd0v6MZ6jHGWmk//rVwk9MDPMbxUVUh5W9MV1nMeHWB
	7vR20KOtkEiIvjJTU2YVEpJYOESb/al0WOhy7nNGZv9pvJGk3mZPPHHpRPnEIpZCJ2doCKlK4uiyv
	Vg5mWBcgMN6gsCP82/Cj0WQPvFeRSU3i6RY45Bsk3KQ9VKi5Yc3tBqPV1e45BD2hryS9t83f6wRo/
	Sy726MoD2yCP1wy3meou5fEqQVLa/0pozFrCs9SCGbCVzKcFN/GbKEUhhEJhWLqukuHWRsLSNuPl2
	5DE8hjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqunn-0000000CHzM-1i5M;
	Tue, 26 Aug 2025 14:37:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquFK-0000000CBay-1RF2;
	Tue, 26 Aug 2025 14:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216916;
	bh=1orjOVOBQPF16N4NkcngIDGSPWhXZVsgtixMp4piRVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WIYB6cX4ZURN1Z8+3WvjWgaAcP0G0sSFewET80YNTMTNDEodE9YPbmacm013xGVwD
	 Wu4dWex+I1eKg6q/s9SaiND/BAVXxSkTxBqwBcnXJRpAdJILEDCyzlSilLDAzc9k2r
	 xmOauOKfgJDDPmTCFe0KBk5pf9ZCQyXtQ+LN8mpRvFdEvR7UEoh2Lha8yTpFcknaia
	 k9MsO3PmYsLWPn9Db9PTEIEk/SNnrsfE0XpIVgtdP2P5g7S0MQLJuMUdn5Q72G+dqe
	 MBLeoPsNf/77dqM7Wgsv0HSTw2Dg+DatxUsy5z0i3I2ou+xNlekwQB6blwfK3I5CUj
	 naPVwQJ+Wam4A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E70C17E0C21;
	Tue, 26 Aug 2025 16:01:56 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 16:01:54 +0200
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
In-Reply-To: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_070158_571565_328DAA2B 
X-CRM114-Status: GOOD (  10.93  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


