Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE81C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VD2sPh7NhASrhwrHoc6BkZAF4tLyjdiTwxw7OnY08i0=; b=tu2POhC501wscPIJlVbcUubHEF
	EqbkOMOSPoZe88RVsdfCPXGI+sNnVIZoeBbRejQUpTNZ5HfeeQ6TNwSd9TveiRx2Gf4+n6gqaQ2dN
	4+Y7Mr71PKlHNyrjOmB9xF/StUXb4soxCx/1qwc0dI5wRYHuHkx1cvkDDww70SI8hWWuA6Fy0SR39
	nV2YYBv7D8Um8nDfYHHmUuiGdyTDk5G/95afgSucbPnUQXpspVoY5aOT1e1uyOYWdDqycWyy55Jin
	kS0Cq3RfAHSDJzd9HkOo8cSTsF2S2L5NrPta9WDWUfcauPsCkzuf1Z9A7Qi0L3JmSUs6+2YbhG6Jc
	Xrr7/vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtrC-0000000Cnuf-43tp;
	Thu, 26 Jun 2025 21:10:06 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsTU-0000000CcEQ-2i7P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:41:33 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 63F4E25AFA;
	Thu, 26 Jun 2025 21:41:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnEja1qB4Et0; Thu, 26 Jun 2025 21:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966890; bh=H8pHmtJhKvCu7fZ5/7YHY1g192cqpSliEgZa4tl8geA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e/5q7fki7A42uIFYthIewv9iyjE1RgWHJPmGukfftjco8fGxWl2Gd/a7XUnmi+HKb
	 hBsX+za+yAO983nS2qHkS+m1cuq6aHn48OqnKshJ7UUDer39svADAKORK//+zrViXx
	 pTn2z/A5y/nrY3LDaYpCeLx3+HvnpJ2YvoHiV5edQnJQvDSAPemJXz5R+mdt2gy+67
	 bZEDp4k8O0EuwvFUjNDHHS+V238uwkYlfoVm0nXUlK6eJA01mg9Eitkyzkvq3vmsol
	 kGq9qD6yvcjg93mEabJHkAurIFsxBF17BpX5Zg/9N6CDFiE1V6tc62ujDzkBbva6/Z
	 thqZEsaeK1xQg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:09:00 +0530
Subject: [PATCH v2 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=1737;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=H8pHmtJhKvCu7fZ5/7YHY1g192cqpSliEgZa4tl8geA=;
 b=OaXjaLdr1Bcq92HtOib5JAJE9K+vzrQX882KqIGdIm792/fzivVyPndNPR/JbHCYYnO5Fje70
 qkgyw7uBIKfBXEBKgsUnxRLQ+6ZaD+d11QRtzNn/SEYPDutEaOBobxh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_124132_820743_AA1D830C 
X-CRM114-Status: UNSURE (   7.84  )
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

Add compatible string for Exynos7870 DSIM bridge controller. The
device requires four clock sources, in schema they're named as "bus",
"pll", "byte", and "esc".

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/bridge/samsung,mipi-dsim.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 1acad99f396527192b6853f0096cfb8ae5669e6b..ad279f0993fa108b312126b112174f10f2b8c3d0 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos5410-mipi-dsi
           - samsung,exynos5422-mipi-dsi
           - samsung,exynos5433-mipi-dsi
+          - samsung,exynos7870-mipi-dsi
           - fsl,imx8mm-mipi-dsim
           - fsl,imx8mp-mipi-dsim
       - items:
@@ -144,6 +145,32 @@ required:
 
 allOf:
   - $ref: ../dsi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+
+        clock-names:
+          items:
+            - const: bus
+            - const: pll
+            - const: byte
+            - const: esc
+
+        ports:
+          required:
+            - port@0
+
+      required:
+        - ports
+
   - if:
       properties:
         compatible:

-- 
2.49.0


