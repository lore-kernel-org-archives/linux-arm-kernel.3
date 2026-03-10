Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8AFFD4F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbRHkg6j9RRwu7gnA0/6n+CmNyUAf+QALaWx+a/gjiE=; b=kqvjKWVx/QIdpEDgg0U8Gz74ib
	bv7RnqSrAfsaMfLKDFiDce1nZkHCc5g1Nkd5YQepF6uJ57aUm3MhKmpaXeH/REomxNk8MBmWeBhtJ
	YVzIZ9l7EQk2IninNvrbJZ9spQDtqebx5FOFQEwRSQ8KZlrcP6g6lvaRZzYUpfM5rmtFJKHY7LFzG
	VXOr0yXd545mdlT6tNKReQYe4jFx9+t71upvDoJtBDQN/JRP4b7QxDeadpjURUkH2SVI5qDRid30c
	L8D540FX++YRzprIeJ8UVpu/pPA80veS9Px3RMMPACTIcm97tUmxLdR3SXkEfnCUcTcFw7zsHsiVK
	hBvOIBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00xp-00000009zkO-0tTP;
	Tue, 10 Mar 2026 17:33:49 +0000
Received: from mta1.migadu.com ([2001:41d0:203:375::] helo=out-181.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00xl-00000009zik-0n0Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 17:33:47 +0000
Date: Tue, 10 Mar 2026 17:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1773164011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbRHkg6j9RRwu7gnA0/6n+CmNyUAf+QALaWx+a/gjiE=;
	b=pIm114EZhCnFvihJDz6EkqgldikGB5peLN/GNoPVUM8SKl14CnwYJIOE4ErMAHwCKfGtB3
	oiRo5WnSWNBtmG5SJUFTonIS3T48mLUDfhQRC8IJMHHuBXt0TisKqY/AYSO1npzSuETDi3
	gAAWkmCY+2/Ycd8B74gOr8ijLiy49hUQu6zDCk1n8iGqvuQukdPenkomdX6v5eaYRIq1PE
	IcCJb1wnZcWUm/PWHiyv4g4Fd4VasAJSTNWatypqr5ulUsI2qy0MSto4QGxM6/iPJ4stqb
	qeF3jkwOIT70sGs5srpp0wqvq8EhAVDnxWciCRok0RGf1q67atuqob0kXOhQ5Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin  
 Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
References: <20260305074328.639993-1-jian.hu@amlogic.com> <20260305074328.639993-4-jian.hu@amlogic.com>
In-Reply-To: <20260305074328.639993-4-jian.hu@amlogic.com>
Message-ID: <tbp23s.3oymu5iyepvke@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_103345_558351_C927162E 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, 05 Mar 2026 07:43, Jian Hu <jian.hu@amlogic.com> wrote:
>Add the required clock controller nodes for Amlogic T7 SoC family:
>- SCMI clock controller
>- PLL clock controller
>- Peripheral clock controller
>
>Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>---
> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
> 1 file changed, 125 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>index 6510068bcff9..6ea1b583b13d 100644
>--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>@@ -6,6 +6,9 @@
> #include <dt-bindings/interrupt-controller/arm-gic.h>
> #include <dt-bindings/power/amlogic,t7-pwrc.h>
> #include "amlogic-t7-reset.h"
>+#include <dt-bindings/clock/amlogic,t7-scmi.h>
>+#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>+#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
> 
> / {
> 	interrupt-parent = <&gic>;
>@@ -201,6 +204,33 @@ pwrc: power-controller {
> 		};
> 	};
> 
>+	sram@f7042000 {
>+		compatible = "mmio-sram";
>+		#address-cells = <1>;
>+		#size-cells = <1>;
>+		ranges = <0 0x0 0xf7042000 0x100>;
>+
>+		scmi_shmem: sram@0 {
>+			compatible = "arm,scmi-shmem";
>+			reg = <0x0 0x100>;
>+		};
>+	};
>+
>+	firmware {
>+		scmi: scmi {
>+			compatible = "arm,scmi-smc";
>+			arm,smc-id = <0x820000c1>;
>+			shmem = <&scmi_shmem>;
>+			#address-cells = <1>;
>+			#size-cells = <0>;
>+
>+			scmi_clk: protocol@14 {
>+				reg = <0x14>;
>+				#clock-cells = <1>;
>+			};
>+		};
>+	};
>+
> 	soc {
> 		compatible = "simple-bus";
> 		#address-cells = <2>;
>@@ -224,6 +254,42 @@ apb4: bus@fe000000 {
> 			#size-cells = <2>;
> 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> 
>+			clkc_periphs:clock-controller@0 {
>+				compatible = "amlogic,t7-peripherals-clkc";
>+				reg = <0x0 0x0 0x0 0x1c8>;
>+				#clock-cells = <1>;
>+				clocks = <&xtal>,
>+					 <&scmi_clk CLKID_SYS_CLK>,
>+					 <&scmi_clk CLKID_FIXED_PLL>,
>+					 <&scmi_clk CLKID_FCLK_DIV2>,
>+					 <&scmi_clk CLKID_FCLK_DIV2P5>,
>+					 <&scmi_clk CLKID_FCLK_DIV3>,
>+					 <&scmi_clk CLKID_FCLK_DIV4>,
>+					 <&scmi_clk CLKID_FCLK_DIV5>,
>+					 <&scmi_clk CLKID_FCLK_DIV7>,
>+					 <&hifi CLKID_HIFI_PLL>,
>+					 <&gp0 CLKID_GP0_PLL>,
>+					 <&gp1 CLKID_GP1_PLL>,
>+					 <&mpll CLKID_MPLL1>,
>+					 <&mpll CLKID_MPLL2>,
>+					 <&mpll CLKID_MPLL3>;
>+				clock-names = "xtal",
>+					      "sys",
>+					      "fix",
>+					      "fdiv2",
>+					      "fdiv2p5",
>+					      "fdiv3",
>+					      "fdiv4",
>+					      "fdiv5",
>+					      "fdiv7",
>+					      "hifi",
>+					      "gp0",
>+					      "gp1",
>+					      "mpll1",
>+					      "mpll2",
>+					      "mpll3";
>+			};
>+
> 			reset: reset-controller@2000 {
> 				compatible = "amlogic,t7-reset";
> 				reg = <0x0 0x2000 0x0 0x98>;
>@@ -234,6 +300,7 @@ watchdog@2100 {
> 				compatible = "amlogic,t7-wdt";
> 				reg = <0x0 0x2100 0x0 0x10>;
> 				clocks = <&xtal>;
>+
> 			};
> 
> 			periphs_pinctrl: pinctrl@4000 {
>@@ -269,6 +336,64 @@ uart_a: serial@78000 {
> 				status = "disabled";
> 			};
> 
>+			gp0:clock-controller@8080 {
>+				compatible = "amlogic,t7-gp0-pll";
>+				reg = <0x0 0x8080 0x0 0x20>;
>+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};

I would separate `gp0:` and `clock-controller@8080` with a space, like so:

			gp0: clock-controller@8080 {

Same for the others below (and `clkc_periphs:clock-controller@0` above).

>+
>+			gp1:clock-controller@80c0 {
>+				compatible = "amlogic,t7-gp1-pll";
>+				reg = <0x0 0x80c0 0x0 0x14>;
>+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			hifi:clock-controller@8100 {
>+				compatible = "amlogic,t7-hifi-pll";
>+				reg = <0x0 0x8100 0x0 0x20>;
>+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			pcie:clock-controller@8140 {
>+				compatible = "amlogic,t7-pcie-pll";
>+				reg = <0x0 0x8140 0x0 0x1c>;
>+				clocks = <&scmi_clk CLKID_PCIE_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			mpll:clock-controller@8180 {
>+				compatible = "amlogic,t7-mpll";
>+				reg = <0x0 0x8180 0x0 0x28>;
>+				clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			hdmi:clock-controller@81c0 {
>+				compatible = "amlogic,t7-hdmi-pll";
>+				reg = <0x0 0x81c0 0x0 0x20>;
>+				clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
>+				clock-names = "in0";
>+				#clock-cells = <1>;
>+			};
>+
>+			mclk:clock-controller@8300 {
>+				compatible = "amlogic,t7-mclk-pll";
>+				reg = <0x0 0x8300 0x0 0x18>;
>+				clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
>+					 <&xtal>,
>+					 <&scmi_clk CLKID_FCLK_50M>;
>+				clock-names = "in0", "in1", "in2";
>+				#clock-cells = <1>;
>+			};
>+
> 			sec_ao: ao-secure@10220 {
> 				compatible = "amlogic,t7-ao-secure",
> 					     "amlogic,meson-gx-ao-secure",
>-- 
>2.47.1
>
>

Best regards,
Ferass

>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

