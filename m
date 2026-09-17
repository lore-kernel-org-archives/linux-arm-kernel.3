Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AB4C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myeiNz7PHG0TTlecixLtkRV6xA4jxRFhvS8Da8tnE+M=; b=ntDtcjmxBp1F6bjJy7+q3t1B4V
	rozfWPLTVRKfLray3bRpUFXEr+QDftdhLW8V0aMwQF0gInNlW35zURkcTn8dGXTLWtJJxXjnX6Q0J
	9xB7UIiPLiwl2X7ALAquyNi0AiGaM/yYAlCaN6PCf/gMnKISvQepIePQGgA3aM/XMgTAfTLHugWau
	58sGTi5OTFu+stHPN0cSRpUz/03h9OJuRhyVzZE5rpvjP7Gq30GC7NScbqSBUHLWuzifrzj/iHZrQ
	vE0ZbXAJL5qZqRcN7SODhnTqP1EWHeozSDWSXi9/3VdF1JYxi15WzFm7pPEG4jCytDE2dRTRPRgQu
	KfFHaPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Klk-0000000Cgcu-3nRY;
	Thu, 17 Sep 2026 22:39:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Klf-0000000CgYZ-1OPk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:39:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59FAA201B;
	Thu, 17 Sep 2026 15:39:42 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44D413F86F;
	Thu, 17 Sep 2026 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684785; bh=7PwcNklDq+/rSBxB6NyGSWTpTGQwENPQUKSvnXRLeaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbH9vLYAqfMhaX9JFjV8xQxygMe905mRBwjZX8wYbpLjBLATwOFRwpmKshyYhnDL1
	 xjZJyFioN1CKKM/DyM+7b0ckA4U842mLs1kTsEuUnTKm/rcqgGD+6iYCYQXzydW0zQ
	 B4WC6tPb+Z5IVeE2dsebLYsKKS8WRzD+mU20Ukg0=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 5/5] arm64: dts: allwinner: a523: add CPU clocks
Date: Fri, 18 Sep 2026 00:39:13 +0200
Message-ID: <20260917223913.1855301-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_153947_468424_17C105C1 
X-CRM114-Status: GOOD (  11.29  )
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

The Allwinner A523 family of SoCs feature a separate clock unit for the
CPU PLLs and muxes, including one for the DSU interconnect.

Add a DT node for the CPU clock controller, and list all the clocks from
the other CCUs that this controller needs.
Also list the clock source for each CPU: there is one clock for each
cluster of four cores, suffixed L and B, for little and big (although
all cores are of the same Cortex-A55 type).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae7..29af21372aba2 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/sun55i-a523-ccu.h>
 #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+#include <dt-bindings/clock/sun55i-a523-cpu-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
@@ -25,6 +26,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x000>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -32,6 +34,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x100>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -39,6 +42,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x200>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -46,6 +50,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x300>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -53,6 +58,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x400>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 
@@ -60,6 +66,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x500>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 
@@ -67,6 +74,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x600>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 
@@ -74,6 +82,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x700>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 	};
@@ -1144,5 +1153,18 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		cpu_ccu: clock-controller@8817000 {
+			compatible = "allwinner,sun55i-a523-cpu-ccu";
+			reg = <0x08817000 0x80>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>,
+				 <&rtc CLK_IOSC>, <&ccu CLK_PLL_PERIPH0_2X>,
+				 <&ccu CLK_PLL_PERIPH0_600M>;
+			clock-names = "hosc", "losc",
+				      "iosc", "pll-periph0-2x",
+				      "pll-periph0-600M";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.43.0


