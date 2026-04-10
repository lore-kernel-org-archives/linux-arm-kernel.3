Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7858AF459FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhPG9ZCaxyMyXGcJyGP//q2qZiiMApBmDULuQhFz7A8=; b=1EVpKsM/tPZUBmEdLhK/ZQh0Pj
	VeufHmA2xZtw/YnllHil6KjAyc2/QzLnjuwLA7AhBw/xJGTZUWo0bKJr0lxQmx07dcJmzTcbyqsil
	GJkZMWBu2a67QS4ZyBYCBvppqImoMGoud+8M2c0k+Ag3XPZA+bkliuf5mVj5NzpkReKjUXOsUXAak
	WZmtN1x/mS0l5BVqA4OeyTJsN+R+93Bs6hNWLI6AnrZLiNCWtYWE5WNbUfy6O5gm4x8WtOwfa02hC
	T4HkSp8e+++IQlrr0eKHBSJVAsop0YEjC+xEy9jDDGJRA05PjoRQWtwAm93osusXWYbZ9OwCfNVOF
	cUr7MbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2b-0000000CYqO-3K0d;
	Fri, 10 Apr 2026 16:49:09 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2U-0000000CYky-0WOE;
	Fri, 10 Apr 2026 16:49:04 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775839733;
	bh=JnH9zOxJRNagemiQv9oYzRiv1ojhPKXvc6QjWfgg8M8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SCs982hejK1UFmNVnWr8K/Cbi6sBubCOwkRe+97Q0ApaylbdBtBf8rC7Gkn9X3Jjo
	 /lxvY38e3TlgjNq3HyjS7cBYBV171K9g36SJ8xzxIKlBrevwQgkiNfX0qwE868SZBI
	 OC3TD5CHkDkrlf1yQTgOn/mdwxpULIW/ObwTHcEE=
Date: Fri, 10 Apr 2026 18:48:02 +0200
Subject: [PATCH 1/8] dt-bindings: thermal: amlogic: Add support for T7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-thermal-t7-vim4-v1-1-19f2b8da74d7@aliel.fr>
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
In-Reply-To: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775839730; l=2587;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=JnH9zOxJRNagemiQv9oYzRiv1ojhPKXvc6QjWfgg8M8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIown5ndRspw9U+KORP1wl++iWagf/WHOEUwIGEnUXSIOxnigvlQa9Dxfaq2ppb6l2j+JeBWAwO
 W7lGJSZi92Qk=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_094902_375896_9CFD96E5 
X-CRM114-Status: UNSURE (   9.82  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the amlogic,t7-thermal compatible for the Amlogic T7 thermal sensor.

Unlike existing variants which use a phandle to the ao-secure syscon,
the T7 relies on a secure monitor interface described by a phandle and
a sensor index argument.

Introduce the amlogic,secure-monitor property as a phandle-array and
make amlogic,ao-secure or amlogic,secure-monitor conditionally required
depending on the compatible.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../bindings/thermal/amlogic,thermal.yaml          | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 70b273271754b..85ee73c6e1161 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -22,6 +22,7 @@ properties:
               - amlogic,g12a-ddr-thermal
           - const: amlogic,g12a-thermal
       - const: amlogic,a1-cpu-thermal
+      - const: amlogic,t7-thermal
 
   reg:
     maxItems: 1
@@ -42,12 +43,40 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  amlogic,secure-monitor:
+    description: phandle to the secure monitor
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the secure monitor
+          - description: sensor index
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - amlogic,ao-secure
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-cpu-thermal
+              - amlogic,g12a-ddr-thermal
+              - amlogic,a1-cpu-thermal
+    then:
+      required:
+        - amlogic,ao-secure
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-thermal
+    then:
+      required:
+        - amlogic,secure-monitor
 
 unevaluatedProperties: false
 
@@ -62,4 +91,13 @@ examples:
         #thermal-sensor-cells = <0>;
         amlogic,ao-secure = <&sec_AO>;
     };
+  - |
+    a73_tsensor: temperature-sensor@20000 {
+        compatible = "amlogic,t7-thermal";
+        reg = <0x0 0x20000 0x0 0x50>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clkc_periphs CLKID_TS>;
+        #thermal-sensor-cells = <0>;
+        amlogic,secure-monitor = <&sm 1>;
+    };
 ...

-- 
2.49.0


