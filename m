Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD69D41C30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ixrjd5uZ9x2LFF0ZoaV1n0QKwuapda4UZQIU/cTO4co=; b=K5Am9Xc3eiAtd0RkyxRNkhKcrw
	El3+ObXo3N0E54VwdjxvkpPOel6+Ql2aKuLxObHDOGjtWbbLZzHQKpMfx0ITlDDdmvZXOCvWfa0oE
	Ye02fFZ0m8uoaW8YqWwdfbwWnth4W+b1T2I3NT3ROelGaoTqYR6sXANUVFQC3hOTBhqILLnABeqgc
	UfhyCfpxupm2S031hnTWyqW9aT6By+KIXRYDmyOukalgu7FuhgKUtDu1Kz8aa94MqIsJkUXyRFh8V
	ByvbgkLhmc86fIs5bvAgBPf0Z1vMT0vmYyRNztrnwuk3vsPUmUl3yA9glVFXB+pWWq42f0t3ogJ0U
	EizWbYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAsh-00000006UOU-04ju;
	Wed, 13 Nov 2024 10:45:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAqE-00000006U6Q-47Pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 10:43:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B14CFF804;
	Wed, 13 Nov 2024 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731494595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ixrjd5uZ9x2LFF0ZoaV1n0QKwuapda4UZQIU/cTO4co=;
	b=n+iRLP5Q4VlQ32AYwug3P/LoBvB7lIWa4X3UE//5tEFCB72k0eue63oBEUPwsWMMRFoBXZ
	dL0oSc7UjffMBdrarFA4jMdYfU1MPNMF/WLlAHFp5WIam0v8lvg7yP32x+pTjXvPB2vkMq
	IWlN6SIub6d1LGUHdsbH95SSPLkLxE4e25/37dDQRydokW4KbKTxFdei0thC7rH91Tt+8C
	qaqehhKbQZH9dOE2PvBtDXmTM5NYzC8nRz5m4ZKHXTI1ugh6wgjDwik54Tm5ztMmRR4MIo
	1lS4L0cI/chqhclho1six/yAqvJbhmNwZKtdQO049Tg9Yv/Wz5EXpTFu5lYYgQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 13 Nov 2024 11:43:05 +0100
Subject: [PATCH] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALiCNGcC/x3MQQqDQAxA0atI1gYm01DFq4gLmcaaUkZJRASZu
 3fo8i3+v8HFVByG5gaTU123XEFtA2md81tQX9UQQ2Si0OOn69kZPRrumtNhX3zyQ2hOMRAnqOF
 usuj1n45TKT/vQCOYZAAAAA==
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
X-CRM114-CacheID: sfid-20241113_024319_323296_06E727FE 
X-CRM114-Status: UNSURE (   9.31  )
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
Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
suspend-to-ram.
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       |  6 +++---
 arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index e73bb750b09a..b25d9a6aff2c 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -230,7 +230,7 @@ main_gpio_intr: interrupt-controller@a00000 {
 	};
 
 	main_pmx0: pinctrl@11c000 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x11c000 0x00 0x120>;
 		#pinctrl-cells = <1>;
@@ -240,7 +240,7 @@ main_pmx0: pinctrl@11c000 {
 
 	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
 	main_timerio_input: pinctrl@104200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x104200 0x00 0x50>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -249,7 +249,7 @@ main_timerio_input: pinctrl@104200 {
 
 	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
 	main_timerio_output: pinctrl@104280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x00 0x104280 0x00 0x20>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi
index 2c97d1c7ebcd..36341665177f 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi
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
base-commit: eff6d7cad08c4ce4e3456fd7f8f1d94c81cd2b63
change-id: 20241108-j784s4-s2r-pinctrl-643e1ac2014c

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


