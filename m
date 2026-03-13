Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5363D107BCD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ojzP9IDZI8XkVs69Bome+Cdd4RT33tf3Ry26dLLt2kI=; b=xKpw0v/HtaLUdVJg85DMmtj9VP
	7Ce1P0LYi2TMxdbfPvav+fXWh5Q6oDE7BY9yh4T3KVj1ZHoYrNzHltqsvOz+Vbd9a0Bluq7zyC7fb
	6f01uDWka1VjrRIAb47UzgPHTecme0E/9+CR/132ghEdJ/QyaKUJHh6iFP7oB5y7lABG7sr+DWe/7
	IyDrktE+9pb3zmYRTkIjiJsp5/+YIEvUb0Ow/NN3iijNuYAdFFcUdtA5VmfxMYKi7VKhFIYkDvE5p
	t08f1F7YI/WxDgXyFF6Is4jvca+o2VeuUEDCql8qgSxSiK9ot+7UT9ZJuFhxW/QwcKTOV3K8KYRYV
	Es2sI1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w176O-00000000soO-0hqn;
	Fri, 13 Mar 2026 18:19:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w176K-00000000sla-2qUV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:19:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1B284E4267F;
	Fri, 13 Mar 2026 18:19:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 940F160027;
	Fri, 13 Mar 2026 18:19:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85F0D10369CF0;
	Fri, 13 Mar 2026 19:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773425942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ojzP9IDZI8XkVs69Bome+Cdd4RT33tf3Ry26dLLt2kI=;
	b=Q36utDLioFeM8PPipK61q8ABABN/5k4UH48qBF3ikF7vtzpQ57O/efn2QnLFx+QPZZUiiJ
	z2QyqiwYoS0rRDa8+gSEAe9CvKkxnWEfYEfO+0Wgy7gZ2u60U6N66YsPbclzcZTrURl3y4
	kCP+E6A6rLr+0W3F9aCWnAtUm7Bt0zMplmWaxKwXr47plQ3WW+ms63aSMSiWC3qg4iEmRY
	wixjCAN2y2nZ2IoZdJCtz7Ra8hWxmb/MXYiqh8XCqLm8uD17qLDjnAvwylzP6/N0JWS6YS
	aWnZGH5KX7BT3qloTayNUscGEs8k+vbC/VqfNLCpg7yWhY1PiFhVlB0EwUsg5Q==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Fri, 13 Mar 2026 19:18:54 +0100
Subject: [PATCH] arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-j721s2-s2r-pinctrl-v1-1-a6f80c641037@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAA1VtGkC/x3MzQpAUBBA4VfRrE3dO/7iVWQhBiNdmpGUvLub5
 bc45wFjFTZokgeULzHZQ4RPExiWPsyMMkYDOSpd5jNcK/JGaKR4SBhO3ZDzuqDRl7XLHcTwUJ7
 k/qdt974fDUQh5WQAAAA=
X-Change-ID: 20260313-j721s2-s2r-pinctrl-e4952d169040
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, richard.genoud@bootlin.com, 
 Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_111908_992917_84A215B6 
X-CRM114-Status: UNSURE (   9.32  )
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

On the J721S2 platform, pinctrl contexts must be saved and restored during
suspend-to-ram, just like on the J7200. So use ti,j7200-padconf compatible.

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi       |  6 +++---
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9f..b4bbfebccb2c 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -175,7 +175,7 @@ main_gpio_intr: interrupt-controller@a00000 {
 	};
 
 	main_pmx0: pinctrl@11c000 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x0 0x11c000 0x0 0x120>;
 		#pinctrl-cells = <1>;
@@ -185,7 +185,7 @@ main_pmx0: pinctrl@11c000 {
 
 	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
 	main_timerio_input: pinctrl@104200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x104200 0x00 0x50>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -194,7 +194,7 @@ main_timerio_input: pinctrl@104200 {
 
 	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
 	main_timerio_output: pinctrl@104280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x104280 0x00 0x20>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 32ee8031cfcb..27b8e7440246 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
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
@@ -113,7 +113,7 @@ wkup_pmx3: pinctrl@4301c190 {
 
 	/* MCU_TIMERIO pad input CTRLMMR_MCU_TIMER*_CTRL registers */
 	mcu_timerio_input: pinctrl@40f04200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x40f04200 0x00 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -124,7 +124,7 @@ mcu_timerio_input: pinctrl@40f04200 {
 
 	/* MCU_TIMERIO pad output CTRLMMR_MCU_TIMERIO*_CTRL registers */
 	mcu_timerio_output: pinctrl@40f04280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x40f04280 0x00 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260313-j721s2-s2r-pinctrl-e4952d169040

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>


