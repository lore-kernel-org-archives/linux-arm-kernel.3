Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c2K2SL7h;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVnKM2rD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w0sP9g9K0qnXPezFXNJXSocNniQdxPAJlla7ZkrNcCk=; b=c2K2SL7hAhnwsU
	qZLyPqh2DrlHlwqgv0dTdNI8yYo3YllRQe7S13HrQVL4z3ndtTcs4aveELyPmWtEfRsybUBWDsUxJ
	2s+lwrL7UYWom53gyQqZUK1cjhZxCGlXHmsPf69ubjDgpzH9G0TSoVHlMppFkcel8ljRTnJanjJaS
	w3cl1On60fCMzzR7yB5/bm45TRf2QRXDxxlKyxjXU49wdhThlIR3Brgj+SDIVPMZ4xWtI8x3Nhd55
	/6UQpqkugtzIThBfvJFYXxSX1hmoSddtGU5QUXmq5ey+b4KaDSwFSSO88RcyqzIOLvtWOD40qQS7c
	G+4J2pvggrC4OQgtO/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyoO-0000000CsHE-2ZDO;
	Sat, 31 Oct 2026 02:27:16 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo6-0000000Cs5q-3aDC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:27:00 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-843cf077f10so1486136a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413618; x=1794018418; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w0sP9g9K0qnXPezFXNJXSocNniQdxPAJlla7ZkrNcCk=;
        b=lVnKM2rDNYGmuC8KkVEtTSkrl7mCzMZafKKU9/ws1levuC7XjFUmKtRLBvLqoC4s8K
         x9Nt1i4S7shwiLQCZ/G0FqoioI1pMOpffDjXWAlDEOlUliskL19QHno1Nxch6BKy6CPW
         dw93GX9ZNBmaHw8jPkTck0upsGzAy0yHzGhStaCPqEEM/MaxRD+JqH6tS0p2/YbdsJke
         7dqSyeelGEle+YyDtTU17kaijEt+athwTLiC0hebA5iDiKx9qtct/SqwfEmarVkGwuS8
         TKpWuso40CCIlZSo+4Ao801w0GyvtIEoXx3/IvL36zLnTJo00NEr3S4JY5fhxzIwIsFX
         NZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413618; x=1794018418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0sP9g9K0qnXPezFXNJXSocNniQdxPAJlla7ZkrNcCk=;
        b=thMBtVR4UpbNP4YFnLE+LJCDKC0ZPB9Nr1tn8VXwxtsL+N51FLJ9nfWCoz4I/Tl/Tk
         sb4cPySOhPAP14qf5TsG5gawFQmuVLRYFb0J8Ov1DcYYCzEI0si8vtsBI3f2qa6CpL5E
         FIWIaZWoRgh4fKeVSPhPHvcfELzlINfVkc1RGSjE1zE1PRnieB2TsGu0uu4/dAaPCc/w
         +T/iAYfnIFEWnqDzky9FlRWTp0DqW3VljSasawSx2XvE6utwF6BjvLGE1dsC/1mQocf7
         qgVmqWYSQR6GL7/+su1ZIgGZwiTLBT5jeTQkrhLScpQ5FMZPJkld1Y75b64N/FbyVScK
         LC3Q==
X-Forwarded-Encrypted: i=1; AKwUvByb4Woy7uHhK0w20/nvomZJ2Rw+d5ptSA37IRgzEHYHDRlDXIhMWSVMT9d6RtBPjBKnU2La5mfSd/8jW78Ml7N/@lists.infradead.org
X-Gm-Message-State: AFq9FYJcxhlpdOKMH7l9nLITSC/6QymQbsDzxhiAwXFvMYOk1l9YTy4l
	IMx0cAoj02Sb+OErhkmARWrpC+Nz7Ox+CGv97jDF5fhQOyUR9SpUujGp
