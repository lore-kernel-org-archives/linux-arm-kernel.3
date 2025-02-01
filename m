Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F13C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8go4AGqudFIZZyYHBzgN/R6QG4WQF0Rag9QeFgE6DyM=; b=hAf+jdoqveaMK+PTDWvEHUWws7
	PTWrBkuyTFvxBA+VtpkG9QnbIu8STMloZNO67x4PzuUPzyBBRFS/S3eQw3KNL7zkU9kCOH53RZRNF
	oovkH2yK+8gTlwwzApFZdsalNbsIYLmjQ5eZ1nnqml23HKIH5U0BDG6T2ojvGh9EL/CxvkEvhYQNR
	ehYYUolcUkHrvggoW+p4DDkIk5NV/OcnhS2GGeXoDdLrhEcXZB+93oU3GK9i4vOlKTE4imVUO0gLH
	1PlLl2fiBc9Y6WdiXebZWbUwWsMDkd9VRkQDZ6R/ZgBKxWDf+anKqF0r5iACqJGq+BfyFqT3KiWQb
	2ZtcbwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teEgc-0000000Cl5O-3jkw;
	Sat, 01 Feb 2025 14:41:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teEfI-0000000Ckv5-33ei;
	Sat, 01 Feb 2025 14:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16095A40548;
	Sat,  1 Feb 2025 14:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDE2C4CED3;
	Sat,  1 Feb 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738420807;
	bh=UETDdbZTrbH3aziuRcpTKdm0bPASnj4ies4k7W717dM=;
	h=From:Date:Subject:To:Cc:From;
	b=CRyEnErp+gTzppgdtRpJOp9Pyqp7y1CBRVJnXwFkiwt/YjwUPREIeCG6PevpTFbox
	 QR+HrzaSSJsr61BUaGzoW58rxBUUDpCT4ZJcXzzam3uGxWw9HRU5tixVw/X35V/Nw3
	 UnTbOFS3ZvPkszSYK6g/knfVWpweXHwQAyA6yC8XBu85KNACCrnWyp4IPDV7hlE+Qy
	 iynevsfj4OShU+FXm/kQBVJiy9tk5nIsdRDjMyAZANH1ld+ZMq8k0VTc/GGOWZTX/z
	 vdDm6tF3FzGagXbHrm5z7DgjrtPT6BI0SfsC7eN492IRSW+qQsXQLawHxWGbsi01Gd
	 DUgSrEtgXdhmQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 01 Feb 2025 15:39:48 +0100
Subject: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC evaluation
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
X-B4-Tracking: v=1; b=H4sIADMynmcC/x3MTQqAIBBA4avErBtQyf6uEi1KpxoIEyciiO6et
 PwW7z0glJgE+uKBRBcLHyFDlwW4bQorIftsMMpYZZRGCo1tNfpTUCJj5ODOtGOlazW3xrqp85D
 jmGjh+x8P4/t+YVDV12gAAAA=
X-Change-ID: 20250201-en7581-dts-spi-pinctrl-4160b825ca9d
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_064008_902297_41A8257F 
X-CRM114-Status: UNSURE (   9.40  )
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

Add the following nodes to EN7581 SoC and EN7581 evaluation board:
- clock controller
- rng controller
- pinctrl
- i2c controllers
- spi nand controller

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts |  8 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 90 +++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index cf58e43dd5b21dbf4f64e305a4b4a2daee100858..1126da4b795f5d5df9725ec4d75cd9353b011710 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -24,3 +24,11 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
 };
+
+&i2c0 {
+	status = "okay";
+};
+
+&snfi {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 55eb1762fb11364877695960f5a2d3e42caf8611..b1cf650efd78c6c20d19e7f18c204cf5862215c0 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/en7523-clk.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -150,5 +151,94 @@ uart1: serial@1fbf0000 {
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <1843200>;
 		};
+
+		scuclk: clock-controller@1fa20000 {
+			compatible = "airoha,en7581-scu";
+			reg = <0x0 0x1fb00000 0x0 0x970>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		rng@1faa1000 {
+			compatible = "airoha,en7581-trng";
+			reg = <0x0 0x1faa1000 0x0 0xc04>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		system-controller@1fbf0200 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x0 0x1fbf0200 0x0 0xc0>;
+
+			en7581_pinctrl: pinctrl {
+				compatible = "airoha,en7581-pinctrl";
+
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		i2cclock: i2cclock@0 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+
+			/* 20 MHz */
+			clock-frequency = <20000000>;
+		};
+
+		i2c0: i2c0@1fbf8000 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8000 0x0 0x100>;
+
+			clocks = <&i2cclock>;
+
+			/* 100 kHz */
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disable";
+		};
+
+		i2c1: i2c1@1fbf8100 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8100 0x0 0x100>;
+
+			clocks = <&i2cclock>;
+
+			/* 100 kHz */
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disable";
+		};
+
+		snfi: spi@1fa10000 {
+			compatible = "airoha,en7581-snand";
+			reg = <0x0 0x1fa10000 0x0 0x140>,
+			      <0x0 0x1fa11000 0x0 0x160>;
+
+			clocks = <&scuclk EN7523_CLK_SPI>;
+			clock-names = "spi";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			spi_nand: nand@0 {
+				compatible = "spi-nand";
+				reg = <0>;
+				spi-max-frequency = <50000000>;
+				spi-tx-bus-width = <1>;
+				spi-rx-bus-width = <2>;
+			};
+		};
 	};
 };

---
base-commit: 7605336e9d136c14c94482ce7385de783f2f748e
change-id: 20250201-en7581-dts-spi-pinctrl-4160b825ca9d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


