Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9688CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPhEgh6h08NvV/WJFEJSaiceUNgtBjJKe3ZQG+Qcpzs=; b=VwIZ6k219VQgdLQGCDAZH1Kv0o
	SgXwYusboWXfqLgHfzkis4vwDRJpYHWyOc8vQDZ9NR+NcgftAXGD/pBNoBabZrDt0Jv5+xdPbCY0u
	23g8rqgauuam04Dx2JDfm86QBKqNBKBXRJi3Anf8/u0mzgbKd47wxCN61QjLuOFGCNfFduZgsceXR
	K3N/odh+i+HDfKg3VNRBoLlTVuw8pdFUlJecrtzhfSFrIDLzDtmEIJFIl18JgxqdAk6FO4b5PANaH
	YPFgOECNbk9913wFpCGfrkx995bj/LAoZKYqeH9XsKZrb/m28UlrMUPMgeEptMXTPy9DwtkRB1KL2
	eyjaNtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXL3-0000000By93-3kOo;
	Fri, 22 May 2026 21:23:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXKv-0000000By2Y-3irW;
	Fri, 22 May 2026 21:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB08A443F5;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B819DC2BCC7;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484996;
	bh=NVSWHAFR1LsCrLz77aschyKwNIXtNKkr5g0+WCuZBCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nXfMFFxN6vCjqLQaJm86dEdDlga29hcHc6tS1APgc6BWhfG+S7P0VAogiZB3BO2Gz
	 buBo3+U8nedC2kENfMJb253Hg1n1x51t4qywIirMyiFR0BZTCBxuTcB9loIH/w20d4
	 bXLs/NVgJGGJYOA8byPTyiNJhAbjYavrHHWFAvWtj4Sq0UgIHXvOSXS0vV4x2KgO77
	 6kExmI49nzSgOnIMOx0CHSR2haIl+oJWpi6QMDcCR+c+aHB+fn3Q2NH/8Y0j2a9dMT
	 QS20wpjjzVwDt1+j7zgcN2x2qOBr5vr33TNcNQNXOVc/s4Ne4XdFelqzC6SWkklKq+
	 DSpTFlGwbkaZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83D8CD5BB7;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 22 May 2026 23:23:08 +0200
Subject: [PATCH v5 2/8] media: dt-bindings: add rockchip rk3588 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=6436;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=im+o/JIpnBODW83u7tZJGsEttv7DKCVZnFjWMn7O7Ds=;
 b=/9Z4cuEnd7E2AIBT2dyZPM9JBgN6OunMh7RhUwHCZ/PZLElRjwjqMv8Rei8T6aofmB//fOg0r
 TuvyywQ8ME3AQR6gN+dTh21InrQQ0GhQcVSzs+vDFX6Bfz7HO+bl0WS
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142317_989302_79F8F121 
X-CRM114-Status: UNSURE (   9.80  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
that end, make the existing rockchip,rk3568-vicap documentation more
general and introduce variant specific constraints.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 173 ++++++++++++++++++---
 1 file changed, 154 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 18cd0a5a5318174910e04f6ef7558c92cbfec899..080b64503b1bc44d0cfa796db8ec0eb369ed4c52 100644
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
@@ -26,11 +32,8 @@ properties:
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
     items:
@@ -38,25 +41,19 @@ properties:
       - const: hclk
       - const: dclk
       - const: iclk
+      - const: iclk1
+    minItems: 4
 
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
@@ -67,8 +64,15 @@ properties:
 
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
@@ -100,13 +104,75 @@ properties:
 
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
 
         properties:
           endpoint:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
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
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
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
@@ -114,6 +180,75 @@ required:
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
+          maxItems: 4
+
+        clock-names:
+          maxItems: 4
+
+        resets:
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
+
+        clock-names:
+          minItems: 5
+
+        resets:
+          minItems: 9
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
2.47.3