X-Gm-Gg: AYBFou22XsHvWozFqaD4lQqB8WO/LXQUxPMl6BJ1RYO2HHMxXOq3tzeOYrqblvGZhXQ
	KlEONyD2bbyHYwufeLl1KRXTSLPYhS4AnrxDKMRDBwDHBgVuB8DxK/09A5eWdoGn1fkMwE3821r
	Tzw8qWJM5gmC7n2vr38qGiCcGWZrOrBF7IB7s4d8lhfbue5hjhixAwB/JqbRO/Fui83RV1rGreY
	atcsLgOhVXemVfgB1thaSPhvxxUmWoWgPhx+h4Ni8DWPx05npnjCrf4BNemJhz4+X1Ijr9Su3rJ
	5mgRAE6JBXNkqIdtjNIRBjbGlkekxMyjwYNcHvscBiTDBl/ZA+7l2MySerFMFLO6iPPSm65wUCE
	2amYPfci0Qy5vlop8Bxri4IVw588JXYXEGuTC0M2nAHRN2LjuiZM4sHRxwUj3sW2iAHnKhlMtEc
	bmy+yv9XhhhWo5iTipYbSJUDNq1GHfqTe9PR2ju7lR7uNmlnqpZF2fR8mdxkAqWoYBLFQ4li7pv
	gP/vcfaMDtCyznT2fNUb1cP8s43aaj/tDYoloohbGs+eddK29k2wqUqIz3k4ZXqUG0N0ntBHvaq
	sM6eKIFuhuWhAjWyHQqUvUOfkLn9MjgM/NH77dP4T7YH8wLCN3B5JrBrJCx6sp/f6mvD1E1Pd4T
	s0eDXkA==
X-Received: by 2002:a05:6830:4389:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-85d36313dd3mr3454977a34.4.1793413617785;
        Fri, 30 Oct 2026 19:26:57 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cd9bbsm3271119a34.16.2026.10.30.19.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:56 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Fri, 30 Oct 2026 22:26:54 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-2@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192658_955023_C6D71751 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the CPUs, PSCI, architectural timers, GIC, RTC, main and
always-on clock/reset and pin controllers. Include all main and R-domain
UART/I2C instances and all four MMC controllers with their documented
pin groups.

