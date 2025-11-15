Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3F4CEBF87
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX63OyLy843bMJU2Vw7R714gkAf6ineUAbu3ZUG0cdE=; b=UaCuieYsmoRGSXY0B2LXD/5zZ4
	5+kpMULI+0MOOSB3xaspfYSlCwc/oAeyCE1kw7KNJWBFq+7ejpm+urKeg4Sh+A4/nXvwewONoTwhl
	///Wsb9XkOJ92NLv7Wcrlf28f7dTBydsO5VqHp92Xf7ozWE1S5YPHRnmFcBiJPxOwlkwwziP0hZfd
	Mc4UUMcu9opb2BOZrF1FGxvzoh8/fveCqZO47x87RBAQAWLGLqbjlBkwAim9vliFC8s+2h+Oq8bTa
	dKO6MY+0agnLpKbZB6ShQlaiGWfLwWzLETq+bDEwzYUh7glEGlOHW6L47SESJorGsfZOZBJwnFsbJ
	TrGTmAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNMG-0000000E5VR-149t;
	Sat, 15 Nov 2025 20:58:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNM2-0000000E58i-0IDV;
	Sat, 15 Nov 2025 20:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763240313;
	bh=l3tEWhRqP4lk80hQap0vJX2rjpGnZh5LT9KfShignVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilgjpPSUMlDtGSpNEMVv3z06Af98BhAOQ0MswiSL4weOeq+OEsNFpxJcr1BcQXAzV
	 jcGlkhNxeuslcmqHhWBUfjNOEvlBz9un+WqLaKJlwi39zf6uBQMQ1yFpa9N7y6/982
	 LIfqQ8EPV9nOvXdJA6r5QbJhG6CBsDwcuqXRrZkkOk/9f/ex7ghOeTbpnc4Obp3Bhi
	 JVuwMqqvSDTvL/C1RG9KBgu54buk+6HnkGCioHGqjeXGlJooCbthCFrszSYtAffEDV
	 quXKbGwUj0NUYVSK0y71hnH7HkMOIq2b91zM5rL71rpqy+dnFy9I9VnIVKcEy3K8rk
	 b9SRJW/XnAFNA==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16F1F17E13DE;
	Sat, 15 Nov 2025 21:58:33 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 48258110527ED; Sat, 15 Nov 2025 21:58:32 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 15 Nov 2025 21:58:14 +0100
Subject: [PATCH v4 11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 wifi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-openwrt-one-network-v4-11-48cbda2969ac@collabora.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
In-Reply-To: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
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
X-CRM114-CacheID: sfid-20251115_125842_340042_B6F8A55A 
X-CRM114-Status: GOOD (  11.54  )
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

Enable Dual-band WiFI 6 functionality on the Openwrt One

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V2 -> V3: replace MTK_DRIVE_4mA with direct value
V1 -> V2: Update eeprom node label
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 2aea899006453..3de368c73bc81 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -180,6 +180,22 @@ conf-pd {
 			pins = "SPI2_CLK", "SPI2_MOSI", "SPI2_MISO";
 		};
 	};
+
+	wifi_dbdc_pins: wifi-dbdc-pins {
+		mux {
+			function = "eth";
+			groups = "wf0_mode1";
+		};
+
+		conf {
+			pins = "WF_HB1", "WF_HB2", "WF_HB3", "WF_HB4",
+			       "WF_HB0", "WF_HB0_B", "WF_HB5", "WF_HB6",
+			       "WF_HB7", "WF_HB8", "WF_HB9", "WF_HB10",
+			       "WF_TOP_CLK", "WF_TOP_DATA", "WF_XO_REQ",
+			       "WF_CBA_RESETB", "WF_DIG_RESETB";
+			drive-strength = <4>;
+		};
+	};
 };
 
 &pwm {
@@ -257,6 +273,14 @@ &usb_phy {
 	status = "okay";
 };
 
+&wifi {
+	nvmem-cells = <&wifi_factory_calibration>;
+	nvmem-cell-names = "eeprom";
+	pinctrl-names = "dbdc";
+	pinctrl-0 = <&wifi_dbdc_pins>;
+	status = "okay";
+};
+
 &xhci {
 	phys = <&u2port0 PHY_TYPE_USB2>;
 	vusb33-supply = <&reg_3p3v>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index a7be3670e0059..66d89495bac52 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -490,7 +490,7 @@ wo_ccif0: syscon@151a5000 {
 			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		wifi@18000000 {
+		wifi: wifi@18000000 {
 			compatible = "mediatek,mt7981-wmac";
 			reg = <0 0x18000000 0 0x1000000>,
 			      <0 0x10003000 0 0x1000>,

-- 
2.51.0


