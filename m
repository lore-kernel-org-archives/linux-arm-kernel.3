Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3D2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avlKJcLS27IiW4i/NSTPBJCPoTBFD15wkzKpbeqsTtI=; b=D29/vimvNGk5tnmwUdbSkf+wz/
	PcNs+6Vl2/BO35H4xnJthG69nShGKjrN8oZvAOxdXYnoiudZbL3pIZ2tnYBA2sP3zmXGJdQL5HV+c
	B9WamlpAsST+S1POt/Ho9cP34alSVCvramd4qlu3Nj4zZbrZXgXsTmOLZtwGfvWhNckMPHpQPzzSG
	hitIOC5i7acJWlNFG4s07Y76m5+hjSMT9+XuvAiZpeSEnhMyEw3WRvdDWvVXB3yDrqlEGVumv5836
	fxGG6WEQCmUrf3wr2s20QROxpeP9/25wLHpXEQySK+lVbVLGl+gztKFYrDJAHS9+TvQ/n3spRi5ye
	uC6KSNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkts-0000000ETzW-2GA0;
	Wed, 05 Nov 2025 21:18:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktq-0000000ETy1-0qjw;
	Wed, 05 Nov 2025 21:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377515;
	bh=bArrOhdqiPrD9jwVtY5HEE/53V3p8i0UZ8xJQqCPlD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VOReS/tBa/q6ng2Yhr2+/vUP5UB2401ugVhFf+0UORldLzyq+GXymaYL+4TyWBzbq
	 E5iJPmF4FgnRteq2+Zzs4MGmfv6KXhmt2G3qH5ETOCYYTIUARBRY6u25jdHX+O/gMo
	 RQjh+GIR3h/L5Zus48T6qNKpMtJhHs1KZ5A/r+YahUv+BbOSHCEvWT7GIIh/9XOhL7
	 6WqcFwJl8Xo3y+1LOMSyZZ/b8WZs6XemcZZkphmKBEawG5voNrNc2TjHbEBZ2Imc79
	 JR7TkSCCYcSdQkGq79iDohJaa4FfGFvVEDfMbGBBWDITlglqViL0jmLc5ieNhvCiXt
	 VgNVVQbZqGcxg==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E12A417E129C;
	Wed,  5 Nov 2025 22:18:34 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 96B5110F352DD; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:17:57 +0100
Subject: [PATCH v3 02/13] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 software leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-2-008e2cab38d1@collabora.com>
References: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
In-Reply-To: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131838_423983_A7543089 
X-CRM114-Status: GOOD (  14.52  )
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

The openwrt has 3 status leds at the front:
* red: Used as failsafe led by openwrt
* white: Used as boot led by openwrt
* green: Used as running/upgrade led by openwrt

On the back each RJ45 jack has the typical amber/green leds. For the WAN
jack this is hardware controlled by the phy, for LAN these are under
software control and enabled by this patch.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V2 -> V3: Move earlier in the patch sequence
V1 -> V2:
  - Improve commit message
  - Re-order nodes to be alphabetical
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 59 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  2 +-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 6bb98629f4536..2e39e72877301 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -3,6 +3,8 @@
 /dts-v1/;
 
 #include "mt7981b.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "dt-bindings/pinctrl/mt65xx.h"
 
 / {
@@ -21,9 +23,60 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 		device_type = "memory";
 	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_WHITE>;
+			default-brightness = <0>;
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <255>;
+			pwms = <&pwm 0 10000>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-brightness = <0>;
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <255>;
+			pwms = <&pwm 1 10000>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&pio 34 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "netdev";
+		};
+	};
 };
 
 &pio {
+	pwm_pins: pwm-pins {
+		mux {
+			function = "pwm";
+			groups = "pwm0_0", "pwm1_1";
+		};
+	};
+
 	spi2_flash_pins: spi2-pins {
 		mux {
 			function = "spi";
@@ -44,6 +97,12 @@ conf-pd {
 	};
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pins>;
+	status = "okay";
+};
+
 &spi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi2_flash_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index f00e5bf63de35..416096b80770c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,7 +94,7 @@ apmixedsys: clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
-		pwm@10048000 {
+		pwm: pwm@10048000 {
 			compatible = "mediatek,mt7981-pwm";
 			reg = <0 0x10048000 0 0x1000>;
 			clocks = <&infracfg CLK_INFRA_PWM_STA>,

-- 
2.51.0


