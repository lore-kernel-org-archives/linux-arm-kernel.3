Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33775CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWwRbCep919hYim9es3dvIznVncx18vPKUoxSbaYVmU=; b=dIkMwA2sy1gegQRCyD0XUiFkip
	34ZkyefECdpWUIcRMDfk5JmqxjYGC6nAfFJLY9nsV38+QirXWQRpVV9gbtlwlP5G3C623KGjLnKPf
	v01nk0Bb8l8G7Qqbey2o95Ftju4ig6H0JmGBpeb4E0XYyEVCa3YX6ym0GjwlZ62IRLf1TjycwPmJf
	jhGq8Nf5wJyEQWwgjmPyqmE828iimDdaSMjfOOTy+BD4vxc6zRiYKnFKRsDxw1et4+56C3azVOFLs
	eQIIzCxwUN+TyRwjw/NFMHC3b3NBQnp+PaNUfsNp4MZnpyNtgAQLtlUGNUlYHQhWQbtp0RCN0TiXg
	+tvuy9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veD-0000000GzIJ-0PwH;
	Sun, 28 Sep 2025 17:57:21 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ve6-0000000GzDy-36vT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E3A3B25E06;
	Sun, 28 Sep 2025 19:57:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MewRaZEVq18p; Sun, 28 Sep 2025 19:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082232; bh=N2KuE8IJLYc1CcM2YMaHWJDojNGvdBHAkkmTUKtgYiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VsEY9pZ9v+qdJP4FUxXvSiJ+nh7qLfxRHWL8I4ZCX+FCZ3bsqo/iT3aBLNa5PVk+f
	 x1D1xIgzgp8RYjt3rGAPjydBrTKfj9zpXfaFG6BRxA6ZOv0SSCSLJyI3de/A8w8kCw
	 AspRszAe/JivLKgbbR19HEGZCAqf4b81Rcu0YavVnkN3dcwbACOKPDPfsF1IFgUzL5
	 3blZgKUM3Nm+t1IF2kSvg3xJCHWgwHKAI3tLVOP0bnSM4/QqyQO15xo/yKbVOQ1lGl
	 dhVEbgUVDtVQHyApvTobFiKxtQcmRJ8vH04rB6jHsiYAQS8oLjIXcIi7T2f9CHe0yE
	 LICj0QzNSOB7w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:35 +0530
Subject: [PATCH v3 1/6] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-1-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=1199;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=N2KuE8IJLYc1CcM2YMaHWJDojNGvdBHAkkmTUKtgYiA=;
 b=b/0m/d5eGFNSuXWC0fmefe6j6ak8+P9wVRNEwC0z7BsTBtah+0Ri6dg/wUPaPlYwlFNcLcfnH
 LyEbjTADMWdDNGDy5UkmpgI8mk3XxHqjNhLLmZ49goCJaJB0dobG/uT
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_105714_917404_48C3C7F8 
X-CRM114-Status: UNSURE (   7.80  )
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

Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
added, used for the SoC MIPI PHY's CSIS and DSIM blocks.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..dd88f40a032c1e4e492dacf34a1eed27ee79976b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -26,6 +26,8 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos7870-cam0-sysreg
+              - samsung,exynos7870-disp-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg

-- 
2.51.0


