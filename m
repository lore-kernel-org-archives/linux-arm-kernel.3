Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D920C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWYh9fm6kBPKsrJV4lVS1c1LXTVpalFQno6SgIQk7aY=; b=mH0Sp71QaMJgbM5TyCgn1q9VwB
	KGYuhMOikQYvhPGq4+H4EW9VJC0M50flucpIP/7KaeYhZkszwTb7fxEp3l7kOn7V3rq9JsFz/Kc5Y
	taoU32A1cEbF/2a+gtQ90b/xpu1jJKflpmaoFcZuiiHdBQOJinPoMicX66+Vxao9bYl9+nPkYgaDv
	eE2t+0hRgawQs9Hz/zMCCnLGYXb22CllyUx5+ohiX3P1o8LTylCPqp+clsK+D9Rtr7dxXRbrKd0lq
	iz8h7MA7mUnodSmtp1cCUcSZAcuySTVy8/ZLAZN1DTE6G26BGdaQL4fggyPum8S3RElvWoWseqMMf
	UHvBqv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H9X-00000007Meg-3WZF;
	Wed, 23 Sep 2026 07:12:27 +0000
Received: from mail-m8384.xmail.ntesmail.com ([156.224.83.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H9J-00000007MSw-2BYC;
	Wed, 23 Sep 2026 07:12:15 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ed74ab80;
	Wed, 23 Sep 2026 15:12:08 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 3/4] arm64: dts: rockchip: Remove cap-mmc-highspeed from SD-only slots
Date: Wed, 23 Sep 2026 15:11:37 +0800
Message-Id: <1790147498-47766-4-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa0cd1b881903a4kunm59cf9035478cc2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGkkaTFZJHh9KGBlLT0
	5MQx1WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UWWfmHzBNogVIg5kso+Ny/HYhTgJi+2o3zMX47n1fpu9N3k1oMoTp9M/OqBVQDw6kYiURNe79wFgx2SuiGy888OB3mwdXIVHdyRZrhhH3h+q8aOLyEg61BoQlt1EWkVRaK43H5arx9zPSp2LiG3LHm6zFGCdDBmQaaTSLzHx1fo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LWYh9fm6kBPKsrJV4lVS1c1LXTVpalFQno6SgIQk7aY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_001213_949914_07AA8661 
X-CRM114-Status: UNSURE (   9.22  )
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

cap-mmc-highspeed declares MMC high-speed support, which contradicts
the no-mmc property on these SD-only slots. Drop it.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts              | 1 -
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts             | 1 -
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts           | 1 -
 arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dts       | 1 -
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts           | 1 -
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi          | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 2 --
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts             | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts            | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts          | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts               | 1 -
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts              | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts         | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts            | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi          | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi    | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts         | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi           | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts             | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts           | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts        | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts     | 1 -
 arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts     | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts           | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts            | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts       | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts          | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts             | 1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts             | 1 -
 33 files changed, 34 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1a..d337f69 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -387,7 +387,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-sdio;
diff --git a/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
index 387062e..04b673a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
@@ -418,7 +418,6 @@
 	no-sdio;
 	no-mmc;
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
index fb1f65c..840de17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
@@ -500,7 +500,6 @@
 
 &sdmmc0 {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-sdio;
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dts b/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dts
index 8e5c182..34b2c0e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dts
@@ -17,7 +17,6 @@
 
 &sdmmc0 {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-sdio;
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts b/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
index a7fe5655..ce5b517 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts
@@ -597,7 +597,6 @@
 	no-sdio;
 	no-mmc;
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	sd-uhs-sdr104;
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
index e3f44ea..8bad11b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
@@ -515,7 +515,6 @@
 	no-sdio;
 	no-mmc;
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	vmmc-supply = <&vcc3v3_sd>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 358dea4..e66803b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -1134,7 +1134,6 @@
 
 &sdio {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <150000000>;
@@ -1165,7 +1164,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <150000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index 3359632..5958b39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -290,7 +290,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <200000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 4ac4465..c5b2f22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -944,7 +944,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <200000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 4c82980..f83d129 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -984,7 +984,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 227fe6f..3a30540 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -892,7 +892,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-mmc;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 0a5cd5f..7f356fd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -757,7 +757,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index 8411c16..f6bec47f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -714,7 +714,6 @@
 	no-sdio;
 	no-mmc;
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	sd-uhs-sdr104;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 272af10..f068794 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -785,7 +785,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <200000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 1005b15..48effab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -419,7 +419,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <200000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
index faeddcf..127be31 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
@@ -403,7 +403,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
index 33dacaa..48aeb22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
@@ -322,7 +322,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
index 2751f84..21a9af7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
@@ -239,7 +239,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-sdio;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
index 19598be..eb5d27b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
@@ -841,7 +841,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index eb0eb124..13be56a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -790,7 +790,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts b/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
index fbe1d5c..e03d22c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
@@ -366,7 +366,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 241df3f..33c175b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -879,7 +879,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 13aaf63..b8d90936 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -617,7 +617,6 @@
 	no-sdio;
 	no-mmc;
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
index 9a540bd..6a97973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
@@ -374,7 +374,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts
index f5b0cfc..5e0b9ce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts
@@ -187,7 +187,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts b/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
index b03dc0a..3f20fa0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
@@ -717,7 +717,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <150000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 2e8661a..c162abe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -517,7 +517,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
index c4ddb78..4ec7923 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
@@ -478,7 +478,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index d43eb48..5ffc94b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -1115,7 +1115,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <150000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index ed36c27c..db6adeeb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -637,7 +637,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-sdio;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 586741a..0d28c61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -371,7 +371,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	max-frequency = <150000000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index a76734d..8d13661 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -445,7 +445,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index e478488..3f1b62d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -546,7 +546,6 @@
 
 &sdmmc {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
-- 
2.7.4


