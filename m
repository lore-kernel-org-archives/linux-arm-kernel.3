Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19481CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlUeiKqBy40E+344jIcqfAa3hwlFrXZHKHXpJHntRnQ=; b=b9CR+ZqhAvU8pflbwg4ry0QWaV
	SRlZGhNAJ/iKGCXThFgQxyYLFephc/L5Qh0au50YgbX98z0pUu5R5lkSzXtuIhzmGbED0K+2C4lDs
	VPxw7U2XMhKUujjPMDjdQjaR52raz4dYjgJbTyAHOxOZCQ3zo71ZFGoENtCw5XSioIvuPy7jotyYH
	7OKfb2zPrjSQXquLow0xf4Mf2eBVzymHNawze44FVmg3+yItwTFkoPKB/SdTBj1utR+a6jcsKU9eN
	mw38woIPY/JmAEmxkhM+I2VGALcc3eNOizUp2esCurcLTh6Wmz8+6C1h9GLwegzSVjhUJJ8mliA+g
	vFZ9NykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VN-00000006Gts-32UB;
	Fri, 09 Oct 2026 12:15:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VK-00000006Gs9-11jz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:15:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0414440360;
	Fri,  9 Oct 2026 12:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C8D1F00899;
	Fri,  9 Oct 2026 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548113;
	bh=GlUeiKqBy40E+344jIcqfAa3hwlFrXZHKHXpJHntRnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IzYea1c+vd7AR8I9hts2rBTUcBfgjZSNZHhUzI1Gtycq5fREKkPA90uNR1RD/+7js
	 3Laq6Nxy64/TkX5+77qM/2/K7NiIVBKqsaF3l7y2OR/zl1K02Ui4P24FG+e/zyJ9Ze
	 WHJxnjEyxc58fZJZ5bxQhFKf9hT0b/8tQsZxNLAEeNl7yNAUmhxeUkkBS52PxUEWwj
	 SGzMF2FN4Kie1zPocFXJSiP+KgWE1vfCzC/acVGzM96yK+azZTPcBiI+ygeWYRN+nl
	 /kIY6/Zyy1cWZIkQqRtxsPMaXXRMJuxwY/BgRz1LrXy5OaptvSrdXTaAPxBYlqKpqn
	 dN3OK1tSnkiRA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 09 Oct 2026 14:15:05 +0200
Subject: [PATCH 2/3] dt-bindings: arm: ux500: Drop NR_DOMAINS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-2-5eb1b90bc35e@kernel.org>
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
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

Keep the internal Ux500 PM domain count local to the only driver
that uses it.

Do not expose this implementation detail through the DT binding header.

Assisted-by: LLM
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pmdomain/st/ste-ux500-pm-domain.c  | 2 ++
 include/dt-bindings/arm/ux500_pm_domains.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain/st/ste-ux500-pm-domain.c
index 6896cb4a7b71..c9129a3b1805 100644
--- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
+++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
@@ -17,6 +17,8 @@
 
 #include <dt-bindings/arm/ux500_pm_domains.h>
 
+#define NR_DOMAINS		(DOMAIN_VAPE + 1)
+
 static int pd_power_off(struct generic_pm_domain *domain)
 {
 	/*
diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
index 9bd764f0c9e6..9d94801d8b89 100644
--- a/include/dt-bindings/arm/ux500_pm_domains.h
+++ b/include/dt-bindings/arm/ux500_pm_domains.h
@@ -9,7 +9,5 @@
 
 #define DOMAIN_VAPE		0
 
-/* Number of PM domains. */
-#define NR_DOMAINS		(DOMAIN_VAPE + 1)
 
 #endif

-- 
2.55.0


