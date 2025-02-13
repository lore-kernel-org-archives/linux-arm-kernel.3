Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FE4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emtVrE88a/udeqXCOA0jPNP7Xe99uTxpCHXfK09rSEM=; b=YtC7WrHV/s98AonSlHF55YlJOB
	FkESOK/R9Yf2TBJ5oDKKYM1uzQx1/rjEyiGauwU8a0nYGLShcvit9zugQuQ3UbdG3r56Z3UzqHko0
	TJjBgLa1T94R3ji7fvQGPjboY8pa74IWUQju+94SE2ZQC6QNOBgUNwZbeP+HYT/eoQLkNlno3ax7i
	tRZ1O8d66JZkdqa5oCk4Ztm23aDtra2boV6NX1Wr+27TknluoeY/kmJIM0CXTUFyzziOYzvAp9c8T
	Q4DkesmOlAaY0Vf0u/FtIBjqyDWD11/dUh/4/LXwc7JxD6s2i7qMg2DFUmsq2blGDWWldMrGk/Vre
	uzyAX11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieq3-0000000COE7-0gXn;
	Thu, 13 Feb 2025 19:25:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqs-0000000CDBQ-0994;
	Thu, 13 Feb 2025 18:22:19 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so2163747a12.1;
        Thu, 13 Feb 2025 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470937; x=1740075737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emtVrE88a/udeqXCOA0jPNP7Xe99uTxpCHXfK09rSEM=;
        b=cnKELd8V4Q9euK538UVDaokbQxSMEQhAKCioL8HiEP6iHt2a5qgknsaOWo0MnJrInO
         DxQJn/hJoyOjVqS75Jwog51yIINQllBCnx/D3z1B5l8GB6ioPiWuA3WglGSxqM4MkdkP
         KHh8CScTJloqZxmslYLbZvxPPuEe6KNd5LuGlt1KYytzatCyqc4WOJLQp+cOT6rW70Hz
         C35WOyd1MJMRtNuNHz2QuvfDnFln+KizpjvgztKNnPnTk4YDlKI+1fmr/g4ebaG6r+HF
         uJaKG1xLtvDkLvY/TB1zEytYwiB+BzG3HFox8OLVSYbv7m/J374Fm3ELf3TytizOxZuf
         UM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470937; x=1740075737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emtVrE88a/udeqXCOA0jPNP7Xe99uTxpCHXfK09rSEM=;
        b=mAZ/9S/lrZWCwf4CWPw07G9asrrrERX8JrxzSovy8DImKZXIYtELzblG4C3cE7S6Fh
         RjYt+T663+DYGsnfomPXUinQSN7rHzhswOnRvyQru2lr0egKzU2zt8exsw0RiLI8Txo8
         ++GjlCH501J05ppHDV7H6MKir6vIMcWY3jB6u70/m6SrQ3TaUbvZUKa25S8eKc4QdH3h
         ghfiq2HZ4oc7b/YgNHDdPnJn2bI75bY2U8ucFDbeY87M73Eo+u4ugSx73SeWZ8CjHEc9
         /pi3e4wj5i37ICwKKSBmWx24k7XNq22aFUCa5ak/bqeaydb9oXgRqgh8VrKtF6ZIB0h/
         2gmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+tlYC4pWWW1BH6TdRsW08JU7cRrdpkR+LWBen+dOLLwlUL8YQu0PprEwtnUAVuBlTyVaoP4dfWeG6vjqAxlb4@lists.infradead.org, AJvYcCVX47eFMm88ezRuCuczsvSMuVqzDraHXj4tTM1fGKHkWu7NPbXVlKnB4o7tOt7GtsPwZEVMO36XhiO9epA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3j0pEQ6nc+5JT8fXWqnDMYdFR03sSgLcC3qOqgWNwW2QNJQn3
	1xf3ImWrQvGLoVDOrrWVJkjTwzohRfR557ohTA9OnP5vQy5gk2Srq3lm563r
X-Gm-Gg: ASbGnct3RmoEKuEy1Lfu6k+zazUt0gz5nxZ3Yv1cwv+/U0R0+DUUzUMfKje/lGjjEST
	D7/kzg8j1cTk+qKgV/jTJ62ztqykYyKGJGX+RUsjvwSccviAMfVZLXMn0DxZ9bOnyXt0ijtKh95
	2/gigO3AOTeyMnnpFkuTQqqk3yFVFVfTfiS0PSEiu00AO3BTA44B6tcAcq3XxLC6eACMgT6GAks
	2WDlRwPFklufTkEXWD7PIUV6JV5wYJ6ScslQU6yB1WL622H/GLu3oo6mTloqbG7M12DLxmIKHU4
	ZISo4T2Fx0NxkS+YstJlgx3s9P17
