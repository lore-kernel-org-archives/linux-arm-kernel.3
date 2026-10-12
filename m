Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE30CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUNMCd9323LQy3MbLNI68EZi6GlqhTxfrN4+F2NjDg0=; b=E8wkxrLaY3pPTQs8GoOoa9VkN/
	SbMZ6+2qNSPFbyl00bAlW9gk68bp34x22JaDrN7RpDUZv8Vv5NLtlci9HDXtvMjIA/A564VnBAMpp
	0PQ+kxkaiemHtYV32naROEF00PRZyMncFjZ8bLw7mCZYOejKxHG2/AEAUURhiPGzMESv+VRfo+Jlr
	mKwnKE9J5BELHudollCLZUuXAYcnpNaWb2xzZybeIZaHkSMRdU36UbeWxn1Nd9A5JwqoqGRsf89SP
	/9K7DWssChkDC3nZkN5+6RaUVRdJb6YQhUVo1BHly+NFkkmQ9j1v41P3Fj6NFeRwEjzc60oS9QWmj
	nAKissdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJs4-0000000B5nX-09xI;
	Mon, 12 Oct 2026 17:31:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJrv-0000000B5hX-0pZc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13DFC44020;
	Mon, 12 Oct 2026 17:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF254C2BCFD;
	Mon, 12 Oct 2026 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791826277;
	bh=ta+sCYa3B5iIapBdVCBKSs7ysLBr0yERQl2LLQed9nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=av5Cyf44hSHHeb3QYE8ikNjcauX+do3+/plVFROhEbZGzqQKgQLYUZb3CIRLCrCSq
	 BQJUz/5N002zn2g0cCMYTtdp/cWOrrIo/A5s9nrh2Br4M3OutCp1Fk1yyvoZziQATm
	 UiG4OBiZz8aCezRu2ouHfZtVkAQO7XXO2PskMgCjq7hp5FQPOpNVIdffKm0Su14QqT
	 TQ0yp5vLaWBhFYVea9DZJ4kp9X9yeQZc9OzBT6Rhzh86ihXTmIwL5wYaWUG0T4uYaB
	 SMjvOuoc8xm6L3ZgQESzRGf0QAxLl5nUYFN+PTQo7dGgiM8sHwg/zPigSR8Khm8/uG
	 uib7SMDoAAA0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7F7CA9EDD;
	Mon, 12 Oct 2026 17:31:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 12 Oct 2026 20:31:22 +0300
Subject: [PATCH v4 08/10] ARM: dts: cortina: Add CS7542 SoC and Securifi
 Almond+ board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-cs75xx-v4-8-df250d903682@gmail.com>
References: <20261012-b4-cs75xx-v4-0-df250d903682@gmail.com>
In-Reply-To: <20261012-b4-cs75xx-v4-0-df250d903682@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791826275; l=6446;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Kz/iJoUxk1DvFqhFj+/+lUnb7liycFbnebAqJPAqCnM=;
 b=s4HmijCuvqxTe3+D/b2Qj1bGYtN7jNsgHktHoXwy6O+KwsLqF9F8v/P+pCAhHqiRukmoe+6D2
 HOQ8tWbok8fACLh1ddJqzXfibYPIo7hBfPVP+s/dOhWng8XmZjSTASb
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add a minimal description of the Cortina Systems CS7542 SoC: the two
Cortex-A9 cores, SCU, GIC, global timer, private timer and watchdog,
PL310 L2 cache controller and the four on-chip UARTs.

The peripheral clock (APB) runs at 100, 150 or 170 MHz depending on the
boot strap pins. Until there is a driver for the global control block
that reads the straps, model it as a fixed clock whose rate is provided
by the board.

