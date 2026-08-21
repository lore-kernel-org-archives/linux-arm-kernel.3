Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA2FC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTj1gaL36pmY1hUg85mdTN81uZ1cHwv626SRuWavoxo=; b=xJH6aoOmP0uIF7+gSJHBTFI6if
	cV4snqfVwFnla1Wf3/m+pckNIENmUAIbC7q+Y2GB6SpTw94nm1D73c67/EOUK4v7il9mMQ2uGzbvV
	UJqmCDthgFOf1NnO2LFGZLWmuLM6ZC2vjLOh81MNXE1ANmLbRNZcd0287Z9D0T+SNtXizopOrp+lG
	jC7Abqi0ohZ7scCdnk8ho5MXTT0vOv5pMSw+lMlK3fcZ1WA9CEXnZJDns0Sclca5XlQVeaZc88K74
	udNaKYZqo6yyGeSCQc6hH93vAPJ0td0vddATEZEuoNxVtZbTgz6Qtc1r1NAdcXvfHddZDMBvRz2J7
	kGh10aOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLxU-0000000CzQN-3F3h;
	Fri, 21 Aug 2026 09:54:44 +0000
Received: from [38.71.22.102] (helo=spam.axera-tech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLxS-0000000CzOx-2Ah9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:54:43 +0000
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9Vxtl010041
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 17:31:59 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlF009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:34 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:31 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Fri, 21 Aug 2026 17:30:05 +0800
Subject: [PATCH 5/6] arm64: dts: axera: add AX650 Demo initial support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ax650-v1-v1-5-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
In-Reply-To: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=5267;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=3X3wyaDmXz7D29E5a4YcUgpvoAFMmWNICN87b2MBl5s=;
 b=A+yOz1mzO41sVuKiZTa2jE7J5fAut/n6hrrXf1ySrHXQN0hbYy5z1gQPEIGfoDRDKYut1egrh
 H2hf2YunhUxADzQZ1JfZIgWAKSmnOpHwJpRpB92tD1zaO8h4LLpQIJA
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-Originating-IP: [10.126.103.103]
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-MAIL: spam.axera-tech.com 67L9Vxtl010041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025442_877364_6EE78BD0 
X-CRM114-Status: GOOD (  14.81  )
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

Add initial device tree support for the Axera AX650 SoC and Demo board.

Reviewed-by: Shi Zhicheng <shizhicheng@axera-tech.com>
Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/boot/dts/Makefile             |   1 +
 arch/arm64/boot/dts/axera/Makefile       |   3 +
 arch/arm64/boot/dts/axera/ax650-demo.dts |  30 +++++++
 arch/arm64/boot/dts/axera/ax650.dtsi     | 134 +++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f12..93740acb553d 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -10,6 +10,7 @@ subdir-y += apm
 subdir-y += apple
 subdir-y += arm
 subdir-y += aspeed
+subdir-y += axera
 subdir-y += axiado
 subdir-y += bitmain
 subdir-y += blaize
diff --git a/arch/arm64/boot/dts/axera/Makefile b/arch/arm64/boot/dts/axera/Makefile
new file mode 100644
index 000000000000..76f436a9466a
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_AXERA) += ax650-demo.dtb
diff --git a/arch/arm64/boot/dts/axera/ax650-demo.dts b/arch/arm64/boot/dts/axera/ax650-demo.dts
new file mode 100644
index 000000000000..aef8f0516232
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650-demo.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "ax650.dtsi"
+
+/ {
+	model = "Axera AX650 Demo";
+	compatible = "axera,ax650-demo", "axera,ax650";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x2 0x00000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axera/ax650.dtsi b/arch/arm64/boot/dts/axera/ax650.dtsi
new file mode 100644
index 000000000000..4fceaee81496
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			<GIC_PPI 14
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			<GIC_PPI 11
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			<GIC_PPI 10
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	/* GIC-400 block base; register frames start at offset 0x1000. */
+	gic: interrupt-controller@4900000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0x0 0x4901000 0x0 0x1000>,
+			<0x0 0x4902000 0x0 0x1000>,
+			<0x0 0x4904000 0x0 0x2000>,
+			<0x0 0x4906000 0x0 0x2000>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+			<&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		uart0: serial@2016000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02016000 0x0 0x400>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <200000000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.34.1