MMC0/1/2 use the existing A733/D1 binding. MMC3 uses the distinct eMMC
binding because its DMA descriptors differ; it remains disabled. Add the
GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12. The
GICD/GICR/ITS windows and noncoherent attributes agree with Andre
Przywara's public A733 reference and the A523 integration precedent. The
manual's CPUX interconnect diagram supports noncoherency as an
integration inference. The ITS stays disabled until its clock/reset and
MSI path are integrated.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 624 ++++++++++++++++++
 1 file changed, 624 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..522eda3d5dc9c7824dac41017162548e7a39d0a2
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -0,0 +1,624 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+#include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	osc: osc-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
+		arm,no-tick-in-suspend;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x40000000>;
+
+		pio: pinctrl@2000000 {
+			compatible = "allwinner,sun60i-a733-pinctrl";
+			reg = <0x02000000 0x800>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_APB1>, <&osc>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			mmc0_pins: mmc0-pins {
+				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+				function = "mmc0";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc1_pins: mmc1-pins {
+				pins = "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
+				function = "mmc1";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc2_pins: mmc2-pins {
+				pins = "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
+				       "PC13", "PC14", "PC15", "PC16";
+				function = "mmc2";
+				allwinner,pinmux = <3>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc3_pins: mmc3-pins {
+				pins = "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
+				       "PC13", "PC14", "PC15", "PC16";
+				function = "mmc3";
+				allwinner,pinmux = <4>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB9", "PB10";
+				function = "uart0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		ccu: clock-controller@2002000 {
+			compatible = "allwinner,sun60i-a733-ccu";
+			reg = <0x02002000 0x2000>;
+			clocks = <&osc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&rtc CLK_OSC32K_FANOUT>;
+			clock-names = "hosc", "losc", "iosc", "losc-fanout";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		uart0: serial@2500000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02500000 0x400>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+			status = "disabled";
+		};
+
+		uart1: serial@2501000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02501000 0x400>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART1>;
+			resets = <&ccu RST_BUS_UART1>;
+			status = "disabled";
+		};
+
+		uart2: serial@2502000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02502000 0x400>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART2>;
+			resets = <&ccu RST_BUS_UART2>;
+			status = "disabled";
+		};
+
+		uart3: serial@2503000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02503000 0x400>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART3>;
+			resets = <&ccu RST_BUS_UART3>;
+			status = "disabled";
+		};
+
+		uart4: serial@2504000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02504000 0x400>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART4>;
+			resets = <&ccu RST_BUS_UART4>;
+			status = "disabled";
+		};
+
+		uart5: serial@2505000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02505000 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART5>;
+			resets = <&ccu RST_BUS_UART5>;
+			status = "disabled";
+		};
+
+		uart6: serial@2506000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02506000 0x400>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART6>;
+			resets = <&ccu RST_BUS_UART6>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2510000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02510000 0x400>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@2511000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02511000 0x400>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@2512000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02512000 0x400>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@2513000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02513000 0x400>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@2514000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02514000 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C4>;
+			resets = <&ccu RST_BUS_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@2515000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02515000 0x400>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C5>;
+			resets = <&ccu RST_BUS_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@2516000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02516000 0x400>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C6>;
+			resets = <&ccu RST_BUS_I2C6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@2517000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02517000 0x400>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C7>;
+			resets = <&ccu RST_BUS_I2C7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@2518000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02518000 0x400>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C8>;
+			resets = <&ccu RST_BUS_I2C8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c9: i2c@2519000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02519000 0x400>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C9>;
+			resets = <&ccu RST_BUS_I2C9>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c10: i2c@251a000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251a000 0x400>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C10>;
+			resets = <&ccu RST_BUS_I2C10>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c11: i2c@251b000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251b000 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C11>;
+			resets = <&ccu RST_BUS_I2C11>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c12: i2c@251c000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251c000 0x400>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C12>;
+			resets = <&ccu RST_BUS_I2C12>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@3400000 {
+			compatible = "arm,gic-v3";
+			reg = <0x03400000 0x10000>, <0x03460000 0x100000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			dma-noncoherent;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			its: msi-controller@3440000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x03440000 0x20000>;
+				msi-controller;
+				#msi-cells = <1>;
+				dma-noncoherent;
+				status = "disabled";
+			};
+		};
+
+		mmc0: mmc@4020000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04020000 0x1000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc1: mmc@4021000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04021000 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc1_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc2: mmc@4022000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04022000 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC2>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc2_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc3: mmc@4023000 {
+			compatible = "allwinner,sun60i-a733-emmc";
+			reg = <0x04023000 0x1000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC3>, <&ccu CLK_MMC3>,
+				 <&ccu CLK_MBUS_STORE>, <&ccu CLK_BUS_MSI_LITE1>;
+			clock-names = "ahb", "mmc", "mbus", "msi";
+			resets = <&ccu RST_BUS_MMC3>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc3_pins>;
+			status = "disabled";
+		};
+
+		r_ccu: clock-controller@7010000 {
+			compatible = "allwinner,sun60i-a733-r-ccu";
+			reg = <0x07010000 0x250>;
+			clocks = <&osc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
+				 <&ccu CLK_PLL_PERIPH0_300M>,
+				 <&ccu CLK_PLL_PERIPH1_300M>;
+			clock-names = "hosc", "losc", "iosc", "sys-24m",
+				      "pll-periph0-200m", "pll-periph0-300m",
+				      "pll-periph1-300m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		nmi_intc: interrupt-controller@7010320 {
+			compatible = "allwinner,sun60i-a733-nmi",
+				     "allwinner,sun55i-a523-nmi";
+			reg = <0x07010320 0xc>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		r_pio: pinctrl@7025000 {
+			compatible = "allwinner,sun60i-a733-r-pinctrl";
+			reg = <0x07025000 0x800>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB0>, <&osc>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			r_i2c0_pl_pins: r-i2c0-pl-pins {
+				pins = "PL0", "PL1";
+				function = "r_i2c0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		r_uart0: serial@7080000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x07080000 0x400>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&r_ccu CLK_BUS_R_UART0>;
+			resets = <&r_ccu RST_BUS_R_UART0>;
+			status = "disabled";
+		};
+
+		r_uart1: serial@7081000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x07081000 0x400>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&r_ccu CLK_BUS_R_UART1>;
+			resets = <&r_ccu RST_BUS_R_UART1>;
+			status = "disabled";
+		};
+
+		r_i2c0: i2c@7083000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07083000 0x400>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_I2C0>;
+			resets = <&r_ccu RST_BUS_R_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_i2c1: i2c@7084000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07084000 0x400>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_I2C1>;
+			resets = <&r_ccu RST_BUS_R_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_i2c2: i2c@7085000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07085000 0x400>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_I2C2>;
+			resets = <&r_ccu RST_BUS_R_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rtc: rtc@7090000 {
+			compatible = "allwinner,sun60i-a733-rtc",
+				     "allwinner,sun50i-r329-rtc";
+			reg = <0x07090000 0x400>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>;
+			clock-names = "bus", "hosc", "ahb";
+			#clock-cells = <1>;
+		};
+	};
+};
-- 
2.53.0


