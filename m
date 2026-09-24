Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F3EC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HcJKcUVq7LllSNvQBs32R2oFsmdY/a/xgb5CUOfaaE=; b=Ma+anlKYSZpymMWktjPkbYF+Ro
	2ApsmmW5qTJ3uHT4SNPhoI2AsHODl8CRwxo63DKuu4+n10sxwgaZeALZI9phbKZ5oYjodpUtgqXlc
	0VrtEgSfJihxf3PpHo30Vs8H5eEY5kcfWplQXKalCePlzWYvECkfTqt1c6VnPznxje9MDAJas4GRV
	EyyA1GOYwJFRjp6dXsb/IiwnKV4RhojDkWYnHogvyMwpi93AeB9N6w961z1RuK+mRBwkvRJhu8moM
	BNTa6BmNaXtvmw+iz+kpIaOGOAdyPHGKRm2dKaY88jQ74KKdVW+M9WgEpO8Xtw4SPH7tdxY/UG+Kt
	TSTE3yBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jPp-0000000B4nC-2jet;
	Thu, 24 Sep 2026 13:23:09 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jPY-0000000B4XZ-0bqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:22:54 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HcJKcUVq7LllSNvQBs32R2oFsmdY/a/xgb5CUOfaaE=;
	b=WYirBpFiGy1GF3cm0bhGfJO9pQc+viReBJs00zq7d64PjhzR8xvmsKufxlgrMDHorniBuV
	8XyMtoXAHdEvGQMCmpqUGI7jne0kKRbxMFpBD5/QSiWeD0r8ZkowXoXT9Casin150GAlp0
	MXmI5Aii4dIB72ucjVoPRNuv+PdDb48=
Date: Thu, 24 Sep 2026 15:22:23 +0200
Subject: [PATCH 1/3] dts: apple: t8132: Fix blank-lines-related
 dt-check-style issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-1-3ec651d75baf@cyberchaos.dev>
References: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
In-Reply-To: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062252_408608_9FB177EE 
X-CRM114-Status: UNSURE (   9.85  )
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

This fixes all `dt-check-style --mode=strict` issues related to blank
lines in the t8132 device tres.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-j604.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-j713.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-j715.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi | 1 +
 arch/arm64/boot/dts/apple/t8132.dtsi      | 8 ++++++++
 5 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/dts/apple/t8132-j604.dts
index c4be915cb33a..93076cd923a9 100644
--- a/arch/arm64/boot/dts/apple/t8132-j604.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-j713.dts b/arch/arm64/boot/dts/apple/t8132-j713.dts
index e1fc5d47f487..892a3812bc65 100644
--- a/arch/arm64/boot/dts/apple/t8132-j713.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j713.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-j715.dts b/arch/arm64/boot/dts/apple/t8132-j715.dts
index 2672914ea76c..212d194bd1ae 100644
--- a/arch/arm64/boot/dts/apple/t8132-j715.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j715.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index 9882ea3f85e6..b0c5d71943b6 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -26,6 +26,7 @@ framebuffer0: framebuffer@0 {
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index afec92a06015..1ea488ce6e1c 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -24,18 +24,23 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e0>;
 				};
+
 				core1 {
 					cpu = <&cpu_e1>;
 				};
+
 				core2 {
 					cpu = <&cpu_e2>;
 				};
+
 				core3 {
 					cpu = <&cpu_e3>;
 				};
+
 				core4 {
 					cpu = <&cpu_e4>;
 				};
+
 				core5 {
 					cpu = <&cpu_e5>;
 				};
@@ -45,12 +50,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p0>;
 				};
+
 				core1 {
 					cpu = <&cpu_p1>;
 				};
+
 				core2 {
 					cpu = <&cpu_p2>;
 				};
+
 				core3 {
 					cpu = <&cpu_p3>;
 				};

-- 
2.55.0


