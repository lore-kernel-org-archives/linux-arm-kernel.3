Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7EACD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqX2C5wfhzexgQUg/cq3E9vWCHTFhjwN3Mz3gTbuKkw=; b=OlrZDCd/0fiqRPOUT1vuCHhbQh
	3YrSfdkZM2eMCiQ/EIng79HryZknUx5Z3R4v2S+uH+JrNCnbPNLa2eplbpwWk7EpZnrAyYAx/b2IX
	brTBnDuXL7PcDOHT2wYq8zWsz1olODe3QMV9s4VYXEtSrcD2xdG5/J9Glcr54nIgRYDsHt8dLgyA4
	D7FaT77ghUXyKUI446ybEyxXsFU/9Q0ifuoGPDbtr0Bx4MiuRCE1M7+HyEVpCHgxR1bIG+CDbflxf
	PGJapmrs12ggd+s6p5rhlEBh+Vh/zUJLdIx6uLF99ZTkQ7iVQ918yq2B86wui2jYoWbv6e8Cd6BeH
	msqbX0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmtB-0000000GyFf-3uMs;
	Wed, 17 Jun 2026 09:48:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmt5-0000000Gy98-1uFG;
	Wed, 17 Jun 2026 09:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92D84600BB;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C4DBC4AF0E;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781689726;
	bh=zFvl4Bm+w43Fh1hqZePVVwkkd5clpVJO6s5c2cfPsoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n6nu/QTrFbDixJ6t4BSetHEqy7JOgnXWeldUhMDYGBdpQVPTylfgas13vQ8ZVRUGi
	 j3LujmNE5xJD4FTWDCSSl0Odp1Qk5mWch3EWsCS71UlRlFZxBuvNu7c9KSZsbYus4t
	 MFJVYJ6obaBIjsnDqZJQadsFXkpZlORTdvQvJggCFAEaVOTt6Tv5lrhpmbk4p2g/pi
	 vojxIyc/Ep6bG1bseX8PZQia4BCtoWbIi1bs3kYuElD+uKKS1+UwBPbgPF//KQ9t6O
	 x3t1B1OL0HUMKT+7TQ5pFoQlKSE1t0cBeXn4t2rW3zP6wcWHTF+ZIOtVBDg/wbQwD9
	 jM2NHXdkDbzbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F22CD98F1;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 17 Jun 2026 12:48:44 +0300
Subject: [PATCH v2 1/4] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC
 EFUSE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt6323-nvmem-v2-1-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
In-Reply-To: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781689724; l=1581;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=Y+qEH2u8RG69hEOj/2KlmQR+9sv6DjCcWKs/dnalb3U=;
 b=ovxSxVODW40H2iPH+WfzrBUbjzVxRv3qqbqJzqsMFcxS6Ib0+q1bJsCXPjI6nBJBU4GbThIso
 rJyeQWkbEY9Ag5DMC7jnoNC4q4V16jxMlTzQs0cGI2jO4Mt/u6lJG07
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The MediaTek mt6323 PMIC includes an EFUSE used for storing calibration
data.

Add the devicetree binding documentation for the MediaTek mt6323 EFUSE.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..beaa67bf0df2 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -145,6 +145,23 @@ properties:
     required:
       - compatible
 
+  efuse:
+    type: object
+    unevaluatedProperties: false
+    description:
+      The efuse is responsible for storing calibration data, such as thermal
+      sensor calibration.
+
+    properties:
+      compatible:
+        const: mediatek,mt6323-efuse
+
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+
+    required:
+      - compatible
+
   leds:
     type: object
     additionalProperties: false
@@ -243,6 +260,10 @@ examples:
         interrupt-controller;
         #interrupt-cells = <2>;
 
+        efuse {
+          compatible = "mediatek,mt6323-efuse";
+        };
+
         leds {
             compatible = "mediatek,mt6323-led";
             #address-cells = <1>;

-- 
2.54.0



