Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4E4CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98yB+0gyGOSCB+Bdmx9Dqtr4n8UbmIopJfptfsY33XQ=; b=n9xw7RmUst89TPg0RO+MUSzN1O
	dRDKGxgrIgSn3AYcrtPapW137SQwVH/SmfjWo+F4GapfPuE06wRU9MLyAhPWG8j2JMxD4Laob2/99
	5262MQMVhlEeEWevQyc7FtWxgu8N0l6vJB8dQTwE+rre/EXFFTmZMyx0soHYqm24K2dhHTeQu83lH
	dTS7w3/yjmcu78whOJCSKnDn8EbhvAotL34gidp+2KRz09qfDtdj/0KyClJq2gXkPVUSQH1Em/G3B
	USxdGUL6uE2CDbwB7OhXlR9KHl2eEL86rziQno07vQOvqAjewL1DQTMUDqKAGo2bXVidfzbuJjp0Q
	6QvKgWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQE-0000000EQwf-3Sny;
	Mon, 20 Oct 2025 17:11:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ6-0000000EQqH-2Qqj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=98yB+0gyGOSCB+Bdmx9Dqtr4n8UbmIopJfptfsY33XQ=; b=Z13ahFCUHxz1Jl1t3vUmWjtCMR
	+9ESvrmWS5caXaCtcIPYfO7m05uMnCF8mwzf7QUsYyPgufi19L7QgJSQ8SOQxRJGa/TGvqAvDPr00
	VzBBytxNoHlFq49d7aCQ0YXbQkFVTefwRIqQaSrCVWjb9F54nP5YOb7ddsS0YUeCLS3R6iNlhFaPf
	ij9DeCAiUXpVFylQTMwM9EVQZF+C864tmdobqAUWU5KH6OTn1aiyPIvmNXfrY+2yNucPVnzwRMMPV
	YwtL57/Zmv+2zVAm9kRK0kbgSDLf1pF3oF0DFK4LLqAcVS/ZBnsrVckDPrsQ/rqqWKNVAoKiS637b
	3qPwa0Jw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYL-0000000025H-3cIV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9624848DD0;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4614BC4CEFE;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980280;
	bh=bfZTvPbJKxHOKhlO78loZoETiX7+tlInaGSPp76tZcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLckVGJ5tDHhW7IotJ9DZCXI7B/SYprw7XvmrT3wvjQCMu7z2uoptGX1kX4mFqP37
	 KIyemA8gOhpgtNjQhxd3daeWK16mFZVDorTEaUIn4TeH0q/CQWwo2r7g6wxUSf1ST0
	 TZetVf80aXNAUs+KzDujeHQDCjh6htC53i1jTP8YTTYF8EhHiBXZUpO/ITebx6xlUz
	 WRDYSatVJoUnYWPnFbJp+bnWryZLOfJC2YlrLR+luGgothpRNSDng9Naig3NUme0jP
	 DaQqe7aQ48s8oePQg21kcrkBCzYfQvRAY0DpD/k4JgGKHB6/0i06+rElKB/TdlOyAf
	 dEPcVO6kC5b0w==
Received: by wens.tw (Postfix, from userid 1000)
	id 3BFAC5FE31; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add compatible for A523
Date: Tue, 21 Oct 2025 01:10:49 +0800
Message-ID: <20251020171059.2786070-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171610_240505_F5A8E88D 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The SPDIF hardware block in the A523 SoC has the same layout as the
H616 for the transmitter side. However unlike previous generations,
the hardware block now takes separate module clocks for the TX and RX
sides. This presumably allows the hardware to send and receive audio
streams at different sample rates. The new hardware also gained RX
insertion detection, and some extra information registers.

Add a new compatible for it without any fallbacks.

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


