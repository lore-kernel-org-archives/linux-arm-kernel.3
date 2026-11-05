Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F15606D81F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t6g1hEn2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTiMuBos
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dGmMiJYc3lHKMhxc/mxh6BHYnDZLHleyhDTNIkVxItI=; b=t6g1hEn2irDo52Hv7G34m5H0Bd
	ap/T58fpTaRrt8e9EvCUUXZmxhSj/Kc1FwNEd6DNr/B4y4G4UbZ058J8csAjGX40HVQdnsVfx0Bpr
	hT+FckF7aIq1mCBYJD7bJZIPYXkoxQt4jF07Sp3Fxp2jD1Du6G46hFXgLyBO9kpVOgcAvuJV/mjEl
	GKvUhPXDI5XMTmAlvG/yk2fHhIFdzgznVUHa5niPy9mj+guPHMFAmmgv6m4kXYtEVG9pV+rqzmlmT
	ZWu+8iZm+I0l0u+HDdcs0QbhJ0cSqg3LLe4ZjWi11dE+hDVPoj3/7zi8Ov3rg7T85EARcBwlPIYPY
	/FV+X3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHb-00000007n5s-45X5;
	Thu, 05 Nov 2026 04:41:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHa-00000007n4I-2jrb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA5ED60ED9;
	Thu,  5 Nov 2026 04:41:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793853661;
	b=0mIuHvRpXnXQgVrctUaBu/XbyC+03S4+t4VYvOEl9UDN/zkH1gcHT3h0a/nbgzDASblr
	 oSOYKFAjwIE+WMmDRBCrPzMoHq/uxj7/uPnKdbPhkAGQivvgQjhq3HYMwYambnaPmpepX
	 I0CE5rXcZWVeVWOQ3gLei/EdJQ8mdRYEF0Qe6EwRn8PgfghAngm8PlawYhZtrfq+LYnxr
	 1G3mrSn36fR1Kj/1GqoBVcfbLT7XHEbvpqJ2t4PsQEkerTesNc1gCyKGGC0OXZsHJMovG
	 9zbUT4AcoUB1POkAgeNAAoOaIByt14Q1FRGeKIcwRQKlqJMkMPliySbjF3489Q4d4sw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793853661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dGmMiJYc3lHKMhxc/mxh6BHYnDZLHleyhDTNIkVxItI=;
	b=Hvq342uXoV0quc9eVbsHOttVPN2VJusF5jaDOJBdbheRSbj2BK00V1mVacNnmBzrxZWM
	 34eEZaKljhOj/t77FO5IuM53KZT+XYRMtmX/hgrePCBUrNLNIP9Z390FcY3cOuOjo99/L
	 ehljLPkMSqjivOlETIBQllZ1tBAcVp7ZKx22mySm8Sbw4LGp3oHpiUMT/yALUvFxLx2yi
	 KdEuOuxZrgEy5v2NCtEW3dAx6knW8jAQ2ztT2BeNmMSrCuNxymULWLWElnwgdCSMHWIS5
	 KcnUl6NfoTDVbSbT7cZJCGQzLCRA/kmLtcvxMB25AglYrZu5mZp3L+aWoTku0vw6fTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56BFE1F00A15;
	Thu,  5 Nov 2026 04:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793853661;
	bh=dGmMiJYc3lHKMhxc/mxh6BHYnDZLHleyhDTNIkVxItI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gTiMuBossNxeyaYYj6lk/I9SDHNvTFpx0AMeysD722dMn64CJEzau4r06az6rBkvl
	 s6f4afGyXJ2mU5HI8OLNj1xw4BJOBxYa3YJt3/1jZfyJNLTeGLY2ZsTWu4mrZDP60r
	 EGjfeCYpjDScTbfZCKc6pSscnM9j+/vWZwhmB6naHUPyfAe+bWn1di+MVJz66R2o/h
	 tSBmiGQDuxJLHU3N041o9jvYehRzCwDDlp2pBkCficwonORDsj758xyVwW6QaxnG1F
	 3dbb8MzLzdhGMURZ7iJ8+GDRghyfgUsfi5+Lvd4y0414TcWbto73lk+JDJk7TuBaJ+
	 COfEIWjo73b/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D687F47088;
	Thu,  5 Nov 2026 04:40:57 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 22:40:56 -0600
Subject: [PATCH 1/6] dt-bindings: opp: h6: Add A133 operating points
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-a133-series-v1-1-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
In-Reply-To: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>, 
 Alexander Sverdlin <alex@sverdlin.org>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793853656; l=6403;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=X/G3DksgzJ+i3rQed4wwbAo4p4D1KALjHDwiLrfYOcU=;
 b=XbeYqKPsgFqj7vO1t315STSTeX5BuZ63YmtmxA7auWASLJShZKufJ6TogzfwvDNE9Ys1QZWfK
 IQI/YWY6ku2DD49oMXg83kCPHqAhaleIMU/unjfq3UnQLirUoJHkj/t
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The vendor BSP for the A100/A133 family (sun50iw10) selects the CPU
speed grade from four efuse fields and the die revision: the speed bin
(SID offset 0x1c, which also holds the ICPU current), the chip marking
ID (0x00), a value programmed at production that the BSP calls PCPU
(0x20) and a bin extension bit (0x28). It knows 11 grades, a0-a6 and
b0-b3. The A100 operating points describe only three speed bins, taken
from 0x1c.

