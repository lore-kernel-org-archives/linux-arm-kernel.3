Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86D5C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ3WvNZD1fM6qd7K9ytp9VM1BWszRvIUXPZ31OG9E3Y=; b=UC7uOIFKEwp5fvux8xMMb+zBJ+
	E+5ynwAg/VPAHO0/L/RWHXvJVC4ARGR2Trh9ooRMAibK6C+Zzv3H/HTxWbGNdoe2SgmT66fqK7EV1
	Y8IiBVxOjI2VxmVOd8h2yv9TWsucPkhJCff4x4tUekHBtomqe2nzhUbw2wqXGk/BgPxsFFmp00eXf
	bKvC2QLvo7QQ43u0OZQezDcxJ4zp5lkKqTWlLlWDcVXj03sNcnvOjUj5Hr1N4J5tCcSAkgMEJ8tYG
	ZDONE7P99Rd1IFFcwX1Pm/FTMQIh1iByGdzRH/LaFBvEz9HSWCHc2DliasgdmS7YuZ+MCFoRpY2Dr
	TgVX+rIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASJK-0000000FJ11-3l59;
	Thu, 01 May 2025 11:42:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASAt-0000000FI35-1QfP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:33:56 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5C71F25B9F;
	Thu,  1 May 2025 13:33:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc7fhaF9XpJn; Thu,  1 May 2025 13:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746099231; bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YFiv6lV8lu+8Sht1wrUjTbb4DyYavZRamoZSVkfmS3JQoMgj5V8CfLecLgn3LzBR8
	 XjMYLrnAQIode/FyXcqZXzZzhqiecgM6GNl5aJC215Techl4ycEKsT+Sa+h9xxXQ4J
	 Rb4YNJWEf2l8lkRIFn2TH4Al7IE/uQU/MuS3cNkh6EprUzSMTQJLof3IZthx2fuSXC
	 cnXTD7ALJl9Pd5GrO7Bi/6jqg9qN68f5rBaa4+LtW49mAtf0zdEEJaQMOTqIPFuNLR
	 hLXaKCTv7Ky/Fui4qWsGBGrlnd0ZHPIyYGq/JhD54PuF3J4qVS8wk75V/4ltwcZ7BK
	 LMXOMLd08itGw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 01 May 2025 17:02:57 +0530
Subject: [PATCH v7 1/5] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-exynos7870-v7-1-bb579a27e5eb@disroot.org>
References: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
In-Reply-To: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746099219; l=1470;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
 b=cClJaaD9AKPEJa8s4BKtIfkQf0ewkjgPgwoW1VDTDUy/30st1i7Goaqx2hOMMKVYmaOd+AENK
 y+7rH1tCi6mDWx9o2WOvIUWG1tejelepO6DtrpL7vUcPt9RHRiqXBBh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_043355_517780_C6EB6DA9 
X-CRM114-Status: UNSURE (   7.30  )
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


