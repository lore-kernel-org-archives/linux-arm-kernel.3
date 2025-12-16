Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B687AD609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MnI1dIuceXVlcCF5b1M18jcWU30dytsPlcPOyQI2+U=; b=exZi6+qp4EPRrAZdfyuKzodIAs
	hB1t2cQNMK3wfL0uvg53Z7SLvC4vuLPTAcuoU5cB6TmhlN6fxx1z1F8CIflaQ9IhyPQv5uDzEsfVO
	pMt6x+jFoHx/ZnOhbZdjhNZn3WJtA1NT4Ho8zGfkAQH+W3HZTCNwqnXEaoYyB4iSQc6DCnf2yH0SS
	kaShIhD3EHrhRpuzmKCG7VTN9nN2tPkLDyWYjMH1lSc/uuaUfZl/52xHFGcjp2Y2DU8x0HQBQzHFW
	JSLWzpplRPrMTiuzMcg2fRkfPh1MI0NmPQKu3n2eFc8L5VE6ayXF1eWLYkAT7ZZdPieomo47A+8M8
	DoAH+5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMY-00000005fnl-2J3L;
	Tue, 16 Dec 2025 18:01:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMO-00000005fej-44C6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 18:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67B35601A2;
	Tue, 16 Dec 2025 18:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8E3C4CEF1;
	Tue, 16 Dec 2025 18:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908080;
	bh=UKbvHEFdrbGA70W2Vp+q+A5UUZFxp7s4Z2HxcK440Tw=;
	h=From:To:Cc:Subject:Date:From;
	b=OLSy2oumnMUuLjA6kChb6sehsEOr4pZYYgFz1ab08CgzmpgGCngCdfQSpoNEOe7DG
	 ChZkA31NDloUjKxbr+LWK4Ad5nNxJlggPbo4vn1kgYS/pieSTKlNLZIkB3HfncmHyC
	 ld6Ybj7cKKEl7FcuUMoR+qtG0FIJ3jJcgS5WfOj3tnC8JkhlSYOER4VsdSbQdi7COs
	 5zYOlmIXjvkjDBrDkX3svjd7c6fIYd+p1hIBShxITPnxNrI3SEuSk3VYKS3d1K4z9t
	 tpG5aim5Lafa/Oe8Z43LoZQKnGHDsG88joj7OxgtfqL8M89TB6oHk7r2C7b3rolcSz
	 mxMq7KOkgwnWA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: toshiba: Use recommended node names
Date: Tue, 16 Dec 2025 12:00:54 -0600
Message-ID: <20251216180055.2793215-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Update Toshiba TMPV7708 node name to the recommended standard node
names. Generally, node names and paths aren't considered ABI, so it
is safe to change them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts      | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts  | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi             | 4 ++--
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
index d209fdc98597..8d099b237025 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
@@ -43,7 +43,7 @@ &piether {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
index ed7aa7e457b1..4439b3e8acbb 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
@@ -43,7 +43,7 @@ &piether {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
index 0c8321022a73..af406f7285c4 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
@@ -26,7 +26,7 @@ &spi0_pins {
 &spi0 {
 	status = "okay";
 
-	mmc-slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 9aa7b1872bd6..88e38d6efcaa 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -161,7 +161,7 @@ gic: interrupt-controller@24001000 {
 			      <0 0x24006000 0 0x2000>;
 		};
 
-		pmux: pmux@24190000 {
+		pmux: pinctrl@24190000 {
 			compatible = "toshiba,tmpv7708-pinctrl";
 			reg = <0 0x24190000 0 0x10000>;
 		};
@@ -463,7 +463,7 @@ piether: ethernet@28000000 {
 			status = "disabled";
 		};
 
-		wdt: wdt@28330000 {
+		wdt: watchdog@28330000 {
 			compatible = "toshiba,visconti-wdt";
 			reg = <0 0x28330000 0 0x1000>;
 			clocks = <&pismu TMPV770X_CLK_WDTCLK>;
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
index a480c6ba5f5d..5ea835fe08a8 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
@@ -91,7 +91,7 @@ i2c8_pins: i2c8-pins {
 		bias-pull-up;
 	};
 
-	pwm_mux: pwm_mux {
+	pwm_mux: pwm-pins {
 		function = "pwm";
 	};
 
-- 
2.51.0


