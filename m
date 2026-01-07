Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7142CF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GODWTnll3gv54pyxhg5fcxPf5nv/jUJE+yJJ3lkoc/U=; b=LfmBPAEOCXRTdUrUYqjpJd1bYc
	s5uaeVRzMZlOYfrTu7puKdUdMB9VlH+/ABy9nQeZh6afwO0enTe46PQXcrnJuD61DGd226CTPWeKI
	j93soEGsxLKKRpzj+zGOP/jJF24rsyx7v3ac2UBKpiDKusOAZ3oC2mvj5TLxD5qsMVVQXEg3f0gTQ
	d06SMl/mrkzcA6fqFxMWDUXfDtU9ubNpEtzWrEH/mH4s3uCIkxLKwXIaDqDvu4G9PYbnBCveyVtXw
	XBYxd9H+xvO8SWZbE6HeW72BV6iQEO6+t4W5Up7mQebsX/K8ez6s+Y2ejbTqqNgolihudERJp6TEJ
	T6LxOq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ01-0000000E2Dg-2lQ6;
	Wed, 07 Jan 2026 02:10:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzy-0000000E29b-0tHS;
	Wed, 07 Jan 2026 02:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E052C443E8;
	Wed,  7 Jan 2026 02:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A372CC116C6;
	Wed,  7 Jan 2026 02:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751809;
	bh=P1nkQlwmHCB4ptKpTcMysgD54OQnmfZucCNh/Rw44NM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nt7J2x57XD42gESqOOQZA3WLIBVGvcDmyrHPNjEav6/k5cST1RrjBrzzpItd3tWbo
	 /dvvf5v5l6kcr4plhg3rcfFneCUeGZknqL2eYCbN8CRKXv7tPczu1sZxrUqaveg5lF
	 wVhZn2Y4QJ7Pp2Y5c9WT3ZB2GPhLhS6zz+d6nBBsrsqp9eI3fkfegTHZp61SBZhQ2h
	 YUXEShQ/DmRvTVXzJgmP0tco1+Rmt38hE9qjTUTHL+d0pf/atYrssPBwdR1WW/JrNu
	 rWWwcFO/l+xkwzBpM5ji7egDJ9FVcU7X9shFDAAo7e0cx5QvlT3Lzl4kvwhkrsJ/Tx
	 n6x64WXSthdvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:42 -0600
Subject: [PATCH 03/13] arm64: dts: broadcom: bcm2712: Move non simple-bus
 nodes to root level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-3-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181010_334556_57B4F241 
X-CRM114-Status: GOOD (  11.20  )
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

The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
under a 'simple-bus'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 49 ++++++++++------------
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  8 ++--
 2 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 04738bf281eb..7d4742ebe247 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -44,6 +44,28 @@ power_button: power-button {
 		};
 	};
 
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+
+		mboxes = <&mailbox>;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+
+		power: power {
+			compatible = "raspberrypi,bcm2835-power";
+			firmware = <&firmware>;
+			#power-domain-cells = <1>;
+		};
+	};
+
 	sd_io_1v8_reg: sd-io-1v8-reg {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-sd-io";
@@ -189,33 +211,6 @@ wifi: wifi@1 {
 	};
 };
 
-&soc {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		mboxes = <&mailbox>;
-		dma-ranges;
-
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
-
-		reset: reset {
-			compatible = "raspberrypi,firmware-reset";
-			#reset-cells = <1>;
-		};
-	};
-
-	power: power {
-		compatible = "raspberrypi,bcm2835-power";
-		firmware = <&firmware>;
-		#power-domain-cells = <1>;
-	};
-};
-
 /* uarta communicates with the BT module */
 &uarta {
 	uart-has-rtscts;
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index d57a9b1bff70..330a121ebfcb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -508,10 +508,6 @@ axi: axi {
 			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
 			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
 
-		vc4: gpu {
-			compatible = "brcm,bcm2712-vc6";
-		};
-
 		pcie0: pcie@1000100000 {
 			compatible = "brcm,bcm2712-pcie";
 			reg = <0x10 0x00100000 0x00 0x9310>;
@@ -648,6 +644,10 @@ mip1: msi-controller@1000131000 {
 		};
 	};
 
+	vc4: gpu {
+		compatible = "brcm,bcm2712-vc6";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |

-- 
2.51.0


