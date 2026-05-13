Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2040CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY2bVcrEeFwt0QKCeF9shBLSPFZbRaUrMn4+YQmfI7w=; b=j33Vp3Gw+6ktRU2vkWFi+FyELd
	D5elIak/kgL9ThjPAYUPR7Ppd+QBKOqhNQAQyD8PAvG+8qyKunRRJYkqZ1i6vWymQW3cScuGR2nMI
	0ED93mN6evZfBYWW/clxdBvhbh3F0GbgiBNyASg91c/r843HRs8uiSb3eHX6WNh5bsL7JuFbriRyI
	DfQklj9SLTYIac0pj+VLEVRRjORwC+vO+qFLw5fy4ywmMEtTD4VRXMTooK1JroIBs6SZuCnZ+i1Rl
	xEm7qQYBtsqPtTS+/BjWK5NGvUo6gXyAVV9fipL5r7BFHgeBqOnEXwh26oQhuWDNU4eC6QJ0nUv4U
	93SklqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TT-00000002dUI-34pj;
	Wed, 13 May 2026 13:18:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TL-00000002dP0-2ToT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:01 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D29322A27;
	Wed, 13 May 2026 15:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678269;
	bh=o2udw3Crr9J1QuXaXPV5drvL6Y5aZAKT/0GYJ/rqNtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vZolVgoYklIUglijceeQe7Fu95R4gzz0omMRLvGmJKSseg1AWtCVgQQRlnokoqGt6
	 TO9GUBGql3/ZH8TAptGhMUtEztqs7mIbRLNxEpphiaNQiJShorIoxdtsAmceDGpzh8
	 d703xckHqdq4AUm74fCWbGSeA3uHVujdCDDUtXHw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:24 +0300
Subject: [PATCH v2 02/16] dt-bindings: display: ti,am65x-dss: Simplify
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-2-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=o2udw3Crr9J1QuXaXPV5drvL6Y5aZAKT/0GYJ/rqNtE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHn80Ad+XRSTUuelDFgjSErBUG8JbAIrPKQ2y
 FVOufLshO2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR5/AAKCRD6PaqMvJYe
 9XrOD/4icJtb8qOGFJrTWSOhePdRV2E6qdo5J0a8UujWjVBjSUfNEFtlMOcV0AgYOeRyQTrc3Ah
 ar1In2AgwcjYrHMowZSy2myjcyzQ1hu0venSiUr51DLTIxOet0fn84RVHWhqke0L2k2i9Z9GGTi
 vPdT3xu2nkR1sr9sDysF7ETxMXfrvjsLpD6MBsDNZ9NgYgvSbCYc3kAPK15UQEM8Z7JVM4lk/yd
 H5+A2SwQhDZXxRAKrLkjtSm0X4/4gbD0ckU7q3zn8MYu7UgR2PG9SCgLV/RvzZtrJ3T4vrR91Yp
 Wf4gv2As+NxoipQgLH90FhGAuLm/upzygvhbQ2SMNdQIW+gd1hldBZpYMQhXLsqVAyTGK2fu6fK
 QNRKGmgLqx+DYPm+X9kVf7yGWzP+zn/K8no3VDGnfCNTn5x+Um7o5jkohuKNEKyCXZPEq6sf1gc
 UDeMy+6qS8EnC/XwsyII/UBII/OFsj1ETr4snHrj9DAFMofJHajzXlXtC7t9BP7HUu/x0qUOhbj
 wqAsavkKjtOzvVkZKaXNkDNn8DUGClcTZn3F9KMHKpRSJon05wgKHUSiwIv5Sr9bzNjLHGuwBCV
 98lEEvYOcIGmSjNiKV663ey85kQ0sIWXF8M4OzFYkdOYRsmCHymwKNfyoKHEK5vCgXnSJLgwtYG
 ISgZ0zsH+RwiFjA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061759_781844_314DBA88 
X-CRM114-Status: GOOD (  12.25  )
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

In principle the DT binding for the DSS IP should mainly cover the DSS
IP. The current binding also covers the SoC integration topics outside
the DSS, mainly via the endpoint related rules and descriptions.

A more recent SoC, AM62P, has two instances of the DSS IP, and while
both DSS IPs are identical, they are integrated slightly differently
(e.g. which DSS output goes to an in-SoC DSI bridge, which goes to
DPI pins, etc.).

To make the bindings usable for both DSS instances, relax the binding
slightly: remove the explicit endpoint rules, and generalize the
descriptions.

Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml          | 55 ++++++++--------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 75d9640398f0..588d72d4ec0d 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -12,12 +12,21 @@ maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 description: |
-  The AM625 and AM65x TI Keystone Display SubSystem has two output
-  ports and two video planes. In AM65x DSS, the first video port
-  supports 1 OLDI TX and in AM625 DSS, the first video port output is
-  internally routed to 2 OLDI TXes. The second video port supports DPI
-  format. The first plane is full video plane with all features and the
-  second is a "lite plane" without scaling support.
+  The Display Subsystem (DSS) used in e.g. AM65x and AM625 SoCs has two output
+  video ports (VP) and two video planes. The integration varies from SoC to SoC,
+  affecting the routing of the video ports.
+
+  The first plane is full video plane with all features and the second is a
+  "lite plane" without scaling support.
+
+  On AM65x, the first VP has an integrated OLDI TX, thus the first output port
+  is OLDI output. The second VP is routed to external MIPI DPI pins.
+
+  On AM625, the first VP is connected to two OLDI TX instances, and the second
+  VP is routed to external MIPI DPI pins.
+
+  On AM62A7, the first VP is tied off in the SoC, and the second VP is routed to
+  external MIPI DPI pins.
 
 properties:
   compatible:
@@ -85,34 +94,15 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          For AM65x DSS, the OLDI output port node from video port 1.
-          For AM625 DSS, the internal DPI output port node from video
-          port 1.
-          For AM62A7 DSS, the port is tied off inside the SoC.
-        properties:
-          endpoint@0:
-            $ref: /schemas/graph.yaml#/properties/endpoint
-            description:
-              For AM625 DSS, VP Connection to OLDI0.
-              For AM65X DSS, OLDI output from the SoC.
-
-          endpoint@1:
-            $ref: /schemas/graph.yaml#/properties/endpoint
-            description:
-              For AM625 DSS, VP Connection to OLDI1.
-
-        anyOf:
-          - required:
-              - endpoint
-          - required:
-              - endpoint@0
-              - endpoint@1
+        description: |
+          AM65x: OLDI output from video port 1
+          AM62A7: Not available, tied off inside the SoC
+          Other SoCs: Parallel video from video port 1
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          The DSS DPI output port node from video port 2
+          Parallel video from video port 2
 
   ti,am65x-oldi-io-ctrl:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -168,11 +158,6 @@ allOf:
     then:
       properties:
         oldi-transmitters: false
-        ports:
-          properties:
-            port@0:
-              properties:
-                endpoint@1: false
 
 required:
   - compatible

-- 
2.43.0


