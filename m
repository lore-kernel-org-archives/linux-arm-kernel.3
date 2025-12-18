Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42998D6ACFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9u+b5oxy+O8eC7sLz1TvF1PyeX6YXz+aaD5TEQIkM48=; b=C7DntOc1nfPP1sXZ8wISdMbgpG
	dmQ1zp9F6rWq7EiEruV5D4FDQJ9NlJNjA2f/qC+ICGCPxh8pnSAjQfBcWZeaS5fhd2+NDeWAIQcEb
	HKnA+VD6ceC55zV3B6ql1TPhKoZyI/SFpxYw1Vd7As3+SfYCDhVDBk6SKE2wZzikyMwOeC647ztOo
	f35bG114UesmplOMP2gFzm9qGjOJ/PRM/MEaXgUd6shT0HbiC+C9E+YGXzrKFW0jcYntl/mWsPi6w
	RMFDJkdunDmyAEKLnQO5CJRcpb1r3nZXgpS2n/q2+u8KAXXlKoiBE2LzbtTEqR/H4HGXDkOaiRjid
	KEHP5gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDTO-00000008RCS-0lZC;
	Thu, 18 Dec 2025 12:51:14 +0000
Received: from mail-106101.protonmail.ch ([79.135.106.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDTJ-00000008RA5-2YKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1766062263; x=1766321463;
	bh=9u+b5oxy+O8eC7sLz1TvF1PyeX6YXz+aaD5TEQIkM48=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mmA7E97mRfWYyL7KLB7fpx3GJxfyGMku2OFaxKI7az2Xt0m/O0ttv9F5ZcOY9yxJr
	 bAF2E5/vckfZbb+ffYexnDtKJNyFQliGVtwS/FUC8Rs/Ld7s/ELwtayF7Cn4lcuZOq
	 MLdfFOquhGsVpTlnMumXz8MwqOG69f+qV1/JcLz+QZs9Rn3yETzEApfr+dvEqkWcNG
	 vpt8VxZpadzwibYq3Kru9SmiAbw6erB6euDqDhGafVqZnVTahC/yhgOby5cyNH3hWj
	 qxCLgCuZ+FsFQouITKLx8RNs3fMjbcXqUdvX6UyUa1W7N74cyA5LV/ONP3PjGFLAWW
	 B20iFeVciyN1Q==
Date: Thu, 18 Dec 2025 12:51:01 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: kylebonnici <kylebonnici@proton.me>
Cc: Michal Simek <michal.simek@amd.com>, Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyle Bonnici <kylebonnici@hotmail.com>, Kyle Bonnici <kylebonnici@proton.me>
Subject: [PATCH] Coding Style: Format arch/arm/boot/dts/xilinx
Message-ID: <20251218125034.248-1-kylebonnici@proton.me>
Feedback-ID: 172426429:user:proton
X-Pm-Message-ID: c8e3e794c7ded659612ababc1bd036969f14a971
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_045110_556937_6CA5E8C0 
X-CRM114-Status: GOOD (  11.97  )
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

From: Kyle Bonnici <kylebonnici@hotmail.com>

- Convert hex value to lowercase
- align property values to ' =3D '
- clean up whitespaces
- fix indentation
- add new line between nodes

The changes are generated using the dts-linter.

This is just a sample of what the above tool can fix and this change is
intended to start the conversation on how I should suggest fixes to this re=
po
Without sending one big PR.

Also, this is my first attempt at such a submission. Hopefully I did not mi=
ss
Anything fundamental in the submission process.

Signed-off-by: Kyle Bonnici <kylebonnici@proton.me>
---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi       | 72 +++++++++++--------
 arch/arm/boot/dts/xilinx/zynq-cc108.dts       | 11 ++-
 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts    |  1 +
 arch/arm/boot/dts/xilinx/zynq-parallella.dts  |  7 +-
 arch/arm/boot/dts/xilinx/zynq-zc702.dts       | 17 +++++
 arch/arm/boot/dts/xilinx/zynq-zc706.dts       | 13 ++++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts | 10 +++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts |  5 ++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts |  6 ++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts |  8 +++
 arch/arm/boot/dts/xilinx/zynq-zed.dts         |  7 ++
 .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  5 +-
 12 files changed, 126 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xi=
linx/zynq-7000.dtsi
index 153b8d93cbee..dd8a6528e8a7 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -27,10 +27,9 @@ cpu0: cpu@0 {
 =09=09=09clock-latency =3D <1000>;
 =09=09=09cpu0-supply =3D <&regulator_vccpint>;
 =09=09=09operating-points =3D <
-=09=09=09=09/* kHz    uV */
-=09=09=09=09666667  1000000
-=09=09=09=09333334  1000000
-=09=09=09>;
+=09=09=09=09=09    /* kHz    uV */
+=09=09=09=09=09    666667 1000000
+=09=09=09=09=09    333334 1000000>;
 =09=09};
=20
 =09=09cpu1: cpu@1 {
@@ -78,17 +77,21 @@ out-ports {
 =09=09=09/* replicator output ports */
 =09=09=09port@0 {
 =09=09=09=09reg =3D <0>;
+
 =09=09=09=09replicator_out_port0: endpoint {
 =09=09=09=09=09remote-endpoint =3D <&tpiu_in_port>;
 =09=09=09=09};
 =09=09=09};
+
 =09=09=09port@1 {
 =09=09=09=09reg =3D <1>;
+
 =09=09=09=09replicator_out_port1: endpoint {
 =09=09=09=09=09remote-endpoint =3D <&etb_in_port>;
 =09=09=09=09};
 =09=09=09};
 =09=09};
+
 =09=09in-ports {
 =09=09=09/* replicator input port */
 =09=09=09port {
@@ -179,13 +182,13 @@ intc: interrupt-controller@f8f01000 {
 =09=09=09compatible =3D "arm,cortex-a9-gic";
 =09=09=09#interrupt-cells =3D <3>;
 =09=09=09interrupt-controller;
-=09=09=09reg =3D <0xF8F01000 0x1000>,
-=09=09=09      <0xF8F00100 0x100>;
+=09=09=09reg =3D <0xf8f01000 0x1000>,
+=09=09=09      <0xf8f00100 0x100>;
 =09=09};
=20
 =09=09L2: cache-controller@f8f02000 {
 =09=09=09compatible =3D "arm,pl310-cache";
-=09=09=09reg =3D <0xF8F02000 0x1000>;
+=09=09=09reg =3D <0xf8f02000 0x1000>;
 =09=09=09interrupts =3D <0 2 4>;
 =09=09=09arm,data-latency =3D <3 2 2>;
 =09=09=09arm,tag-latency =3D <2 2 2>;
@@ -204,6 +207,7 @@ ocm: sram@fffc0000 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
 =09=09=09ranges =3D <0 0xfffc0000 0x10000>;
+
 =09=09=09ocm-sram@0 {
 =09=09=09=09reg =3D <0x0 0x10000>;
 =09=09=09};
@@ -214,7 +218,7 @@ uart0: serial@e0000000 {
 =09=09=09status =3D "disabled";
 =09=09=09clocks =3D <&clkc 23>, <&clkc 40>;
 =09=09=09clock-names =3D "uart_clk", "pclk";
-=09=09=09reg =3D <0xE0000000 0x1000>;
+=09=09=09reg =3D <0xe0000000 0x1000>;
 =09=09=09interrupts =3D <0 27 4>;
 =09=09};
=20
@@ -223,7 +227,7 @@ uart1: serial@e0001000 {
 =09=09=09status =3D "disabled";
 =09=09=09clocks =3D <&clkc 24>, <&clkc 41>;
 =09=09=09clock-names =3D "uart_clk", "pclk";
-=09=09=09reg =3D <0xE0001000 0x1000>;
+=09=09=09reg =3D <0xe0001000 0x1000>;
 =09=09=09interrupts =3D <0 50 4>;
 =09=09};
=20
@@ -304,6 +308,7 @@ nfc0: nand-controller@0,0 {
 =09=09=09=09reg =3D <0 0 0x1000000>;
 =09=09=09=09status =3D "disabled";
 =09=09=09};
+
 =09=09=09nor0: flash@1,0 {
 =09=09=09=09status =3D "disabled";
 =09=09=09=09compatible =3D "cfi-flash";
@@ -336,24 +341,26 @@ slcr: slcr@f8000000 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
 =09=09=09compatible =3D "xlnx,zynq-slcr", "syscon", "simple-mfd";
-=09=09=09reg =3D <0xF8000000 0x1000>;
+=09=09=09reg =3D <0xf8000000 0x1000>;
 =09=09=09ranges;
+
 =09=09=09clkc: clkc@100 {
 =09=09=09=09bootph-all;
 =09=09=09=09#clock-cells =3D <1>;
 =09=09=09=09compatible =3D "xlnx,ps7-clkc";
 =09=09=09=09fclk-enable =3D <0>;
 =09=09=09=09clock-output-names =3D "armpll", "ddrpll", "iopll", "cpu_6or4x=
",
-=09=09=09=09=09=09"cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x",
-=09=09=09=09=09=09"dci", "lqspi", "smc", "pcap", "gem0", "gem1",
-=09=09=09=09=09=09"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
-=09=09=09=09=09=09"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1",
-=09=09=09=09=09=09"dma", "usb0_aper", "usb1_aper", "gem0_aper",
-=09=09=09=09=09=09"gem1_aper", "sdio0_aper", "sdio1_aper",
-=09=09=09=09=09=09"spi0_aper", "spi1_aper", "can0_aper", "can1_aper",
-=09=09=09=09=09=09"i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper",
-=09=09=09=09=09=09"gpio_aper", "lqspi_aper", "smc_aper", "swdt",
-=09=09=09=09=09=09"dbg_trc", "dbg_apb";
+=09=09=09=09=09=09     "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x",
+=09=09=09=09=09=09     "ddr3x", "dci", "lqspi", "smc", "pcap", "gem0",
+=09=09=09=09=09=09     "gem1", "fclk0", "fclk1", "fclk2", "fclk3",
+=09=09=09=09=09=09     "can0", "can1", "sdio0", "sdio1", "uart0",
+=09=09=09=09=09=09     "uart1", "spi0", "spi1", "dma", "usb0_aper",
+=09=09=09=09=09=09     "usb1_aper", "gem0_aper", "gem1_aper",
+=09=09=09=09=09=09     "sdio0_aper", "sdio1_aper", "spi0_aper",
+=09=09=09=09=09=09     "spi1_aper", "can0_aper", "can1_aper",
+=09=09=09=09=09=09     "i2c0_aper", "i2c1_aper", "uart0_aper",
+=09=09=09=09=09=09     "uart1_aper", "gpio_aper", "lqspi_aper",
+=09=09=09=09=09=09     "smc_aper", "swdt", "dbg_trc", "dbg_apb";
 =09=09=09=09reg =3D <0x100 0x100>;
 =09=09=09};
=20
@@ -380,10 +387,10 @@ dmac_s: dma-controller@f8003000 {
 =09=09=09 * "dma4", "dma5", "dma6", "dma7";
 =09=09=09 */
 =09=09=09interrupts =3D <0 13 4>,
-=09=09=09             <0 14 4>, <0 15 4>,
-=09=09=09             <0 16 4>, <0 17 4>,
-=09=09=09             <0 40 4>, <0 41 4>,
-=09=09=09             <0 42 4>, <0 43 4>;
+=09=09=09=09     <0 14 4>, <0 15 4>,
+=09=09=09=09     <0 16 4>, <0 17 4>,
+=09=09=09=09     <0 40 4>, <0 41 4>,
+=09=09=09=09     <0 42 4>, <0 43 4>;
 =09=09=09#dma-cells =3D <1>;
 =09=09=09clocks =3D <&clkc 27>;
 =09=09=09clock-names =3D "apb_pclk";
@@ -412,7 +419,7 @@ ttc0: timer@f8001000 {
 =09=09=09interrupts =3D <0 10 4>, <0 11 4>, <0 12 4>;
 =09=09=09compatible =3D "cdns,ttc";
 =09=09=09clocks =3D <&clkc 6>;
-=09=09=09reg =3D <0xF8001000 0x1000>;
+=09=09=09reg =3D <0xf8001000 0x1000>;
 =09=09};
=20
 =09=09ttc1: timer@f8002000 {
@@ -420,7 +427,7 @@ ttc1: timer@f8002000 {
 =09=09=09interrupts =3D <0 37 4>, <0 38 4>, <0 39 4>;
 =09=09=09compatible =3D "cdns,ttc";
 =09=09=09clocks =3D <&clkc 6>;
-=09=09=09reg =3D <0xF8002000 0x1000>;
+=09=09=09reg =3D <0xf8002000 0x1000>;
 =09=09};
=20
 =09=09scutimer: timer@f8f00600 {
@@ -466,6 +473,7 @@ etb@f8801000 {
 =09=09=09reg =3D <0xf8801000 0x1000>;
 =09=09=09clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
 =09=09=09clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
+
 =09=09=09in-ports {
 =09=09=09=09port {
 =09=09=09=09=09etb_in_port: endpoint {
@@ -480,6 +488,7 @@ tpiu@f8803000 {
 =09=09=09reg =3D <0xf8803000 0x1000>;
 =09=09=09clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
 =09=09=09clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
+
 =09=09=09in-ports {
 =09=09=09=09port {
 =09=09=09=09=09tpiu_in_port: endpoint {
@@ -499,8 +508,7 @@ funnel@f8804000 {
 =09=09=09out-ports {
 =09=09=09=09port {
 =09=09=09=09=09funnel_out_port: endpoint {
-=09=09=09=09=09=09remote-endpoint =3D
-=09=09=09=09=09=09=09<&replicator_in_port0>;
+=09=09=09=09=09=09remote-endpoint =3D <&replicator_in_port0>;
 =09=09=09=09=09};
 =09=09=09=09};
 =09=09=09};
@@ -512,6 +520,7 @@ in-ports {
 =09=09=09=09/* funnel input ports */
 =09=09=09=09port@0 {
 =09=09=09=09=09reg =3D <0>;
+
 =09=09=09=09=09funnel0_in_port0: endpoint {
 =09=09=09=09=09=09remote-endpoint =3D <&ptm0_out_port>;
 =09=09=09=09=09};
@@ -519,6 +528,7 @@ funnel0_in_port0: endpoint {
=20
 =09=09=09=09port@1 {
 =09=09=09=09=09reg =3D <1>;
+
 =09=09=09=09=09funnel0_in_port1: endpoint {
 =09=09=09=09=09=09remote-endpoint =3D <&ptm1_out_port>;
 =09=09=09=09=09};
@@ -526,8 +536,8 @@ funnel0_in_port1: endpoint {
=20
 =09=09=09=09port@2 {
 =09=09=09=09=09reg =3D <2>;
-=09=09=09=09=09funnel0_in_port2: endpoint {
-=09=09=09=09=09};
+
+=09=09=09=09=09funnel0_in_port2: endpoint {};
 =09=09=09=09};
 =09=09=09=09/* The other input ports are not connect to anything */
 =09=09=09};
@@ -539,6 +549,7 @@ ptm@f889c000 {
 =09=09=09clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
 =09=09=09clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
 =09=09=09cpu =3D <&cpu0>;
+
 =09=09=09out-ports {
 =09=09=09=09port {
 =09=09=09=09=09ptm0_out_port: endpoint {
@@ -554,6 +565,7 @@ ptm@f889d000 {
 =09=09=09clocks =3D <&clkc 27>, <&clkc 46>, <&clkc 47>;
 =09=09=09clock-names =3D "apb_pclk", "dbg_trc", "dbg_apb";
 =09=09=09cpu =3D <&cpu1>;
+
 =09=09=09out-ports {
 =09=09=09=09port {
 =09=09=09=09=09ptm1_out_port: endpoint {
diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dts/xi=
linx/zynq-cc108.dts
index f5525c048426..25828ba9fa16 100644
--- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
@@ -55,6 +55,7 @@ ethernet_phy: ethernet-phy@1 {
 &qspi {
 =09status =3D "okay";
 =09num-cs =3D <1>;
+
 =09flash@0 { /* 16 MB */
 =09=09compatible =3D "jedec,spi-nor";
 =09=09reg =3D <0x0>;
@@ -63,26 +64,32 @@ flash@0 { /* 16 MB */
 =09=09spi-rx-bus-width =3D <4>;
 =09=09#address-cells =3D <1>;
 =09=09#size-cells =3D <1>;
+
 =09=09partition@0 {
 =09=09=09label =3D "qspi-fsbl-uboot-bs";
 =09=09=09reg =3D <0x0 0x400000>; /* 4MB */
 =09=09};
+
 =09=09partition@400000 {
 =09=09=09label =3D "qspi-linux";
 =09=09=09reg =3D <0x400000 0x400000>; /* 4MB */
 =09=09};
+
 =09=09partition@800000 {
 =09=09=09label =3D "qspi-rootfs";
 =09=09=09reg =3D <0x800000 0x400000>; /* 4MB */
 =09=09};
+
 =09=09partition@c00000 {
 =09=09=09label =3D "qspi-devicetree";
 =09=09=09reg =3D <0xc00000 0x100000>; /* 1MB */
 =09=09};
+
 =09=09partition@d00000 {
 =09=09=09label =3D "qspi-scratch";
 =09=09=09reg =3D <0xd00000 0x200000>; /* 2MB */
 =09=09};
+
 =09=09partition@f00000 {
 =09=09=09label =3D "qspi-uboot-env";
 =09=09=09reg =3D <0xf00000 0x100000>; /* 1MB */
@@ -92,8 +99,8 @@ partition@f00000 {
=20
 &sdhci1 {
 =09status =3D "okay";
-=09broken-cd ;
-=09wp-inverted ;
+=09broken-cd;
+=09wp-inverted;
 };
=20
 &uart0 {
diff --git a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts b/arch/arm/boot/dts=
/xilinx/zynq-ebaz4205.dts
index 14f644156a6f..d4c07d28ec25 100644
--- a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
@@ -53,6 +53,7 @@ &nfc0 {
=20
 =09#address-cells =3D <1>;
 =09#size-cells =3D <0>;
+
 =09nand@0 {
 =09=09reg =3D <0>;
 =09};
diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/d=
ts/xilinx/zynq-parallella.dts
index 366af4fcf8d9..e498feaa7ca4 100644
--- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
@@ -44,10 +44,10 @@ &gem0 {
 =09ethernet_phy: ethernet-phy@0 {
 =09=09/* Marvell 88E1318 */
 =09=09compatible =3D "ethernet-phy-id0141.0e90",
-=09=09             "ethernet-phy-ieee802.3-c22";
+=09=09=09     "ethernet-phy-ieee802.3-c22";
 =09=09reg =3D <0>;
 =09=09marvell,reg-init =3D <0x3 0x10 0xff00 0x1e>,
-=09=09                   <0x3 0x11 0xfff0 0xa>;
+=09=09=09=09   <0x3 0x11 0xfff0 0xa>;
 =09};
 };
=20
@@ -63,13 +63,16 @@ dcd1 {
 =09=09=09=09regulator-name =3D "VDD_DSP";
 =09=09=09=09regulator-always-on;
 =09=09=09};
+
 =09=09=09dcd2 {
 =09=09=09=09regulator-name =3D "1P35V";
 =09=09=09=09regulator-always-on;
 =09=09=09};
+
 =09=09=09ldo1 {
 =09=09=09=09regulator-name =3D "VDD_ADJ";
 =09=09=09};
+
 =09=09=09ldo2 {
 =09=09=09=09regulator-name =3D "VDD_GPIO";
 =09=09=09=09regulator-always-on;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc702.dts b/arch/arm/boot/dts/xi=
linx/zynq-zc702.dts
index 6955637c5b1a..63eded827b37 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc702.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
@@ -34,6 +34,7 @@ chosen {
 =09gpio-keys {
 =09=09compatible =3D "gpio-keys";
 =09=09autorepeat;
+
 =09=09switch-14 {
 =09=09=09label =3D "sw14";
 =09=09=09gpios =3D <&gpio0 12 0>;
@@ -41,6 +42,7 @@ switch-14 {
 =09=09=09wakeup-source;
 =09=09=09autorepeat;
 =09=09};
+
 =09=09switch-13 {
 =09=09=09label =3D "sw13";
 =09=09=09gpios =3D <&gpio0 14 0>;
@@ -112,6 +114,7 @@ i2c@0 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <0>;
+
 =09=09=09si570: clock-generator@5d {
 =09=09=09=09#clock-cells =3D <0>;
 =09=09=09=09compatible =3D "silabs,si570";
@@ -126,6 +129,7 @@ i2c@1 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <1>;
+
 =09=09=09adv7511: hdmi-tx@39 {
 =09=09=09=09compatible =3D "adi,adv7511";
 =09=09=09=09reg =3D <0x39>;
@@ -141,6 +145,7 @@ i2c@2 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <2>;
+
 =09=09=09eeprom: eeprom@54 {
 =09=09=09=09compatible =3D "atmel,24c08";
 =09=09=09=09reg =3D <0x54>;
@@ -151,6 +156,7 @@ i2c@3 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <3>;
+
 =09=09=09gpio@21 {
 =09=09=09=09compatible =3D "ti,tca6416";
 =09=09=09=09reg =3D <0x21>;
@@ -163,6 +169,7 @@ i2c@4 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <4>;
+
 =09=09=09rtc: rtc@51 {
 =09=09=09=09compatible =3D "nxp,pcf8563";
 =09=09=09=09reg =3D <0x51>;
@@ -173,14 +180,17 @@ i2c@7 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <7>;
+
 =09=09=09hwmon@34 {
 =09=09=09=09compatible =3D "ti,ucd9248";
 =09=09=09=09reg =3D <0x34>;
 =09=09=09};
+
 =09=09=09hwmon@35 {
 =09=09=09=09compatible =3D "ti,ucd9248";
 =09=09=09=09reg =3D <0x35>;
 =09=09=09};
+
 =09=09=09hwmon@36 {
 =09=09=09=09compatible =3D "ti,ucd9248";
 =09=09=09=09reg =3D <0x36>;
@@ -396,32 +406,39 @@ &qspi {
 =09bootph-all;
 =09status =3D "okay";
 =09num-cs =3D <1>;
+
 =09flash@0 {
 =09=09compatible =3D "jedec,spi-nor";
 =09=09reg =3D <0x0>;
 =09=09spi-tx-bus-width =3D <1>;
 =09=09spi-rx-bus-width =3D <4>;
 =09=09spi-max-frequency =3D <50000000>;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "qspi-fsbl-uboot";
 =09=09=09=09reg =3D <0x0 0x100000>;
 =09=09=09};
+
 =09=09=09partition@100000 {
 =09=09=09=09label =3D "qspi-linux";
 =09=09=09=09reg =3D <0x100000 0x500000>;
 =09=09=09};
+
 =09=09=09partition@600000 {
 =09=09=09=09label =3D "qspi-device-tree";
 =09=09=09=09reg =3D <0x600000 0x20000>;
 =09=09=09};
+
 =09=09=09partition@620000 {
 =09=09=09=09label =3D "qspi-rootfs";
 =09=09=09=09reg =3D <0x620000 0x5e0000>;
 =09=09=09};
+
 =09=09=09partition@c00000 {
 =09=09=09=09label =3D "qspi-bitstream";
 =09=09=09=09reg =3D <0xc00000 0x400000>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc706.dts b/arch/arm/boot/dts/xi=
linx/zynq-zc706.dts
index 3b803c698473..d6447e544d8f 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc706.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
@@ -73,6 +73,7 @@ i2c@0 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <0>;
+
 =09=09=09si570: clock-generator@5d {
 =09=09=09=09#clock-cells =3D <0>;
 =09=09=09=09compatible =3D "silabs,si570";
@@ -87,6 +88,7 @@ i2c@1 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <1>;
+
 =09=09=09adv7511: hdmi-tx@39 {
 =09=09=09=09compatible =3D "adi,adv7511";
 =09=09=09=09reg =3D <0x39>;
@@ -102,6 +104,7 @@ i2c@2 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <2>;
+
 =09=09=09eeprom: eeprom@54 {
 =09=09=09=09compatible =3D "atmel,24c08";
 =09=09=09=09reg =3D <0x54>;
@@ -112,6 +115,7 @@ i2c@3 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <3>;
+
 =09=09=09gpio@21 {
 =09=09=09=09compatible =3D "ti,tca6416";
 =09=09=09=09reg =3D <0x21>;
@@ -124,6 +128,7 @@ i2c@4 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <4>;
+
 =09=09=09rtc: rtc@51 {
 =09=09=09=09compatible =3D "nxp,pcf8563";
 =09=09=09=09reg =3D <0x51>;
@@ -134,6 +139,7 @@ i2c@7 {
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <0>;
 =09=09=09reg =3D <7>;
+
 =09=09=09ucd90120@65 {
 =09=09=09=09compatible =3D "ti,ucd90120";
 =09=09=09=09reg =3D <0x65>;
@@ -309,6 +315,7 @@ &qspi {
 =09bootph-all;
 =09status =3D "okay";
 =09num-cs =3D <2>;
+
 =09flash@0 {
 =09=09compatible =3D "jedec,spi-nor";
 =09=09reg =3D <0>, <1>;
@@ -316,26 +323,32 @@ flash@0 {
 =09=09spi-tx-bus-width =3D <1>;
 =09=09spi-rx-bus-width =3D <4>;
 =09=09spi-max-frequency =3D <50000000>;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "qspi-fsbl-uboot";
 =09=09=09=09reg =3D <0x0 0x100000>;
 =09=09=09};
+
 =09=09=09partition@100000 {
 =09=09=09=09label =3D "qspi-linux";
 =09=09=09=09reg =3D <0x100000 0x500000>;
 =09=09=09};
+
 =09=09=09partition@600000 {
 =09=09=09=09label =3D "qspi-device-tree";
 =09=09=09=09reg =3D <0x600000 0x20000>;
 =09=09=09};
+
 =09=09=09partition@620000 {
 =09=09=09=09label =3D "qspi-rootfs";
 =09=09=09=09reg =3D <0x620000 0x5e0000>;
 =09=09=09};
+
 =09=09=09partition@c00000 {
 =09=09=09=09label =3D "qspi-bitstream";
 =09=09=09=09reg =3D <0xc00000 0x400000>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts b/arch/arm/boot/=
dts/xilinx/zynq-zc770-xm010.dts
index 5fe799c3c7cf..4929a5aa1678 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
@@ -62,32 +62,39 @@ eeprom: eeprom@52 {
 &qspi {
 =09status =3D "okay";
 =09num-cs =3D <1>;
+
 =09flash@0 {
 =09=09compatible =3D "jedec,spi-nor";
 =09=09reg =3D <0x0>;
 =09=09spi-tx-bus-width =3D <1>;
 =09=09spi-rx-bus-width =3D <4>;
 =09=09spi-max-frequency =3D <50000000>;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "qspi-fsbl-uboot";
 =09=09=09=09reg =3D <0x0 0x100000>;
 =09=09=09};
+
 =09=09=09partition@100000 {
 =09=09=09=09label =3D "qspi-linux";
 =09=09=09=09reg =3D <0x100000 0x500000>;
 =09=09=09};
+
 =09=09=09partition@600000 {
 =09=09=09=09label =3D "qspi-device-tree";
 =09=09=09=09reg =3D <0x600000 0x20000>;
 =09=09=09};
+
 =09=09=09partition@620000 {
 =09=09=09=09label =3D "qspi-rootfs";
 =09=09=09=09reg =3D <0x620000 0x5e0000>;
 =09=09=09};
+
 =09=09=09partition@c00000 {
 =09=09=09=09label =3D "qspi-bitstream";
 =09=09=09=09reg =3D <0xc00000 0x400000>;
@@ -104,14 +111,17 @@ &spi1 {
 =09status =3D "okay";
 =09num-cs =3D <4>;
 =09is-decoded-cs =3D <0>;
+
 =09flash@1 {
 =09=09compatible =3D "sst25wf080", "jedec,spi-nor";
 =09=09reg =3D <1>;
 =09=09spi-max-frequency =3D <1000000>;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "data";
 =09=09=09=09reg =3D <0x0 0x100000>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts b/arch/arm/boot/=
dts/xilinx/zynq-zc770-xm011.dts
index f9a086fe66d3..d4e739772d7b 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
@@ -51,20 +51,25 @@ &nfc0 {
 =09status =3D "okay";
 =09#address-cells =3D <1>;
 =09#size-cells =3D <0>;
+
 =09nand@0 {
 =09=09reg =3D <0>;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "nand-fsbl-uboot";
 =09=09=09=09reg =3D <0x0 0x1000000>;
 =09=09=09};
+
 =09=09=09partition@1000000 {
 =09=09=09=09label =3D "nand-linux";
 =09=09=09=09reg =3D <0x1000000 0x2000000>;
 =09=09=09};
+
 =09=09=09partition@3000000 {
 =09=09=09=09label =3D "nand-rootfs";
 =09=09=09=09reg =3D <0x3000000 0x200000>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts b/arch/arm/boot/=
dts/xilinx/zynq-zc770-xm012.dts
index 24520e7d3965..32422aed77a3 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
@@ -56,26 +56,32 @@ eeprom1: eeprom@52 {
 &nor0 {
 =09status =3D "okay";
 =09bank-width =3D <1>;
+
 =09partitions {
 =09=09compatible =3D "fixed-partitions";
 =09=09#address-cells =3D <1>;
 =09=09#size-cells =3D <1>;
+
 =09=09partition@0 {
 =09=09=09label =3D "nor-fsbl-uboot";
 =09=09=09reg =3D <0x0 0x100000>;
 =09=09};
+
 =09=09partition@100000 {
 =09=09=09label =3D "nor-linux";
 =09=09=09reg =3D <0x100000 0x500000>;
 =09=09};
+
 =09=09partition@600000 {
 =09=09=09label =3D "nor-device-tree";
 =09=09=09reg =3D <0x600000 0x20000>;
 =09=09};
+
 =09=09partition@620000 {
 =09=09=09label =3D "nor-rootfs";
 =09=09=09reg =3D <0x620000 0x5e0000>;
 =09=09};
+
 =09=09partition@c00000 {
 =09=09=09label =3D "nor-bitstream";
 =09=09=09reg =3D <0xc00000 0x400000>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts b/arch/arm/boot/=
dts/xilinx/zynq-zc770-xm013.dts
index 103e87ea7253..9c94421bf650 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
@@ -61,6 +61,7 @@ si570: clock-generator@55 {
 &qspi {
 =09status =3D "okay";
 =09num-cs =3D <2>;
+
 =09flash@0 {
 =09=09compatible =3D "jedec,spi-nor";
 =09=09reg =3D <0>, <1>;
@@ -68,26 +69,32 @@ flash@0 {
 =09=09spi-tx-bus-width =3D <1>;
 =09=09spi-rx-bus-width =3D <4>;
 =09=09spi-max-frequency =3D <50000000>;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "qspi-fsbl-uboot";
 =09=09=09=09reg =3D <0x0 0x100000>;
 =09=09=09};
+
 =09=09=09partition@100000 {
 =09=09=09=09label =3D "qspi-linux";
 =09=09=09=09reg =3D <0x100000 0x500000>;
 =09=09=09};
+
 =09=09=09partition@600000 {
 =09=09=09=09label =3D "qspi-device-tree";
 =09=09=09=09reg =3D <0x600000 0x20000>;
 =09=09=09};
+
 =09=09=09partition@620000 {
 =09=09=09=09label =3D "qspi-rootfs";
 =09=09=09=09reg =3D <0x620000 0x5e0000>;
 =09=09=09};
+
 =09=09=09partition@c00000 {
 =09=09=09=09label =3D "qspi-bitstream";
 =09=09=09=09reg =3D <0xc00000 0x400000>;
@@ -100,6 +107,7 @@ &spi0 {
 =09status =3D "okay";
 =09num-cs =3D <4>;
 =09is-decoded-cs =3D <0>;
+
 =09eeprom: eeprom@2 {
 =09=09compatible =3D "atmel,at25";
 =09=09reg =3D <2>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zed.dts b/arch/arm/boot/dts/xili=
nx/zynq-zed.dts
index 52ba569b2b9f..dd46d71e3f36 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zed.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zed.dts
@@ -51,6 +51,7 @@ &qspi {
 =09bootph-all;
 =09status =3D "okay";
 =09num-cs =3D <1>;
+
 =09flash@0 {
 =09=09compatible =3D "jedec,spi-nor";
 =09=09reg =3D <0>;
@@ -58,26 +59,32 @@ flash@0 {
 =09=09spi-rx-bus-width =3D <4>;
 =09=09spi-max-frequency =3D <50000000>;
 =09=09m25p,fast-read;
+
 =09=09partitions {
 =09=09=09compatible =3D "fixed-partitions";
 =09=09=09#address-cells =3D <1>;
 =09=09=09#size-cells =3D <1>;
+
 =09=09=09partition@0 {
 =09=09=09=09label =3D "qspi-fsbl-uboot";
 =09=09=09=09reg =3D <0x0 0x100000>;
 =09=09=09};
+
 =09=09=09partition@100000 {
 =09=09=09=09label =3D "qspi-linux";
 =09=09=09=09reg =3D <0x100000 0x500000>;
 =09=09=09};
+
 =09=09=09partition@600000 {
 =09=09=09=09label =3D "qspi-device-tree";
 =09=09=09=09reg =3D <0x600000 0x20000>;
 =09=09=09};
+
 =09=09=09partition@620000 {
 =09=09=09=09label =3D "qspi-rootfs";
 =09=09=09=09reg =3D <0x620000 0x5e0000>;
 =09=09=09};
+
 =09=09=09partition@c00000 {
 =09=09=09=09label =3D "qspi-bitstream";
 =09=09=09=09reg =3D <0xc00000 0x400000>;
diff --git a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi b/arch/arm/boo=
t/dts/xilinx/zynq-zturn-common.dtsi
index defef9c8da13..57e6cda1a798 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
@@ -33,6 +33,7 @@ chosen {
=20
 =09gpio-leds {
 =09=09compatible =3D "gpio-leds";
+
 =09=09usr-led1 {
 =09=09=09label =3D "usr-led1";
 =09=09=09gpios =3D <&gpio0 0x0 0x1>;
@@ -49,6 +50,7 @@ usr-led2 {
 =09gpio-keys {
 =09=09compatible =3D "gpio-keys";
 =09=09autorepeat;
+
 =09=09key {
 =09=09=09label =3D "K1";
 =09=09=09gpios =3D <&gpio0 0x32 0x1>;
@@ -73,8 +75,7 @@ &gem0 {
 =09phy-mode =3D "rgmii-id";
 =09phy-handle =3D <&ethernet_phy>;
=20
-=09ethernet_phy: ethernet-phy@0 {
-=09};
+=09ethernet_phy: ethernet-phy@0 {};
 };
=20
 &sdhci0 {
--=20
2.50.1 (Apple Git-155)



