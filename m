Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A642BC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxht+lGztbp/8xYzXMd9+4DKYSQ6bXWifYCzXRQKuRo=; b=CbMrR+U/2yGMWV1bduOKgASmzZ
	bR9QBf7uJaBe1VL12IS+1JNdQE/SidLeB2cITI9d1cfUwSz9Y757Qh7cCopEuZC8zCjfaBM8i2IsD
	DrTby3d1W3vUP03a6Gm6xuVP8Y6lwOy1eCDQdN4GHZ7GrH9gxwt3wkqTWDxIQSvAuMT3DQFtA8RyU
	p7BdqswxMF2/amzTlY5QKtV0JJgi6OHOocP/u39o/uUenAJVAs6kbkph/Pp2rwEU8HcnMB8fgN+ED
	zyXQg+XI2d7eE0U2uqQu8ySujDZD8cJrAXiAgW9nlSxITiOlHj96qnMdH3yXKGFF16Z0HAv30z/Si
	vfQn4adQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kfh-0000000BPGs-3lt2;
	Tue, 01 Sep 2026 09:20:49 +0000
Received: from [38.71.22.102] (helo=spam.axera-tech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kfb-0000000BPAg-3Urj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:20:47 +0000
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819Jd94047675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:39 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:38 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:32 +0800
Subject: [PATCH v2 5/6] arm64: dts: axera: add AX650 Demo initial support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-5-993bea305476@axera-tech.com>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
In-Reply-To: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
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
	<lenghonglin@axera-tech.com>, <hlleng233@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=6119;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=F+grr6TyjghM0kMzH6YVeD4LuxiU9ojQTyXZ495EXAg=;
 b=SRmfHRCi2NnTJrL8P100TueYzZCFmjBP2ddi+uBUAHfaH5IwfeyQwfLQfIsRSwvByHhpkI442
 2yd4kDIrj9bAHrEol245Iju4NZGplxRTfD9NSNvDuwzxn3W91VuUlKV
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-Originating-IP: [10.126.103.103]
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-MAIL: spam.axera-tech.com 6819Jd94047675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022044_217604_EF7EF209 
X-CRM114-Status: GOOD (  18.58  )
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

Axera AX650 is an Arm64 SoC developed by Axera Semiconductor. The
AX650 Demo board is based on the AX650 SoC and provides the hardware
platform used to validate this initial support.

Add the initial device tree description required to boot Linux on the
AX650 Demo board. The SoC description includes eight Cortex-A55 CPUs
booted through PSCI, the GIC-400 interrupt controller, the ARMv8
architectural timer, the Cortex-A55 PMU, and the DesignWare APB UART
used for the serial console.

The board description provides 8 GiB of system memory, the serial0
alias, and the stdout path for the console.

The platform was tested on an AX650 Demo board using the vendor boot
chain to load the kernel and device tree. A kernel with an embedded
initramfs reached an interactive shell on the serial console, and all
8 CPUs were brought online.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/boot/dts/Makefile             |   1 +
 arch/arm64/boot/dts/axera/Makefile       |   3 +
 arch/arm64/boot/dts/axera/ax650-demo.dts |  30 +++++++
 arch/arm64/boot/dts/axera/ax650.dtsi     | 136 +++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)

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
index 000000000000..d8690287bfcd
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
+	compatible = "axera,ax650-demo", "axera,ax650";
+	model = "Axera AX650 Demo";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory@100000000 {
+		reg = <0x1 0x00000000 0x2 0x00000000>;
+		device_type = "memory";
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
index 000000000000..38547df8b619
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	interrupt-parent = <&gic>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			compatible = "arm,cortex-a55";
+			reg = <0x400>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			compatible = "arm,cortex-a55";
+			reg = <0x500>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			compatible = "arm,cortex-a55";
+			reg = <0x600>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			compatible = "arm,cortex-a55";
+			reg = <0x700>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+				     <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		uart0: serial@2016000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02016000 0x0 0x400>;
+			clock-frequency = <200000000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+
+			status = "disabled";
+		};
+
+		/* GIC-400 register frames start at offset 0x1000. */
+		gic: interrupt-controller@4901000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0x4901000 0x0 0x1000>,
+			      <0x0 0x4902000 0x0 0x2000>,
+			      <0x0 0x4904000 0x0 0x2000>,
+			      <0x0 0x4906000 0x0 0x2000>;
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9
+				     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+};

-- 
2.34.1


