Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A57E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 03:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAtS5tAFtjz6hZ6HldahUJm+IWPmGZTig9XKH9PZYVc=; b=VhvHYnOxZ0SUwqkQdleRoav2PG
	+Uai6VDBLG5mRuV69SZH19P525YiygoWxKc8mwJNtvYIBgsIOzXWmpbEjlflAVa02g9aFvz2V4JeL
	Pax8S5mrwr0LtJivEPbSlkBPBimyYQsuPYeL8q8YQILingrb87Mhdn9sgg19vaIv4vax/nEJs+gl4
	iSEROAZEfrKBx+J06kI57AnchpgUnxUWxpyNomWJfVqEdpQQetE/T2G4FIUiHO7Rd0HzZQJKWJfOl
	0uXclXvG7Idq6wUYwpgoYa2ivc69Fo983mRPQwyJmp6chu/IKGLgK6eOZnYrPBWxHfjaZo5qrB7s9
	WUuLFOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1km-00000008vbe-0QOS;
	Mon, 16 Dec 2024 03:26:40 +0000
Received: from mail-m49218.qiye.163.com ([45.254.49.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1Xl-00000008tKM-1vK5;
	Mon, 16 Dec 2024 03:13:14 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5cf7993e;
	Mon, 16 Dec 2024 11:13:08 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 11/11] arm64: dts: rockchip: Add nodes related to eDP1 for RK3588
Date: Mon, 16 Dec 2024 11:12:25 +0800
Message-Id: <20241216031225.3746-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216031225.3746-1-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhkZS1YeT08eGElDT09KQkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cd7490e403a3kunm5cf7993e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhQ6NRw5EzIJSSEtFE8#QkIM
	H0swCgFVSlVKTEhPSEpDTEJLT0NCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0lCNwY+
DKIM-Signature: a=rsa-sha256;
	b=ObbzxO3ZYBIEacGgl+8dc20s4yn7Vp8x/wYPQrPif0dAonoeCtFJil9+Ju3kk7EACCANXJs8opQge2Qmy0JOtib1KTMzGtjZrQ5b4ZGRmkVnzz151+Jwy5UsLL2Qm+Oo7oKeJy+AWQ5sRRDie/jxGyMleyltACy2vhhXKV8fS5Y=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=cAtS5tAFtjz6hZ6HldahUJm+IWPmGZTig9XKH9PZYVc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_191313_684138_6A49B84E 
X-CRM114-Status: UNSURE (   7.47  )
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

The related nodes are hdptxphy1_grf, hdptxphy1 and edp1. And the
aliases edp0 and edp1 are added to separate two independent eDP
devices.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 0ce0934ec6b7..17cc0b619744 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -7,6 +7,11 @@
 #include "rk3588-extra-pinctrl.dtsi"
 
 / {
+	aliases {
+		edp0 = &edp0;
+		edp1 = &edp1;
+	};
+
 	usb_host1_xhci: usb@fc400000 {
 		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
 		reg = <0x0 0xfc400000 0x0 0x400000>;
@@ -67,6 +72,11 @@ u2phy1_otg: otg-port {
 		};
 	};
 
+	hdptxphy1_grf: syscon@fd5e4000 {
+		compatible = "rockchip,rk3588-hdptxphy-grf", "syscon";
+		reg = <0x0 0xfd5e4000 0x0 0x100>;
+	};
+
 	i2s8_8ch: i2s@fddc8000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddc8000 0x0 0x1000>;
@@ -135,6 +145,35 @@ i2s10_8ch: i2s@fde00000 {
 		status = "disabled";
 	};
 
+	edp1: edp@fded0000 {
+		compatible = "rockchip,rk3588-edp";
+		reg = <0x0 0xfded0000 0x0 0x1000>;
+		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>, <&cru CLK_EDP1_200M>;
+		clock-names = "dp", "pclk", "spdif";
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
+		phys = <&hdptxphy1>;
+		phy-names = "dp";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_EDP1_24M>, <&cru SRST_P_EDP1>;
+		reset-names = "dp", "apb";
+		rockchip,grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp1_in: port@0 {
+				reg = <0>;
+			};
+
+			edp1_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	pcie3x4: pcie@fe150000 {
 		compatible = "rockchip,rk3588-pcie", "rockchip,rk3568-pcie";
 		#address-cells = <3>;
@@ -395,6 +434,22 @@ sata-port@0 {
 		};
 	};
 
+	hdptxphy1: phy@fed70000 {
+		compatible = "rockchip,rk3588-hdptx-phy";
+		reg = <0x0 0xfed70000 0x0 0x2000>;
+		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX1>;
+		clock-names = "ref", "apb";
+		#phy-cells = <0>;
+		resets = <&cru SRST_HDPTX1>, <&cru SRST_P_HDPTX1>,
+			 <&cru SRST_HDPTX1_INIT>, <&cru SRST_HDPTX1_CMN>,
+			 <&cru SRST_HDPTX1_LANE>, <&cru SRST_HDPTX1_ROPLL>,
+			 <&cru SRST_HDPTX1_LCPLL>;
+		reset-names = "phy", "apb", "init", "cmn", "lane", "ropll",
+			      "lcpll";
+		rockchip,grf = <&hdptxphy1_grf>;
+		status = "disabled";
+	};
+
 	usbdp_phy1: phy@fed90000 {
 		compatible = "rockchip,rk3588-usbdp-phy";
 		reg = <0x0 0xfed90000 0x0 0x10000>;
-- 
2.34.1


