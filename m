Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PXwVT3mCA+YpecjXQdVelOjDLl8aO5/fm2KL71yj98=; b=aKBZsReRvVtpDwTyanDkgCTRFD
	P2SnHuRBwTBFFySfW6kEbcqc6PNZBwnFRv1eKpKUD7/mq+1IciWm+KFVWuRgVLC3wILvcuXj8MZCT
	c2npvZeBaAzCVy9iyliJZZv+1+QRiqA4Or8IWEHs6I9g63MSWxvbqQRqJESKvUsY+zPFE0caQe0Xa
	2iC8Gjrcs0e5yyv2aodTIlQ6ZWwOBEsYsFkk7KSVxmdOtr9DK9j+az37dh+YHkRo7veAiYa4UfQvc
	LohkgRg5jDFg1HG0E52BomCsBBVQaV/uFtgJ/CY0PVsiK4D9r1V1i36ztAOyxQhcUhux/HwTnqih/
	zxoCM9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65H9-00000003Ofm-1RhB;
	Mon, 14 Sep 2026 11:55:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65H0-00000003ObY-3Oa3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:54:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3192960142;
	Mon, 14 Sep 2026 11:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECDB1F00893;
	Mon, 14 Sep 2026 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386897;
	bh=5PXwVT3mCA+YpecjXQdVelOjDLl8aO5/fm2KL71yj98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P/qe+7Tq2Hg4z53wJUgNPPO9MrD+DLgbMFeAgEttz/tgjQwLtxoIE9zggyjrMrTWC
	 oG7682yvcChjBk/+45vxhaDqIcjtClRMvawrxXQfIfkywgd1ys///PKH9IWL7iC5kY
	 V2NMvOYmD/Ykri6bT7a5M2+SbszcgEwQDEbHhPJronq/iGWWznOYnSYNqLb4AgRjJQ
	 9UGG8QXc+3G45kk969wD7hnxoXaxL+4m2212ulAvDR2GtBTkMe0wNC1OjU8s2fkrcp
	 ude/XidK5ZqKV46r4EpCxCUc4vKYEu5Is7CQdTYxJVlBLhRJ2pF0G37G9AY8hiUgGQ
	 DF1LIVH2wcL/A==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:33 +0200
Subject: [PATCH v2 05/20] dt-bindings: display: ste,mcde: Allow power
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-5-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
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

Document the MCDE power domain.

Keep the legacy EPOD regulator binding unchanged for now.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/display/ste,mcde.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ste,mcde.yaml b/Documentation/devicetree/bindings/display/ste,mcde.yaml
index 7a12d0b817e6..05e7e4ebc882 100644
--- a/Documentation/devicetree/bindings/display/ste,mcde.yaml
+++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
@@ -35,6 +35,9 @@ properties:
   resets:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   epod-supply:
     description: a phandle to the EPOD regulator
 
@@ -109,6 +112,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/ux500_pm_domains.h>
     #include <dt-bindings/mfd/dbx500-prcmu.h>
     #include <dt-bindings/gpio/gpio.h>
 
@@ -116,6 +120,7 @@ examples:
       compatible = "ste,mcde";
       reg = <0xa0350000 0x1000>;
       interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+      power-domains = <&pm_domains DOMAIN_B2R2_MCDE>;
       epod-supply = <&db8500_b2r2_mcde_reg>;
       vana-supply = <&ab8500_ldo_ana_reg>;
       clocks = <&prcmu_clk PRCMU_MCDECLK>,

-- 
2.55.0


