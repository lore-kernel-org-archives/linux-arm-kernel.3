Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BC1CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80kSvpfyzBxuYEKCsAN1GTKDFg1DTMxxLrRPv35mVJ8=; b=QbfTYZAjmawCwlOPfaJKlwWX9t
	PjoCA+TiOJfIfx1Wb6SyFwBBtHSw9FrRifSqGO/w0KB2xKBF0hOcNaA1MX4fERlWdkJdgeMPnludc
	ClopQ2ZWme8zTJ47fWRj7UUncW0GkQ6Q0Gd4K1Jm00ng70/Gw2u4zRK24wORr8uuUMWl/Aq1uECbU
	IFF9D5Pt11VuL2U5SVHlpJ/gWoWfxCZCJsapdONU8Fb2PviVv67oeARiIH5h7o4iyj82oJ3Zaqvuj
	Y7enGIX+IfJ2QDLXuVMdqs5k29hlZwQQWdYh/BeTvmHgJ1CUJqDMWxWiLa3U5sDdtlgKRhnCx5DJk
	384mwV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veJ-0000000GzMw-1l4C;
	Sun, 28 Sep 2025 17:57:27 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veD-0000000GzHo-0lTb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7509225E06;
	Sun, 28 Sep 2025 19:57:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvRMZfMFsOge; Sun, 28 Sep 2025 19:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082238; bh=jfzyGuj16kMxD/o3zPsHJeSPpMjeWRHQN6zNVt1Jkh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VgdiktBSl72VFw/IWBtVXrrPsE8MWYSOm2/16wNQTLgTwNVmDYClEv/9oA8yCbf1f
	 H7ETQqo592bSnwrlxLVvN9wT2OUB3sjgtlxLaIFFO5++p28D32iGU5ov7vdU8Sy60L
	 467vRyg0lZjsXD98Rn7W5MLKsrMHNIBYHmGeXfU7qei41I1DLS9+PJYpdG3jcLi1Tk
	 OS11uwVAarlSQwMyjPx05eztTmLiRY/St5dNT7arPkWJaXGzsNBMBiq6H2hI95y2TH
	 ksMJCgtm1+/1CbyFSJLydh0msANjGOwuXeddLHMrgtxE/8bQ84vUtlt0/IyD7+K2Nh
	 rwhmSJvZx8dGw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:36 +0530
Subject: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode for Exynos7 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-2-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=1058;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=jfzyGuj16kMxD/o3zPsHJeSPpMjeWRHQN6zNVt1Jkh0=;
 b=eTef1nL0ejalqzBBewnKa6qqmug2JuyYhRuwquEuDfJCZjhroidGH7MKIb8QsYFz3OUuV9T+Q
 mSG3NbGhQ5iDQzSWXU7ICRW+Zb6hsyBDVu5M8B8kyW9ykG3u0Z/dstx
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_105721_376030_F4F418DA 
X-CRM114-Status: UNSURE (   8.43  )
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

Add Exynos7's PMU compatible to the list of nodes which allow a MIPI
PHY driver. This helps defining the phy node on SoC DTSIs such as
exynos7870's as it has a compatibility fallback on Exynos7's PMU (and
others in future if support is added).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..9293c5eeaaedf1704a48c19226d35d183d34fcd1 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -172,6 +172,7 @@ allOf:
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
               - samsung,exynos5433-pmu
+              - samsung,exynos7-pmu
     then:
       properties:
         mipi-phy: true

-- 
2.51.0


