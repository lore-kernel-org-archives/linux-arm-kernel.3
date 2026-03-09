Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB0F417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mDlQ1F3MoMglSJv1YlJJl/kF8KgvLGzPVUN0strxdnY=; b=AfuqB50XG62c7BXYxS2if6BLYJ
	K0moetTH1IIQWiE+kzFAx8sjVCNWKgnT6sbq1LNG1ipKZKjly+rWBSFwUDZ+tkLq5EJBw7II1xh3l
	J5anVkEcBLhoe+H5ziGNgyphMEMsnf2IBOfKt7vkF8T0gteJchN9NgNpO34ysWkHUQ6JOd6azVXsv
	Rsi8h3hEvovAJVgVkkZ6Nl6jLvApb8O0tfFD8cvJNI1+CjfKA6nn/FjLsDN/Xxno7YNrpx5LKEv1K
	8vIWIQyPBcSqdctTtwgNVjBR42g469aA8mdIgfmJRw1QaJd2jMJlSzc+D2sKrWKx03T+odwEEmqS9
	9M/22/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcrs-00000007dtu-3TPj;
	Mon, 09 Mar 2026 15:50:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcrr-00000007dtK-0uIU;
	Mon, 09 Mar 2026 15:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04EF441781;
	Mon,  9 Mar 2026 15:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FE5C2BC86;
	Mon,  9 Mar 2026 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071401;
	bh=jD+HjaNHgbAd33dUrOKzWmUqIYgmr2OAzta/dFxlHAU=;
	h=From:Date:Subject:To:Cc:From;
	b=HNZOM4inoAoeLVAdbE04fEzIvpjZpd+dgYRhu5cr8IA8TjG4+ZUcs3mwuNI+t2Llc
	 EY1Pl0xqk+nFlYuMjSA/ywSaJZOlybOuvRzYLRs5OAgb8a4n91yVz6412MiKhN0WY7
	 zF9aSHBs44HZIAt3hkfReTMgBUSTTkzLG2r1bj1wiJrzQeGg75+lE+cxBPzTFwMd7c
	 xviK4ZIsf1phFivTzPHUmxHTKUPskZHEt554VZg/Gx5TLjKb8OaxsdG9wpW5rQqNUq
	 PsbqEXgxYnO8pEtYrLTNfZapiNH7+pei18yuI24Lvz2C53qFzidODL5ST7uh5oVDdk
	 2QsilGm7dr/OA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 09 Mar 2026 16:49:49 +0100
Subject: [PATCH] arm64: dts: airoha: en7581: Add thermal node to to EN7581
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-airoha-7581-thermal-zones-v1-1-f9b543981022@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBeIDq36KsNDsJkNaCupyJj47
 is7fof/vyCLqWQYqwtMTs2aYkH9qGAOHBdB9cXQUNPRkwZktRQYXdvXeASxjVf8pigZO6LWucH
 z7BlKv5u89fN/v6b7/gGVZRW3awAAAA==
X-Change-ID: 20260309-airoha-7581-thermal-zones-6005779dacda
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_085003_321964_DBD7C42E 
X-CRM114-Status: GOOD (  10.58  )
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

Introduce thermal controller node to EN7581 SoC.
Define thermal-zones and related cpu trips and cooling-maps.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8eb6cf91343495d1fe531a868e41fb..092c8ab0f4322552495dbe00b9e41e087876817e 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -74,6 +75,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			clock-frequency = <80000000>;
 			next-level-cache = <&l2>;
@@ -83,6 +85,7 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			clock-frequency = <80000000>;
 			next-level-cache = <&l2>;
@@ -92,6 +95,7 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			clock-frequency = <80000000>;
 			next-level-cache = <&l2>;
@@ -101,6 +105,7 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			clock-frequency = <80000000>;
 			next-level-cache = <&l2>;
@@ -124,6 +129,39 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				cpu_hot: cpu-hot {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_hot>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	clk20m: clock-20000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -173,6 +211,11 @@ spi_nand: nand@0 {
 			};
 		};
 
+		chip_scu: syscon@1fa20000 {
+			compatible = "airoha,en7581-chip-scu", "syscon";
+			reg = <0x0 0x1fa20000 0x0 0x388>;
+		};
+
 		scuclk: clock-controller@1fb00000 {
 			compatible = "airoha,en7581-scu";
 			reg = <0x0 0x1fb00000 0x0 0x970>;
@@ -300,6 +343,15 @@ rng@1faa1000 {
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		thermal: thermal-sensor@1efbd000 {
+			compatible = "airoha,en7581-thermal";
+			reg = <0x0 0x1efbd000 0x0 0xd5c>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			airoha,chip-scu = <&chip_scu>;
+
+			#thermal-sensor-cells = <0>;
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";

---
base-commit: 405c09548a695ca7be58b5b9d3ac8388630e907f
change-id: 20260309-airoha-7581-thermal-zones-6005779dacda

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


