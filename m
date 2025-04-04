Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E249AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy1eBoUdd32oYrBAo7INUJkEb71UqJejhLasW2VVXYw=; b=BAgyJCYH9UPh3/W8oZgw7XgijB
	f1WO7+eYgmje0M1Vw1zncikMquvpP9awvu7By5kCoPf7/YHlMpFRArlJFemnyoHfPt2Yk4h1ezCrO
	1+dz48ajWrgGW1ED50xmHTpJMUWCtULLFnCpjsiws7Dm+IdVsmsHvlFX03T8gJjFWg+56qP93OpB7
	GqufTWjXmgLln6BmCgUf8xsJnKkueSTSy1xiW4WMY2lJ7DdqywasLD6vkaHZuwKj2aMiihvhnAs3F
	dLuy+MXxmpWfJnIgp2hM7ghhWbHRAcig2LVWDMffYvTdKJXbkbJ1FBpNlBa83oeBDbFyd6eLwT40t
	kDaQ3PPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Xb8-0000000Ag9J-2xkB;
	Fri, 04 Apr 2025 03:20:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHf-0000000Acyv-1zuc;
	Fri, 04 Apr 2025 02:59:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A354B44F28;
	Fri,  4 Apr 2025 02:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85A7C4CEEA;
	Fri,  4 Apr 2025 02:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735595;
	bh=xMgbsjBv9Kef+UFcQ6l0JsE73pnNHHIi5V3EKTVvKZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWCsZoJxuJf4uC4DHbLlZqGIlVn0yqULR8Xtwd1cvdcGj7FhgjRQsG2SZFQd0XerM
	 CRUVey1D2fQtZTk306phmWw6frB7jh1SH8kVjnZg+Qubx0VBm/vyiWFIzZpWBR08PA
	 /LZ/0lId4BBMvcDw1WOPh7PViu2YUoTQ+UAqMt+Y7hyQdMNBm+uZwkM3WH9Tcr5/23
	 Vd8Ft9GnkB81oQy2ce+2bXpECXxW3bO6y598SZCfo3GvNV1vdgjQQvH5ZZ6EYT4wcG
	 6pqTzBxnPTqB8+Dy9NGVG76jnC1SNKcdt17QiODpJwYElrrof8OiFD5VlOEZ+y99Gs
	 jg+wxJbjyDYcA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:31 -0500
Subject: [PATCH 10/19] arm/arm64: dts: imx: Drop redundant CPU
 "clock-latency"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-10-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195955_570324_59944AEA 
X-CRM114-Status: GOOD (  10.55  )
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

The "clock-latency" property is part of the deprecated opp-v1 binding
and is redundant if the opp-v2 table has equal or larger values in any
"clock-latency-ns". The OPP tables have values of 150000, so it can be
removed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi      | 1 -
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 4 ----
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 4 ----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ----
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ----
 5 files changed, 17 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 2629968001a7..9235dd7e93bb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -73,7 +73,6 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clock-frequency = <792000000>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clks IMX7D_CLK_ARM>;
 			cpu-idle-states = <&cpu_sleep_wait>;
 			operating-points-v2 = <&cpu0_opp_table>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..cfebaa01217e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -62,7 +62,6 @@ A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MM_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -83,7 +82,6 @@ A53_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MM_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -102,7 +100,6 @@ A53_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MM_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -121,7 +118,6 @@ A53_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MM_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..848ba5e46ee6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -62,7 +62,6 @@ A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -83,7 +82,6 @@ A53_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -102,7 +100,6 @@ A53_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -121,7 +118,6 @@ A53_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MN_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..f8afdba71c36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -65,7 +65,6 @@ A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MP_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -86,7 +85,6 @@ A53_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MP_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -105,7 +103,6 @@ A53_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MP_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -124,7 +121,6 @@ A53_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
-			clock-latency = <61036>;
 			clocks = <&clk IMX8MP_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..d27b824995eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -106,7 +106,6 @@ A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MQ_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -126,7 +125,6 @@ A53_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MQ_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -144,7 +142,6 @@ A53_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MQ_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
@@ -162,7 +159,6 @@ A53_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
-			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clk IMX8MQ_CLK_ARM>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;

-- 
2.47.2


