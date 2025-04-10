Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784D6C369AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WnS+rp6vT50A3JJ3ssMiqM6mQIpNm1UaXoxLrvMKsE=; b=lz7RNojdKPdAbhr0m1fXTqLX0B
	2O7DWtyqg97NOfXLjy+L6cIFcze6S46O+rtk8li+4S9Cq1EREsvrUgpGsk1oKw60MbC2cZLofRBMp
	bFofE7tP03mNlCfguSVys/RGwWaU4TDyrrzTUrWdOK5UQT/+dsrZhWwMjlVXI/CZIwjRYZF/uIjKi
	+/81RJU1EtjDSCf07VtnVUv7GIUBACeM+XhZAivNOu9rPLu53+u7D9z/3gSrTD2EtbP4GpmmABmVm
	qEaBV2KFz72jQurkgyuu9fOeqLWxjUEJlMX26ctyXywd/ths+HFN+L1dbQ+J38SZoiMfIzxMtUJZR
	LJGYoaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vPP-0000000BK7T-30iv;
	Thu, 10 Apr 2025 17:09:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8M-0000000B54u-27P3;
	Thu, 10 Apr 2025 15:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08C1943C4A;
	Thu, 10 Apr 2025 15:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74791C4CEDD;
	Thu, 10 Apr 2025 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300084;
	bh=dKAOoXa8SCYRYEZ5DexCu2UhSLqHH8rlgSZklM08q94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l2gIODf+ANFVlqZ9CulzWNQFCDEoQRk9OTYtBUUUmUr+0KRxQ+QpqorLHa6YLWbl8
	 v3Oi2r0xr7ARSLLOMqYg5AZWNrArNFy1udHWR+bJVRxAxFquzbOBL3NmlJ561hNlLA
	 fgqJ3BYhZfnGst0as+dG+23NMcPorSF+hKBPcg2XZk1HNLWkLkkH51tNlODcQCvckQ
	 4LSBDn59C62j13sYFO/xz4YPyXOa0LmbDztipsCo3yE50CeVEm/RfpOSRPmrotfBrH
	 QjFjYrdKte/IjRM21kzYTJi9VvedUeiF+JT+R2BNFy99OSpj3GB9FUVaTetGmcoZq2
	 18/BEZEbZraOA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:34 -0500
Subject: [PATCH v2 13/17] dt-bindings: arm/cpus: Re-wrap 'description'
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-13-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084806_595448_43DE9EA6 
X-CRM114-Status: GOOD (  18.28  )
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

Some of the 'description' entries have odd line wrapping and incorrect
YAML block modifiers. The 'description' entries should typically wrap
at 80 chars. Reformat the entries to follow that along with using '>'
modifiers as appropriate.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 85 +++++++++++--------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 351be2f77581..acf38b3518dd 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -10,9 +10,9 @@ maintainers:
   - Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
 
 description: |+
-  The device tree allows to describe the layout of CPUs in a system through
-  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
-  defining properties for every cpu.
+  The device tree allows to describe the layout of CPUs in a system through the
+  "cpus" node, which in turn contains a number of subnodes (ie "cpu") defining
+  properties for every cpu.
 
   Bindings for CPU nodes follow the Devicetree Specification, available from:
 
@@ -41,45 +41,40 @@ description: |+
 properties:
   reg:
     maxItems: 1
-    description: |
-      Usage and definition depend on ARM architecture version and
-      configuration:
+    description: >
+      Usage and definition depend on ARM architecture version and configuration:
 
-      On uniprocessor ARM architectures previous to v7
-      this property is required and must be set to 0.
+      On uniprocessor ARM architectures previous to v7 this property is required
+      and must be set to 0.
 
-      On ARM 11 MPcore based systems this property is
-        required and matches the CPUID[11:0] register bits.
+      On ARM 11 MPcore based systems this property is required and matches the
+      CPUID[11:0] register bits.
 
-        Bits [11:0] in the reg cell must be set to
-        bits [11:0] in CPU ID register.
+        Bits [11:0] in the reg cell must be set to bits [11:0] in CPU ID register.
 
         All other bits in the reg cell must be set to 0.
 
