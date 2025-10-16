Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE37CCCD19E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy22bcrCdRWaGHNiZCW8QeRRCExd7BelSd/I1HEJOb4=; b=RcRT55DENaH5z0F3zWwZQc7m6B
	k+Hq+hE48ReCmkJSMf22MPBRuZ41dron/TDAZbxcZlxx3d0jECpHNFJSj1Dj9DHezsg8HdBxacPmT
	iApql1bJ5uho+8gMPMmQ+1Ny5oeFo1WPUySo6Kzuv+N0hReFSZ/75pt9mSJBNKdA459KPPc70wE1j
	hqVLT4hKAY/hNVZ4Y8NCrDMGEl7sUVEORcvxkD7xVltm/x3MGv0NbhA87Mv0ehucJyuS0hVvSfA+g
	0KUDct/jYoqzpiLaTZk3xx8hM3/9tslmKbSNwIl4maTdF1pgLzclDWWjHVYAsdqwPHxwr0x1A4sPf
	3DmYWLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KvI-00000004LWj-1KdV;
	Thu, 16 Oct 2025 10:09:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kux-00000004L24-010U;
	Thu, 16 Oct 2025 10:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hy22bcrCdRWaGHNiZCW8QeRRCExd7BelSd/I1HEJOb4=; b=IUAlT1tOu6oQD/9A3bTFRO7rKH
	hK3YRIDRJqqRaWRRc4DqT5KzY+gyjXErtpPp9MoUQDEmF9hiPwXHLl9f76xTn0I+MIY/HvWgBTeud
	CzIOt1n+hwryfYstQGeJJWiOIASXaj+qB3523ITEN34ew60gH4yBCWGuGTSW5OmpEhh9RyyJrKzke
	fhAXvtKdirbGClEyiSQb6Y1MuUsHYtnybwhd6DoQ6cmGXSYOtSuQ4yj3SYNa0k2kiILbyQ2RsWGiq
	gOhm7EHZAXxn5FCJad1GLxpr1gGqaDWNYDFneD8HRGUOTMD/gTMHHNg2jE5iBloxLrDl93qNEuCiq
	dkL90yeA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kut-00000006f63-0KGL;
	Thu, 16 Oct 2025 10:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760609334;
	bh=afFY8d06YR6Xe0mRxobtGmvJrl4DTV7aEVRQ2QIq/r0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oSGfSCm7mQgqcQGeuEt+uG+gb/EysmochzTYczJ3QIPFUONJmMI5FOikniJx6xgzw
	 STcVwsER77GIwib1IMca9+yNoWn56micy/WqUP/4kTfpz9R7JRGOvi0SOeIphvJvdO
	 TKkvODvOKj4wpDqJD0pTiK1fRD7pOjVe8MJZ6kwN8+3nZy9HlYALXefetLijoKsbqd
	 hf4Auh4Eh8GrYKRF7fClm1FIlqIoCVSObAnVNM9JBuxJCfKjGw4q/aT/HRQNhf0p4P
	 p+w89q4zVfW+sk/a4yri5BwR4aZUzs651OLvdTAM/4Kxk2//0UTxZi2TQzKjU7vYkc
	 G2enIYaziYT7w==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC97117E1412;
	Thu, 16 Oct 2025 12:08:54 +0200 (CEST)
Received: by beast.luon.net (Postfix, from userid 1000)
	id BEC0B10C9C796; Thu, 16 Oct 2025 12:08:53 +0200 (CEST)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Thu, 16 Oct 2025 12:08:47 +0200
Subject: [PATCH 11/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 SPI NOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-openwrt-one-network-v1-11-de259719b6f2@collabora.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
In-Reply-To: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
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
X-CRM114-CacheID: sfid-20251016_110903_793194_50B0803E 
X-CRM114-Status: GOOD (  11.71  )
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

The openwrt one has a SPI NOR flash which from factory is used for:
* Recovery system
* WiFi eeprom data
* ethernet Mac addresses

Describe this following the same partitions as the openwrt configuration
uses.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index b6ca628ee72fd..9878009385cc6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "mt7981b.dtsi"
+#include "dt-bindings/pinctrl/mt65xx.h"
 
 / {
 	compatible = "openwrt,one", "mediatek,mt7981b";
@@ -54,6 +55,25 @@ mux {
 		};
 	};
 
+	spi2_flash_pins: spi2-pins {
+		mux {
+			function = "spi";
+			groups = "spi2";
+		};
+
+		conf-pu {
+			bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			pins = "SPI2_CS", "SPI2_WP";
+		};
+
+		conf-pd {
+			bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			pins = "SPI2_CLK", "SPI2_MOSI", "SPI2_MISO";
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
@@ -62,6 +82,69 @@ mux {
 	};
 };
 
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2_flash_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x00000 0x40000>;
+				label = "bl2-nor";
+			};
+
+			partition@40000 {
+				reg = <0x40000 0xc0000>;
+				label = "factory";
+				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					eeprom_factory_0: eeprom@0 {
+						reg = <0x0 0x1000>;
+					};
+
+					macaddr_factory_4: macaddr@4 {
+						reg = <0x4 0x6>;
+						compatible = "mac-base";
+						#nvmem-cell-cells = <1>;
+					};
+
+					macaddr_factory_24: macaddr@24 {
+						reg = <0x24 0x6>;
+						compatible = "mac-base";
+						#nvmem-cell-cells = <1>;
+					};
+				};
+			};
+
+			partition@100000 {
+				reg = <0x100000 0x80000>;
+				label = "fip-nor";
+			};
+
+			partition@180000 {
+				reg = <0x180000 0xc80000>;
+				label = "recovery";
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;

-- 
2.51.0


