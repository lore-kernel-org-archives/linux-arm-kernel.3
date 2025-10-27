Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E03CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/sBYEp4tLD1MzxeRn+bdb0qt3nel923yJvH5TFpwpc=; b=aXiy7RGvR4MaqWKkwqdFo/X33T
	+jUG4Vhn3lYnNEtfRJ22HKhkY/8ccRnO1Ro5+034qJ6yE5iaAJgZByr8EDIO/A+UJRt+059slhEIS
	L0oHQpYHkxrNz6H+IjuSuTP+F2w23tgaINOwX3Pk+MGzi6IPGGdCYx5lq9ybjgLv8MJQ6odQ4ZAS2
	UcciizulvFVeqB+qmO9cqOxDNUaH07i4PJE3HJvtq4V3PS7gacXhRC/ua01BszMDcnWkUaO7Ny89q
	Y2baIia84LP/PsPRFhbWVfz5dXUqP3qOZ4ba+kvLUxgrfBzQK/zFJMoRcaoYMVOKanFptd/DMc5aI
	ZhbxO4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmf-0000000Dx2f-1NfD;
	Mon, 27 Oct 2025 12:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmZ-0000000Dwye-2Swr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=y/sBYEp4tLD1MzxeRn+bdb0qt3nel923yJvH5TFpwpc=; b=kp1hktaYUy27DHnZRUSqR/7/aE
	QrFNngc3YxmJYFTTLBnzvXIPXgveQnkA8r51H2iMP6x1ymVMX+jJWM3wZBZJ3Hu7qCI0AdoETqaz2
	VXeIxA7MI6USAmLFt32eOEaUw7yWOJI37eKT+MtzEKaWTqV3GnJBvGEea7TVSdNiTghjbH2rY+5Mc
	W+8EEPZf3SBjYqGy8tZrWxGrHM/d4Rc5X5O88MDNnNvctlchYCpelgpXM6xKgnuh1MrXsXlV3DvQF
	EHbWKqw0WUhb50YbtnYcymhSMc450d0kI6IHsmzkfb9gejUbU2m0yTddKFunAyeJYcuH6CP52VCwD
	ZTpwuOug==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLul-0000000270R-0qo2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3182459B0;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F34C16AAE;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569819;
	bh=tZng3pvLf5NVIYjrv5Cdlkb3kjII1JMSXNhC/Cdf7Og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/brPLd27LQxkag5GvBdnPPh7bFVokQlJWK6AREvtkOXp7m0Ter+XyZTQafVICWIL
	 XNX5HD29gmuENvJOFkRAgzO8W8T5Wx7bBHckFOOaw0cU+f2qwGBMWKLmuxrmJOQ+DZ
	 IhcY1MQaGv+x7kE6ys2jMpKouNNg/GOKrYDpWWQqVc6YN9pFkGke5Hs4+Hn9Gqwj+g
	 1gCSFNx7NPhZ3+vZFRHiuw1KOTbP+8JdtiXQgxe0zCCsuZ0YRx1cnoGkBWlz252F7q
	 zuciNLynCA+ngLHjDc9AKQa5SdAeUEZq5kbHMhur97m7r4LaqVUYRE6CTowG1o/QiK
	 uY7FEv03zbb9g==
Received: by wens.tw (Postfix, from userid 1000)
	id 8455C5FEEE; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 03/10] ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add compatible for A523
Date: Mon, 27 Oct 2025 20:56:44 +0800
Message-ID: <20251027125655.793277-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120131_584558_BB031DC2 
X-CRM114-Status: GOOD (  11.09  )
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

The SPDIF hardware block in the A523 SoC has the same layout as the
H616 for the transmitter side. However unlike previous generations,
the hardware block now takes separate module clocks for the TX and RX
sides. This presumably allows the hardware to send and receive audio
streams at different sample rates. The new hardware also gained RX
insertion detection, and some extra information registers.

Add a new compatible for it without any fallbacks.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../sound/allwinner,sun4i-a10-spdif.yaml      | 44 ++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
index aa32dc950e72..1d089ba70f45 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun8i-h3-spdif
       - const: allwinner,sun50i-h6-spdif
       - const: allwinner,sun50i-h616-spdif
+      - const: allwinner,sun55i-a523-spdif
       - items:
           - const: allwinner,sun8i-a83t-spdif
           - const: allwinner,sun8i-h3-spdif
@@ -37,14 +38,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    items:
-      - const: apb
-      - const: spdif
+    minItems: 2
+    maxItems: 3
 
   # Even though it only applies to subschemas under the conditionals,
   # not listing them here will trigger a warning because of the
@@ -65,6 +64,7 @@ allOf:
               - allwinner,sun8i-h3-spdif
               - allwinner,sun50i-h6-spdif
               - allwinner,sun50i-h616-spdif
+              - allwinner,sun55i-a523-spdif
 
     then:
       required:
@@ -98,6 +98,38 @@ allOf:
             - const: rx
             - const: tx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-spdif
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: TX Clock
+            - description: RX Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: tx
+            - const: rx
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: spdif
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.47.3


