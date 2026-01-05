Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A31ECD0409
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Im+1uPtAsHmMgTHyP6vN7Ci6XLQ3Q1HmHKAZSOYfbZU=; b=DeNH260c99wzul6yhjhOGBy4dg
	FHlrR0n3MCNEoGs4iMTJtfaB82ugLf+gNXDL6oO4u8/NZgq8e3zR1MeWPxjMp+mFjqnOXCu03KUNm
	bf6RfdPK0d3uqIvF+v8jCRTmKQJOsWGnELAH7j+5lp+YpzioVcNAtszzi98arap8OHKk4HCoVrNrQ
	z+eA4r9wIxdnBiUP+9pnx5bsWW8yZ2LOHaxPz7x058qco26cYzYnc9/lfQEmw2wlfvdeoeg4dSZZF
	GO/rbCSGuF66grrSxGMiwFlyvXjsPXnXw6ChS3A/6E+qwtX96e8d4XDCvq5uBM+fZP/q/5X3gWoFw
	rrfvMdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs8T-0000000C7j2-1FRG;
	Mon, 05 Jan 2026 21:29:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs8Q-0000000C7ii-2H7p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC114407EB;
	Mon,  5 Jan 2026 21:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC31C116D0;
	Mon,  5 Jan 2026 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767648545;
	bh=CiTuVwc7tscmiNNKi7o7qvreD6DS7hi3dLd5+IdW8AE=;
	h=From:To:Cc:Subject:Date:From;
	b=MyLU7TVXqWVP5cnxK1llZYdSGPFcHXVDkIaK6cEz0jWGVt6PVc2HuKr65Rf65xa9y
	 HPon11mTgb3MwMvfMSi/ncp2OU0BzqDsoZRanpcE2JEpGJGZeoizBLp7ZtA2iOcHVA
	 RR3p/KNp/l6dZc4NksRlwp5Qsu+gbIJLgv3UyPH1TEL2tcrsrBBt3HA2UKDnyqruI8
	 sCENthzAmZ7kzr0WOqdnum/kEFLuDdKKK6Pc7N3VsFaGM3f0SUtFT6xmD5BaByf3Yt
	 gOpW4SA2gGNR9gTEElaYTmp65QBIgWZRH1r3diBfepk4Ufc/GY16/6CTJ1lOPMrSLT
	 FWVM03VRspHWQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select schema
Date: Mon,  5 Jan 2026 15:28:57 -0600
Message-ID: <20260105212858.3454174-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_132906_626156_6932CD12 
X-CRM114-Status: UNSURE (   6.65  )
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

The "select" schema is not necessary because "syscon" compatible is already
excluded from the default select logic.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/samsung/exynos-pmu.yaml      | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6de47489ee42..bc2f83aec42b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -9,28 +9,6 @@ title: Samsung Exynos SoC series Power Management Unit (PMU)
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
-# Custom select to avoid matching all nodes with 'syscon'
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - google,gs101-pmu
-          - samsung,exynos3250-pmu
-          - samsung,exynos4210-pmu
-          - samsung,exynos4212-pmu
-          - samsung,exynos4412-pmu
-          - samsung,exynos5250-pmu
-          - samsung,exynos5260-pmu
-          - samsung,exynos5410-pmu
-          - samsung,exynos5420-pmu
-          - samsung,exynos5433-pmu
-          - samsung,exynos7-pmu
-          - samsung,exynos850-pmu
-          - samsung-s5pv210-pmu
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:
-- 
2.51.0


