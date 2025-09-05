Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2B5CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1H0+tH8aowTcmCbj+ABXp44J9R1eCjrHPG/cYgc/+Y=; b=PNMi8SUoI11acUGI65M3u/cuwR
	Y/7u4chQ/amT5QF2yyNNp/IRSnBW6ZjGTi5tK1OVgGMGkLT+ugLZF1GunexevmCAbZ0H5kem9Fx9Z
	HIzNUhfkCOzWU4eM8+nHyXj8Sv4iDDoRudHAy14kFjXKWLQQDPNJ3wObEEEyYDdBfAxTU8J4HIgkx
	8vzAdwGKooZEcocQzu3VylZublcpMUJdH4u/Gw8vnUqBD3VOGVUi5QMos3VG9wtGJ4OXdsD3SY/mc
	LCgAnMUU5lGQjTyZSiQjtMHdbWOL7+Q4bKxatwsiUwyAFIUhKOoKEGHs6X6lncajfw9T/CDCTqlJo
	A/yZQL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYnJ-00000002vGh-2nSb;
	Fri, 05 Sep 2025 15:56:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUzA-00000001UjD-3q0P;
	Fri, 05 Sep 2025 11:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757073127;
	bh=zIcPzz4+ZUV4cxLri5m6RzjiaeHPYd2Q0gnoN2653mA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n/5wTmOJizcJeU4glq9D89n5nNLNFkbZpRFaDOEH34cQ50NB3U7c1CU0/O7JwaNTA
	 3Tt+eCqbDpu5MR4mScsm9u8LtOv5L/G/8INm66hPFwxrp18SuBwA+BdeNhx2bIKJRo
	 VV1EIuzzgtiQ6xmiHuutnDmFJ1TcHf7G1N9MBe+E0+qfRTB9tMNRo8uXIez0Mg0Slz
	 0SUKxGqewoDknKev/GpFeDBSW2fsPpKhadKKBn0YIO/wRqhkc78QPzA9jiGd0ue0T9
	 LGgxDyuSfyMbaHCd/k0Amvp0oE8PtmATzKMD7Wfm26Vjr5AyJNV/2Y+1Q4fwTvcWrx
	 J1JXqIApbA5VQ==
Received: from localhost-live.home (2a01cb0892F2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FE6017E12BA;
	Fri,  5 Sep 2025 13:52:06 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 05 Sep 2025 13:52:00 +0200
Subject: [PATCH v3 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-radxa-nio-12-l-gpio-v3-3-40f11377fb55@collabora.com>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
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
X-CRM114-CacheID: sfid-20250905_045209_100195_FE80C440 
X-CRM114-Status: GOOD (  11.03  )
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
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index fd596e2298285361ad7c2fb828feec598d75a73e..0ea36e7c960fc0b2607833d743c5e2e806864600 100644
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
@@ -73,6 +74,26 @@ button-volume-up {
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
+		rgb-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	wifi_vreg: regulator-wifi-3v3-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wifi_3v3_en";
@@ -647,6 +668,14 @@ pins {
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
2.51.0