X-Google-Smtp-Source: AGHT+IG5RBWUZNQpGErMop2HaEXH5zVDaO2+2/91CwJE9eOU2mEMg0/GLHSCEF9Km/RY9nu3uTdvwg==
X-Received: by 2002:a05:6402:50cc:b0:5dc:7464:2228 with SMTP id 4fb4d7f45d1cf-5deb086a58bmr7194616a12.2.1739470936292;
        Thu, 13 Feb 2025 10:22:16 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:15 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Subject: [PATCH v4 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi files
Date: Thu, 13 Feb 2025 19:22:02 +0100
Message-ID: <20250213182210.2098718-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102218_210644_57E1F773 
X-CRM114-Status: GOOD (  17.20  )
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

Make the peripheral device tree re-usable on ARM64 platform by moving CPU
core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
cv18xx-intc.dtsi.

Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
into "plic" interrupt-controller numbering.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- cleanups dropped
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- instead of carving out peripherals' part, carve out ARCH-specifics (CPU
core, interrupt controllers) and spread them among 3 SoC .dtsi files which
included cv18xx.dtsi;
- define a label for the "soc" node and use it in the newly introduced DTs;

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
 6 files changed, 93 insertions(+), 69 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..e5494f0f1f45 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,8 +3,11 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 
 / {
 	compatible = "sophgo,cv1800b";
@@ -15,6 +18,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1800b-pinctrl";
 			reg = <0x03001000 0x1000>,
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..96e1a2f14d3e 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -3,9 +3,12 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 #include "cv181x.dtsi"
 
 / {
@@ -17,6 +20,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1812h-pinctrl";
 			reg = <0x03001000 0x1000>,
diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
index 5fd14dd1b14f..bbdb30653e9a 100644
--- a/arch/riscv/boot/dts/sophgo/cv181x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
@@ -11,7 +11,7 @@ soc {
 		emmc: mmc@4300000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4300000 0x1000>;
-			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(18) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_EMMC>,
 				 <&clk CLK_EMMC>;
 			clock-names = "core", "bus";
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
new file mode 100644
index 000000000000..5e5d163e79d4
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/ {
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
+
+&soc {
+	interrupt-parent = <&plic>;
+
+	plic: interrupt-controller@70000000 {
+		reg = <0x70000000 0x4000000>;
+		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		riscv,ndev = <101>;
+	};
+
+	clint: timer@74000000 {
+		reg = <0x74000000 0x10000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..62c1464a0490 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -12,47 +12,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_25m";
 		#clock-cells = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&plic>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		dma-noncoherent;
 		ranges;
 
 		clk: clock-controller@3002000 {
@@ -75,7 +44,7 @@ porta: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -93,7 +62,7 @@ portb: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -111,7 +80,7 @@ portc: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -129,7 +98,7 @@ portd: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -137,7 +106,7 @@ saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;
 			clocks = <&clk CLK_SARADC>;
-			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(84) IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -162,7 +131,7 @@ i2c0: i2c@4000000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
-			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -173,7 +142,7 @@ i2c1: i2c@4010000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
-			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -184,7 +153,7 @@ i2c2: i2c@4020000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
-			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -195,7 +164,7 @@ i2c3: i2c@4030000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
-			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -206,14 +175,14 @@ i2c4: i2c@4040000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
-			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(28) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -224,7 +193,7 @@ uart0: serial@4140000 {
 		uart1: serial@4150000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04150000 0x100>;
-			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(29) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -235,7 +204,7 @@ uart1: serial@4150000 {
 		uart2: serial@4160000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04160000 0x100>;
-			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(30) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -246,7 +215,7 @@ uart2: serial@4160000 {
 		uart3: serial@4170000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04170000 0x100>;
-			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(31) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -261,7 +230,7 @@ spi0: spi@4180000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -272,7 +241,7 @@ spi1: spi@4190000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -283,7 +252,7 @@ spi2: spi@41a0000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -294,14 +263,14 @@ spi3: spi@41b0000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		uart4: serial@41c0000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x041c0000 0x100>;
-			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(32) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -312,7 +281,7 @@ uart4: serial@41c0000 {
 		sdhci0: mmc@4310000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4310000 0x1000>;
-			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD0>,
 				 <&clk CLK_SD0>;
 			clock-names = "core", "bus";
@@ -322,7 +291,7 @@ sdhci0: mmc@4310000 {
 		sdhci1: mmc@4320000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4320000 0x1000>;
-			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD1>,
 				 <&clk CLK_SD1>;
 			clock-names = "core", "bus";
@@ -332,7 +301,7 @@ sdhci1: mmc@4320000 {
 		dmac: dma-controller@4330000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
-			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
@@ -344,19 +313,5 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
-
-		plic: interrupt-controller@70000000 {
-			reg = <0x70000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <101>;
-		};
-
-		clint: timer@74000000 {
-			reg = <0x74000000 0x10000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
-		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 7f79de33163c..a0cb8080dfa5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -3,9 +3,12 @@
  * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 #include "cv181x.dtsi"
 
 / {
@@ -17,6 +20,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,sg2002-pinctrl";
 			reg = <0x03001000 0x1000>,
-- 
2.48.1


