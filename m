Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F89C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2LgVhlzhn0hDa1LGAfL3axU9ZN1DPMF0wnkzXXiYco=; b=jozlqk+k7ySP7Y70m+yNjC90fg
	0qZ5daJgjxNhsqMxC5D957g0TYr+LXFsaDkiAKBU78WcDfqpIu69Nl70e47IJGsghK6mQcy+FkYYQ
	7hmuX6XNgYITRPI5q5J0g7Q1uD+D2ZRyKyuqOI7yqLNmLaBocioag/b4IFOTZmiXUgzUpQpMv/uDE
	mMW8jrS9KmIA/SekhTaFmDtQE8/xah+tHZW2NpWpKLa9nsfOFO0ECCgMoVASfKGkKToSOuk+EFclb
	eNXIQ9GcCZE6zfbF471YSM78iegBo6vntwJbuYU3RNi8sPQOUXRByBlOBnkXBtxE8IHhR3y8jaQMq
	jIV7r4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUVj-00000000gLR-1rZi;
	Sun, 06 Jul 2025 18:54:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU5n-00000000dP8-3BRE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:28:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 90C4420E30;
	Sun,  6 Jul 2025 20:27:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBRF9vHUDJv3; Sun,  6 Jul 2025 20:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826477; bh=HC29jIb+LJXzNsT5n2KQRnRrUJPZnyBZMVkVyDKqBR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MmD5zOTlQUOxZePBVy0kXTSIMhhdYy7n6YIYdfviXEoXs23qo8YkIc8OC5AWaeMy8
	 zvJo6pJMcKdTUWc7Ss81LDO7odeCUSH4xq01Y9pRBIe22Dp8bI1zbFI6q4CFxFbX3E
	 i7bdQCg18pdnICYqbtXj82Ax5sVCXhQFIiLk3WwJFE7L7YpZAS11v6IBaoZm/jBb25
	 opOV40NcH+kvzpO5jodfgAacQiFYes7inJamL5kx8ZmJR0f8PDTwOBi0IDPlOgesc6
	 T4VfTOSnT38c5eGhB/kiY/Ca4Ztie50QmRjfCqsdfFKaMxX4GZQKgQzoRrIM4h8om2
	 yAOshPthlFJgg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:45 +0530
Subject: [PATCH v3 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-11-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=1787;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=HC29jIb+LJXzNsT5n2KQRnRrUJPZnyBZMVkVyDKqBR0=;
 b=whHG90/xE0mgOXwSxWFwi4YmHLukJm3JjyYoCmZuuMXVgIyxa9aGf1Aw+2jqE1ia4/Na45iGy
 NfCu+wNp2UXBgeEa7IP27ch3ebR+8N2lX/uLcV2ZVmBwyzaynoCCASf
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112759_931671_823ACB88 
X-CRM114-Status: UNSURE (   8.38  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