Add allwinner,sun50i-a133-operating-points for this. In its tables the
N of opp-microvolt-speedN is the vendor grade: 0-5 are a0-a5 (a6 has
the same OPPs and voltages as a5) and 6-9 are b0-b3. The four cells are
named, with the speed bin first. The meaning of the PCPU field is not
documented; the name follows the vendor BSP.

Indices 0-2 are the vendor grades a0-a2, which have the voltages of the
three A100 speed bins. So allwinner,sun50i-a100-operating-points is a
valid fallback: software that knows only the A100 compatible reads the
first cell, selects one of speed0-2 with the A100 rule and gets the
OPPs and voltages of the A100 table today, with 1008 instead of
1080 MHz. That is the A100 selection, not the vendor's; the new
compatible adds the vendor's. The binding requires indices 0-2 to stay
usable this way.

The new compatible is SoC specific, like the root compatible
allwinner,sun50i-a133; the A100 compatible stays as it is for existing
DTBs. The schema now also limits the other compatibles to the single
unnamed cell that all in-tree users have.

Claude Code (Anthropic) drafted this change and its message from the
vendor BSP sources (field layout and numbers only, no code copied); I
reviewed it and checked it with dt_binding_check and dtbs_check.

Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 .../opp/allwinner,sun50i-h6-operating-points.yaml  | 94 ++++++++++++++++++++--
 1 file changed, 86 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index 75ab552f6ec..5fa6a1074da 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -16,24 +16,70 @@ description: |
   Voltage Scaling Tables define the voltage and frequency values based
   on the speedbin blown in the efuse combination.
 
+  With allwinner,sun50i-a133-operating-points, the speed bin index N of
+  opp-microvolt-speedN and opp-supported-hw is the speed grade of the
+  Allwinner BSP: 0-5 are a0-a5 (a6 uses the a5 values) and 6-9 are b0-b3.
+  Indices 0-2 must be usable as the A100 speed bins 0-2, because software
+  using the A100 fallback compatible selects only these.
+
 allOf:
   - $ref: opp-v2-base.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-a133-operating-points
+    then:
+      properties:
+        nvmem-cells:
+          minItems: 4
+      required:
+        - nvmem-cell-names
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names: false
 
 properties:
   compatible:
-    enum:
-      - allwinner,sun50i-a100-operating-points
-      - allwinner,sun50i-h6-operating-points
-      - allwinner,sun50i-h616-operating-points
+    oneOf:
+      - enum:
+          - allwinner,sun50i-a100-operating-points
+          - allwinner,sun50i-h6-operating-points
+          - allwinner,sun50i-h616-operating-points
+      - items:
+          - const: allwinner,sun50i-a133-operating-points
+          - const: allwinner,sun50i-a100-operating-points
 
   nvmem-cells:
     description: |
-      A phandle pointing to a nvmem-cells node representing the efuse
-      register that has information about the speedbin that is used
-      to select the right frequency/voltage value pair. Please refer
-      to the nvmem-cells bindings in
+      Phandles pointing to nvmem-cells nodes representing the efuse
+      registers that have information about the speedbin that is used
+      to select the right frequency/voltage value pair. Please refer to
+      the nvmem-cells bindings in
       Documentation/devicetree/bindings/nvmem/nvmem.yaml and also the
       examples below.
+    minItems: 1
+    items:
+      - description:
+          Speed bin, or the chip marking ID on the H616. With the A133
+          compatible, bits 15:12 are the CPU bin and bits 11:0 the ICPU
+          current in units of 0.1 mA.
+      - description: Chip marking ID.
+      - description:
+          Value programmed at production, called PCPU by Allwinner. Bits
+          11:0 are used together with the ICPU current to select the speed
+          grade; their unit is not documented.
+      - description:
+          Bin extension. Bit 31 is used to select the speed grade.
+
+  nvmem-cell-names:
+    items:
+      - const: bin
+      - const: marking
+      - const: pcpu
+      - const: bin-ext
 
   opp-shared: true
 
@@ -132,4 +178,36 @@ examples:
         };
     };
 
+  - |
+    opp-table {
+        compatible = "allwinner,sun50i-a133-operating-points",
+                     "allwinner,sun50i-a100-operating-points";
+        nvmem-cells = <&cpu_speed_grade>, <&chip_marking>,
+                      <&cpu_pcpu>, <&cpu_bin_ext>;
+        nvmem-cell-names = "bin", "marking", "pcpu", "bin-ext";
+        opp-shared;
+
+        opp-408000000 {
+            clock-latency-ns = <244144>; /* 8 32k periods */
+            opp-hz = /bits/ 64 <408000000>;
+
+            opp-microvolt-speed0 = <900000>;
+            opp-microvolt-speed1 = <900000>;
+            opp-microvolt-speed2 = <900000>;
+            opp-microvolt-speed8 = <940000>;
+            opp-supported-hw = <0x107>;
+        };
+
+        opp-1512000000 {
+            clock-latency-ns = <244144>; /* 8 32k periods */
+            opp-hz = /bits/ 64 <1512000000>;
+
+            opp-microvolt-speed6 = <1180000>;
+            opp-microvolt-speed7 = <1130000 1130000 1140000>;
+            opp-microvolt-speed8 = <1100000>;
+            opp-microvolt-speed9 = <1080000>;
+            opp-supported-hw = <0x3c0>;
+        };
+    };
+
 ...

-- 
2.34.1



