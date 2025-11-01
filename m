Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB63ACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbUnTVyO0ZVrDHc7pbuKAoub8U3vQra7VrlCIauAjYU=; b=WpuLG7XlRa7jjJB4Ob5S9mhbfm
	V6JDYUFGmJ+mpoXKg0ZJePkIkI5eD6pkgb14NdOyZCSekP4X1gENncNMWduh/xQhXeYKSCxNb4eiu
	S0FK6nqW/QYx/dD67iLYCKl8F+MlyOVnhAArbBN3RQYmApZ0qLQD13LSH/6h2otumcwiOX00lCiNk
	c6C+iAW8YtgOfRe0iXGqHEwaih3InMLYoqRPjeAam5hcY+pewMR/cAlxH11QNZgZ4UYbtTgloH2nb
	26p5nRqVZtDx2Q5S84/PxjusmgWotjOMpk7ZMmotSZOWUhZqJdK3xBAHZy+GkZUkq9qrtmzNxYLj6
	Yr8PKI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBja-00000007mxC-2i6a;
	Sat, 01 Nov 2025 13:33:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBjF-00000007mFK-16vW;
	Sat, 01 Nov 2025 13:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762003980;
	bh=ZDZDYWQ0pBb006s9WoF4BubE2PEuT8OM2W2BmbduJzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nh2aYfQiFcRIetufBWS4vqK2KujifLFy12b1CPMyEOtcoYhLE/xrV5Z+8TBe2ka1Y
	 tbkq5j9dPw+LmwO5l3yr0d8wgLaMh5I8BDq0dWngGXFhKtZQMp+hSKQJ2h5HIwJ8FL
	 89c5YvH3G2+WvzansquvT24h55dufBJ440yPgy5QvlS2W/E2J8Gb4YfucZnT/zJNyG
	 1KFlTc05ffnK2Yg0admBEDga9+t+9okKrtOpkkzwi7Iq8Ulyxgmnl1nC5XSm8GRNVi
	 Z+J0ig2rqLRqsLHepcS1MLKLb/tmbTbIRkjWu1JCKlOcw8BuM0wZn4C3qAwBr72z9o
	 r9SWVNNmJ+4lA==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9FB817E35CB;
	Sat,  1 Nov 2025 14:32:59 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id BF4D510E9D03E; Sat, 01 Nov 2025 14:32:58 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 01 Nov 2025 14:32:56 +0100
Subject: [PATCH v2 11/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-openwrt-one-network-v2-11-2a162b9eea91@collabora.com>
References: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
In-Reply-To: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
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
X-CRM114-CacheID: sfid-20251101_063313_634363_32E3DC9A 
X-CRM114-Status: GOOD (  11.99  )
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

Enable the Ethernet subsystem on OpenWrt One board with dual-MAC
configuration:
- GMAC0: Connected to external Airoha EN8811H 2.5GbE PHY via SGMII
  (2500base-x mode) for WAN connectivity with LED indicators
- GMAC1: Connected to internal MT7981 1GbE PHY (GMII mode) for LAN

Ethernet aliases are defined to provide consistent network interface
naming (ethernet0 = LAN, ethernet1 = WAN).

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V1 -> V2:
  - Switch gmac0 phy irq to Level
  - Update mac nvmem label name
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 183e48d985ed7..90edb9f493c6d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -3,6 +3,8 @@
 /dts-v1/;
 
 #include "mt7981b.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "dt-bindings/pinctrl/mt65xx.h"
 
 / {
@@ -10,6 +12,8 @@ / {
 	model = "OpenWrt One";
 
 	aliases {
+		ethernet0 = &gmac1;
+		ethernet1 = &gmac0;
 		serial0 = &uart0;
 	};
 
@@ -41,6 +45,58 @@ reg_5v: regulator-5v {
 	};
 };
 
+&eth {
+	status = "okay";
+
+	/* WAN interface */
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		nvmem-cells = <&wan_factory_mac 0>;
+		nvmem-cell-names = "mac-address";
+		phy-mode = "2500base-x";
+		phy-handle = <&phy15>;
+	};
+
+	/* LAN interface */
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "gmii";
+		phy-handle = <&int_gbe_phy>;
+	};
+};
+
+&mdio_bus {
+	phy15: ethernet-phy@f {
+		compatible = "ethernet-phy-id03a2.a411";
+		reg = <0xf>;
+		interrupt-parent = <&pio>;
+		interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pio 39 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <20000>;
+		airoha,pnswap-rx;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				function = LED_FUNCTION_WAN;
+				color = <LED_COLOR_ID_AMBER>;
+			};
+
+			led@1 {
+				reg = <1>;
+				function = LED_FUNCTION_WAN;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+		};
+	};
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
@@ -132,6 +188,10 @@ partition@180000 {
 	};
 };
 
+&sgmiisys0 {
+	mediatek,pnswap;
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.51.0


