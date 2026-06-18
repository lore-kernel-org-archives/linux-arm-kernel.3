Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62472CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 05:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHA1c+YTFswugOkwWPADK8MsK2KSP7p25UkONlDzkAs=; b=Dp8+QFSGgsQpiLviCwCHMLfzHo
	re8Dibs+zqrt7YSpkHQobL5YMb0YaWIx3W78JV0IusTzMDihSMA0t+ItojysRPhXpeuE74JrpdkfM
	LozpKx/qcx2DsckoAJRmIVWily2WQ5wXnr4K2eKmrd0+kv5zGiTsyJY6iYev+2qIui8iPKKbt6sK6
	uhm6IIpe9oP/jzCB/E6sNRXy4eAF36liGCS5iTWFU7RFdIkLN0trtYNpW++6ny6S8vRZEml5LIeUn
	vFiWn6Li+ovCb6jmghsHvXq9X+/4us+hSCSuEVZfSmiWJU2wkh9hiFS3A3zdgn5dSDPHN4Zgcf2jw
	OPxOebgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4sK-00000000dL7-19f6;
	Thu, 18 Jun 2026 05:01:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4sJ-00000000dKB-1yFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 05:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E99406D2;
	Thu, 18 Jun 2026 05:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48E61F000E9;
	Thu, 18 Jun 2026 05:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781758870;
	bh=sHA1c+YTFswugOkwWPADK8MsK2KSP7p25UkONlDzkAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hf9YuCNAUeUoTaYomuSiK7BZprOo4vuTe3NF7zzGe6DmdhU3rkd/XLAqp3qldLZ52
	 L2VP7qnrZHPKkPY4vJoNHAB/eJLFLMWkdq7bXsfhjHSggJozLU/lDzGiBF5E9sQoGc
	 dZoHUnbilnMc2FaPuohn6nZdrh9O8F0p+N8ar7oT4XuFpuZQqys6N3UaXOYaZ9/UGb
	 1bzxAOzBDA2LMIY1E8XEKeBjWuT/K202Jsr3Wy+JA36GjDxZq5+1DMbDLVuMpziDSA
	 87t6hSR6ZDcd8M8LA1+8d/1NJtarxoSk6rrMUWTNR4lRsrJlfFol6CCz4PDFk0X/2k
	 hREGHsdwyKd8w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 07:00:50 +0200
Subject: [PATCH 04/11] ARM: dts: ux500: Rename power domains node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ux500-power-domains-v7-1-v1-4-eb5e50b1a588@kernel.org>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
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
 Linus Walleij <linusw@kernel.org>
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

This matches the naming used in the binding document
Documentation/devicetree/bindings/power/power-domain.yaml
It's most logical to call it a power controller.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 0f87abeddc33..d76a65da7011 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -343,7 +343,7 @@ pmu {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pm_domains: pm_domains0 {
+		pm_domains: power-controller {
 			compatible = "stericsson,ux500-pm-domains";
 			#power-domain-cells = <1>;
 		};

-- 
2.54.0


