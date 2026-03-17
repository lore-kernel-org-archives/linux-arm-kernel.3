Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D62F33825
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYUFNv6oerQ73NwwVpDXzjeAJExAP5JQjRfo+dML2YI=; b=pNCjs6wRbiM+Nf7uw+fSwKkLnQ
	Bh4exYLeZchY/Lq5Hy3flqSu3SzeJKBQOhvZmRoZJJR/bGUAnbmMu5uYkIXH45Md4vA8Ps2poV6xJ
	guhm9Y5xk8VOmr5qcFxs5GLlmy5xLDh2YunAU0+E+Saz/sWn6p83hqykFnArM0OHGvSGKlMgvr3q0
	FxAnCYsuRep+RGjxlR1K/hTRRmpbqssAb0ljZssPpGPkozCkbtk2iHMDD3PZYQoRr3F2uGPPEyyi1
	rGBpeVXw1XV0uXRkCVa9jdVWw3/Ix87Yf0PWPnlff0R8Ja1UNGKARs/de9MPV0o++aObdb4tfOV8x
	soaLYY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmr-00000005sjM-37Ub;
	Tue, 17 Mar 2026 09:32:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmn-00000005sdc-0j7B;
	Tue, 17 Mar 2026 09:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 307C343F31;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C976C2BCB0;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=V5PTH40VekrkxYCqjZUI1t6FYotUriGKSPdl3yvDG+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gZjoQOKLKgaRPaav8Z1PVRhw8k3yIOBIddGAJxrYiPpTcR989DbbdvoE2Fu0UWP6l
	 7vy6aRAOd4zr0H4VkKU8PklMEOByCImiv0r2l34s+BF9dnV7LzSBkR87jrTLodq571
	 INmKswbzJVO3Qnc3NxsRsxHAsdTunmHRfwoZmF2gwWHZCXVe4Rkxs3kjzZno4uStJL
	 LgOyyr77N6s6YBPma6Gd5fbYUNyGi+3Nn5M02qo2k+DfOgOmKiLTy22DJFg5OM7PlX
	 ZWhuwtvXnw4DTRqxvzMTFSu+vgkndkQstscksFuMoohpiaGLCOGSijdh2VnV2/y+dq
	 zD48cFQLuQQzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18B4F33829;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:20 +0100
Subject: [PATCH v2 2/9] media: dt-bindings: add rockchip rk3588 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=6651;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=PLP1i3Q3G/G8xseLo4+pMV9u9+xVQUl6byMHyUWuO4g=;
 b=AqS14d5aadM5bP6UR7gw9PFX4fEa2SMiTGSJoGH84HOsgFCJyDi3galru8oBMOouhvm3lKLKH
 Raox9YOVttcBvcz3F2xqU2truM5WXGQp6BOVmNFPY65prKVneInYJLE
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_023225_296665_F99DFFC6 
X-CRM114-Status: GOOD (  10.25  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
To that end, make the existing rockchip,rk3568-vicap documentation
more general and introduce variant specific constraints.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 191 ++++++++++++++++++---
 1 file changed, 167 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 18cd0a5a5318..15a889ff8e52 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -15,9 +15,15 @@ description:
   the data from camera sensors, video decoders, or other companion ICs and
   transfers it into system main memory by AXI bus.
 
+  The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
+  counterpart, but features six MIPI CSI-2 ports and additional connections
+  to the image signal processor (ISP) blocks.
+
 properties:
   compatible:
-    const: rockchip,rk3568-vicap
+    enum:
+      - rockchip,rk3568-vicap
+      - rockchip,rk3588-vicap
 
   reg:
     maxItems: 1
@@ -26,37 +32,23 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: ACLK
-      - description: HCLK
-      - description: DCLK
-      - description: ICLK
+    minItems: 4
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: aclk
-      - const: hclk
-      - const: dclk
-      - const: iclk
+    minItems: 4
+    maxItems: 5
 
   iommus:
     maxItems: 1
 
   resets:
-    items:
-      - description: ARST
-      - description: HRST
-      - description: DRST
-      - description: PRST
-      - description: IRST
+    minItems: 5
+    maxItems: 9
 
   reset-names:
-    items:
-      - const: arst
-      - const: hrst
-      - const: drst
-      - const: prst
-      - const: irst
+    minItems: 5
+    maxItems: 9
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -67,8 +59,15 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
 
     properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
       port@0:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
@@ -100,13 +99,75 @@ properties:
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-        description: Port connected to the MIPI CSI-2 receiver output.
+        description: Port connected to the MIPI CSI-2 receiver 0 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 1 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 2 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 3 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 4 output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver 5 output.
 
         properties:
           endpoint:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
+      port@10:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the ISP0 input.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@11:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the ISP1 input.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
 required:
   - compatible
   - reg
@@ -114,6 +175,88 @@ required:
   - clocks
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+
+        clock-names:
+          items:
+            - const: aclk
+            - const: hclk
+            - const: dclk
+            - const: iclk
+
+        resets:
+          minItems: 5
+          maxItems: 5
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: prst
+            - const: irst
+
+        ports:
+          properties:
+            port@2: false
+
+            port@3: false
+
+            port@4: false
+
+            port@5: false
+
+            port@6: false
+
+            port@10: false
+
+            port@11: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          items:
+            - const: aclk
+            - const: hclk
+            - const: dclk
+            - const: iclk0
+            - const: iclk1
+
+        resets:
+          minItems: 9
+          maxItems: 9
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: irst0
+            - const: irst1
+            - const: irst2
+            - const: irst3
+            - const: irst4
+            - const: irst5
+
 additionalProperties: false
 
 examples:

-- 
2.39.5



