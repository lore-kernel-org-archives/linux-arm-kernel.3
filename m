Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29892C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeQJSAdDhXmUj7Mhcp/EXCis2MZWrjN6L07LIferSPw=; b=PUbo2KMdzcoXW0agW+9pWdy1Co
	LMvSI50jVi3FNEPdKCjbIapqfyi9NTUN11ILFVAtkowIctSGYriu7nO+O3xSrpdX5A6TjjxCO8rXI
	brgIMPgs3qtdi9H1xvZE9HsY/PKMuhNmm0d4A9fHR+CCHbPcLAoTtQyaqSlQT4psiIOzp6LAmxmx4
	XGCKxYCfLJuGvytRtoMjr/h59uUTnESdfFt4J0YZho1Ar3YfVEfnVft2OaKOLPDZOr6pzXFu91oFX
	QnE2jeFMzwzzL58aVFjxokQwGloIZNDZnFpCWsJXOq1F8QFzBPNZCygc8JQRhdhZGmosYr56etHuA
	rkg1cLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFWO-0000000FfN5-1uID;
	Sun, 09 Feb 2025 22:11:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSG-0000000FefN-2Lpu;
	Sun, 09 Feb 2025 22:07:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1010670f8f.2;
        Sun, 09 Feb 2025 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138827; x=1739743627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeQJSAdDhXmUj7Mhcp/EXCis2MZWrjN6L07LIferSPw=;
        b=gSKmRdFPKWI7v684E6PT30wWzzifWNoioiTxIrxh6WlDQHwZs1xv9XNRnRX3zKzZte
         U6cd9zj+A7zdkWEh5fAC8SqtXAM/iE7hU40+l7u4UwGBVxB1hPI44u9pExaAHtjUEa0s
         9cXXVtgGe+vA47rlU3Nzxzr032KTcXNYI6mJL03uAK3yU1y6YEtDjr139Uk5OM90BUut
         ZpQGaAS29fI5FwUgmrglk9rZSM5/6LHvtteepdI0n8C5/IWIvDq9D0ryoxgkt6cTVd4T
         lexevD6GKLFj0MonUVzNij0+NtreUCljNeMVtaLKWNmH+GgiVomZcmnaq4punSLKImru
         BgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138827; x=1739743627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeQJSAdDhXmUj7Mhcp/EXCis2MZWrjN6L07LIferSPw=;
        b=FwxhHNIVPlW0nelufmD/WMnh43M4vQ8txKb+6efzob/i9gLPwIIaue6kXCfqWQXmUn
         sTWkMr0GMVAIgoVvibrolbWtJ38Ucxar3+rADybhIJ/m0h+rrE7XknRi6TeDU+Ttrf5P
         rRaSVjI4e0e9+xrkZkNN3CgV902VXX+1hOCoDRxatDia/wj6C3B2NnuqXYptmRq/99nA
         4oT8UyluaOJAIZ58VdnpdjYm49lC8bytFL39LEy7fQF173BLsf8Vm/csKEirbV2tm5xF
         yPraKvEJKzPK6Ypr9rOg/s0X0k3HTyJ9NFEiIW9vbNDCOtOjFMgclEavPVpXtFCDnI4C
         FlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoPTOUS27LltAzlJ9/jBjOHlWGsXouzzU+ACGG3KngwNUsctCQfuYxl8sQqPAzRiVyCu2irpG7fKIdxrQCOngC@lists.infradead.org, AJvYcCW4D748NINsxG+yN45MWHfAfz+sllv6A4fMyIhHSS9bQl0f3ZCubGji383HnNO8S0hbXBrAjmOQ9aVkQYI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfre89fU+lUfG+Z6uTEPMm1b2lH4zuhoFteaptyGQc1AmMfQV/
	vaxjmw5+wJY7Ezu9xA05WXs0vluzdhrLjwbWmWBYWwc8m3gl/tCj
X-Gm-Gg: ASbGncsn8gi3JzuWxJA88B3/6xO1yGlkle1TXQyMPnoCpG6719HSmenQOOxZQSVHxSI
	QiWVmOBhRMKj8e5CyewrMz2Ci2Hgf3Q000lB47BKp2K8LGEvDyoMTdgkYcXiWXwcbaDlUKD3NK2
	iXp79sZF4m1pqKHJAfAhhxG5a9Y1f6sfKm2GnDu/DyBB7AfMqZE9W/CKXlCEzN6bcpcqlzL+U2C
	lIeeB3Y9cDAlyqXsk90AfeGjUlow3zRFRPoBHBT74cz2tkNzflrka/Dx+/3WfpQIJv4MMRD9DDK
	tJqjw4B1YIGj3FNCi5iqljDr2omF
