Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA3CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIeXyvBK3Nj+TzbXnUNoyLcSI2KPHCuGL3SRdXj47vo=; b=l4IANENeTN07Pn2G7ziLZC0V5i
	vz80IqTT2EleqVWXn7Gn9ypyEnMeuD83EuUy6mwD/za1TXmZMZhXNaIaYwj5L7/kTedqQzXOh5/jE
	a7pZ8U9ys1PKBI9enf2FNZMksO4sIVVWES2CIUUOwqqaTe7+iyFMzhNH9P/DwpFQrqDq4n3XdXU78
	6g7ET7+OwzM3DvxqLzxUNpDIOANRvfiCxvelZk9eK/yBVsTdwtiHWnEkDZSe5J/U+NkL0k8J7TeYp
	m6p3UEwIcsOyrvnbKplauvQLC9osPdLy/ZVF9GOi5sHbtE3O/FM3bQ14It4xzB0msmTN6X6vJ2Xib
	cJbxZemA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSI-0000000HQO8-0iiT;
	Wed, 17 Jun 2026 13:37:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSG-0000000HQLF-3QZX;
	Wed, 17 Jun 2026 13:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFBFF600AB;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C846C2BCB8;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781703439;
	bh=oDALUj//HPljI6BidS2OPjD+hQfSM7usFOv2D9/WMF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k/VMKbDXmH6Tylzq01TtdO5kO7xpnSu8NRbPJVI7EDg7UhvKwNfCH3QHhe8mTozaf
	 axM3pk28E+Ex4E8eYoE6jWmRK9l9SqFlkbJxmwozvH1pLpA6gSyWXfBDCmKczKgLyx
	 mOlsCQL7RtfqDyUi4QAU/ScptRNWfXS8qIatFlK1FPFu1fRiVzlxWLfhylB0lefW7I
	 wTKSohIAd8mEvr9uhzDxIxszGUzZ7VRQGi5X+i6knRizmuR8d9pfeXZyOjbdJRRcdB
	 O6tzgmZDDRGDwHCY0CE5jz4uAPDtLak99dlbBRipViJnOc4SO0yg4liyjn4gf8Le5o
	 mnOpzokdKxJAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64427CD98E2;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 22:36:59 +0900
Subject: [PATCH v2 1/5] dt-bindings: watchdog: mediatek: Add MT8127
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v2-1-6859e29e72a8@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781703437; l=955;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=biWOiqmry9LgaiOTwUC1SAvyWdKvAgZ0Pq6ZY68s2fM=;
 b=Wu9XaZItWvuv0sYoM0oaHGAcXv1MIFgt+LwbNE4sArjeTWwzng7Z+5bXygQ/KBpPuRzOYDXRI
 TxqAKg0i4FyAlBYdJC3VY+5q22B6OZszpXuoZX5nVJmmWXA/jbE4rsq
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



