Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D3BC02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSkwaCdJ3qkpnEhd4+OKrM05apqAmrP75BoSYKqIRzk=; b=C6enivvPIaicchyNYRpcpzxN3h
	Mge5rSsGdn2H1ePHTUYKKrcpYyUVezgCaFfTeAHjvMPWdxFEU/mIzMjLYBafCXSvrNlVnaRiON+Ez
	41txKJ4XPXOhcK0dY5aRVxzrF2wY5i+RIxSBVihp0Dv797pdP20wamk1C8n0xjyWyxqK5C/g2ccML
	N5/ILesqKZQ/sglfnYRpSF0r6TkKY5G0U8Gj0mbbvyqvx4sEUdsRhdeaZrtYiKlndil0qQ6YzgM3B
	2ivw1dauym9c/pbOYXZhb4vDGMFzSrwWKykI6Q7ISS84rvx0nTteamRzJd0aI5zX5NYBYMc8F5YCy
	h3DA0w+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSzN-00000001tO6-3CE4;
	Wed, 05 Feb 2025 00:09:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSy2-00000001tIe-1pXx;
	Wed, 05 Feb 2025 00:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C65255C5EE2;
	Wed,  5 Feb 2025 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02E4C4CEE4;
	Wed,  5 Feb 2025 00:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738714113;
	bh=+cEOMy8ydUtssgVKpjALmKCooZqZQVWRptFfWsZE5Cs=;
	h=From:Date:Subject:To:Cc:From;
	b=u5DerNbvJmIvph3GFJrq8qTVKNZcshmpkkS1p4LCVDMQvMblFIJyseVAW4OiWTpnM
	 sFWf/JIoDKA/mVla0JXjQbO74gxJ4Tftl2dYqHnBmRteabC2T4xQ+f5KN5mf0+ZVDe
	 3/d56xRYtyvvSU/ZFhNXHZhZ/QFlDaq39oTZrPorjQ2dVnO4tIwBPihVvJ6ysS+WOO
	 NrOKZKkAM8EjnyDUJcDOy9BHwjG0dAmfkjI9hoRr9hwFFAJfrwRaBsPw5TzaKg2SKo
	 asr+smq5AskK5H1xOkmzWsqEc/GSU+4s0Y7zHnSMWvkTqJYZkDWjiTDquAU/Y+kwAh
	 iQggh3+EBViIg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 05 Feb 2025 01:08:24 +0100
Subject: [PATCH v2] arm64: dts: airoha: en7581: Add more nodes to EN7581
 SoC evaluation board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-en7581-dts-spi-pinctrl-v2-1-ae61df01802a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPeromcC/4WNQQ6CMBBFr0Jm7Zi2oYiuvIdhUcsAE0lppoRoS
 O9u5QIu30v++zskEqYEt2oHoY0TL6GAOVXgJxdGQu4Lg1HGKqM0UrjYVmO/JkyRMXLwq8xY60Y
 9W2O9u/ZQxlFo4PcRfnSFJ07rIp/jZ9M/+ze5adTonKtLcvC1a+4vkkDzeZERupzzF+3sJvq9A
 AAA
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
X-CRM114-CacheID: sfid-20250204_160834_587054_8CAE83E4 
X-CRM114-Status: GOOD (  10.17  )
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

Introduce the following nodes to EN7581 SoC and EN7581 evaluation board:
- clock controller
- rng controller
- pinctrl
- i2c controllers
- spi nand controller

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Fix dtschema warnings
- Fix i2c nodes generic name
- Fix commit log
- Link to v1: https://lore.kernel.org/r/20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org
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
index 55eb1762fb11364877695960f5a2d3e42caf8611..8e3c53edce2e40103e825b3123d54e2c9f1e8638 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -2,6 +2,8 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7581-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -122,6 +124,12 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	clk20m: clock-20000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -150,5 +158,87 @@ uart1: serial@1fbf0000 {
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <1843200>;
 		};
+
+		scuclk: clock-controller@1fb00000 {
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
+			compatible = "airoha,en7581-gpio-sysctl", "syscon",
+				     "simple-mfd";
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
+		i2c0: i2c@1fbf8000 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8000 0x0 0x100>;
+
+			resets = <&scuclk EN7581_I2C2_RST>;
+
+			clocks = <&clk20m>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c1: i2c@1fbf8100 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8100 0x0 0x100>;
+
+			resets = <&scuclk EN7581_I2C_MASTER_RST>;
+
+			clocks = <&clk20m>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
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


