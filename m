Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FD2CF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oRKHoRfokbEEDzQO6/g/zod77+qmAQWPDM1DzTwZiU=; b=5BxiemH3fG4qI2dWt4Y2xk9K06
	k10kX0NMVD510bWI5xEDBrXBbJ9vC93tHx6WdSf2tevZ4+JdRIZBzX0tHgAbT/QGWJ/9ZwPuAC3Kk
	tukfG0rpx4D3hs96h/rRbtmQGhINxw1Fa37AvWv15Rln4cAjjzx0J+yLVhaVFIfBkYUu9yQrtSvlX
	Uwn90xvTqEuuAhI9SGF7qFn8PL8nZvWAnbmhnUri38+G8Olw5kDNeRxQ7+GeN9NSJmfNu6b3VaIVu
	6zMhKUGrS/O6L9V6b9tZl57q646JArlsFaS3Yz6DUykp8mmMd8kQSToJnc/avkqFGNt4qGD2F02ZL
	ngDb94kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ04-0000000E2HD-48eM;
	Wed, 07 Jan 2026 02:10:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIzz-0000000E2AY-18MO;
	Wed, 07 Jan 2026 02:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8D3443F4;
	Wed,  7 Jan 2026 02:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3BFC19423;
	Wed,  7 Jan 2026 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751810;
	bh=YrnlD7633PVliJ61smTwoQ8PijcGS3rXVJe9bcmSyts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SGH21g2HP1Fq/dTQaW6QN1EVjl9N+MD6l3/VUqh9+prH1RPMpFZ7h+qrjeHmlDE0j
	 P61oeE+PSz5ijUaiH4unB0e9HslGtad5cHf494Tu5wY88vvQTSnO2cYFjxyvn9G+cV
	 7NdbY3fgL2e7la9lsKkdRQBdhAvyNcoPeT+Kz/62C2jz0+cRBi7Ode/XJgAVGYYcGO
	 KWFz7B542smI+bLR1WhBsW4KMRS6vL+IlNdGaQraLo6DRQ0dmjpPIbi5KbFq++/oMT
	 2DCfmuBqE7+oIF3JIL6OsztIGbHYsZwBpGqpxEMVk8r61goI/OKO8tef8kVhwhnOYH
	 p6m4dVhw/ViQQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:43 -0600
Subject: [PATCH 04/13] arm64: dts: broadcom: Remove unused and undocumented
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-4-ba45874e4553@kernel.org>
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
X-CRM114-CacheID: sfid-20260106_181011_373044_B56A4FD6 
X-CRM114-Status: GOOD (  10.82  )
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

The "silabs,si3226x" and "brcm,bdc-v0.16" nodes have no documentation
and no driver in the kernel, so remove them. They can be added back with
proper documentation if there is a need for them.

Note that if both USB ports have similar memory maps in relationship to
their USB PHY nodes, it looks like the device controller should have
been at 0x12000, not 0x21000?

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts   | 16 ----------------
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi      | 19 -------------------
 2 files changed, 35 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index 5939d342aec7..f06472edd4a1 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -106,22 +106,6 @@ &uart3 {
 
 &ssp0 {
 	status = "okay";
-
-	slic@0 {
-		compatible = "silabs,si3226x";
-		reg = <0>;
-		spi-max-frequency = <5000000>;
-		spi-cpha;
-		spi-cpol;
-		pl022,interface = <0>;
-		pl022,slave-tx-disable = <0>;
-		pl022,com-mode = <0>;
-		pl022,rx-level-trig = <1>;
-		pl022,tx-level-trig = <1>;
-		pl022,ctrl-len = <11>;
-		pl022,wait-state = <0>;
-		pl022,duplex = <0>;
-	};
 };
 
 &ssp1 {
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
index ac4f7b8f9273..3fa9e57185b2 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
@@ -31,16 +31,6 @@ xhci0: usb@1000 {
 			status = "disabled";
 		};
 
-		bdc0: usb@2000 {
-			compatible = "brcm,bdc-v0.16";
-			reg = <0x0 0x00002000 0x0 0x1000>;
-			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&usbphy0 0>, <&usbphy0 1>;
-			phy-names = "phy0", "phy1";
-			dma-coherent;
-			status = "disabled";
-		};
-
 		usbphy1: usb-phy@10000 {
 			compatible = "brcm,sr-usb-combo-phy";
 			reg = <0x0 0x00010000 0x0 0x100>;
@@ -65,13 +55,4 @@ xhci1: usb@11000 {
 			status = "disabled";
 		};
 
-		bdc1: usb@21000 {
-			compatible = "brcm,bdc-v0.16";
-			reg = <0x0 0x00021000 0x0 0x1000>;
-			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&usbphy2>;
-			phy-names = "phy0";
-			dma-coherent;
-			status = "disabled";
-		};
 	};

-- 
2.51.0


