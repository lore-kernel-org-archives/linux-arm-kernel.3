Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7311CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sHbyVVVphEP21Gb1FWUwdcoubWd7dsPOQRT2FxUz/g=; b=OGIQ7cADHuuul/AZcsg1MvJDRu
	1k8mjKwefo0W7cIX2GzLy466j5qXiQj8siiAU+cZBx7+dHVrW3RX6hM5dC8N1mCrZ5neex2++hxKB
	KZwZrT/2DJwwLYr3LPOyztNGlbYShuBAJytvfxQYY6xWUMfbkS9RDfWv+IHv+iWkf+heJ9vREYQVd
	JvfTCKvLx0UR5sKwPtgkR9iWFF22T5BQt0WsDZL4jMiXlfeciX2HeNzdFbIntnb5Yw8cBPR88EXD/
	3Rf0UGGqxOP1LLr2xgKAKV5biMYKUhekgxHFAovNp8e0VMDZRsFSPk6vSWQMmLMwCt5PJ0+0MC8RM
	p1/axzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJEp-0000000AEaF-3jO1;
	Thu, 02 Jan 2025 11:19:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJBN-0000000AE4e-2d5i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 236435C5B86;
	Thu,  2 Jan 2025 11:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D035AC4CEE0;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735816563;
	bh=YR3aOQfQRpjZeAPGaopQcbBOCXaW1wkvfZuiJhh9ZRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nwB82J1Pv2iNNTb2Af7IuogSNLkCde2a3t0qaAzS97CdDpXBqitQiDKZ1AV1o2hZ7
	 mbyzLeyQeB2TWP/VrsCWotg84pwCHlfJt2PpMlXIbfQhFrm0fsu9mf5gDe2jFG9Gef
	 LF34GIxYDDxKGA+R+zsuHU8omuWo/piJT/j/rLeQapr0KgUDOmNl1l0eHYMqF9rd2A
	 4/VtzP9Uq/4PQ64doNWVk4mWeB5CM8UxTVBhSEzGkZiAApGDInZ6W4dXf6Cjq+6JXx
	 87zvrIWvHHgMaOtyPWkHg09EOqFbouIdB2oef/i1gdt2uUc1pkp/iUBN11gapKvdtr
	 xiIJuV6M+pkaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD23FE77197;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Thu, 02 Jan 2025 12:15:04 +0100
Subject: [PATCH v2 2/4] dt-bindings: power: supply: add max77759-fg flavor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-gs101_max77759_fg-v2-2-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735816515; l=2599;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=NQEfG+SwFTGG+va2nEDX792ufRBYG0gtt35ac3EAHLY=;
 b=jM9VyggQ6eUW1RT5Sw+s3vgG3v7+G7XxjmfVHL2taeQU21fLP17pnVRrLZpT7NYIGIpDtxYrk
 OMqxPoSo6FqBEGjo0OnJe41tXf4Ii/jZK6JPj76xV1c1Vmui0kl7rNh
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_031605_915583_1D41152F 
X-CRM114-Status: GOOD (  11.48  )
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

The max77759 is an IC used to manage the power supply of the battery and
the USB-C. Based on drivers from google, it contains at least a PMIC, a
fuel gauge, a TCPCI and a charger.

Use max77759-fg compatible to avoid conflict with drivers for other
functions.

The max77759 has no non-volatile memory so it doesn't require an address
and instead requires a value for the current sensing resistor.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 .../bindings/power/supply/maxim,max17201.yaml      | 56 +++++++++++++++++-----
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
index fe3dd9bd5585618e45220c51023391a5b21acfd2..7e95314508c27d0d90ea92f61bca6b4a2fe0e88e 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
@@ -9,31 +9,61 @@ title: Maxim MAX17201 fuel gauge
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
           - const: maxim,max17201
 
-  reg:
-    items:
-      - description: ModelGauge m5 registers
-      - description: Nonvolatile registers
-
-  reg-names:
-    items:
-      - const: m5
-      - const: nvmem
-
   interrupts:
     maxItems: 1
 
+allOf:
+  - $ref: power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max17201
+    then:
+      properties:
+        reg:
+          items:
+            - description: ModelGauge m5 registers
+            - description: Nonvolatile registers
+          minItems: 1
+
+        reg-names:
+          items:
+            - const: m5
+            - const: nvmem
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max77759-fg
+    then:
+      properties:
+        reg:
+          items:
+            - description: ModelGauge m5 registers
+
+        reg-names:
+          items:
+            - const: m5
+
+        shunt-resistor-micro-ohms:
+          description: The value of current sense resistor.
+
+      required:
+        - shunt-resistor-micro-ohms
+
 required:
   - compatible
   - reg

-- 
2.47.1



