Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D14CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=934k3YAOTPUTeNORw7nnBK60COtWPxMdyIUkVWLuyNE=; b=OJP1SqCgl2GMDX7cdgI6FbKcsr
	FbRZiQVFAsRftLu/O5Wm2O/z5EQvxeysLkaIdCJ2BxEnnP0mpoQcC3rTjz+ia5bu3OC/K0rkRoA/g
	6Fh/So9rB2i6IpPedUaiSnKOHnt9MJIzkBn0/35eWXU7fdzFxmtXSLzc+s/5eP2nvaOwdO8i/xFEk
	+wRL4o6nruFpxptV9QjKm47HsgsIXh6bT2+aZirqINRPvRDPSuVW3Su6ga+U6ViCj9MxQev5hcYxs
	BgR6jp/s+ox2RrKBfQ+5FfT+/PJu1MN6O9HF6DVfZqykoJr0YpFWKo4/24gdWBt8z/jqw/ecPScLP
	BzgBxPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCZ-00000004f3V-0Vpf;
	Thu, 30 Oct 2025 19:20:51 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCV-00000004f1x-25D9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:20:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 720BE25EE0;
	Thu, 30 Oct 2025 20:20:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_GFZq4rWBXP; Thu, 30 Oct 2025 20:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852038; bh=eWAhpOP3tW5TGqxzO8umGaIxutrPDC/am6PDJA0iz90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TXDvFSGjFPgYTm8P6IuZkyFjZcm8fxhFzgfYxWKWSOgFOePUKIQmPiUk/VsNJmOJz
	 oEG9hQmfx7SL4Zf+bEbtAAyhPbXs29AXigcBZavsUlt+HvuKVnHOueTULaX5UaLmJp
	 ysTVtlF5L21HKScdwm8nDZKZvY8G6/zGAM8fVcTnbzZfnhfidrJjt/PfkcAM15sFt+
	 6weezTb+uVQZMHspGB+zp9W6HVyLTJHk5cUh0LiI8anr6UAWD5+2mFXwllnaINqrtE
	 ucYIkZMeHW5jW0EiWC92dAnig07It++0wLZf1fGPGm8IEaGNEcsueJzntgOEGbsy/3
	 E7Gkx16y0TsGg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:15 +0530
Subject: [PATCH v4 1/5] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode for Exynos7870 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=947;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=eWAhpOP3tW5TGqxzO8umGaIxutrPDC/am6PDJA0iz90=;
 b=Kd4Mx5ujS7haC/eKtrb0dT8FuDJlpey+ZiV+3hTyCIovoLYDZPHcPJwWA0o6fycG4F1IaceAC
 DcpnVhlYrh7A+NpVSLFJ3swKVt2B7U1RNZBIEO+q0lprzHk3SFnJArI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122047_678623_F58624DE 
X-CRM114-Status: UNSURE (   8.39  )
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

Exynos7870 PMU is already documented in schema. Add Exynos7870's PMU
compatible to the list of nodes which allow a MIPI PHY driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193feeea1c12d0d5370168e9316c8dcf76..6de47489ee42f429b46835af563112f5bbc1ac65 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -173,6 +173,7 @@ allOf:
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
               - samsung,exynos5433-pmu
+              - samsung,exynos7870-pmu
     then:
       properties:
         mipi-phy: true

-- 
2.51.0


