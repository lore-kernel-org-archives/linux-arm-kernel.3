Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29357C982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okZ2uRctNqH/RBMm5GnvIsnhGZ7RfC7nOHnC/0oYehs=; b=yhcosv0od6t3xreBE7tt64tict
	yFWFQHS1YwzkbL+hkXijX9egxjDTECCQcT/5TquNxyt8vuh0hVeXy+JnWwL8/69FTtOhDwlPVGftr
	9fVJzxrf80xefrUQYszBYX5cFCK81jpRRkz9eR22WPcT6FkbeuG6KaSaRn54QmKrpGpzO6z9KFlb8
	o3cFm+lizAPnIuYVnObcqu/vpx4L1tUhBRE7V8TjXHmG4OxhSJEl7+46N4YaI7TOD7D6Oa3SCu6oD
	cmdOhwrB/qvs8cVzutWqE/FSDH86I/uqzmJGLmK8Sleyc9TGsEzPKmMsiYJole/bYA5fppjQNdRx5
	m+DasHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WQt-0000000EBLZ-3lUp;
	Fri, 18 Sep 2026 11:07:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WQd-0000000EBC1-3LWi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F4005447C3;
	Fri, 18 Sep 2026 11:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4E03C32781;
	Fri, 18 Sep 2026 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789729610;
	bh=XsLeQwB1fLUCtAKmgPFpm557IbbzSOp56z8va3WVDH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DVqE5y7DQJYuVpmjWMIt4o0darHkxyOHJa5vi7AF5iEtkNLv+D7jZVp5fqkOCIrAh
	 CGFs7SSaIl/xUsPHR5XFVINqsihkxvjRJx3oqTBYhyxqoudlXS9/0754omlpcvN/yu
	 yKx65wnGI/mf+p976gp475Ee1QfVFjl5KeoXeiIZtLlVcSRxcPo5yHAf1mRtgGAA7+
	 7GaSbEKtRG1sdCkhIeSRjw2RjfSHn439uzMzP68VIVnWAS1R/JQ9H4X31v/mzj9MIG
	 6GIQWQPO1I49lPPNP4m0GghS6Xqr1xZHfb5iTa8jy4QdHua0lOnnlMu0KNgtf8TPFa
	 hRHWFcDje7sXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF823C982DF;
	Fri, 18 Sep 2026 11:06:50 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 18 Sep 2026 21:06:53 +1000
Subject: [PATCH v2 10/10] arm64: dts: apple: Enable DockChannel HID on M2
 and M3 laptops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-apple-mtp-keyboard-final-v2-10-a5c685e50b60@gmail.com>
References: <20260918-apple-mtp-keyboard-final-v2-0-a5c685e50b60@gmail.com>
In-Reply-To: <20260918-apple-mtp-keyboard-final-v2-0-a5c685e50b60@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>, Julian Braha <julianbraha@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789729608; l=7273;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=78kUfdeWKUeiEf4dX7SZ0qB0VILZ/K/tdCVxq/uYAb0=;
 b=SlCQi8R+AsDGd7i6kEdHhrkowfvRK7D4GPBrG+nolP9gXvfAkOOkqK8McyMEOXCUP/cRKrnH/
 T9OI6ggaRtxDXum667qxqJmtLkZd0DyGfXUqKjQhSeJzFVZsQDz22yB
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

Enable the MTP mailbox, DART, DockChannel mailbox, and HID transport on
the M2 and M3 laptop device trees using this internal input path.

Add a keyboard alias and keyboard child node for each machine so the
transport can expose the internal keyboard.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 29 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi | 24 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       | 24 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j415.dts       | 24 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 26 ++++++++++++++++++++++-
 arch/arm64/boot/dts/apple/t8122-j504.dts       | 26 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-j613.dts       | 27 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-j615.dts       | 27 ++++++++++++++++++++++++
 8 files changed, 206 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8dd..91fda44d9 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -16,6 +16,12 @@
 
 #include "t600x-j314-j316.dtsi"
 
+/ {
+	aliases {
+		keyboard = &keyboard;
+	};
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0_cpu0>, <&ps_dptx_phy_ps>;
 };
@@ -43,3 +49,26 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index 517b84c18..f6fe382de 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -21,6 +21,7 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
+		keyboard = &keyboard;
 		serial0 = &serial0;
 	};
 
@@ -64,3 +65,26 @@ &serial0 {
 &fpwm0 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08..5b9bdad3d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth0;
+		keyboard = &keyboard;
 		wifi0 = &wifi0;
 	};
 
@@ -93,3 +94,26 @@ &fpwm1 {
 };
 
 #include "hwmon-laptop.dtsi"
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2..3da132eeb 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth0;
+		keyboard = &keyboard;
 		wifi0 = &wifi0;
 	};
 
@@ -93,3 +94,26 @@ &fpwm1 {
 };
 
 #include "hwmon-laptop.dtsi"
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594..ecc057929 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+ OR MIT
 /*
- * Apple MacBook Pro (13-inch, M1, 2022)
+ * Apple MacBook Pro (13-inch, M2, 2022)
  *
  * target-type: J493
  *
@@ -24,6 +24,7 @@ / {
 	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
+		keyboard = &keyboard;
 		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
@@ -149,3 +150,26 @@ touchbar0: touchbar@0 {
 
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8122-j504.dts b/arch/arm64/boot/dts/apple/t8122-j504.dts
index 464491b55..a08a130be 100644
--- a/arch/arm64/boot/dts/apple/t8122-j504.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j504.dts
@@ -18,6 +18,10 @@ / {
 	compatible = "apple,j504", "apple,t8122", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M3, 2023)";
 
+	aliases {
+		keyboard = &keyboard;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
@@ -35,3 +39,25 @@ &fpwm1 {
 	status = "okay";
 };
 
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8122-j613.dts b/arch/arm64/boot/dts/apple/t8122-j613.dts
index 51894ea70..a81326cd5 100644
--- a/arch/arm64/boot/dts/apple/t8122-j613.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j613.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "apple,j613", "apple,t8122", "apple,arm-platform";
 	model = "Apple MacBook Air (13-inch, M3, 2024)";
 
+	aliases {
+		keyboard = &keyboard;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
@@ -33,3 +37,26 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8122-j615.dts b/arch/arm64/boot/dts/apple/t8122-j615.dts
index 2a1970c1b..21bcacb6f 100644
--- a/arch/arm64/boot/dts/apple/t8122-j615.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j615.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "apple,j615", "apple,t8122", "apple,arm-platform";
 	model = "Apple MacBook Air (15-inch, M3, 2024)";
 
+	aliases {
+		keyboard = &keyboard;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
@@ -33,3 +37,26 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+
+	keyboard: keyboard {
+		hid-country-code = <0>;
+	};
+
+	stm {
+	};
+};

-- 
2.55.0



