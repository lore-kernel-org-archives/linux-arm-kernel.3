Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A6CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 09:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prGrXc3O+qczp5QnOBOdbAPxQxwuSuLhRnMQhCRuU48=; b=LXVnM1RwfaDavG8j6xG/8FWUIA
	p9FPeHtIOFadMga6qDZf3HhkUDDdpwAi8l8t5AuzpSOozbLFCdv9mJCgDN/VSzs+ppIX6tPgXBCoi
	GCQIYXYV+gZ7jD7n7Z3VT8kDkx6vbTMmGGpZgPzxFNWeVMgpBMyyJ+/6zFnjBVbpj/6y5AH+EoAiG
	MK5mQqtYAW893f7GC5T5LaEgscDqUDUU5dfndX4XX7Coj2nfed9koJ3SA8FS1W/MtR+D0Fcax6txG
	z/176k6/qrFmzgOIlITL3gOR7SkN2/mUmdeSeQn0FfP9aViZYirW7ieJHCU+Y0sJe6Xr+xIS5B9iM
	ZFPv6L2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gQ0-00000007BjW-3a37;
	Fri, 17 Oct 2025 09:06:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gPy-00000007BiE-2o04;
	Fri, 17 Oct 2025 09:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C2C2604C5;
	Fri, 17 Oct 2025 09:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE77C4CEFE;
	Fri, 17 Oct 2025 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760691993;
	bh=2hoee5aUofQ7RDJJ+SoAmMAvRdZk3eVJOdj3z3fu1/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OMWddH23pCXxhbNHfOj+eV/wTAMH99uI99paDSSb3TCii7/NLqlu5kx82WqMpH7AO
	 KcK82avV1g6WC3M1+EOVDCBOiFIcAAOml6sPnYMHNijs9rsRg5XGiY4+1/cRDul9UW
	 Dtv4iZTUewXV/kS1NbsME0nPDZIPro6yK/zhnYDzxChqF5wSRpuhHtL5WLMxrJ9weL
	 AO3ci9RF+LAp9qq37W6G9sZlw0YyQ+Q0hrCn05rBXlyWmoiQK5XDUPzkJiK0wsCbZq
	 vsBVPTBUlUlaDd4J6ISNlKKbuzSeEqqCE0ZX6J9fTYrvVmzETSvF6E1+QruymFFr4L
	 GepxnjS5qNkug==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Oct 2025 11:06:10 +0200
Subject: [PATCH net-next v3 01/13] dt-bindings: net: airoha: Add AN7583
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-an7583-eth-support-v3-1-f28319666667@kernel.org>
References: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
In-Reply-To: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
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
 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index 6d22131ac2f9e28390b9e785ce33e8d983eafd0f..fbe2ddcdd909cb3d853a4ab9e9fec4af1d096c52 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - airoha,en7581-eth
+      - airoha,an7583-eth
 
   reg:
     items:
@@ -44,6 +45,7 @@ properties:
       - description: PDMA irq
 
   resets:
+    minItems: 7
     maxItems: 8
 
   reset-names:
@@ -54,8 +56,9 @@ properties:
       - const: xsi-mac
       - const: hsi0-mac
       - const: hsi1-mac
-      - const: hsi-mac
+      - enum: [ hsi-mac, xfp-mac ]
       - const: xfp-mac
+    minItems: 7
 
   memory-region:
     items:
@@ -81,6 +84,36 @@ properties:
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
+
+        reset-names:
+          minItems: 8
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
+          maxItems: 7
+
+        reset-names:
+          maxItems: 7
+
 patternProperties:
   "^ethernet@[1-4]$":
     type: object

-- 
2.51.0