The Securifi Almond+ is a touchscreen Wi-Fi router with 512 MiB of DDR3,
512 MiB of NAND flash, a QCA8337 switch, QCA9880 and AR9580 Wi-Fi and an
ASM1042 USB 3.0 controller behind the SoC PCIe root ports. For now,
describe the memory, the console UART and a ramoops region, and reserve
the top 64 MiB of RAM which the vendor firmware hands to the packet
engine queue manager.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/cortina/Makefile                 |   3 +
 .../dts/cortina/cs7542-securifi-almondplus.dts     |  55 +++++++++
 arch/arm/boot/dts/cortina/cs7542.dtsi              | 127 +++++++++++++++++++++
 4 files changed, 186 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 28fba538d..cf4433001 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -12,6 +12,7 @@ subdir-y += broadcom
 subdir-y += calxeda
 subdir-y += cirrus
 subdir-y += cnxt
+subdir-y += cortina
 subdir-y += gemini
 subdir-y += hisilicon
 subdir-y += hpe
diff --git a/arch/arm/boot/dts/cortina/Makefile b/arch/arm/boot/dts/cortina/Makefile
new file mode 100644
index 000000000..93be6c9ae
--- /dev/null
+++ b/arch/arm/boot/dts/cortina/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_CORTINA_ACCESS) += \
+	cs7542-securifi-almondplus.dtb
diff --git a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
new file mode 100644
index 000000000..e2988c687
--- /dev/null
+++ b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Device Tree Source for the Securifi Almond+ router
+ */
+
+/dts-v1/;
+
+#include "cs7542.dtsi"
+
+/ {
+	model = "Securifi Almond+";
+	compatible = "securifi,almondplus", "cortina,cs7542";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ramoops@1bf00000 {
+			compatible = "ramoops";
+			reg = <0x1bf00000 0x100000>;
+			record-size = <0x20000>;
+			console-size = <0x80000>;
+			ecc-size = <16>;
+			no-map;
+		};
+
+		/* Reserved for the packet engine queue manager */
+		qm-buffer@1c000000 {
+			reg = <0x1c000000 0x4000000>;
+			no-map;
+		};
+	};
+};
+
+&apb_clk {
+	clock-frequency = <150000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/cortina/cs7542.dtsi b/arch/arm/boot/dts/cortina/cs7542.dtsi
new file mode 100644
index 000000000..29b0b7da8
--- /dev/null
+++ b/arch/arm/boot/dts/cortina/cs7542.dtsi
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Device Tree Source for the Cortina Systems CS7542 SoC
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	/* Rate is selected by the boot strap pins, set by the board */
+	apb_clk: clock-apb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "apb";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <1>;
+			enable-method = "cortina,cs7542-smp";
+			cpu-release-addr = <0 0xf00000b8>;
+			next-level-cache = <&l2>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		uart0: serial@f0070110 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf0070110 0x30>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@f0070140 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf0070140 0x30>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		uart2: serial@f0070170 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf0070170 0x30>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		uart3: serial@f00701a0 {
+			compatible = "cortina,cs7542-uart";
+			reg = <0xf00701a0 0x30>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>;
+
+			status = "disabled";
+		};
+
+		l2: cache-controller@f5010000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xf5010000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			arm,shared-override;
+			arm,tag-latency = <1 1 1>;
+			arm,data-latency = <1 1 2>;
+		};
+
+		scu@f8000000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0xf8000000 0x100>;
+		};
+
+		timer@f8000200 {
+			compatible = "arm,cortex-a9-global-timer";
+			reg = <0xf8000200 0x20>;
+			interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&apb_clk>;
+		};
+
+		timer@f8000600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0xf8000600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&apb_clk>;
+		};
+
+		watchdog@f8000620 {
+			compatible = "arm,cortex-a9-twd-wdt";
+			reg = <0xf8000620 0x20>;
+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&apb_clk>;
+		};
+
+		gic: interrupt-controller@f8001000 {
+			compatible = "arm,cortex-a9-gic";
+			reg = <0xf8001000 0x1000>,
+			      <0xf8000100 0x100>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+	};
+};

-- 
2.53.0



