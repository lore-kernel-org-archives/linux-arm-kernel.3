Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8CDCCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGCX3mgdLYE3ZtU21iczIBrppRvsmuNEB9MXEkOTjzE=; b=RMWO7PYmTiAmMCYVu1N3+Zyzty
	X5WPZqo1DAg2G9q6P40oJAJlkfna3Hz62PJYgzAYDUydGlcCZWgu98bkHOsjvI1P+Qiup3Z0BrO/h
	FL+uHi3gFEMlA8twNe+SzY8psTM4ydvQ+4gLaQ3bLIVrhz4PsszUVLTfkRvDwvBjmNmPjIKsXlBJi
	VHrq/k1n7K7RL2Z9go+778nZFVQa2vtKNAMwGFxMlWiRQhuVzofqYh+ik1zJ1QKKa3tQYol8SZuWu
	xw+oDI6sQZ0NqzZG+HlS9SEgK+wfw3TyGCmpKkFai35UbFI7k3SVakFEb2vb6rzi7FNuMs8iNJCZ+
	auGLGVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGku9-0000000EUOj-3Gay;
	Wed, 05 Nov 2025 21:18:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktu-0000000ETzZ-10Ek;
	Wed, 05 Nov 2025 21:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377515;
	bh=8iJNPpI85EcL2zA7omSQYgyHFc03BY1+Hwd6GqmpZ7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bhcUswclG/V7+nJL9BrqpvNYkBM0psesnDqRq4okPos7i3GdGONTy0afA68KlTBYl
	 zpMIv8lqWjOkFGB3cGxu5HSPs4wGpRySiOTO6Rc3Zaz3r+M/Xmasu82dcfGbvYc0za
	 DS59SGV8KrRBldu6YfMedk/I+R3jD5xdRQwb5RWuwM52ePJZCjHxyJnlN7lc7F7oej
	 YKuwFLLB2CaQPDm4h67Kqrd6o+IkWXx61A0SevTi6yc4fDg5Z7k393cfyU++BRjjdE
	 /w2GvFBsr6KtHHMcS+sog8i4wMR48Uw2+7jiNyhYttvT82m0pxA32Vbotz4MPtu175
	 eAxrkt5hWJEBQ==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8797817E1416;
	Wed,  5 Nov 2025 22:18:35 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id C315110F352ED; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:18:05 +0100
Subject: [PATCH v3 10/13] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-10-008e2cab38d1@collabora.com>
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
X-CRM114-CacheID: sfid-20251105_131842_555266_32BA2742 
X-CRM114-Status: GOOD (  12.02  )
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
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 7382599cfea29..2aea899006453 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -12,6 +12,8 @@ / {
 	model = "OpenWrt One";
 
 	aliases {
+		ethernet0 = &gmac1;
+		ethernet1 = &gmac0;
 		serial0 = &uart0;
 	};
 
@@ -87,6 +89,58 @@ reg_5v: regulator-5v {
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
@@ -191,6 +245,10 @@ partition@180000 {
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