X-Google-Smtp-Source: AGHT+IGIPPTW7s6FMIHinxaydcbU4c1SdYr2UsWlxPFTGc738bi2zQ0yuQr39n6hlVqn6DA50ArXng==
X-Received: by 2002:a5d:64cc:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-38dd701445emr3294852f8f.41.1739138826504;
        Sun, 09 Feb 2025 14:07:06 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:05 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core and peripheral parts
Date: Sun,  9 Feb 2025 23:06:27 +0100
Message-ID: <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140708_611075_8711C1A6 
X-CRM114-Status: GOOD (  14.68  )
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

Make the peripheral device tree re-usable on ARM64 platform by splitting it
into CPU-core specific and peripheral parts.

Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
into "plic" interrupt-controller numbering.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |   2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 313 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 305 +----------------
 3 files changed, 317 insertions(+), 303 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi

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
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
new file mode 100644
index 000000000000..53834b0658b2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <dt-bindings/clock/sophgo,cv1800.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	osc: oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "osc_25m";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		clk: clock-controller@3002000 {
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		gpio0: gpio@3020000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@3021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio2: gpio@3022000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3022000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portc: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio3: gpio@3023000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3023000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		saradc: adc@30f0000 {
+			compatible = "sophgo,cv1800b-saradc";
+			reg = <0x030f0000 0x1000>;
+			clocks = <&clk CLK_SARADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(84) IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			channel@0 {
+				reg = <0>;
+			};
+
+			channel@1 {
+				reg = <1>;
+			};
+
+			channel@2 {
+				reg = <2>;
+			};
+		};
+
+		i2c0: i2c@4000000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04000000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
+			clock-names = "ref", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@4010000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04010000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
+			clock-names = "ref", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@4020000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04020000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
+			clock-names = "ref", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@4030000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04030000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
+			clock-names = "ref", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@4040000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04040000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
+			clock-names = "ref", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart0: serial@4140000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04140000 0x100>;
+			interrupts = <SOC_PERIPHERAL_IRQ(28) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@4150000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04150000 0x100>;
+			interrupts = <SOC_PERIPHERAL_IRQ(29) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@4160000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04160000 0x100>;
+			interrupts = <SOC_PERIPHERAL_IRQ(30) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@4170000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04170000 0x100>;
+			interrupts = <SOC_PERIPHERAL_IRQ(31) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		spi0: spi@4180000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x04180000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
+			clock-names = "ssi_clk", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		spi1: spi@4190000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x04190000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
+			clock-names = "ssi_clk", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		spi2: spi@41a0000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x041a0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
+			clock-names = "ssi_clk", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		spi3: spi@41b0000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x041b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
+			clock-names = "ssi_clk", "pclk";
+			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart4: serial@41c0000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x041c0000 0x100>;
+			interrupts = <SOC_PERIPHERAL_IRQ(32) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		sdhci0: mmc@4310000 {
+			compatible = "sophgo,cv1800b-dwcmshc";
+			reg = <0x4310000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_AXI4_SD0>,
+				 <&clk CLK_SD0>;
+			clock-names = "core", "bus";
+			status = "disabled";
+		};
+
+		sdhci1: mmc@4320000 {
+			compatible = "sophgo,cv1800b-dwcmshc";
+			reg = <0x4320000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_AXI4_SD1>,
+				 <&clk CLK_SD1>;
+			clock-names = "core", "bus";
+			status = "disabled";
+		};
+
+		dmac: dma-controller@4330000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x04330000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
+			clock-names = "core-clk", "cfgr-clk";
+			#dma-cells = <1>;
+			dma-channels = <8>;
+			snps,block-size = <1024 1024 1024 1024
+					   1024 1024 1024 1024>;
+			snps,priority = <0 1 2 3 4 5 6 7>;
+			snps,dma-masters = <2>;
+			snps,data-width = <4>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..57a01b71aa67 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -4,9 +4,9 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
-#include <dt-bindings/clock/sophgo,cv1800.h>
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
+#define SOC_PERIPHERAL_IRQ(nr)		((nr) + 16)
+
+#include "cv18xx-periph.dtsi"
 
 / {
 	#address-cells = <1>;
@@ -41,310 +41,11 @@ cpu0_intc: interrupt-controller {
 		};
 	};
 
-	osc: oscillator {
-		compatible = "fixed-clock";
-		clock-output-names = "osc_25m";
-		#clock-cells = <0>;
-	};
-
 	soc {
-		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		dma-noncoherent;
 		ranges;
 
-		clk: clock-controller@3002000 {
-			reg = <0x03002000 0x1000>;
-			clocks = <&osc>;
-			#clock-cells = <1>;
-		};
-
-		gpio0: gpio@3020000 {
-			compatible = "snps,dw-apb-gpio";
-			reg = <0x3020000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			porta: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
-				gpio-controller;
-				#gpio-cells = <2>;
-				ngpios = <32>;
-				reg = <0>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		gpio1: gpio@3021000 {
-			compatible = "snps,dw-apb-gpio";
-			reg = <0x3021000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			portb: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
-				gpio-controller;
-				#gpio-cells = <2>;
-				ngpios = <32>;
-				reg = <0>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		gpio2: gpio@3022000 {
-			compatible = "snps,dw-apb-gpio";
-			reg = <0x3022000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			portc: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
-				gpio-controller;
-				#gpio-cells = <2>;
-				ngpios = <32>;
-				reg = <0>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		gpio3: gpio@3023000 {
-			compatible = "snps,dw-apb-gpio";
-			reg = <0x3023000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			portd: gpio-controller@0 {
-				compatible = "snps,dw-apb-gpio-port";
-				gpio-controller;
-				#gpio-cells = <2>;
-				ngpios = <32>;
-				reg = <0>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
-		saradc: adc@30f0000 {
-			compatible = "sophgo,cv1800b-saradc";
-			reg = <0x030f0000 0x1000>;
-			clocks = <&clk CLK_SARADC>;
-			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			channel@0 {
-				reg = <0>;
-			};
-
-			channel@1 {
-				reg = <1>;
-			};
-
-			channel@2 {
-				reg = <2>;
-			};
-		};
-
-		i2c0: i2c@4000000 {
-			compatible = "snps,designware-i2c";
-			reg = <0x04000000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
-			clock-names = "ref", "pclk";
-			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		i2c1: i2c@4010000 {
-			compatible = "snps,designware-i2c";
-			reg = <0x04010000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
-			clock-names = "ref", "pclk";
-			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		i2c2: i2c@4020000 {
-			compatible = "snps,designware-i2c";
-			reg = <0x04020000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
-			clock-names = "ref", "pclk";
-			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		i2c3: i2c@4030000 {
-			compatible = "snps,designware-i2c";
-			reg = <0x04030000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
-			clock-names = "ref", "pclk";
-			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		i2c4: i2c@4040000 {
-			compatible = "snps,designware-i2c";
-			reg = <0x04040000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
-			clock-names = "ref", "pclk";
-			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		uart0: serial@4140000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04140000 0x100>;
-			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
-			clock-names = "baudclk", "apb_pclk";
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart1: serial@4150000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04150000 0x100>;
-			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
-			clock-names = "baudclk", "apb_pclk";
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart2: serial@4160000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04160000 0x100>;
-			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
-			clock-names = "baudclk", "apb_pclk";
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart3: serial@4170000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04170000 0x100>;
-			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
-			clock-names = "baudclk", "apb_pclk";
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		spi0: spi@4180000 {
-			compatible = "snps,dw-apb-ssi";
-			reg = <0x04180000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
-			clock-names = "ssi_clk", "pclk";
-			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		spi1: spi@4190000 {
-			compatible = "snps,dw-apb-ssi";
-			reg = <0x04190000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
-			clock-names = "ssi_clk", "pclk";
-			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		spi2: spi@41a0000 {
-			compatible = "snps,dw-apb-ssi";
-			reg = <0x041a0000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
-			clock-names = "ssi_clk", "pclk";
-			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		spi3: spi@41b0000 {
-			compatible = "snps,dw-apb-ssi";
-			reg = <0x041b0000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
-			clock-names = "ssi_clk", "pclk";
-			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		uart4: serial@41c0000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x041c0000 0x100>;
-			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
-			clock-names = "baudclk", "apb_pclk";
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		sdhci0: mmc@4310000 {
-			compatible = "sophgo,cv1800b-dwcmshc";
-			reg = <0x4310000 0x1000>;
-			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_AXI4_SD0>,
-				 <&clk CLK_SD0>;
-			clock-names = "core", "bus";
-			status = "disabled";
-		};
-
-		sdhci1: mmc@4320000 {
-			compatible = "sophgo,cv1800b-dwcmshc";
-			reg = <0x4320000 0x1000>;
-			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_AXI4_SD1>,
-				 <&clk CLK_SD1>;
-			clock-names = "core", "bus";
-			status = "disabled";
-		};
-
-		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
-			reg = <0x04330000 0x1000>;
-			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-			clock-names = "core-clk", "cfgr-clk";
-			#dma-cells = <1>;
-			dma-channels = <8>;
-			snps,block-size = <1024 1024 1024 1024
-					   1024 1024 1024 1024>;
-			snps,priority = <0 1 2 3 4 5 6 7>;
-			snps,dma-masters = <2>;
-			snps,data-width = <4>;
-			status = "disabled";
-		};
-
 		plic: interrupt-controller@70000000 {
 			reg = <0x70000000 0x4000000>;
 			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-- 
2.48.1


