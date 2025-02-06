Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B11CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALjLr5LQJBg8oWtV2iSIYIw7m88sAth7bWlzA7dd5ic=; b=C/QD+1FYbk2ITkXCDW1iXrWMPB
	+7T+xHosGro1pQ36pLNxys2EdeIe4GeTfcOrdgj6GP6pCirJgiL1/AI0CGFoPTtldftGOdIju8EN7
	1/agQu8cNngFOcXg+fCes3is/HISoMSCY+N0oGQFaF9k27Q43vpESyx+x7ZC9ks8mmzkDnUaY7CqC
	Mvz6eLY/hT33HmUH1ss5TMQqeXSGiuhulbt/JY4Bj9Bqm7h4AWo34BXHlSQLZL6hblr271TSVlDA+
	BJ34uHK8Z5tZ26UMp/IOZj/xG+PMzI4HQ+M8hjiGDzNxdTwVx8vSEgicUxRpVdnsP9LBYrIbnyxxA
	E8gJW+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsHC-000000056xU-02eR;
	Thu, 06 Feb 2025 03:10:02 +0000
Received: from mail-m15580.qiye.163.com ([101.71.155.80])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsBq-000000056G3-2lSi;
	Thu, 06 Feb 2025 03:04:32 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a47c7ae0;
	Thu, 6 Feb 2025 11:04:25 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 2/2] arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
Date: Thu,  6 Feb 2025 11:03:30 +0800
Message-Id: <20250206030330.680424-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206030330.680424-1-damon.ding@rock-chips.com>
References: <20250206030330.680424-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5IT1YeT0pISR5IGU1NGk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d937469e03a3kunma47c7ae0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6LSo*LTIXDglRIyE4OSIx
	GC8KCgNVSlVKTEhDQ0pKS01MT05KVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS09PTDcG
DKIM-Signature: a=rsa-sha256;
	b=GENeDPoyFO6pS8oONqgmVNflZ0awTgRfnBRZK3vHQWOuZ66JRIW32g7XRkzs3d0IC9UNUe93bWwe6R+na1/BWFOWlyLwuJnbsspjCwnjgV3ypYMa+55ew2hPpAYm2g/Z9NtboOPWoXcY/RohHV3EimpiAAi/mbdAzuGCAlV2HCY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ALjLr5LQJBg8oWtV2iSIYIw7m88sAth7bWlzA7dd5ic=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_190430_924648_D3E8B95E 
X-CRM114-Status: UNSURE (   9.07  )
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

The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
and eDP Link. Therefore, it is better to name it hdptxphy0 other than
hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi                 | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts     | 2 +-
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts                | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts              | 2 +-
 20 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce7..ebdd7c0a76b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1385,7 +1385,7 @@ hdmi0: hdmi@fde80000 {
 			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
 		interrupt-names = "avp", "cec", "earc", "main", "hpd";
-		phys = <&hdptxphy_hdmi0>;
+		phys = <&hdptxphy0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
 			     &hdmim0_tx0_scl &hdmim0_tx0_sda>;
@@ -2807,7 +2807,7 @@ dmac2: dma-controller@fed10000 {
 		#dma-cells = <1>;
 	};
 
-	hdptxphy_hdmi0: phy@fed60000 {
+	hdptxphy0: phy@fed60000 {
 		compatible = "rockchip,rk3588-hdptx-phy";
 		reg = <0x0 0xfed60000 0x0 0x2000>;
 		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX0>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 9d525c8ff725..9eda69722665 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -129,7 +129,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 92f0ed83c990..d1be72eb63a4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -166,7 +166,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index ba49f0bbaac6..3fd0665cde2c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -364,7 +364,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
index 2be5251d3e3b..e086114c7634 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
@@ -337,7 +337,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index b3a04ca370bb..8171fbfd819a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -335,7 +335,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 4791b77f3571..c8bc85b7d133 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -207,7 +207,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 90f823b2c219..ef56380530f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -303,7 +303,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cb350727d116..0d9b5020acc0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -360,7 +360,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index ce44549babf4..9baca7f9ce48 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -39,7 +39,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 255e33c5dbdc..0f874b87b47e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -125,7 +125,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d597112f1d5b..86a9f2f35e66 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -220,7 +220,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 3187b4918a30..795d8175e654 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -189,7 +189,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 9c394f733bbf..f471baca6d31 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -236,7 +236,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 4a3aa80f2226..74a4f03e05e3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -278,7 +278,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index d2eddea1840f..cd47969fadba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -251,7 +251,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index 8f034c6d494c..1463bd36b1b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -264,7 +264,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index d86aeacca238..9e16960b8705 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -197,7 +197,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index 70a43432bdc5..676cc4fec269 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -334,7 +334,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 9b14d5383cdc..bf74789e3f51 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -278,7 +278,7 @@ hdmi0_out_con: endpoint {
 	};
 };
 
-&hdptxphy_hdmi0 {
+&hdptxphy0 {
 	status = "okay";
 };
 
-- 
2.34.1


