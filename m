Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A727CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xiLD/vBcP7a+qVEkjVAty45mbYb3VKilG9jSDWbmz8=; b=oBhoNFVzRe2/6vDhXhuTToqtwW
	iSjy7hWIU85MaefIApcY98R3xFz3ffHH7ldvwK5YB01DstII3ZVdQqgLjR21w55hxSB3KbN1P9q5n
	HDpsrtjeBA5bYdoXzO+/GFfFfd3GlH8+QlPh7l/e/Ab7JWnM7ORxkbP2EMkutCfd6FtmVGVd9ghZw
	bTfBv9yamtjmkeHSFUkSIVYOSEWg+EPZ5wlWdiaK1u4br9VreGJLL+y3eKTwn/SxWBOmqDg/0qbf1
	nDynL12JgaFHkVFEqW97NWzJWPDqgH0BtVAforCKA+n70HIOm+x5bhCMl/kcxdlqYCgt/wvQx2KPs
	7owPuaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssr-00000006zMs-3Hgi;
	Fri, 29 May 2026 08:48:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssO-00000006yxb-3ekR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:34 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B7B425DE;
	Fri, 29 May 2026 10:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044431;
	bh=QRCgGuQI9KSr0PSqJDtaxynA7ArGu4rjVovMKdCClWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nRWRm82POlTzi7uYDkCrhI6CUWQTnRSMnA+s166+G3cGy+fl9ke+bENH8Q2LSTfEX
	 EqvBgVXQ5YvRH4F+Dk4ZOBmojfR+LeVKVUXKN5XEwQdX4S/Lm3gyrVQdcQzOYnWX2Q
	 Ozs0GHltlXUiAFYqUMimxdRrwgf32weNSF/O/unw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:44 +0300
Subject: [PATCH v3 14/15] arm64: dts: ti: k3-am62p-j722s-common-main: Add
 support for DSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-14-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8756;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=H0wMXSAIONmI151f8HbVdYTNwHlQyFFAmPe5iU0V2c4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKQCS0GVQDGIJWI/vDJumBVzf/Akj4v50BA2
 OIpNJgFo/GJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSkAAKCRD6PaqMvJYe
 9eE3D/4hUUhmRgav/zaXGM4K19kTxD4TlGl/IemCNDXS7cqzHIx201g5u9dgYzvB6UWqL8uIVMF
 YSwBZv+Yvz5J06NX2Sa66Or5urQkWNnrv10PnIMFeiDAgejb/pyFpuIuj+OyXWBXJvfAyTa9Rc6
 IvdXMZPip106oJH2sfbbGg/RfTwnIKXP5JiLk3r0LssrUmuoY7F/HO9zgEm3obtm36W3GJa3YJ0
 DbCaqDUCPWNS4hCXPO3fpZA64e4QJVaQAnnoU9KY45HIrWu25LzQeTNN9IB8ocosQAVpFCyVgCp
 tmdpWVCTYV6NoJcBHBPIjmmHN5scRZ5VB/xBjVaqrIdJHKGl73pZKshqhlpINydqKBC51KN4Gmu
 p4CLCMbYrVbfavgV5+KlQMeCNVaxERJaCPjkfR/v92pQcBmNDM2tMNw+o48/RHNXVtzzpcjZNhC
 g7lRj5kMEgh1AW1sOCmj0bPrPveTg6hjbIOVx1cEUt9GDrBAExeCoYt0bM8jsfFPYKpQoE7hMtC
 xihvCWXbAhGwZqMOpwSZ8PIczhapgk+dyKWzpkvzUBh27CBobxZ8tHTh0rImHxTHmggSqjrruug
 np5GhVUPyOysmUnEwrXjwrPOMuYP3BGOfou6mk1IJC2VHo0fKHnwzEmO17O1bRCFzCIedUtl3F3
 TN+KNX2HU9VBcjA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014733_066015_CF14650C 
