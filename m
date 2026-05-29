Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84564CD6E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuK6NVNMTXhBUvWleeSyVltH3yscmbFx5tnFc8nvfME=; b=WLhm3yiwhUWUmuCayKQZtaQDWp
	bjth4dJqwBtEZshhmL3gxqxuAkhN9UHzQM6wdTLOostWhlCR9UYfwiecex+NmLCmw2bTDH3oRLPPJ
	zB1S6NnvUSqYGLCMCBTmjA7ymoizbafweUT+t7/Tvo32XmBMIFIRumEN4ZK9U2kG0M1YRSobFXTC4
	NIsNiIHH900uJmCRQ1dkPO6bNdw6Sq+BATWkxDaM0Tz1QOM5hBn+B60QYSKHBFSV1vwuvoKlmunlf
	IzUJ/z7Nn85HAHJ8o7wSaO7K6MeyfE8/YBRF2mjmiZipVwvm2ToN8i9M0GKvjPRt3MIJ1XE/UcKo6
	Zg5pLnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2VC-000000089p8-0ZQk;
	Fri, 29 May 2026 19:04:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2V3-000000089jQ-18Ao;
	Fri, 29 May 2026 19:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=PuK6NVNMTXhBUvWleeSyVltH3yscmbFx5tnFc8nvfME=; b=se9JJd8dIhYf5+PzZNlR5+NIIS
	OSFW/pR74ZCSY1ZcHlcwQN+pD1YHKqEK5UZAT1HWAflAdkYkhAuxSGQWwKGqMyFlqj9J8Ci4OBURz
	134RHM2yDG7mwMGDRl8kUTrAvt2lJeP4/pL9R0VhDZWlj0YzZIV2sXlyRxR6Yow2NBaCgZGB/btr5
	0KEP/Zf7x/IngSdxe1v2XYJr+QV/A10frp/0KSi6OBGxIvoDyTKhIlJSQicstAau+Z+HO1PbdDl3b
	U71DbhiPbLflfDISvMAcTMU/yGu9G6H0xgqajWWHeSHBs3GozSVmEnGJ5JfhIX/CAvxrpZoB1PsUC
	h0MBEDuQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v4 2/5] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
Date: Fri, 29 May 2026 21:03:52 +0200
Message-ID: <20260529190355.4148175-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529190355.4148175-1-heiko@sntech.de>
References: <20260529190355.4148175-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_120405_378643_1DB229BF 
X-CRM114-Status: GOOD (  13.71  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The Radxa E20C has one USB2.0 Type-A HOST port and one USB2.0 Type-C port.

The Type-C port is conneced to a FE1.1s_QFN USB hub on the board, with its
ports being connected to the XHCI usb controller and an usb-uart bridge.

This also means, the XHCI controller can only be used in device-mode.

Add support for using the USB 2.0 ports on Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[set xhci to peripheral and add comment about the outward-facing hub]
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b32452756155..f872b8d20ebc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -134,6 +134,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 		regulator-max-microvolt = <5000000>;
 	};
 
+	vcc5v0_usb20: regulator-5v0-vcc-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_en>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vccio_sd: regulator-vccio-sd {
 		compatible = "regulator-gpio";
 		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
@@ -273,6 +285,12 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb {
+		usb_host_en: usb-host-en {
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm1 {
@@ -320,3 +338,45 @@ &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+/*
+ * The usb controller can only work in peripheral mode, as it is
+ * connected to one of the ports of an outward-facing usb hub.
+ *
+ * type_c-port (hub-input)
+ *          |
+ *       usb-hub
+ *     |         |
+ * uart-usb   usb-host0
+ *     |
+ *   uart0
+ */
+&usb_host0_xhci {
+	dr_mode = "peripheral";
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.47.3


