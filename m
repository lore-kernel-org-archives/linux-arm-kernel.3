Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCF6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBjpLqYRBJQe4l37yBWtKFo1l+XvkZH0NozupgRBcOo=; b=QAZA6T/aFhgsEQAp49wlxUT6vR
	iMz//79X2gNM3+5U9yZsEUUPPZ4OCM40wt/gYjYuWDNrV+ggCh8dkNDyGtnIs1uk/wuskLO7e4T00
	Sn32jh3RvigopYA3xn7MEDSWv88bWrBSmvD5yv42dm9Oc8wPLqDq4isFcfdd2PiJ2uUBiVLLRz9Sx
	G7IMM9ArJvR4YbzCnfFAHclh2QCvHoE+9Y04926ySSGEZyOmmHJ4Un8nh65g0YSAbAsMmWZhcva/o
	0zcRZSVbHDQsLpnZGnNbbT7wC8wfFTuJGcQNATua0Ols12N1gSXKo5t4TJF1UNQ2nzWar4VR561lr
	iAFsJRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCPr-00000004yFe-0B1X;
	Mon, 30 Dec 2024 09:50:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCOd-00000004y24-1UMB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:49:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1F83240002;
	Mon, 30 Dec 2024 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735552145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RBjpLqYRBJQe4l37yBWtKFo1l+XvkZH0NozupgRBcOo=;
	b=kpgTHxdncqXx6zJ5FMkrUUDOAgYUP9bxo09P0XVwvSB8klbRbH6cQgb3c0nYO4QPlc9z61
	a5PY1qx+/KDN3mcEZpqznfDpUopzAMrBXwRgQZJCyXTwZj+MtDgaLwIvOvk22887vGCLl5
	q8265N6B3Jb5vicuuY3qpXCqqjj+KXPKdic+e7oulFwSDVwkM9rzHu5k3yOX+8CDg0hXq9
	5Wf2HM+kDhiSdwu0rkJtrQd5Onryk9cTflkkAfU6mWYmWtM9GSLqTYjrlsq3egN/m7bcWG
	WYeYV24aVsYaMyeZxHlsIVb0VyH706G5GSDzywLPeIllofuUTkcq7tcd0XEJMg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 30 Dec 2024 10:49:00 +0100
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-j784s4-s2r-pinctrl-v2-1-35039fafe2ca@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAItscmcC/22NzQrCMBCEX6Xs2Ug2Df3x5HtID01c7UpNShKKU
 vLuxuJR5vQNzDcbRApMEU7VBoFWjuxdAXWowE6ju5Pga2FQUmlE2YlH2+moRVRBLOxsCrNodE0
 4WiVRWyjDJdCNX7v0MhSeOCYf3vvHit/2p8P6n25FUdKPZBrV1r2xZ+N9mtkdrX/CkHP+AMFMb
 QC2AAAA
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 thomas.petazzoni@bootlin.com, richard.genoud@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_014911_844494_FC1C9494 
X-CRM114-Status: UNSURE (   9.81  )
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

Like on j7200, pinctrl contexts shall be saved and restored during
suspend-to-ram.

So use ti,j7200-padconf compatible.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Second iteration, the series was just rebased to v6.13-rc5.
---
Changes in v2:
- Rebased to v6.13-rc5
- Link to v1: https://lore.kernel.org/r/20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi     |  6 +++---
 .../boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi      | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 7721852c1f68..026f959e68a2 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -224,7 +224,7 @@ main_gpio_intr: interrupt-controller@a00000 {
 	};
 
 	main_pmx0: pinctrl@11c000 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x11c000 0x00 0x120>;
 		#pinctrl-cells = <1>;
@@ -234,7 +234,7 @@ main_pmx0: pinctrl@11c000 {
 
 	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
 	main_timerio_input: pinctrl@104200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x104200 0x00 0x50>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -243,7 +243,7 @@ main_timerio_input: pinctrl@104200 {
 
 	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
 	main_timerio_output: pinctrl@104280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x104280 0x00 0x20>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index 9638130caece..52e2965a3bf5 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -76,7 +76,7 @@ mcu_ram: sram@41c00000 {
 	};
 
 	wkup_pmx0: pinctrl@4301c000 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c000 0x00 0x034>;
 		#pinctrl-cells = <1>;
@@ -85,7 +85,7 @@ wkup_pmx0: pinctrl@4301c000 {
 	};
 
 	wkup_pmx1: pinctrl@4301c038 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c038 0x00 0x02c>;
 		#pinctrl-cells = <1>;
@@ -94,7 +94,7 @@ wkup_pmx1: pinctrl@4301c038 {
 	};
 
 	wkup_pmx2: pinctrl@4301c068 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c068 0x00 0x120>;
 		#pinctrl-cells = <1>;
@@ -103,7 +103,7 @@ wkup_pmx2: pinctrl@4301c068 {
 	};
 
 	wkup_pmx3: pinctrl@4301c190 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c190 0x00 0x004>;
 		#pinctrl-cells = <1>;
@@ -125,7 +125,7 @@ wkup_gpio_intr: interrupt-controller@42200000 {
 
 	/* MCU_TIMERIO pad input CTRLMMR_MCU_TIMER*_CTRL registers */
 	mcu_timerio_input: pinctrl@40f04200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x40f04200 0x00 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -136,7 +136,7 @@ mcu_timerio_input: pinctrl@40f04200 {
 
 	/* MCU_TIMERIO pad output CTRLMMR_MCU_TIMERIO*_CTRL registers */
 	mcu_timerio_output: pinctrl@40f04280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x40f04280 0x00 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;

---
base-commit: 0fcd4792246bb4fd490af35de8d914c33ccfa65f
change-id: 20241108-j784s4-s2r-pinctrl-643e1ac2014c

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


