Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01A9F36C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKl+bQNpWD9JU/8BGD9cASqBRqdtlUW4I0VqiWU4D+0=; b=wyOZAY5Yf+MUI18vqiH8CtJjui
	KbpBNPJ8F7OrPs/oK8ENshTF69q+WXX/2/CoNG4g0zueogkg+4eExLHgRvdqG+inL/kvihGv9vAk5
	cfnsjTXf4eG+dLNmjEyCXhQYmBH6wYv/2ZwpuJ0vr8ffl6ptYMN3298jZ4uJG/pTF5W3aZOR1N5Ud
	SvpyNsITBe6GqCkFhha8AndzMcPXSZW0KXIh1Syd9JR9cKAvYV6TVkM9qPsj1gH6k1iGvSjKrDyNW
	aEIvLQevPIHl2GdEroNJV5u/S7d/Ud7e8PxKYdHkbbVDUzNDhZw2uUR+PJ+WLsieo1k298jgQkk9f
	z5gwG3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnGx-00000006poW-3H2n;
	Mon, 20 Apr 2026 11:58:39 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnGq-00000006pin-1td2;
	Mon, 20 Apr 2026 11:58:34 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776686308;
	bh=1WmAgn/FyzsKhMv+YbDwDX6oHzK8g6LX2ZrR/tJNlRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zq0lQpL09erDcI35QsWMK54O4QwcsaBe2uGoQdyutNGi53llGlJ21VdkkRI8E9BHv
	 9brYw4ssMws8HsGwnojT6P6s18STJJ7mAQzwoOOBblzHgAm+yr+9YNrUIkUxukDtxm
	 GDR5d1Hvoe5qWUs25YFedYj+A3xnzliLjTXLnG8g=
Date: Mon, 20 Apr 2026 13:58:10 +0200
Subject: [PATCH v3 2/4] arm64: dts: amlogic: t7: Add UART controllers nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776686306; l=3650;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=1WmAgn/FyzsKhMv+YbDwDX6oHzK8g6LX2ZrR/tJNlRw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP01c986XK1M73imz/pawPqggaTpTWUHpjx/8+Yxoykf0MdHPg0ep6+sR3mPTxJBfkWZfnziwOX
 hld/29NENvAg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_045832_849065_13CE51F3 
X-CRM114-Status: UNSURE (   7.71  )
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
index 4a55d9641bc9b..81c26b1e3e7a4 100644
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


