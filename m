Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DCCCF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCoNnL0pkWlIUOJf8axnqI/f/TrbWMLSBPFzbA+Aqnk=; b=Vz2y0yApm9wWQ+Tt2HDXO03R7Q
	TgkhFM22mTTXUV6GE5w913Hvw2KFywSh3yPzq9mZn/0xdX99nzQzwX4v/rs1DX0Knt6yNQN/UVGKm
	R9qwNHzs6HCHJlVSnAVoT68cjpy78k24zrda2dd6mi13BIlbDfOrsSQ3nEgbqhUSSKJu9dK6p5mDB
	uDNKxAWBUjIftH8o2BRu0pf8BolGcTYcnNWK65PvZS0lHnTL/fTUGfLKDiHxDtLYXQk5m4z+IorzV
	GhRDC8I2eVPEX02Bwp75r4syMF1Nf5GHTnLFB+NZP8pk4cNlUL7V9MrQyKP6qWAQswnGCoOg2E+WL
	1EWrD+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ01-0000000E2CY-071c;
	Wed, 07 Jan 2026 02:10:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzx-0000000E28u-0phW;
	Wed, 07 Jan 2026 02:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA216443E3;
	Wed,  7 Jan 2026 02:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AB1C19423;
	Wed,  7 Jan 2026 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751808;
	bh=bEeV9AIXgJUOiv5AAurKGQy27HtWNurlRvp9L2dNDu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W+ZaIDIWVB7W1ksneiAra3uH9lBBnY5kdOY8CLWWRPa+3zEtRyhdRNpsmHHwnAOx/
	 Eut9VJX+3RZnK7J6UMsNLlLUomPlnJVSg7c1i4NrgYJRv9auRibQ6H5a9lUvz0LPlw
	 +cCLzlofTVDNtEJRRYIRymPn4eXUCgo94Hh0o8s9x78O4O10XAjcWobDVxzaHcI7Td
	 Qqup66vbMj4s7IcwQpsXwGwUJ8pGMDN32QKkLvfzrlrovhBEy5I3OFWDYum7acsGaZ
	 P7La+QY3HhtWMmk7vb+B9TL8lTJgXG8DKbSQmL0fKieIHp9wYStOLbfmS/KJQXXxMD
	 vSas1R/oYVisQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:41 -0600
Subject: [PATCH 02/13] ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus
 nodes to root level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org>
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
X-CRM114-CacheID: sfid-20260106_181009_281608_0F473182 
X-CRM114-Status: GOOD (  11.19  )
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
under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
is part of the firmware, so move it under the /firmware node.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi |  7 ++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi    | 16 ++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 9261b67dbee1..1e76b290510d 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -141,9 +141,10 @@ v3d: v3d@7ec00000 {
 			interrupts = <1 10>;
 		};
 
-		vc4: gpu {
-			compatible = "brcm,bcm2835-vc4";
-		};
+	};
+
+	vc4: gpu {
+		compatible = "brcm,bcm2835-vc4";
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index e9bf41b9f5c1..9ab70b519a63 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -1,15 +1,13 @@
 #include <dt-bindings/power/raspberrypi-power.h>
 
 / {
-	soc {
-		firmware: firmware {
-			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-			mboxes = <&mailbox>;
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		mboxes = <&mailbox>;
 
-			firmware_clocks: clocks {
-				compatible = "raspberrypi,firmware-clocks";
-				#clock-cells = <1>;
-			};
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
 		};
 
 		power: power {
@@ -17,7 +15,9 @@ power: power {
 			firmware = <&firmware>;
 			#power-domain-cells = <1>;
 		};
+	};
 
+	soc {
 		vchiq: mailbox@7e00b840 {
 			compatible = "brcm,bcm2835-vchiq";
 			reg = <0x7e00b840 0x3c>;

-- 
2.51.0


