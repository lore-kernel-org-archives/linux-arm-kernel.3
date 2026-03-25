Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFF0FEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJln8tELZIzBEjgO42b4KJ9vBvM9uIYD4HKSebpjatk=; b=TBVTCa9+V3nB0d1TE0GvgqPSGD
	djlKQemxh34f1SStwMq2pb0HZPQ3OYJzEMkj01n/0Dp8DQClmrjZtCpCOkCqJeiXiZzbXBBsVWWtK
	3bzoYnrakQLzamWmmsqghzg7sVt4fmIhnxF78X1vJfGaA5AE5Yfk1xAmGtEG79oeZ5P0NafALi5VT
	ry0FQf9p6Zb5MzWLgDHtOgpKPI5JkInmEQB+RtDjCsErEDxrEwTy0fzqrcs9A++dkIgOI3QrDfP79
	5zvrkBTgzoZfZS1F5yVMsjguSbKYMxXxr9IAUG1rD2MuAOizz3fwM9ddCgl79lMhZ5fXeQrTcRfq4
	0rDeHxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MlT-00000003J41-1Ii4;
	Wed, 25 Mar 2026 11:51:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MlS-00000003J2T-1S5x;
	Wed, 25 Mar 2026 11:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B83AE6013C;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C84CC2BCB5;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439469;
	bh=JjjcPqq9H27QPxfBDMqXEuUsyUGVuGKEtryZAio5lrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oeXKpmF+Ssb56dhuDzTZ8bYVAw47TPYmo2I3Y6Br7BFQfxKeuFViWplqXXWHXjK1X
	 WAseVzxT4qGjF0tuLCJ7hfh6XGnIIFtb5TUxOKE8SpQFAzpHAj7NstAAmfi9nBneeA
	 wu5uBjc98bsGShuFkTG593kuJbslnJmngAhtSD6K3USiN5nTJZHKXeELpuS4CQ5qdW
	 PEtvBzFi2GOXvY9KNU7wtFQUk9YSI4KuSp8WYDbIySfoACV+hsgjxj7pJy6BTT5gRm
	 ocqILi1Km0p6+TVa6F3KTVxGV9oNdu2ALErviUJis0YenSFtuZ06LO2DahmR7MJr9I
	 iZ7ynjCe9YF4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592EE1093168;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 25 Mar 2026 12:51:07 +0100
Subject: [PATCH v3 2/9] media: dt-bindings: add rockchip rk3588 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v3-2-e38e428868cc@collabora.com>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
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
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774439467; l=6555;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=oa4KcT9fRYz9I8qYtj9tZE2sEkoYMSd4GpMdemZqn04=;
 b=/KDSFbVMYD09sLoLmNNsigUIQm54I9NYo0iabgQuiGDwRr508GdhthCGkPJOyS+aLQIO1ysV+
 6uuoRJpIvRaA8ILKyI4sIs5L72oIG2pxGKQzoZCAF8EMJDTCZ3vgsqR
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 187 ++++++++++++++++++---
 1 file changed, 163 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 18cd0a5a5318..897ed00c239b 100644
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
@@ -114,6 +175,84 @@ required:
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
+          items:
+            - const: aclk
+            - const: hclk
+            - const: dclk
+            - const: iclk
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
+          items:
+            - const: aclk
+            - const: hclk
+            - const: dclk
+            - const: iclk0
+            - const: iclk1
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
2.39.5



