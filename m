Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF5DC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ePTA8pgF790OhWjhPzybza21Jju8yXqqcRjJYT8EJ0=; b=uev49MtnuQPwVYbf17vD8Z74EE
	Xghxns+Elu5Edt1MoNATAkM7ylGT+M30KY5TIMYFUuUPYSnva77oE5UV9hx4+WBOIGmR8Qcvz3dfw
	P8cwho7j24VJ6n0klDyVJ17X7Co5BGvIAddR8gxz3hTa3H3luDyODx6D0uNFZ/zYTca6gvlcWe5ct
	W1DBMT/xZUEGGPq+zA2sfXMpm/agthpso7X54CMVKpJpoFDQhG1U51Ob6gejEiy4/iQyt6i9TGFNs
	fZ7j40qfvbFQxpkUjORELKSLEXdo7rAeu6hOONYxpXp7fZJgV5NVXQwXZbq0r/DIsoWQ7kCK6Cufu
	FjVt7fMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulMn-000000021YS-0zeC;
	Fri, 14 Aug 2026 06:26:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulMl-000000021Xo-0Te3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B7DD44F94;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D865C2BCF7;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786688766;
	bh=jEcPzTS2r9CRkRuHf/bP0CLeDxdimN8/GXo8Hz0PSGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cluIIJKXuqBHZ52WdgHTuM7n2Y6Q10Fdb/oPdUxiAD/FDMi2lX0ibkR++omcjK1Dw
	 6c8t/rtEUoBHy4WtbuqyBOTIsNH99sverFbOtSyeJXqkkf8FExz0n9DJeBkT7E+am3
	 h5o1EyimxGqRJJUlyrs2tLlo707xsJxD4kQT50ZoxJYOk5hX9FERv7bydwT6BPSYBY
	 aeqWrEIin2psXYWaahYqxxw34DYvW5IKqjRVxIGfMKXJB7GkvfGOvGVJMwgFjRbFSf
	 eoXpFmEJhsi12tXJGGInuF+O3M3gB4XOmII283fEr1NOJflpMmtyA7AncyIsvxxOG+
	 vt9kUnXZJA/iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00242C5CFDB;
	Fri, 14 Aug 2026 06:26:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 14 Aug 2026 14:25:42 +0800
Subject: [PATCH v4 2/4] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-cv75-v4-b-v4-2-ef2e83ec0eac@ambarella.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
In-Reply-To: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786688764; l=1941;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=Pngr7p+U3E/qWLbm7iUMOUjiAHv8IZUzMpz2/ZKNyVk=;
 b=9gDEX+Je0r5Q2wLy6qzP4LRjhNA9Jm5Y17qdFenFRkBmS6C5TEkdv4mfj5//eQwNfdo1gNbZe
 AnDzcY4Zc+QAdoBtRImv+Xgcd58ndHF2UNlNVE1ZGjknMdPprU8pm+l
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Document the Ambarella CV75 GPIO bank compatible and the synthetic
arm,primecell-periphid used with the PL061 binding.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/gpio/pl061-gpio.yaml       | 35 +++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 4d970e55104b..414f8d4a3976 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -15,7 +15,9 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,pl061
+        enum:
+          - arm,pl061
+          - ambarella,cv75-gpio
   required:
     - compatible
 
@@ -24,9 +26,20 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    items:
-      - const: arm,pl061
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,pl061
+          - const: arm,primecell
+      - items:
+          - const: ambarella,cv75-gpio
+          - const: arm,primecell
+
+  arm,primecell-periphid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value to override the hardware PrimeCell peripheral ID. Ambarella
+      variants use a synthetic ID retaining the PL061 part number because
+      the hardware has no discoverable ID or assigned designer ID.
 
   reg:
     maxItems: 1
@@ -57,6 +70,20 @@ properties:
     minItems: 1
     maxItems: 8
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ambarella,cv75-gpio
+    then:
+      properties:
+        arm,primecell-periphid:
+          const: 0x00000061
+      required:
+        - arm,primecell-periphid
+        - gpio-ranges
+
 required:
   - compatible
   - reg

-- 
2.34.1



