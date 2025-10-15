Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5824FCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjwkqKUm+XBdz/nekgjXDwIwPLOIOz076Vy7wT06j38=; b=flQCMzyPzDWwKHe0LzxXA9j/Ir
	US6CEtt7QctqI3vYqfsiBTqQBdDd5S05cPITYLeTeTf7N/d+mC87/VMde5B5oe0rePFGG1hxTSaTp
	g8PCEiFCHOoGa5VAMQ3z4f115KSWk75OUaoplYhoMUfbC1MPyiqJNmgD0WgOuie8BPafIrxIl+0kg
	9avV8PGD68cHnwBofr+L4qZPCqDkMc4eFpQXXYX/+GhNqRLBtSiXjx+DrWs2Ed3GQLH/1YGkkzojC
	8Bh1KwxagBQXDFF1rGAldvqrQUzAnbmh+UCCeheAz8ueJcJSwxbHrn2khuPtNvVGG3X9i2GOvBhWh
	NHylsnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjU-00000000gNn-1eCt;
	Wed, 15 Oct 2025 07:15:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjR-00000000gLg-1SWL;
	Wed, 15 Oct 2025 07:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D07844924C;
	Wed, 15 Oct 2025 07:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4D8C4CEF8;
	Wed, 15 Oct 2025 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512532;
	bh=m9aUxWoOvf6KxhNOwsEC/YLVISuan8Zpc3IMwKpcPLg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q0dNwlcbwLeRfQbHmwNUQuOVIEz0SSc3fW19SV0NNPH2zBaRq3+zOXcQK7UfMvyCK
	 cKObj1tMVXU1k9bk7EpcS1C30UFPDW8lsKuMt9B7rQiCnwA+eizME5MCpMRnEh1Fda
	 rxXuk+Hqi2pYnb2l5UUI8g/hG8rZiMRUvkr/XHLzsNMSyoK4G2E0ktd/D5PqgcgaRD
	 E6Ye0jn79yMVYMkZIyjiTiMWQMNPCBvdBFNNvJzcFjT9gxgl9kNxqA9NkaOtmLfPzD
	 i77Jsz7KYi8ASHaCp4GtPDgtMZ2k+s/fpNzkB6o+ZVTaeP8/LSqVEqVAX8F0bs/TbQ
	 yf5jQNQx5Rhcg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:01 +0200
Subject: [PATCH net-next 01/12] dt-bindings: net: airoha: Add AN7583
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-1-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_001533_432938_7E48E9BD 
X-CRM114-Status: UNSURE (   8.53  )
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


