Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5563DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWdeyxJTrSqtUy1o3BmKYAvwJUWr0TdX9o6IjFUpbIQ=; b=fDszE4bRctwfEgsHnvYxTBNf4t
	CEEKrd35CFWGvp7NiQZCWqEXve6LNP9fiZ/yXg15R6AaVGeqXYXNWJBe/D4QzcAK2gwCLk2T6pzHi
	Gtvtz3TkyajzEFGnayBflTXngDj7j3DrQRpLmN8NPGajwASfHoZzOn9gh9VeoRvRc6yN1doTENj4x
	W79sAsoBbSsiERG07oAbz1axuRH/s3Nmym5i5wYhvrkrSFViuq3HFP1MqsEfKOhbw59oUVJZbwIGT
	XDho8raXxuwOsfn0tiA+IZnGM8c5h7G0Tr7kScCXmZeKQ8WIUPoYtHjwbRB5vRievWqMAdSSRMFuQ
	akXydrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWxk-00000008B03-0hFO;
	Tue, 16 Sep 2025 14:47:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWxh-00000008Az4-1L8F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:47:18 +0000
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BBDC8D4;
	Tue, 16 Sep 2025 16:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758033956;
	bh=/dTeJXdPxUT53/ruJthxURTgDXuMrYo4Vt5Nrzhj828=;
	h=From:To:Cc:Subject:Date:From;
	b=iegQpZ/Nnu/0NTRKHBLZgQ57/302Okt9v041Ht7QjnlH8DT9U+6kRbLbND+1+tNcx
	 sXagert615SuTGfA2XlbPcR4SZw9z86g2k72Z9cq7jk8IsK+ckaCSkEwvE0mLb1ahU
	 O/sKQBPjHJul0BeJuBATD5n9UVExtcLDhsdKgj6Q=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI output
Date: Tue, 16 Sep 2025 15:47:09 +0100
Message-ID: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_074717_497240_ECD55B46 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
present in the i.MX8MP SoC.

Enable and configure all nodes required for the HDMI port usage.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---

This replicates 4880ee1c9046 ("arm64: dts: imx8mp-debix-model-a: Enable
HDMI output") to support the Debix SOM as well.


 .../freescale/imx8mp-debix-som-a-bmb-08.dts   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
index d241db3743a9..04619a722906 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
@@ -22,6 +22,18 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	reg_baseboard_vdd3v3: regulator-baseboard-vdd3v3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -222,6 +234,28 @@ flash: flash@0 {
 	};
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c4 {
 	expander0: gpio@20 {
 		compatible = "nxp,pca9535";
@@ -276,6 +310,10 @@ ethmac2: mac-address@c {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -430,6 +468,15 @@ MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x19
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x19
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL			0x400001c2
-- 
2.50.1


