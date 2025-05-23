Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E1C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4krM79518bzUxfgR5X74Ve7/KlQrTTtgONTkMxiiZk=; b=2kiABjh1FQwFWD0mwavvxoNseV
	Gd7CohjVJa3FFx106cyGo00rNg1faBUnlux1GdhlDb9LvIivcgcrT7pyxjZgA1TBO++z2/2KVIq4R
	+8Y9fiW3n72kQb9+k/jiuFU4ELQzxlCPo5drmgzFeS7lTynXOmzQLu3/PPrrvxVu7MmX0+kk9QZMt
	LsVIMBZOKhhcQ6u8XZ8dYcbbUcOlf0RsfSawEB2aj8i80QVVFraKsFLUfuKEKDsUI4RNEeUXo6iz2
	Nm9pgfFGIyRmZvAvRx3WGinoQSexT3Sq1kQ94a93MZFB1sDncmmV5K9D6C9VXu9B3goYCdQJMSo/E
	zK2Y7Rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS5p-00000003ttm-20pL;
	Fri, 23 May 2025 13:05:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRsc-00000003rL6-0WiW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E90A4AA90;
	Fri, 23 May 2025 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3201C4CEF4;
	Fri, 23 May 2025 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004725;
	bh=NveI/c5xQaxOP/723CwcVzN8aFWHOag/eGc7TuodKC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TXnmkCKz9hGSfTZovLeW2UjOICio8LoJ6TTxFV7e/3mhMKar9XQLj+eP0ADCF7C7t
	 BnFbyWRaRA5ffbqZ2lKd9HtyudivcnB/a2W/0E1qQLp6tlkYItl7R8kYDLHl5SHZ41
	 khU/8/gjRY7k3onKkhAoPCBG5t7pJNHdclvFmTIoaFKMMHPDuWwMC0rbcSkHaDeNnP
	 eWMx3T6IfqvcO/DYS0rdJlojh80nwk+fB545yYKou7wPK/8zVgVeRGj7iNsKbmTREP
	 zValZAlmoZfBf30yGsLC1PYwZ02qjOJMn67Fa5hB0wCVHdMXzQdepdw3Fg/WFXPP8q
	 SCfqVOFC5c+xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5447C54F30;
	Fri, 23 May 2025 12:52:04 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Fri, 23 May 2025 14:51:46 +0200
Subject: [PATCH v4 3/5] dt-bindings: power: supply: add max77759-fg flavor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-gs101_max77759_fg-v4-3-b49904e35a34@uclouvain.be>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748004727; l=2682;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=GU2WoKOxlaWJoWfEaZr2bJ8lw3s+AOWQv0h8uwcwC90=;
 b=1zMV5uiw+xStEJWY23TLxuRPfW60BpaXrb6tMzTSEz/FqhcXCpWyL8y858ymE4+QoyVLSt7Fu
 iIKgAx0Q2TYCrw1JC4VQmzIV0StD/KwzRrwQOyp3yvofsr+hC59GTRu
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_055206_210619_58860B7E 
X-CRM114-Status: GOOD (  13.63  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

The Maxim MAX77759 is an IC used to manage the power supply of the battery
and the USB-C. Based on drivers from google, it contains at least a PMIC,
a fuel gauge, a TCPCI and a charger.

Use max77759-fg compatible to avoid conflict with drivers for other
functions.

The Maxim MAX77759 has no non-volatile memory so it doesn't require an
address and instead requires a value for the current sensing resistor.

Keep shunt-resistor-micro-ohms optional for the MAX17201/MAX17205 as it is
not be used at the moment but could be in the future. (e.g. as a default
value to be used in case of nvmem failure)

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 .../bindings/power/supply/maxim,max17201.yaml      | 42 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
index fe3dd9bd5585618e45220c51023391a5b21acfd2..2fb826b4b160eb9abe6604185ac2192447d90b8c 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
@@ -9,13 +9,11 @@ title: Maxim MAX17201 fuel gauge
 maintainers:
   - Dimitri Fedrau <dima.fedrau@gmail.com>
 
-allOf:
-  - $ref: power-supply.yaml#
-
 properties:
   compatible:
     oneOf:
       - const: maxim,max17201
+      - const: maxim,max77759-fg
       - items:
           - enum:
               - maxim,max17205
@@ -25,11 +23,18 @@ properties:
     items:
       - description: ModelGauge m5 registers
       - description: Nonvolatile registers
+    minItems: 1
+    maxItems: 2
 
   reg-names:
     items:
       - const: m5
       - const: nvmem
+    minItems: 1
+    maxItems: 2
+
+  shunt-resistor-micro-ohms:
+    description: The value of current sense resistor in microohms.
 
   interrupts:
     maxItems: 1
@@ -39,6 +44,37 @@ required:
   - reg
   - reg-names
 
+allOf:
+  - $ref: power-supply.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max17201
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max77759-fg
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+      required:
+        - shunt-resistor-micro-ohms
+
 unevaluatedProperties: false
 
 examples:

-- 
2.49.0



