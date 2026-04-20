Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98979F588C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqLEN/9LqyUNAcYzISHs5IWV9qXi2WV5+DwI+VSgr8o=; b=QxF1KH3tMFqvqFcMQiPG9/Z8aI
	x9aFZyyGTlgNbOKWkObD6zDyccg0C0piRbqUDw3tdA8MJsnR3QN9Z07pwo5MLMX00bU3iDJVUfUdH
	SDxzJ6miHIBR+w8IfkFCCS3yBHfJ5pskE16TRsd5/yntK7/eIAI9wMcgz4zlG3gVQeZRxzJKBEo94
	/TYi5rVAdPGvwT9ED0W/BJdZ0LZL7jCp5XlGlA1qE/CYMvYiIH5IxtK9bXuDHmhda7b3MQ3TP06bl
	G7GOYlKQA+NoFuVGkRGorzDU9Rosv9BNX38Ajr8+cRJG79EclP55hvfnuCHRDmWdENvTqpcdtcIAD
	RX7S8gIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9H-00000006uwg-0eMe;
	Mon, 20 Apr 2026 12:54:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo98-00000006urK-0UE2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:54:40 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C9792677;
	Mon, 20 Apr 2026 14:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689579;
	bh=fExIAih1V/hUxLXpMt7LVH1DfE+RqN2Y1ycWAegD0uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HngQQALN8W5cp1iABKNlfrEY1iO0zLyhduFC0O5EjsjD3ewMFKyYcDmUargaq1OYT
	 mmwBivFjYsQ4FbaJa5dpfduQiWTuPgEjqZy7VH4TeoBCkTTYpbkuxICCpxgc1xSlaT
	 E7eZStwzRosl9DuPTBz0Gk+gjMoMQOcFrGA7/Ifw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:09 +0300
Subject: [PATCH 02/15] dt-bindings: display: ti,am65x-dss: Simplify binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-2-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4076;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fExIAih1V/hUxLXpMt7LVH1DfE+RqN2Y1ycWAegD0uk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iIDVQka58bN3HLS4c+NlZswqixlG/xqmGICs
 ymyuvYjy2uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiAwAKCRD6PaqMvJYe
 9aGsD/9n256V6XjrpI6lnUsY3QZ9Uin8/hpZ2dn2RxWzS6WIJkT5ak5+hUNTBUeGgRbAe+7AUvR
 J5L/zug7O2P7r4DCiy6rfGyvvGg72AWaaehgIjfME8pyp4lpBNcDnPDobS1kAjHt7nH8pOIxTs4
 wc+P4yppYNaFuLlBp2gWLrzGLSjZ9cEi1lAf+5LjP15SMqUYmzF3ka0fOjiv9WGFB6huFo8wgtJ
 fhrNybFqE4iDNLvfNY3ZhZwdpoISSQMaV9ZRkDEriGDefrF3dtrc9uI/sGw+Z5whWYHg8GFWkvH
 JmVkCFkFYE9d75hdbuKZvBjwNRwkGKPro0CoJlGqUjg8QFmLUZonasd6atlWrhWwFFUlCSz+Fvm
 rDFwE+WBvZKY/a567XZghGqkUv0ych5zbDp9/ciUGYFaLsDJtBcnS+0bjJJM1j1Ov4OxGveOnCE
 jpoh0zcIvAXrKYII7QArV90f5M/hpS1IuveCPmgxQIXX8MIySviHcRkEJhI+7KwhDPLVgBAhg5f
 XBrEZLCcGn5riJxaI3tyGgl6N9LC0EWRLtgGscs08mbneFGnMuRHvByKi2PGGscoetEULbgwp6z
 k3DHBGtk+fPfp54uO+tpEzRpEzWLBM4BiASygc703zmKVHHeS2xzZvUs7ZBOwuD7rHeltN6GVvI
 5nYYmydQj26sqzw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_055438_306878_7D181371 
X-CRM114-Status: GOOD (  12.49  )
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


