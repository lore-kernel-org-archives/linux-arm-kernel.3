Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18551C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRTzvywCoM+SKDtOtAhP6jEOQLJQN9iekyLDEuugxY0=; b=haYnvKiE1Y6eN9HsWJwUWoy+he
	kfABxpWxCNN4zJ+0vC1xHs1jtIo/VPQ9jev16BLwIKD1eurkJq2kyncuC56zDpK0Q3lddVVIi3e4e
	EosAp4UmAwBFLDmsXYnyinViGhRXOgN9jW9s3DEVeDtB1no6AQM+J947A03Gz+O8X37kZKssLP6Ag
	oVXYFh6OPZVmXalVOmsIjENeytEMW58izglA6FNCNludL25WLtjTVTm6Ddy/7DU2XmcZrXYY+kOmr
	GA0vyjSFESJjZjCwjqUDwPv5dBXo9UyZUBbsKtd+S3mzgh8VENkU3dPfi5QvEjfaZfSci3lUoEXPb
	3pTzUwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4XK-00000000UWM-18ks;
	Thu, 20 Feb 2025 11:16:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4RO-00000000SxK-2tXX;
	Thu, 20 Feb 2025 11:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740049801;
	bh=CgnTh2SgXWfWMsbA62uV8poLmBzORUJLbZLqZihFI3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUIefjQKKUvm5ZQ6wRnlU7fYJLC3zcRmYt3Vl+aYKLx6yw5+uy8VskdXG7J/8Qk96
	 dY1woKR2wsWtDL9ce3urS9YqSdr0QSBwCF7LUQih0XKK6j/xLSA+QBcocB4Nk7ez0E
	 kMUrTklbsJCgApVPVyKqRw9J+CmA6a7a3a0970SRAogrfeYULhQvQzFkrrlCbhBxkH
	 jKsX0Dgs/8OHnbKmIfUHTFB7UlN+LI5FoBeYrcMkLJwSz7EoxjhN0cnjK9DIPbq/LB
	 i86WydurZ2F8O6irQ3gC5UzuFwlKXNjJ/iI6a3HdF0bpm5RITVokmgUDnVnca5hA6L
	 zLtIOdNxb0BtA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7499517E156B;
	Thu, 20 Feb 2025 12:10:00 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 3/4] arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
Date: Thu, 20 Feb 2025 12:09:47 +0100
Message-ID: <20250220110948.45596-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_031002_898363_7D82648F 
X-CRM114-Status: GOOD (  10.64  )
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

The base SoC devicetree now defines a display controller graph:
connect the board specific outputs (eDP internal display, DP
external display) to fully migrate Cherry and make it finally
possible to make Chromebooks and other board types to coexist
without per-board driver modifications.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 155 +++++++++++++++++-
 1 file changed, 148 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index faed5c8bc721..c5254ae0bb99 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		dsi0 = &disp_dsi0;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
@@ -273,14 +274,27 @@ dsi_panel: panel@0 {
 
 		port {
 			dsi_panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
+				remote-endpoint = <&dsi0_out>;
 			};
 		};
 	};
 
-	port {
-		dsi_out: endpoint {
-			remote-endpoint = <&dsi_panel_in>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
 		};
 	};
 };
@@ -296,12 +310,74 @@ &disp_pwm1 {
 	pinctrl-0 = <&disp_pwm1_pins>;
 };
 
+&dither0_in {
+	remote-endpoint = <&postmask0_out>;
+};
+
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&ethdr0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			ethdr0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&vdosys1_ep_ext>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			ethdr0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&merge5_in>;
+			};
+		};
+	};
+};
+
+&gamma0_out {
+	remote-endpoint = <&postmask0_in>;
+};
+
 &dp_intf1 {
 	status = "okay";
 
-	port {
-		dp_intf1_out: endpoint {
-			remote-endpoint = <&dptx_in>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			dp_intf1_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&merge5_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			dp_intf1_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dptx_in>;
+			};
 		};
 	};
 };
@@ -394,6 +470,35 @@ &i2c6 {
 	status = "okay";
 };
 
+&merge5 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			merge5_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&ethdr0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			merge5_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dp_intf1_in>;
+			};
+		};
+	};
+};
+
 &mfg0 {
 	domain-supply = <&mt6359_vproc2_buck_reg>;
 };
@@ -513,6 +618,10 @@ flash@0 {
 	};
 };
 
+&ovl0_in {
+	remote-endpoint = <&vdosys0_ep_main>;
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
@@ -1029,6 +1138,14 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&postmask0_in {
+	remote-endpoint = <&gamma0_out>;
+};
+
+&postmask0_out {
+	remote-endpoint = <&dither0_in>;
+};
+
 &sound {
 	pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
 			"aud_etdm_spk_on", "aud_etdm_spk_off",
@@ -1135,6 +1252,30 @@ &ssusb2 {
 	status = "okay";
 };
 
+&vdosys0 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys0_ep_main: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&ovl0_in>;
+		};
+	};
+};
+
+&vdosys1 {
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdosys1_ep_ext: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&ethdr0_in>;
+		};
+	};
+};
+
 &xhci2 {
 	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
-- 
2.48.1


