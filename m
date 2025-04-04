Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B063C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e05OrNSWCcCsmzoY3y8dtZiHi9YnOHkoFCkFAlCqFcI=; b=IEkK9GHdMX/wVfUn/WTknGFDOC
	ozZrv5LaIyJbQphxS6UVqkYrFOx83w1e5BHMYvRwdBbdmhRowUGtLntp9XJRRW3QoLy5EsvSyDI51
	xpCebek+onhyQMY0dXM5K/+oJr3CEXzfEsOCrPLj9+2ziw2TnzkEM6ji40XsuZWos7v/tlo6VONVf
	Vyinh3IFjCPoYIULv0ywB0RhmzQyAOL7wJ4X6U3WGnfSWsISu+legCijo39eGl/qw+27WT0nu/iqQ
	mUcz0FHZI4yKwSuGOQSwSRc0Bqq370XVNKrHiLg/PdkI1crxCF8KJTBLG3ihHcf+2kp7PByiCpoff
	qxWdl0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XgR-0000000Aghw-2V0y;
	Fri, 04 Apr 2025 03:25:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHj-0000000Ad0y-25Wv;
	Fri, 04 Apr 2025 03:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CA5F44EC6;
	Fri,  4 Apr 2025 02:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84474C4CEEC;
	Fri,  4 Apr 2025 02:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735598;
	bh=4ruN2yfM04MfyMd6Xn/cn9jUkSuoetlWEHVWLk/RgcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NSI78iULj7EW28JG6UGcyucWTfviR4kacHtacvVklWgcec5mnFZIlv9fRfA/TVrJy
	 ykQoMv6ZI5LSkZnkgkd1LHdl0FUdDkos7cOsilXzM4YH8EtkHmpEbg7CUUCsa4cMEQ
	 34nltx4QMZnliKNpDFK2EVs5rEq6DlFMy7GTEskilCGVfIBgVWXB3M/MSZV+I/Cwh/
	 TcCvoRsiAFSsQY6saLpV+bNzRfI0Ly2Vy51nN0TLGGDzxTGpDHquXnFBg4U+YUqWHb
	 JXFP+8N0MFAi9iBySk4TVdw8xIS2tRGUhAUWn4805s5EUR4SpRiaqcdYYmNjroveZ9
	 WPd+aaU3lumQw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:34 -0500
Subject: [PATCH 13/19] arm64: dts: amlogic: Drop redundant CPU
 "clock-latency"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-13-076be7171a85@kernel.org>
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
X-CRM114-CacheID: sfid-20250403_195959_605130_C6078D44 
X-CRM114-Status: GOOD (  11.07  )
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
"clock-latency-ns". Add any missing "clock-latency-ns" properties and
remove "clock-latency".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts             | 4 ----
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts         | 4 ----
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts             | 4 ----
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts               | 4 ----
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts            | 4 ----
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                   | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi             | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi      | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi          | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi       | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts    | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi            | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts        | 6 ------
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi             | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi              | 6 ------
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi              | 4 ----
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi           | 4 ----
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts        | 4 ----
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi             | 4 ----
 arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts | 4 ----
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts              | 4 ----
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                    | 1 +
 23 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
index 9aa36f17ffa2..d0a3b4b9229c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -267,28 +267,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index 952b8d02e5c2..4353485c6f26 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -220,28 +220,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 52fbc5103e45..f39fcabc763f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -314,28 +314,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 5407049d2647..b5bf8ecc91e6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -407,28 +407,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &clkc_audio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 01da83658ae3..5ab460a3e637 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -263,28 +263,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 543e70669df5..deee61dbe074 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -62,6 +62,7 @@ cpu_opp_table: opp-table {
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <731000>;
+			clock-latency-ns = <50000>;
 		};
 
 		opp-1200000000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
index adedc1340c78..415248931ab1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
@@ -76,42 +76,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &pwm_ab {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index 8e9ad1e51d66..8ecb5bd125c1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -14,6 +14,7 @@ cpu_opp_table_0: opp-table-0 {
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <761000>;
+			clock-latency-ns = <50000>;
 		};
 
 		opp-1200000000 {
@@ -54,6 +55,7 @@ cpub_opp_table_1: opp-table-1 {
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <731000>;
+			clock-latency-ns = <50000>;
 		};
 
 		opp-1200000000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 92e8b26ecccc..39011b645128 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -155,42 +155,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 54663c55a20e..1b08303c4282 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -263,42 +263,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index 48650bad230d..fc737499f207 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -51,42 +51,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &pwm_ab {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index e21831dfceee..d5938a4a6da3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -281,42 +281,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 /* RK817 only supports 12.5mV steps, round up the values */
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 7e8964bacfce..3298d59833b6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -227,42 +227,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu_thermal {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index fc05ecf90714..1e5c6f984945 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -259,42 +259,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu_thermal {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 44c23c984034..19cad93a6889 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -14,6 +14,7 @@ cpu_opp_table_0: opp-table-0 {
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <731000>;
+			clock-latency-ns = <50000>;
 		};
 
 		opp-1200000000 {
@@ -59,6 +60,7 @@ cpub_opp_table_1: opp-table-1 {
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <771000>;
+			clock-latency-ns = <50000>;
 		};
 
 		opp-1200000000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index a7a0fc264cdc..9b6d780eada7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -213,42 +213,36 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
-	clock-latency = <50000>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
index a3463149db3d..9be3084b090d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
@@ -147,28 +147,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 40db95f64636..538b35036954 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -185,28 +185,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 5d75ad3f3e46..a3d9b66b6878 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -51,28 +51,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
 };
 
 &pwm_AO_cd {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index ad8d07883760..c4524eb4f099 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -250,28 +250,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
index 537370db360f..5daadfb170b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
@@ -64,26 +64,22 @@ &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 37d7f64b6d5d..024d2eb8e6ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -359,28 +359,24 @@ &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
 	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 97e4b52066dc..966ebb19cc55 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -100,6 +100,7 @@ cpu_opp_table: opp-table {
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <770000>;
+			clock-latency-ns = <50000>;
 		};
 
 		opp-1200000000 {

-- 
2.47.2