X-CRM114-Status: GOOD (  19.14  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

TI's AM62P and J722S SoCs support 2 display subsystems (DSS), DSS0 and
DSS1, each with two video ports (VP) and two video planes. The outputs
from the DSS VPs can be routed to two OLDI TXes (OLDI0, OLDI1), a DSI
TX, or parallel DPI output.

DSS0 supports:
- VP0: OLDI0 in single-link mode or OLDI0 and OLDI1 in dual-link or
  clone mode.
- VP1: DPI

DSS1 supports:
- VP0: OLDI1 in single-link mode, or DPI
- VP1: DPI or DSI

The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
between the DSS instances. Thus only a single VP can output to DPI, and
a single VP can use an OLDI block. Note that in single-link
configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
be used by DSS1.

Add the necessary nodes to k3-am62p-j722s-common-main.dtsi, including
DSS0, DSS1, OLDI0, OLDI1, DPHY and DSI.

An important note about OLDIs:

We have two OLDI hardware blocks. Each OLDI has certain configuration
that has to be done before it can be used. The OLDI blocks get this
configuration directly from the DSS block, via DSS registers. However,
as a single OLDI block can be used either with DSS0 or DSS1, the
source for the configuration changes according to (probably, this is
unclear) a DSS related clock mux.

So, afaics, when thinking about Linux device hierarchy wrt. control
busses, OLDI blocks are children of DSS blocks, and they reside in a
special DSS bus. And the OLDI parent changes according to the mux. As
far as I know, there is no way we can represent this in the DT.

Thus the solution used here (and in the driver) is that each DSS node
contains the OLDI nodes that can be used with that DSS. Thus the DSS0
node has two child nodes, OLDI0 and OLDI1, and the DSS1 node has one
child node, OLDI1. The OLDI1 nodes thus refer to the same piece of
hardware, and they cannot be used at the same time. The selection which
OLDI nodes to use are chosen in the board dts files, so assuming the dts
files are correct, no resource conflict can happen.

This is not a very nice solution, but the hardware doesn't make it easy
to have a clean solution, and, most importantly, this works.

[j-choudhary@ti.com: Refactor changes for k3-am62p-j722s-common-main.dtsi
 and add changes for new OLDI driver support]

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
[tomi.valkeinen: various fixes and improvements]
Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    | 112 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |  16 +++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  16 +++
 3 files changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 58805e287496..8b65c6efc148 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -64,6 +64,11 @@ audio_refclk1: clock@82e4 {
 			#clock-cells = <0>;
 		};
 
+		dss_oldi_io_ctrl: dss-oldi-io-ctrl@8600 {
+			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
+			reg = <0x8600 0x200>;
+		};
+
 		phy_gmii_sel: phy@4044 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4044 0x8>;
@@ -1111,6 +1116,113 @@ dphy0: phy@30110000 {
 		status = "disabled";
 	};
 
+	dss0: dss@30200000 {
+		compatible = "ti,am62p-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30206000 0x00 0x1000>, /* vid */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Used for OLDI */
+		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "vid",
+			    "ovr1", "ovr2", "vp1", "vp2", "common1";
+		power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;	/* DSS0 */
+		clocks = <&k3_clks 186 6>,
+			 <&dss0_vp1_clk>,
+			 <&k3_clks 186 2>;
+		clock-names = "fck", "vp1", "vp2";
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,dpi-io-ctrl = <&main_conf 0x8300>;
+		status = "disabled";
+
+		oldi-transmitters {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dss0_oldi0: oldi@0 {
+				reg = <0>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+				power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>; /* OLDI0_VD */
+			};
+
+			dss0_oldi1: oldi@1 {
+				reg = <1>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+				power-domains = <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>; /* OLDI1_VD */
+			};
+		};
+	};
+
+	dss1: dss@30220000 {
+		compatible = "ti,am62p-dss";
+		reg = <0x00 0x30220000 0x00 0x1000>, /* common */
+		      <0x00 0x30222000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30226000 0x00 0x1000>, /* vid */
+		      <0x00 0x30227000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x30228000 0x00 0x1000>, /* ovr2 */
+		      <0x00 0x3022a000 0x00 0x1000>, /* vp1: Used for DPI/OLDI */
+		      <0x00 0x3022b000 0x00 0x1000>, /* vp2: Used DPI/DSI */
+		      <0x00 0x30221000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "vid",
+			    "ovr1", "ovr2", "vp1", "vp2", "common1";
+		power-domains = <&k3_pds 232 TI_SCI_PD_EXCLUSIVE>;	/* DSS1 */
+		clocks = <&k3_clks 232 8>,
+			 <&dss1_vp1_clk>,
+			 <&k3_clks 232 4>;
+		clock-names = "fck", "vp1", "vp2";
+		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		ti,dpi-io-ctrl = <&main_conf 0x8300>;
+		status = "disabled";
+
+		oldi-transmitters {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dss1_oldi1: oldi@1 {
+				reg = <1>;
+				clocks = <&k3_clks 232 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+				power-domains = <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>; /* OLDI1_VD */
+			};
+		};
+	};
+
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x301c0000 0x0 0x1000>;
+		clocks = <&k3_clks 238 16>, <&k3_clks 238 1>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 238 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 238 1>;
+		assigned-clock-parents = <&k3_clks 238 2>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
+		clocks = <&k3_clks 231 2>, <&k3_clks 231 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 231 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 9d6266d6ddb8..074dc44ec049 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -144,6 +144,22 @@ cbass_wakeup: bus@b00000 {
 		};
 	};
 
+	dss0_vp1_clk: clock-divider-oldi-dss0 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 186 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
+	dss1_vp1_clk: clock-divider-oldi-dss1 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 232 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
 	#include "k3-am62p-j722s-common-thermal.dtsi"
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 1b36dcf37925..e34e32ef8b8d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -228,6 +228,22 @@ cbass_wakeup: bus@b00000 {
 		};
 	};
 
+	dss0_vp1_clk: clock-divider-oldi-dss0 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 186 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
+	dss1_vp1_clk: clock-divider-oldi-dss1 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 232 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
 	#include "k3-am62p-j722s-common-thermal.dtsi"
 };
 

-- 
2.43.0


