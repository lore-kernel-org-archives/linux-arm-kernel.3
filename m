Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D20FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX63OyLy843bMJU2Vw7R714gkAf6ineUAbu3ZUG0cdE=; b=S+mMzTs8iA8/edTg0nVTdp/2ff
	Z7BeiC4HZFnvsYmOxsWhRWFNUIyq0WHWTM75O8PTm67X8N8oAVWfrmwbA/9EuG97tjqgjq4+eDh9v
	3R0kd1wPDjm88iYV48uEhrh3AyjpMFuWiaLPmIoa93gxjT5tf4JdvEhPF27L/w11t2qM9l6M+Yi9I
	6GlxvBQG5ofK/zw697UKorXkk765KmWHJZASlGXDz3b/kMxfaAZQcxfLOUnhjJ207t7deaoYDVMrx
	D5qDjMAAV90GcVNv6vZw5H6s+S7HYsGAZaf1xFliQDyAkiXhsZEGNAldQiZQvYTdyHDk7gA/lC85q
	nNdTspuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGku4-0000000EUHA-46dR;
	Wed, 05 Nov 2025 21:18:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktu-0000000ETzx-2I9Z;
	Wed, 05 Nov 2025 21:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377516;
	bh=l3tEWhRqP4lk80hQap0vJX2rjpGnZh5LT9KfShignVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RZt8bfUA3x1BMPbp6nkMXKDVBZsmSqC8Cr6yQf9Bmt2Dn+/fwoSYvUgfRuREfi7tC
	 Q/Q8f7iMK8cG1uT2ybpCwmTx6q0+56XFN+FUXpTwPkiJMlqFbUFh6CDhq3d/Sb3pYd
	 0khH4Qat4TIVxrmiUAmDbJPZJT6v44l65FEstFParsZO2eah/zNv3Ok8LrSTZFrPLT
	 QOlF3l0Ffm4b5G93+j/mYrVhX1W2ZC5PZDl3BBzk01fwCQCSA3FY8u3Pgkmvk7bXAF
	 cQY9ji73EbfDjeSbnSNsBMHmBoCAp688kMuyKVrKb17vGX9Deq5zuP796vQziSjtIf
	 lHPsXdw8w/mGw==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3395417E14FF;
	Wed,  5 Nov 2025 22:18:36 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id D51B210F352F3; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:18:08 +0100
Subject: [PATCH v3 13/13] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 wifi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-13-008e2cab38d1@collabora.com>
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
X-CRM114-CacheID: sfid-20251105_131842_784749_B7C916F9 
X-CRM114-Status: GOOD (  12.16  )
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


