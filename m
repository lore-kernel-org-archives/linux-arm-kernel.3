Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA03CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSeCi3HjnZu5qImVkcM0BZPx+2guCpJROAr8BzZP2vY=; b=DMqC9OjiBcIPzOfhC1dw3v3+6/
	MHB958IdxQmUBBkYLSQg0ANoGicp/mTx6E5nsUKyQS4cxF0h/MoSRmmld6GbSsRJb9z8kzB15K6Lh
	TqToSo3JTm0cHD929lgTz3vJIc58EO09fzceKTXbhqqkCHzxCp9GLWmVMqtavgtnNTyNJW/c2cMIn
	1vJ7vJG10Hdf26KHKLOGXQi46p9RGQXL0o0Zd4x0m2HUKMB2FTtPfn1NZWVB6pQk6r5OeAPDnazEK
	l1GMQPyd+ZcWe/RxIEvKQwiWGs+AS13+8hM4+fpJBlkjQRtECAHRMfNMhgiLdlVQa7d0Vgw815J1g
	l38EIeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftz-0000000GUr8-0Pe4;
	Wed, 17 Jun 2026 02:21:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftx-0000000GUq2-1CaI;
	Wed, 17 Jun 2026 02:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D219444CE;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C4BDC4AF0F;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781662872;
	bh=TYv4I/0EdUguA4dQzRGYgV0SyQbG+2UcMGEinY6mWVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qRVKpiK6lvimqkwXV9x0qS6ZtuPoRJJNqQUGVRHDzVCLby+dNpKoJavoZPbNqF4lH
	 wYLfX2mJbbUsc++wZXZfgLgCsc/F+Beee6TESc4XvlT/YsSXYSt3S9/5mwFDZLIBEJ
	 k8d3KeeNt0YyFHQX0qORlYVjVx0446EuVGI6uac1i1B31ChsmU4zB4njHlO6kzx4Od
	 P9Ery8RLqNXT3Wk89ePhjUJqoCBpx9BVskEAijVzo/tNF4fI/ha7220yocehjoM2fJ
	 Rb3Lkv2MbHPJKJqN8y8vBtnGAAp1U2o6JnFGxR+opTjrWi7diS+6IAlNlWrJ62R4oF
	 Xy2w1CHEXsRJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E92CD98F0;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 11:20:14 +0900
Subject: [PATCH 5/5] dt-bindings: watchdog: mediatek: Add MT8127
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v1-5-d02ad15ac359@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781662870; l=885;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=EYpC4LZ5dsncfmZVo1Qa3+LOjpZlxDCulVGvphKLKMQ=;
 b=a/R2TapQVdN1Ryp32CARs1QbBbPlH+I0Wa0q7pOdQP5E4LNloIpf6D7WIqIg15p4aptuMMK16
 IRnMJYOAxcABQiTxiWVbnGl4mqyviY2Thqw6BjpmAtWwzy+IvTLLFTt
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh1@proton.me>

Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
one.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..e6e4546da0aa 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
+              - mediatek,mt8127-wdt
               - mediatek,mt8173-wdt
               - mediatek,mt8188-wdt
               - mediatek,mt8189-wdt

-- 
2.54.0



