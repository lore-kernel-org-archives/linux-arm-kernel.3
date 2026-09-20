Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0EBC982EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82Lpl4esNr0fEGBNe2yBIcFrhWe1VJjlH0m9toI3nWY=; b=hACaFJLJtV4Zfizxxglc3ESKod
	x1Pv8EMtsMAlc31WucrfLQL17kHOzWKrn86+YBpEbwJjR/NNNIzkGy5/Ix+rjWkTCRZLuqKgGugla
	nEZZgONugHBKMIfJ9clg7zeKV+wCW27tCt5DO7L2AyMdECPtws0CcT4qgzg16SNgyJzGlk/YyqdX0
	C0ICgSv2o6Md+EaR3DHQn4hI0lHPKwpHT9cKGDZKXSGgZ2hyJTQlkIDSQ1KT5oje09BlaleovTvGy
	vJzLS/N7ybSlwtIkysC1ypz1zGduxcJLezg5TW9kji126yk8N6DtRz1P1++gatCJDlTvBbu269PVA
	AxX/Sj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKx-00000000XIf-04oa;
	Sun, 20 Sep 2026 22:48:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKr-00000000XFi-1OvE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:48:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC0FD40690;
	Sun, 20 Sep 2026 22:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81381F000FF;
	Sun, 20 Sep 2026 22:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789944516;
	bh=82Lpl4esNr0fEGBNe2yBIcFrhWe1VJjlH0m9toI3nWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K3iIUc+va9bzkt86uUyVRkUYGpRVZ9KUHkX7587vB55OzJIRGyKJlQYuIItOG6xPl
	 D0cyts3cGHJ69d3NpTDdt4GA1Oi/KYg1OhDAsUq2qx513NW9k7VX8bSK+opNyYT95L
	 UoB2K8ZwcZhTt9Nijx3sjlNg8ZvzEyT0M5Dw7baxofOCpkYNUWyP0mvEMvqFssTeKe
	 u/+4MELq9IKdFgx9jEyvYem3909pnRCS0tALop6TsZmi85oZ/aA2YlvKNZfagLHruM
	 n0dd3zqj97V8zfnHpJPSbVIgJwirgBMYLdV+CWGu95ugeGsrMIITLQBAxkMKef3zcO
	 4KdQ4JFw6zbYQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:48:11 +0200
Subject: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
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
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
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

Document the MCDE power domain.

Keep the legacy EPOD regulator binding unchanged for now.

Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


