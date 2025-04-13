Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D76C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=utJCue1caiiVC6LaI3oId+Yi6e+n4Mbwhya8VRaTo2Y=; b=DU2lWnFEG8enzElpd/7W89dTde
	JoY5Y5Ztd3H/QgEMzZbO2m2G8nrrBJDLSgR95k3AkAeDaWuzAMUBYTd+ghFvKoDYyl2CZj5b/zlJP
	geNt/WfnJueHQWy6mUtYspBquetwlEnmduxIUgJeBM0zYf48BA3sm1KwrDvqFWQWpW4o6Mj2EDore
	IBsa4c4FycuINA2Sh1k7Nk60oW2N08aX4+QnVgFba//iRmxVw9h9xc4XBS8pp+i2fD1MBELuOa6pQ
	XygcpEfeojSFQeBsYhHmeJVJPa2kNwbipfxH431gUCPpQFgN298M1egvjYzCEwo7eysjaaMPeECg6
	Y74yo9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3xtL-0000000HEZA-0Jqa;
	Sun, 13 Apr 2025 14:00:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3xrU-0000000HESW-1RMt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 13:59:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso5771130a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744552742; x=1745157542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utJCue1caiiVC6LaI3oId+Yi6e+n4Mbwhya8VRaTo2Y=;
        b=E1+q/VwtYhA3/NCVwYMu2Rvu4HBc7x94RGnrExSvNO+8pEmwyveovIOSw9kIFg9WZf
         lQ5ecJ8rgGVvi6uxbC3wG88iRTihX4GAH1cuR2VShC55bQPMli4v3c/sjTQbbLpj9/XW
         LcCCbhBUB2J4iX0Y+h/2AIWEOM/BPPMTSrc1dbEbnrux8+ryavovIIPHm27Wsf1iWADt
         BpwdTeteOtVS7w/T9SwkqyXtLgWM1PJtBYOpPJ7Exx7Ez9bsTGZbzMcSgrGkG6C4OZUR
         yANZcPr5EP53QXQOiSlNqJsTB9Iwli7fApv4tEumSSdIxRAXGAobriZDmHhzXll92KL8
         TFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744552742; x=1745157542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utJCue1caiiVC6LaI3oId+Yi6e+n4Mbwhya8VRaTo2Y=;
        b=Kn8ionKGcBVGrsN5PgZg0LB3HVGedvSzs4AEevP3Ip1fnpWFgpQX8Dnmw0kofiJvwE
         htxstto59GWKlHs/pSs6qgpIPpHOrA+jE3TobEz5fIedkv/I8MCe4h09aiIonc1G0k0t
         xdCgOVtPjjD6UuxJkXV+ifgqhVz67bWJ56ihZmvuD22T1I9vwveLvLtzuyDb4NEfKf9N
         5CGCdPf3lC4CmudPhqwddvtsbeZ4RyLFBHlzlmcXivE9V0X13ozhe9/Hbn0b6DZ8dfHF
         LNVvX8kf3q9E9pqUbxctuWHlHbfNKPDV3eTGvAiBLDCHl9FkpfCiF4lgla3Qu9QLhGsV
         OJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/cyIO+bO7mM1dkADPeqtiWpktVW6neYkJ6H0ejMK59dDnrRGGelYJNKsb+e55plyCMjTQr0oDJwsXVlNAacW2@lists.infradead.org
X-Gm-Message-State: AOJu0YwI77NczzB0FrryS1hJFh2KGLeNfoXfigBI5bM/Hx/vtJ1Hzok1
	o2m4BS6Qh5aC8bKbxYLi/mcc4d2sNcXWpS/lWrVP6ip2GPsGiu/+
