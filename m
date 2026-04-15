Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A3EF4198B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDW/hkjZG2TNajZ9OhpqOBIm7y1FmRjLBIkT4OyaOGo=; b=Uu/spmShV49HG1GISiU58yxjWZ
	qJdLbrGLWxT1R6QmBxxqMOOWcxnFCPrI+pYuiz5VNX0Kx/ZJjpO/hxj9nmLmyt98UWBik578Fw9yh
	K3RURNM5pj6d85240sAUrr19C5DqIyVV3lZTXH4VbbLGtTEZXcN3MRUV6E9UO5Iu7yR1i3hkR7P6O
	wAp7gJS7FwF1brjkwrJOtDiUuy8EQIUiOBvbJJlbPMZOGdIIk6L3YQ+3QxDPxhrnu5NKCSvVtBogU
	Dd+BijaEUZcmCehISWV7vX3pBDn3VDRcGJMwcl/HLq/kGM7itxHrFJyHPWk3cr2VpIMNcSJE9fJ7z
	MF2qDolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyF6-000000011ta-0Tyr;
	Wed, 15 Apr 2026 11:17:12 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyF2-000000011rt-0eQq;
	Wed, 15 Apr 2026 11:17:09 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776251823;
	bh=L3Q7zkw2FPx+B+NP3gRuCh4v3HV7G+1IeRCxJ9+Fo90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XH8leFYvQduC2e5BQTdD3s/kN4Yx8hNJH9qS4aenS5YRC1pDORLWUQiEX6Sb5JAYg
	 LJ/Inn/WoUYRk48g9qfhvCEQKjyyDaVCEpCB/yhIojvxzuxX7V1mOJGyXItDOKWjE0
	 ShiETy+Fng0eYhXXRZmXDg0LJuH3AzipkpUAvyHI=
Date: Wed, 15 Apr 2026 13:16:14 +0200
Subject: [PATCH 2/3] arm64: dts: amlogic: t7: Add UART controllers nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-add-bluetooth-t7-vim4-v1-2-0ba0746cc1d6@aliel.fr>
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
In-Reply-To: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776251821; l=3650;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=L3Q7zkw2FPx+B+NP3gRuCh4v3HV7G+1IeRCxJ9+Fo90=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNZFuzW9w43solsBUqQBQsol4CdNLpiKGi8QELKGmU1lzLkaCkIl4n0fwFlyQHw5mQj2kXGqrTl
 in7oOmgbvAQI=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_041708_607734_4F1A73A1 
X-CRM114-Status: UNSURE (   8.01  )
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

Add device tree nodes for UART B through F (serial@7a000 to
serial@82000), completing the UART controller description for the T7
SoC. Each node includes the peripheral clock.

While at it, move the uart_a node to its correct position in the
bus address order (0x78000) to comply with the DT requirement that
nodes be sorted by their reg address. Complete the
uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
associated clock-names, matching the vendor default clock assignment,
consistent with the other UART nodes.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 531931cc1437c..56b015cfbd6d1 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
-			uart_a: serial@78000 {
-				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
-				reg = <0x0 0x78000 0x0 0x18>;
-				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-				status = "disabled";
-			};
-
 			gp0: clock-controller@8080 {
 				compatible = "amlogic,t7-gp0-pll";
 				reg = <0x0 0x8080 0x0 0x20>;
@@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
 				status = "disabled";
 			};
 
+			uart_a: serial@78000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x78000 0x0 0x18>;
+				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_b: serial@7a000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x7a000 0x0 0x18>;
+				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_c: serial@7c000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x7c000 0x0 0x18>;
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_d: serial@7e000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x7e000 0x0 0x18>;
+				interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_e: serial@80000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x80000 0x0 0x18>;
+				interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_f: serial@82000 {
+				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
+				reg = <0x0 0x82000 0x0 0x18>;
+				interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
 			sd_emmc_a: mmc@88000 {
 				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
 				reg = <0x0 0x88000 0x0 0x800>;

-- 
2.49.0


