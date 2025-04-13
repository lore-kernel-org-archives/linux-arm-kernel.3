Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8817AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ3WvNZD1fM6qd7K9ytp9VM1BWszRvIUXPZ31OG9E3Y=; b=Hjaqo6S0yZwY3PMgm9fnsE4zgT
	GDqgZFzYRp3IpWTsB0HCiCiu6WZ4Ah5VdqfH5jotSisGLx7zMjpBaGIFR4RVoWid2MHXiEX18jTLA
	qtZxVB7flKNMRUWKuw6MZQUT1fxwl3XNgaFKz+F3RAzcxPw83PWUPIGmhQpgD9b6yPr6hszrO79Lp
	IMdA/sFpqYtIIf7jqNWS6vxh12sMUAv0vlt1ScIzUmN8oMaaNFbkfd21BVb6XLo4M1W0st+f8rpBB
	6o9CSsOEyF1coVdu35lk6/fIMkpvr2/FBn74DhPoF8b/WGCCkizmie1eOf3oZE4YcALzCx1eLKL+U
	Qsi6Gw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u42Zy-0000000HaV6-3rAg;
	Sun, 13 Apr 2025 19:01:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u42Y7-0000000Ha4G-3tgt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 18:59:25 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3FF7025FD8;
	Sun, 13 Apr 2025 20:59:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-NWjSllyoVM; Sun, 13 Apr 2025 20:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744570757; bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XIaRF+rjPqhLFJvBZADx0/XI3HXSltDN349oaa3v8Leay3sKCWxePC6orrFrpQ5H7
	 pTrDBfZMdT+DyaYurbj7qp9J6WoghfR8rELx630OvZhxtq6Aqdaj4yegIcUuy8MVdH
	 HNoQrF7b5ppggvNpxD1YfCyzsx5aKVgO6j6QfHo+iYrcl9MrKjWvymaJuH8HhHvSbF
	 HzwpIH8RRuaMK5SCDEPjcAKqkr6Q4L3DFipE2L23/FzphB6Xe7wEPue44u03p+9wt6
	 dtf7B8bpgQuVIWTxbOs/mtHx39m/6s+j0nC1ViyCPPjEDZk5RiYdqOLd8gwOWHtIgK
	 brHY9IkjS7mkQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Mon, 14 Apr 2025 00:28:42 +0530
Subject: [PATCH v6 1/5] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-exynos7870-v6-1-039bd5385411@disroot.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
In-Reply-To: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744570750; l=1470;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
 b=2uXYGQ0Iw9i3OeG/bso4YtGc83tCQs/5ErfyfrdmenAwwGNYAt4mwX9muze++efq4FO4QEg+u
 mhBtGxx/cJvABDHom4vD+ul1gwi7910L24aYYBqFNbZiB3JTa7egrTO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_115924_372130_A5A8D5BF 
X-CRM114-Status: UNSURE (   7.22  )
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

Document the compatible string for Exynos7870 - "samsung,exynos7870".

The following devices are also added:
 - Galaxy A2 Core       ("samsung,a2corelte")
 - Galaxy J6            ("samsung,j6lte")
 - Galaxy J7 Prime      ("samsung,on7xelte")

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d8e62f5ea75bb0819a9d514e54f88d3c..b3be184c7e563478aa37eb16a69c08ff7f70af29 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -212,6 +212,14 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos7870 based boards
+        items:
+          - enum:
+              - samsung,a2corelte               # Samsung Galaxy A2 Core
+              - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,on7xelte                # Samsung Galaxy J7 Prime
+          - const: samsung,exynos7870
+
       - description: Exynos7885 based boards
         items:
           - enum:

-- 
2.49.0


