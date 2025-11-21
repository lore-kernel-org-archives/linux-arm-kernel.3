Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F6DD59F5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIiprcjgq2lecYZK2AZBwF2o0KKwZPjW0iWNG/O03pU=; b=FYbc/H2Psopc5aG29UHcs1ORGU
	Mko3oCf7uWilQXKpoWq7wmjqBW44soBaATYCnvnBfKgfUZocJ/b5jh/d48pc3IKzC/6LZHZ81qBJh
	GoO3lbmYjOWczN4TRUxFbHooh/pmTz/VTL0rYPrah2x9LL5fJ1SRUGaiuytoB2jUmObUOpTq9zNcs
	5Hh7Z57E94LEm5e93RY/8SF8D+81ATKPce8bE7039jYt0c1uI0Ts0rnH5r4wStxSiNtG/CKmI0L4t
	D7tUcOT2VJX0/+TspAe3hA3lBnAhgZZPzc33zFQiyo35+yxn1z+JmDiwFeDn803c/F2pvA4/q4QKj
	1tltjm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpf-00000001Kjt-0E6k;
	Sat, 13 Dec 2025 02:58:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpF-00000001KKg-17H6;
	Sat, 13 Dec 2025 02:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UIiprcjgq2lecYZK2AZBwF2o0KKwZPjW0iWNG/O03pU=; b=XOHx94rKui6wWiK0OYSD/WIlsq
	LW3BHu3xXK7YdX5edIR5JlnO/bPAePMN4CAF+w1YV94XZhtW+NYGFb2a8LplhEtX+kAkIdF6GuigU
	8R9G+iOxV2pB61+YYdGtXK50hm0BLy5HOQPDN4rBdDzyorQycGu3LZkmYQ2OFSTOVcDGPRtjZRKhc
	G7Fn6OG7r/pnGGf96V28LfexWycrfA7fcef7xdkuuo8y4khd+r6zHU2FBcztD4TVnzjeonI1zS3+6
	u10RK0Xn7z/PBhKUkii4ZejrsH2T0qBVcQRz1brPYM6riSyKCh3IjoTMbbYOIhluanbppDHZMcWDK
	aneXYOdg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLwB-0000000GL9i-25cU;
	Fri, 21 Nov 2025 07:52:14 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AL8j5w853255892, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763714706; bh=UIiprcjgq2lecYZK2AZBwF2o0KKwZPjW0iWNG/O03pU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=CBZV4LVGo68+lGMx/J7aC695Mrcp8oF8xfHZbJ6/uXm/8zNjx04MpbRPUK0ZCkmlz
	 lCAKt6J5kaQeJa0+diC9glyrUOxDfYkwQOgGn5mhwezKn6/JpwJds2wrgmoXzgKbkM
	 cf4uMhvtEaD4eFetUWdTEyXcL/HpBwzVoVDglS8hUrk90vPWXws43UTapwZonm9b1Q
	 TnLWX+6AX85y8qwrs8tmijiBi4IXdfFBUlotOfBYAk2eERFCC1gjbGegD8ZGYINBDL
	 48B6dBiqGU812KEXhPJl+FmB2kD6CaImcdKSjJI0U6rSJif87qPOlHC8c30G5XZmyt
	 qHl4YHoXi1bag==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AL8j5w853255892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 16:45:05 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:45:06 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:45:05 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Fri, 21 Nov 2025 16:45:05 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lee@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>
Subject: [PATCH v3 2/2] arm64: dts: realtek: Add Kent SoC and EVB device trees
Date: Fri, 21 Nov 2025 16:45:05 +0800
Message-ID: <20251121084505.3200-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251121084505.3200-1-eleanor.lin@realtek.com>
References: <20251121084505.3200-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_075212_176561_25A63E31 
X-CRM114-Status: GOOD (  14.55  )
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

Add Device Tree hierarchy for Realtek Kent SoC family:

- kent.dtsi: base SoC layer
- rtd<variant>.dtsi: SoC variant layer
- rtd<variant>-<board>.dtsi: board layer
- rtd<variant>-<board>-<config>.dts: board configuration layer