-      On 32-bit ARM v7 or later systems this property is
-        required and matches the CPU MPIDR[23:0] register
-        bits.
+      On 32-bit ARM v7 or later systems this property is required and matches
+      the CPU MPIDR[23:0] register bits.
 
-        Bits [23:0] in the reg cell must be set to
-        bits [23:0] in MPIDR.
+        Bits [23:0] in the reg cell must be set to bits [23:0] in MPIDR.
 
         All other bits in the reg cell must be set to 0.
 
-      On ARM v8 64-bit systems this property is required
-        and matches the MPIDR_EL1 register affinity bits.
+      On ARM v8 64-bit systems this property is required and matches the
+      MPIDR_EL1 register affinity bits.
 
         * If cpus node's #address-cells property is set to 2
 
-          The first reg cell bits [7:0] must be set to
-          bits [39:32] of MPIDR_EL1.
+          The first reg cell bits [7:0] must be set to bits [39:32] of
+          MPIDR_EL1.
 
-          The second reg cell bits [23:0] must be set to
-          bits [23:0] of MPIDR_EL1.
+          The second reg cell bits [23:0] must be set to bits [23:0] of
+          MPIDR_EL1.
 
         * If cpus node's #address-cells property is set to 1
 
-          The reg cell bits [23:0] must be set to bits [23:0]
-          of MPIDR_EL1.
+          The reg cell bits [23:0] must be set to bits [23:0] of MPIDR_EL1.
 
       All other bits in the reg cells must be set to 0.
 
@@ -278,29 +273,26 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       maxItems: 1
-    description: |
-      List of phandles to idle state nodes supported
-      by this cpu (see ./idle-states.yaml).
+    description:
+      List of phandles to idle state nodes supported by this cpu (see
+      ./idle-states.yaml).
 
   capacity-dmips-mhz:
     description:
       u32 value representing CPU capacity (see ../cpu/cpu-capacity.txt) in
-      DMIPS/MHz, relative to highest capacity-dmips-mhz
-      in the system.
+      DMIPS/MHz, relative to highest capacity-dmips-mhz in the system.
 
   cci-control-port: true
 
   dynamic-power-coefficient:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      A u32 value that represents the running time dynamic
-      power coefficient in units of uW/MHz/V^2. The
-      coefficient can either be calculated from power
+    description: >
+      A u32 value that represents the running time dynamic power coefficient in
+      units of uW/MHz/V^2. The coefficient can either be calculated from power
       measurements or derived by analysis.
 
-      The dynamic power consumption of the CPU  is
-      proportional to the square of the Voltage (V) and
-      the clock frequency (f). The coefficient is used to
+      The dynamic power consumption of the CPU  is proportional to the square of
+      the Voltage (V) and the clock frequency (f). The coefficient is used to
       calculate the dynamic power as below -
 
       Pdyn = dynamic-power-coefficient * V^2 * f
@@ -309,10 +301,6 @@ properties:
 
   performance-domains:
     maxItems: 1
-    description:
-      List of phandles and performance domain specifiers, as defined by
-      bindings of the performance domain provider. See also
-      dvfs/performance-domain.yaml.
 
   power-domains:
     description:
@@ -341,22 +329,21 @@ properties:
 
   rockchip,pmu:
     $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
+    description: >
       Specifies the syscon node controlling the cpu core power domains.
 
-      Optional for systems that have an "enable-method"
-      property value of "rockchip,rk3066-smp"
-      While optional, it is the preferred way to get access to
-      the cpu-core power-domains.
+      Optional for systems that have an "enable-method" property value of
+      "rockchip,rk3066-smp". While optional, it is the preferred way to get
+      access to the cpu-core power-domains.
 
   secondary-boot-reg:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: |
+    description: >
       Required for systems that have an "enable-method" property value of
       "brcm,bcm11351-cpu-method", "brcm,bcm23550" or "brcm,bcm-nsp-smp".
 
-      This includes the following SoCs: |
-      BCM11130, BCM11140, BCM11351, BCM28145, BCM28155, BCM21664, BCM23550
+      This includes the following SoCs:
+      BCM11130, BCM11140, BCM11351, BCM28145, BCM28155, BCM21664, BCM23550,
       BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
 
       The secondary-boot-reg property is a u32 value that specifies the

-- 
2.47.2


