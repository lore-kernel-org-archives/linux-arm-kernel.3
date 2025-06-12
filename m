Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF7AC7114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d034LA3suNRa9P/bWzO7BJTB1mmauGmaUwjoM4AKSvY=; b=xPd3+Bf+6L04ybqF5kqdlMb6qm
	vNoFDsPNvPN71uF8Z8XVLk3vKbykfZPwm/Cr5YqIJhucNfMaSKfXWl2tOa60a86T+eTecP9Uh6/wB
	YNWzCYmxUVBnxxuHn2h1i2mO3okIckIBpeBMsm9bEZOS2e7GEmNwL881PVLBXdo+T3OPtb8C4sj35
	E7jHjdhi9iA/NN1w1l2wsXREMy23zsibFlqWCZVqnY5L9j1TWKU5uSByt3woWGPRbbnaZYU8A10S/
	UVAjl4/M9DvCCVhvxajc9g0zGWCOpJHV8PN4B2RSS4eeHjl9MxHesf4E/C83vJtbYRJemQpE5Mx9j
	fdbLdKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq72-0000000EjGi-1MZH;
	Thu, 12 Jun 2025 22:09:32 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjip-0000000DlVN-2OaM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:20:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 43C2626065;
	Thu, 12 Jun 2025 17:20:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZLghuaa8o59; Thu, 12 Jun 2025 17:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741603; bh=gTjvfwIft0zOYqMzvPWu+tpH9F/eoLvFl3Vm+gEuo2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fhg1WqRcOltyD8/HdHPYHktTBYw6J0gkI9V3H/p2eCAvYod4AFivQwwiffrBd4DDH
	 C7aGs65oLOBfFdrx0sOjQ+hs6AsM53TtAmPa94+oTaDjXHlDPfGoXIa3vJZXGis52L
	 o7mCRFM2m+fhdtEEMhbRVDHd3MvD0GKQUlCxDIP4y5+rRhIqZGCLnHQRnROcQisQwC
	 96j56gHoKzS4qEaearRb2rdgbgl04qwC9X/6oRTRcSzYJkn8pF9H7hsd8nzOL+OMzF
	 C1yc28hdFyVNMGeMy0E9FkghPLmgKz5KgwXxo05Tkqf7f0dtgbsNN2g0MY5crKTOMu
	 jYQSCIlmyTT1Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:14 +0530
Subject: [PATCH 10/12] dt-bindings: samsung,mipi-dsim: document exynos7870
 DSIM compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-10-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=1756;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gTjvfwIft0zOYqMzvPWu+tpH9F/eoLvFl3Vm+gEuo2U=;
 b=ufmNp6zr5Z1H2KmNf5QlVyiVd8w6ILSOscwAY9EKjp0sjOYTzRrZdK2m49hTE8q6hQ22W71p2
 CibhNIBNSNwBKIBFn2dA8afwDoYyoMOe+aELMzc5xZdu+/W/XJNUYtV
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082007_745018_D290B761 
X-CRM114-Status: UNSURE (   7.78  )
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
devicetree node requires four clock sources, named:
- bus_clk
- phyclk_mipidphy0_bitclkdiv8
- phyclk_mipidphy0_rxclkesc0
- sclk_mipi

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/bridge/samsung,mipi-dsim.yaml | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 1acad99f396527192b6853f0096cfb8ae5669e6b..887f3ba1edd24a177a766b1b523d0c197ff1123a 100644
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
@@ -144,6 +145,31 @@ required:
 
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
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: phyclk_mipidphy0_bitclkdiv8
+            - const: phyclk_mipidphy0_rxclkesc0
+            - const: sclk_mipi
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


