Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6F9CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcaitcnIFtp2AXZFmOst13BopMFkgX4CT1uqYWrQBNo=; b=o3VudqY35+2d04XulCVFcr3+zX
	XWWk5tnv8+XtkEp22OvpehYFNuDH3gbaicKvKzPNAbL5773LFJbJCveHPWRWWspME5+0hagvJSYlY
	MX2xseUWgszPk0jJ1vWpqu7VcCzOZOhet4DdKro0dUXe8OT9dfP+rtxwsJxboY49Xxp0q2wS9LhQ9
	Qk4DSItGTiWURW2D4LK53JOdWlglZ2Y0PL4ra4J6QJyXB5ke5gRBj4+/GkC68ZYCNrnqEaZGkTUkD
	ulEEES66KLW2djciiBaFDoP/i7TeSTGoUqaZqRv8/th8QL+66STzAWACPsaqcAdK/1nFul3ZH2Z2S
	j7SPnEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssI-00000006ypz-2fo8;
	Fri, 29 May 2026 08:47:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssA-00000006ykw-1mJX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:20 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E48FB1254;
	Fri, 29 May 2026 10:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044416;
	bh=fzDQkAC1FEgeII5oaBsYalF51qtpuLbGjpBpq89aIjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mwzEjsaX/TNzvwgeHP5LYXiaIK6zKNysvdVLHiYmicZ38w40VWGKUKsqBoswgYCij
	 jbhxJ6dlNLXivST/VnEFb/Pp6Vjhz5p4uy6ZCA7Et60rW4k0WW77/PYC7TkHTTHtMJ
	 24Z8llhzZu/x6jvYsO2jEqQJ0AcG1xshN+ibeEZc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:32 +0300
Subject: [PATCH v3 02/15] dt-bindings: display: ti,am65x-dss: Simplify
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-2-7fefdc5d1adf@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fzDQkAC1FEgeII5oaBsYalF51qtpuLbGjpBpq89aIjo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKLSD83oGAUC3OtfKMhgKnDcXa/xR119ai6u
 1IrlVwbyx6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSiwAKCRD6PaqMvJYe
 9YfiD/4p6W9i3/OfJZSuRwyyue3of3X7ohj83TUPIqsJb3/argKyg0Df+0H0Uv9hokKXC9oUPgU
 a3PufR1+sZOPrc/2yt7qncpHTTl4sFG8ldRq8fQojuMnxt5chFIHLh7lyZhAso255jrJ/rkksvS
 LY3e0qGxuzDhX8V6EbCf4wHYRLrQH1dLYNQ4eqAfKeNeIiemTWKiTl6rZ/du3WKlpnLgoZ81ta4
 QmsDRreXrTd8rXS23oPIXrEzZ9Dr69YAu6zlBd0rasv25QgtjLjMXhpd+J6dg4GDinOgBVTSexM
 zCnr3b/QLiaWWvPyULyqQhSbSDn4V680exPM7PAAsVWj56LCPnR84V4i3zDf5cz/nWr6sG+paKE
 k8+WoeeAu/TDuYZTYhwjEk86N3RCmog+21dLmAnG9i1tpJshoVo5xYvJpPDv4bV+I8EGEEJbdbV
 CTCetFg2gAH+kYl/DUjRVY4ogCDFVrXm6UVx3Tc7CplJRK/DU665vil464/LBki0XFnGrycAUF3
 kEYolsVbxFy8FVkUdrlWB2S/U63voELUqqf5NRwE0zAvqumwPlFFRefR8+bF/QZOvTh77m3urL5
 VMKZpk1998vGBxcJb22PSnNkyA9jejGHkJnmbkBxTnMXjoxbpZJrD15SyuQ+2nTbS5IgEM3hAwB
 EvCV6N4Ub4kzkTw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014718_609930_9A5083A2 
X-CRM114-Status: GOOD (  12.51  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


