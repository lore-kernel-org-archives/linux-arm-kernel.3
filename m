Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888F7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/D8N3AT/SDCbOQl1MHeeXXnpoLiiG4Uqz9lV9VA2rkQ=; b=vFMqjQg81/u1PJDYgeyvbwfSSC
	kvsKgFPz7maDJcCGFFpz2aTKFchhFVgpMPgUGuncc52IF9DsN9LMGdQgvcnmxzOIaPw0ZPOKmSPNS
	b3bmM4s+CwZkNQhWxxxD9QBGF8NZqwGE/Vvet1PrmDyo2cMkly8UsZ6r9aSi0aGa6Jkb9d7gmMvoH
	W4ROgJSDTQbfJ5m0y5i4lvaOkaFjOJv85aT32LhCJeaA5mjJ/mXGipUrciGQNkH57mapvWzpy4Nmy
	q612fN3YkhU9Z36+UKN0IblLEkaxhQEGz8HlAutpWoOYFZf0Fn8Qh3DHiCzuLBDptE93G94kfyOhD
	z9Ru+Vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XnX-0000000AhWB-0Nde;
	Fri, 04 Apr 2025 03:32:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHo-0000000Ad3y-3ygk;
	Fri, 04 Apr 2025 03:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B362A42648;
	Fri,  4 Apr 2025 02:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06E7C4CEE3;
	Fri,  4 Apr 2025 03:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735604;
	bh=qt04cpMtce1Dpx+XQO1X0rXON/Jr6p5yPdGytRb8Eas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q/n2/+qAbQ4lqGimi3B39jw61JwhYStJxbhIKpQByr6sATNhR0pByuj78+ofl0w3b
	 mDYpwWD136Zeead5FiF3meTxotK0fSVSKY+pLIMCy6nHHT2XntZ2hIuZGE0CofixOf
	 66GxYVVp8SPCEKljznidvtg8tyHPaWU3lqYPRODKskhUIdq8wmiyjOHnbX1UV5O/Hd
	 1zXJDjHiwOeHhIiGKBrIEfSSy+5HgAQSIgjQkV+JNHxsvQiURpsgi3Auk/qhrqM7bU
	 xft6O+le2YtCNm5Wk4E3pmvSVZajHPPBt2o9L5ObkWzDIY4YhQ+RA9wpGjeEYy7Lxk
	 JSnSa3SGRCJlA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:38 -0500
Subject: [PATCH 17/19] dt-bindings: arm/cpus: Add missing properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-17-076be7171a85@kernel.org>
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
X-CRM114-CacheID: sfid-20250403_200005_126650_F88AA43B 
X-CRM114-Status: GOOD (  14.08  )
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

The Arm CPU schema is missing a number of properties already in use.
This has gone unnoticed as extra properties have not been restricted.
Add a missing reference to cpu.yaml, and add all the missing properties.

As "clock-latency" and "voltage-tolerance" are related to opp-v1, add
those properties to the opp-v1.yaml schema.

With this, other properties can be prevented from creeping in with
'unevaluatedProperties: false'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml   | 46 ++++++++++++++++++++++-
 Documentation/devicetree/bindings/opp/opp-v1.yaml | 16 ++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 3d2b6286efb8..6f74ebfd38df 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -299,6 +299,16 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  interconnects:
+    minItems: 1
+    maxItems: 2
+
+  nvmem-cells:
+    maxItems: 1
+
+  nvmem-cell-names:
+    const: speed_grade
+
   performance-domains:
     maxItems: 1
 
@@ -317,6 +327,31 @@ properties:
       corresponding to the index of an SCMI performance domain provider, must be
       "perf".
 
+  resets:
+    maxItems: 1
+
+  arm-supply:
+    deprecated: true
+    description: Use 'cpu-supply' instead
+
+  cpu0-supply:
+    deprecated: true
+    description: Use 'cpu-supply' instead
+
+  mem-supply: true
+
+  proc-supply:
+    deprecated: true
+    description: Use 'cpu-supply' instead
+
+  sram-supply:
+    deprecated: true
+    description: Use 'mem-supply' instead
+
+  mediatek,cci:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Link to Mediatek Cache Coherent Interconnect
+
   qcom,saw:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -327,6 +362,11 @@ properties:
     description:
       Specifies the ACC node associated with this CPU.
 
+  qcom,freq-domain:
+    description: Specifies the QCom CPUFREQ HW associated with the CPU.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
   rockchip,pmu:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: >
@@ -352,7 +392,11 @@ properties:
       formed by encoding the target CPU id into the low bits of the
       physical start address it should jump to.
 
+  thermal-idle:
+    type: object
+
 allOf:
+  - $ref: /schemas/cpu.yaml#
   - $ref: /schemas/opp/opp-v1.yaml#
   - if:
       # If the enable-method property contains one of those values
@@ -407,7 +451,7 @@ required:
 dependencies:
   rockchip,pmu: [enable-method]
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
index 1b59b103dab6..61c080e50859 100644
--- a/Documentation/devicetree/bindings/opp/opp-v1.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
@@ -21,6 +21,18 @@ description: |+
 deprecated: true
 
 properties:
+  clock-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The latency in nanoseconds for clock changes. Use OPP tables for new
+      designs instead.
+
+  voltage-tolerance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 10
+    description:
+      The voltage tolerance in percent. Use OPP tables for new designs instead.
+
   operating-points:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     items:
@@ -28,8 +40,12 @@ properties:
         - description: Frequency in kHz
         - description: Voltage for OPP in uV
 
+dependencies:
+  clock-latency: [ operating-points ]
+  voltage-tolerance: [ operating-points ]
 
 additionalProperties: true
+
 examples:
   - |
     cpus {

-- 
2.47.2