X-Gm-Gg: ASbGncuHpKNcrPHkMUErjhPMFvbX2tC6+zwjU0gViHX7QKRhP8wW8nhkpJ12TclIXh2
	JLmEur/U++RsfEEYsplCKgcoUSC4E0KEr5iNwHFf2xdwNMVS9j4bDmCneNxZzYwedVf2KDORjwn
	HMkh4FhR3pcBqKetZ6SAW1Gn7zQ1w06r3th8DpHOxyMVYU43j65u/Z7NZRDqL78YSYntAAU8W74
	qqqzP06u5sAKMjTDY0nNGIsMmyFfEDzx3joVCMvJlZPLfZAaw6xUDvflJyiStomRsgn7m34Uj4A
	78KC6CXiK6fmFnhzX5DRSv1DVGmAR3etM+Xtb6oeq2u7H0niu3S+HnwOfpg=
X-Google-Smtp-Source: AGHT+IFqWK6+W/ftgNa12pbudvEkEdI1jjaGufzqDfLNRVe+EJuwsxPBM904Yn3WNizh9i5HATWBHw==
X-Received: by 2002:a17:907:3fa2:b0:ac7:edc4:3d42 with SMTP id a640c23a62f3a-acad349a039mr807773666b.24.1744552742322;
        Sun, 13 Apr 2025 06:59:02 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9152sm732602266b.42.2025.04.13.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:59:01 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
Date: Sun, 13 Apr 2025 15:58:48 +0200
Message-ID: <20250413135848.67283-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_065904_383566_E2D7FD1B 
X-CRM114-Status: GOOD (  13.00  )
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

This reverts commit 531fdbeedeb89bd32018a35c6e137765c9cc9e97.

Hardware that uses I2C wasn't designed with high speeds in mind, so
communication with PMIC via RSB can intermittently fail. Go back to I2C
as higher speed and efficiency isn't worth the trouble.

Fixes: 531fdbeedeb8 ("arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection")
Link: https://github.com/LibreELEC/LibreELEC.tv/issues/7731
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 13a0e63afeaf..2c64d834a2c4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -152,28 +152,12 @@ &pio {
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
-&r_ir {
-	linux,rc-map-name = "rc-beelink-gs1";
+&r_i2c {
 	status = "okay";
-};
 
-&r_pio {
-	/*
-	 * FIXME: We can't add that supply for now since it would
-	 * create a circular dependency between pinctrl, the regulator
-	 * and the RSB Bus.
-	 *
-	 * vcc-pl-supply = <&reg_aldo1>;
-	 */
-	vcc-pm-supply = <&reg_aldo1>;
-};
-
-&r_rsb {
-	status = "okay";
-
-	axp805: pmic@745 {
+	axp805: pmic@36 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x745>;
+		reg = <0x36>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -291,6 +275,22 @@ sw {
 	};
 };
 
+&r_ir {
+	linux,rc-map-name = "rc-beelink-gs1";
+	status = "okay";
+};
+
+&r_pio {
+	/*
+	 * PL0 and PL1 are used for PMIC I2C
+	 * don't enable the pl-supply else
+	 * it will fail at boot
+	 *
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
 &spdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spdif_tx_pin>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index ab87c3447cd7..f005072c68a1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -176,16 +176,12 @@ &pio {
 	vcc-pg-supply = <&reg_vcc_wifi_io>;
 };
 
-&r_ir {
+&r_i2c {
 	status = "okay";
-};
 
-&r_rsb {
-	status = "okay";
-
-	axp805: pmic@745 {
+	axp805: pmic@36 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x745>;
+		reg = <0x36>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -296,6 +292,10 @@ sw {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &rtc {
 	clocks = <&ext_osc32k>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index d05dc5d6e6b9..e34dbb992021 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -113,20 +113,12 @@ &pio {
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
-&r_ir {
+&r_i2c {
 	status = "okay";
-};
 
-&r_pio {
-	vcc-pm-supply = <&reg_bldo3>;
-};
-
-&r_rsb {
-	status = "okay";
-
-	axp805: pmic@745 {
+	axp805: pmic@36 {
 		compatible = "x-powers,axp805", "x-powers,axp806";
-		reg = <0x745>;
+		reg = <0x36>;
 		interrupt-parent = <&r_intc>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
@@ -241,6 +233,14 @@ sw {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
+&r_pio {
+	vcc-pm-supply = <&reg_bldo3>;
+};
+
 &rtc {
 	clocks = <&ext_osc32k>;
 };
-- 
2.49.0