Include RTD1501s Phantom EVB (8GB), RTD1861B Krypton EVB (8GB), and
RTD1920s Smallville EVB (4GB).

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 166 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 118 +++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  72 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  12 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 128 ++++++++++++++
 11 files changed, 596 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/realtek/Makefile
index ef8d8fcbaa05..60a37d5a948c 100644
--- a/arch/arm64/boot/dts/realtek/Makefile
+++ b/arch/arm64/boot/dts/realtek/Makefile
@@ -1,15 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1293-ds418j.dtb
-
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-mele-v9.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-probox2-ava.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-xnano-x5.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-zidoo-x9s.dtb
-
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1296-ds418.dtb
-
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1395-bpi-m4.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1395-lionskin.dtb
-
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1501s-phantom-8gb.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1619-mjolnir.dtb
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1861b-krypton-8gb.dtb
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1920s-smallville-4gb.dtb
diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
new file mode 100644
index 000000000000..ae006ce24420
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek Kent SoC family
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
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
+	aliases {
+		serial0 = &uart0;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_1>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l2_2>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_3: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		l3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <0x200000>;
+			cache-unified;
+		};
+	};
+
+	psci: psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x40000>, /* boot code */
+			 <0x98000000 0x0 0x98000000 0xef0000>, /* rbus */
+			 <0xa0000000 0x0 0xa0000000 0x10000000>, /* PCIE */
+			 <0xff000000 0x0 0xff000000 0x200000>; /* GIC */
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		rbus: bus@98000000 {
+			compatible = "simple-bus";
+			ranges = <0x0 0x98000000 0xef0000>,
+				 <0xa0000000 0xa0000000 0x10000000>; /* PCIE */
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			uart0: serial@7800 {
+				compatible = "snps,dw-apb-uart";
+				reg = <0x7800 0x100>;
+				clock-frequency = <432000000>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+		};
+
+		gic: interrupt-controller@ff100000 {
+			compatible = "arm,gic-v3";
+			reg = <0xff100000 0x10000>,
+			      <0xff140000 0x80000>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#interrupt-cells = <3>;
+			#size-cells = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
new file mode 100644
index 000000000000..65f7ede3df73
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1501 SoC
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include "kent.dtsi"
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
new file mode 100644
index 000000000000..09e544acfd34
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1501S Phantom EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1501s-phantom.dtsi"
+
+/ {
+	compatible = "realtek,phantom", "realtek,rtd1501s";
+	model = "Realtek Phantom EVB Chromium (8GB)";
+
+	memory@40000 {
+		device_type = "memory";
+		reg = <0x0 0x50000 0x0 0x7ffb0000>,
+		      <0x0 0x8a100000 0x0 0xdef0000>,
+		      <0x0 0x98700000 0x0 0x7900000>,
+		      <0x0 0xa0600000 0x0 0x5ea00000>,
+		      <0x1 0x0 0x0 0xa0000000>,
+		      <0x1 0xa0600000 0x0 0x5fa00000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi b/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
new file mode 100644
index 000000000000..bcfb96799671
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1501S Phantom EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/thermal/thermal.h>
+#include "rtd1501.dtsi"
+
+/ {
+	chosen {
+		stdout-path = "serial0:460800n8";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x0 0x0 0x20000000>;
+			size = <0x0 0x2000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	cpu_opps: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp800: opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <830000 830000 1100000>;
+		};
+
+		opp900: opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <850000 850000 1100000>;
+		};
+
+		opp1000: opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <870000 870000 1100000>;
+		};
+
+		opp1100: opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <890000 890000 1100000>;
+		};
+
+		opp1200: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <910000 910000 1100000>;
+		};
+
+		opp1300: opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <930000 930000 1100000>;
+		};
+
+		opp1400: opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <950000 950000 1100000>;
+		};
+
+		opp1500: opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <970000 970000 1100000>;
+		};
+
+		opp1600: opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <990000 990000 1100000>;
+			opp-suspend;
+		};
+
+		opp1700: opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <1010000 1010000 1100000>;
+		};
+
+		opp1800: opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1030000 1030000 1100000>;
+		};
+
+		opp1900: opp-1900000000 {
+			opp-hz = /bits/ 64 <1900000000>;
+			opp-microvolt = <1050000 1050000 1100000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861.dtsi b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
new file mode 100644
index 000000000000..44c3de8f1f48
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1861 SoC
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include "kent.dtsi"
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
new file mode 100644
index 000000000000..9c23d901c49c
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1861B Krypton EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1861b-krypton.dtsi"
+
+/ {
+	compatible = "realtek,krypton", "realtek,rtd1861b";
+	model = "Realtek Krypton EVB (8GB)";
+
+	memory@40000 {
+		device_type = "memory";
+		reg = <0x0 0x50000 0x0 0x7ffb0000>,
+		      <0x0 0x8a100000 0x0 0xdef0000>,
+		      <0x0 0x98700000 0x0 0x7900000>,
+		      <0x0 0xa0600000 0x0 0x5ea00000>,
+		      <0x1 0x0 0x0 0xa0000000>,
+		      <0x1 0xa0600000 0x0 0x5fa00000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi b/arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
new file mode 100644
index 000000000000..b500f4d2c502
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1861B Krypton EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1861.dtsi"
+
+/ {
+	chosen {
+		stdout-path = "serial0:460800n8";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x0 0x0 0x20000000>;
+			size = <0x0 0x2000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	cpu_opps: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp1200: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <900000>;
+		};
+
+		opp1600: opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1000000>;
+			opp-suspend;
+		};
+
+		opp1800: opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920.dtsi b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
new file mode 100644
index 000000000000..becf546216e9
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1920 SoC
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include "kent.dtsi"
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
new file mode 100644
index 000000000000..9fd6976e0d9b
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1920S Smallville EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1920s-smallville.dtsi"
+
+/ {
+	compatible = "realtek,smallville", "realtek,rtd1920s";
+	model = "Realtek Smallville EVB (4GB)";
+
+	memory@40000 {
+		device_type = "memory";
+		reg = <0x0 0x50000 0x0 0x7ffb0000>,
+		      <0x0 0x8a100000 0x0 0xdef0000>,
+		      <0x0 0x98700000 0x0 0x7900000>,
+		      <0x0 0xa1000000 0x0 0x5e000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi b/arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi
new file mode 100644
index 000000000000..3db8fcea6447
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1920S Smallville EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/thermal/thermal.h>
+#include "rtd1920.dtsi"
+
+/ {
+	chosen {
+		stdout-path = "serial0:460800n8";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		protected_mem: protected-mem@50000 {
+			reg = <0x0 0x50000 0x0 0xbf0000>;
+			no-map;
+		};
+
+		metadata: metadata@c40000 {
+			reg = <0x0 0xc40000 0x0 0x3c4000>;
+			no-map;
+		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x0 0x0 0x20000000>;
+			size = <0x0 0x2000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	cpu_opps: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp800: opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <830000 830000 1100000>;
+		};
+
+		opp900: opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <850000 850000 1100000>;
+		};
+
+		opp1000: opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <870000 870000 1100000>;
+		};
+
+		opp1100: opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <890000 890000 1100000>;
+		};
+
+		opp1200: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <910000 910000 1100000>;
+		};
+
+		opp1300: opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <930000 930000 1100000>;
+		};
+
+		opp1400: opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <950000 950000 1100000>;
+		};
+
+		opp1500: opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <970000 970000 1100000>;
+		};
+
+		opp1600: opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <990000 990000 1100000>;
+			opp-suspend;
+		};
+
+		opp1700: opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <1010000 1010000 1100000>;
+		};
+
+		opp1800: opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1030000 1030000 1100000>;
+		};
+
+		opp1900: opp-1900000000 {
+			opp-hz = /bits/ 64 <1900000000>;
+			opp-microvolt = <1050000 1050000 1100000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
-- 
2.34.1


