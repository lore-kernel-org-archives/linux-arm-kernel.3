Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E37C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyxMb2v2xH3DqhlOTPMz0/M1e7eVp6T0Xm51IK0MVXs=; b=fQnJBRNh/oDTdFMioTOWGCBFLz
	uM+31HFnlPyM7+dXNBFyo9oJifFnTrTFlcCb+buDo78Uy54/lHiaFHR81RmUlmNbPvjMh68Fxq9W8
	ZV7N0YjvpJKZVbrI8WuijZSXd4WPyaXkmXtdlraN0/2yR4vIHzYBbSEavDMpcpnQnjFxh7Qu9gc9r
	Zwli2+mZMyfbmKcXhXM39uu5mYNxXy6RGOxiuMdTYPmIQE25yqFSNY8BE1aJeJJVwwJuED9SOO4fl
	Wc/1dn7bA/sYeipJTorRgSxE+8rMft8EwnH4RwLC1m7rXwx+jtf2tcfWJZC5ZK/NPU2Bj0MX2XY4x
	bn2Lh/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqd-0000000EJ0k-14cR;
	Thu, 12 Jun 2025 19:44:27 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjZA-0000000DjrE-3JC8;
	Thu, 12 Jun 2025 15:10:09 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9A73725F83;
	Thu, 12 Jun 2025 17:10:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCDNXuUrQhRX; Thu, 12 Jun 2025 17:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741005; bh=RMxlZZIAVYR4kFgqtNMLrm8uGrSLXC1YGwxamWZ4Tu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XJJvut2Nqxgv5QH6VeFlqM99M21FIhHh9IxSlNC9w8j8Z04KIoio6U1AAs3mqU+KG
	 Y0d6Lljvv7DZ7YUhNQ2e5HzI6xTM4nIBheXyIeM5Umdw4/sGJNvQC5a9AMJCQWnDvi
	 dX/5NT24myz0uqGUSjal7pA9A2ESPqb8YXe+nHaNfoIp3WUJhvZvCndUb78HPkkUog
	 mDRqkElnYcK1wdRgQM0gtgzu287qwX3oLH5phaXsCvPyThxNwH4uQQbmox+PnbF5EG
	 22KAtHj705UOvGXB6Gz8zvMOPnlmWB9u+sBI9YiE5bRh6+TRm9iP7VGfLSvjDpaxev
	 KXqSpKUj9oc7w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:39:29 +0530
Subject: [PATCH 1/2] dt-bindings: phy: samsung,mipi-video-phy: document
 exynos7870 MIPI phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-mipi-phy-v1-1-3fff0b62d9d3@disroot.org>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740994; l=2809;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=RMxlZZIAVYR4kFgqtNMLrm8uGrSLXC1YGwxamWZ4Tu0=;
 b=+ZD2EOrD3CDxuxegEi1OGwEkGg/XPUjn7pPHdiUH0RUqH6lcZCchYpML9KIwI0/d/zmacidOy
 UI6jdjNReHOCee17/3SG4SqsNnDWkq781DtwX2/OOseiDCri/zAewfy
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081008_968998_F60314AF 
X-CRM114-Status: UNSURE (   6.93  )
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

The Exynos7870 MIPI PHY device contains one DSIM PHY block and three
CSIS PHY blocks. It also requires two sysregs, one for display, and the
other for cameras. Document this device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/phy/samsung,mipi-video-phy.yaml       | 29 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
index b2250e4a6b1b1ae072bc8e10e53528a4ca0e4a5e..16967ef8e9ecc09e24a995fc041ae3735334d98d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - samsung,s5pv210-mipi-video-phy
       - samsung,exynos5420-mipi-video-phy
       - samsung,exynos5433-mipi-video-phy
+      - samsung,exynos7870-mipi-video-phy
 
   "#phy-cells":
     const: 1
@@ -46,19 +47,20 @@ properties:
     deprecated: true
     description:
       Phandle to PMU system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy (if not a child of PMU).
+      samsung,exynos5433-mipi-video-phy and samsung,exynos7870-mipi-video-phy
+      (if not a child of PMU).
 
   samsung,disp-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to DISP system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy.
+      samsung,exynos5433-mipi-video-phy and samsung,exynos7870-mipi-video-phy.
 
   samsung,cam0-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to CAM0 system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy.
+      samsung,exynos5433-mipi-video-phy and samsung,exynos7870-mipi-video-phy.
 
   samsung,cam1-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -84,7 +86,13 @@ allOf:
         samsung,disp-sysreg: false
         samsung,cam0-sysreg: false
         samsung,cam1-sysreg: false
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5433-mipi-video-phy
+    then:
       properties:
         syscon: false
       required:
@@ -92,6 +100,19 @@ allOf:
         - samsung,cam0-sysreg
         - samsung,cam1-sysreg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-mipi-video-phy
+    then:
+      properties:
+        syscon: false
+        samsung,cam1-sysreg: false
+      required:
+        - samsung,disp-sysreg
+        - samsung,cam0-sysreg
+
 additionalProperties: false
 
 examples:

-- 
2.49.0


