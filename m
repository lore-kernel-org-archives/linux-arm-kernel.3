Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD2CCD19E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjwkqKUm+XBdz/nekgjXDwIwPLOIOz076Vy7wT06j38=; b=zfArLPpg8QpzkaTN63XiWYfqFr
	Ay7So3K2RehkvILBOcbyBC1vM+jWWunmWJyDLGw73/2B3ZEqbQCl81lEyWoDmixAEHC8FgmCUTjyN
	LWwDsA8oyEz23ifSdXg5yugj+37FhJEzUYiyGftGjBf+mLkSKi1IoaXtrTlgLvQQC7tfFvPLVmA0v
	5aUZ5Va3opSJPMglj/ug2IMkxB2zCuvglsAc1yYLQeqx7AhWnhzwbv0cM6dNF7upernp/bNwlbNI7
	jWWcQIYek5zJ1Cniw9agQ+mv/QrO0CG/X4esr5mh/FlPCcTTRsIaabaXpQaNY4uSZkq7lCGtO7ccN
	39lIPsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LDw-00000004Pky-2PaB;
	Thu, 16 Oct 2025 10:28:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LDt-00000004Pj7-1eB7;
	Thu, 16 Oct 2025 10:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1756603CC;
	Thu, 16 Oct 2025 10:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DFDC113D0;
	Thu, 16 Oct 2025 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610520;
	bh=m9aUxWoOvf6KxhNOwsEC/YLVISuan8Zpc3IMwKpcPLg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ikJcBWLvDvcIZzbgK5g2pRk8QrztkorF6iYeFB4oLNBIEDRBFANuBsZMdhd8nr90K
	 Vot59Wg1qkjzOvbRy0XrpLMR9Kxm8QzITFyvqj5wH/ZAORSC9zot3qTNShiAxAOnGH
	 PIG3l4EA8cAZbxs9sdCl9M1CAEa9XdU47pWABugviZqTXZKyozOfZaL9brqb+dsfqh
	 GLeUz93U8aYH48qfGcloL8TDaOlseTujhI0yKvj4SngCj4uXnrN52HYC3tdqded07c
	 DjPGd98KJc22uBtlO/4Dk3DIy7ux82iErEK+IucQzg0VWCA+yV5bGrsaWkDocnvaGa
	 7TDD3RDAJN6mQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:15 +0200
Subject: [PATCH net-next v2 01/13] dt-bindings: net: airoha: Add AN7583
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-1-ea6e7e9acbdb@kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
In-Reply-To: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Introduce AN7583 ethernet controller support to Airoha EN7581
device-tree bindings. The main difference between EN7581 and AN7583 is
the number of reset lines required by the controller (AN7583 does not
require hsi-mac).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 60 ++++++++++++++++++----
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index 6d22131ac2f9e28390b9e785ce33e8d983eafd0f..7b258949a76d5c603a8e66e181895c4a4ae95db8 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - airoha,en7581-eth
+      - airoha,an7583-eth
 
   reg:
     items:
@@ -44,18 +45,12 @@ properties:
       - description: PDMA irq
 
   resets:
+    minItems: 7
     maxItems: 8
 
   reset-names:
-    items:
-      - const: fe
-      - const: pdma
-      - const: qdma
-      - const: xsi-mac
-      - const: hsi0-mac
-      - const: hsi1-mac
-      - const: hsi-mac
-      - const: xfp-mac
+    minItems: 7
+    maxItems: 8
 
   memory-region:
     items:
@@ -81,6 +76,53 @@ properties:
       interface to implement hardware flow offloading programming Packet
       Processor Engine (PPE) flow table.
 
+allOf:
+  - $ref: ethernet-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - airoha,en7581-eth
+    then:
+      properties:
+        resets:
+          minItems: 8
+          maxItems: 8
+
+        reset-names:
+          items:
+            - const: fe
+            - const: pdma
+            - const: qdma
+            - const: xsi-mac
+            - const: hsi0-mac
+            - const: hsi1-mac
+            - const: hsi-mac
+            - const: xfp-mac
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - airoha,an7583-eth
+    then:
+      properties:
+        resets:
+          minItems: 7
+          maxItems: 7
+
+        reset-names:
+          items:
+            - const: fe
+            - const: pdma
+            - const: qdma
+            - const: xsi-mac
+            - const: hsi0-mac
+            - const: hsi1-mac
+            - const: xfp-mac
+
 patternProperties:
   "^ethernet@[1-4]$":
     type: object

-- 
2.51.0


