Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77997C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LrJiEVM95oznn+hJH8/9LEjNBqxWrIAa6YUnSAT8k8=; b=SKNlSiKov0clX2fy9jYCwDBYld
	nbfyvjKX2yL3uocO0smeBOzK9aV/pVjZlMgcCN4fqptHjzjPRf7GhsDf8hQf4LOY6IhH0fXedtRJ9
	arLiKeq2vGXI7r4uzLNHZP0pqI02Bi5NTacpoJAjh1ccA1hjNPW5U+XB41RQvL5Kpoih3ylgZ5VHz
	qfkWJNYbf3oBK0Mm+MdM4R5yJsD3vYam9sX8veL8AsT3SHPeN6f1qY4iG9Y6e5HXvZJ47Q0eCmRMd
	Un32BxniiEyhnMHJJpd2snTE+WX/ZXQ1xi02oAIC4TW3CIsr6+uOHOAsVmeODpmsJjmU+rjLyXM9I
	Tl53l5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QLE-00000000XVl-1e70;
	Sun, 20 Sep 2026 22:49:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKz-00000000XLS-2txt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:48:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73F5340379;
	Sun, 20 Sep 2026 22:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF1D1F000FF;
	Sun, 20 Sep 2026 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789944525;
	bh=7LrJiEVM95oznn+hJH8/9LEjNBqxWrIAa6YUnSAT8k8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bP3gQLnaIwo225Tg6gJB7a19mojGt4JpefiHDwZy5LPdCKWkhR4DZ6iQraCx45IJc
	 Mk5ODpyNUXSgpf94D12KnQ6ekTm+hPdp722+5vgpK0kt9qvIFz0Y0EHGNuNCi/DxQM
	 rDcyDTqK4ztRUrEh2gsi20HniBjKpJiqi1kAesQJbynW+UKWo1p5xkVyc6JrvBn2xJ
	 t71P1n3RIQH03UtOicaG5HoGMifY3FyegznEXTsebIN5u9h99CrcZY6syA0InDviV5
	 tcDR15GD2Xk9B7x7CuVwvqU+SrUhJOAMPOaEOymZtQ+fwSXMLknolh3TPdNdo3cFrb
	 I8CkkHOm0HdeQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:48:13 +0200
Subject: [PATCH v3 07/18] ARM: dts: ux500: Rename power domains node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ux500-power-domains-v7-1-v3-7-9352be6b86b1@kernel.org>
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

This matches the naming used in the binding document
Documentation/devicetree/bindings/power/power-domain.yaml
It's most logical to call it a power controller.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 25a20fafc6b9..11fcae1904e2 100644
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
2.55.0


