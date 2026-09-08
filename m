Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B720C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUuW0uVZnmmFYfzlADyUpYwUcDsqPHnRtqJHTrYOEMA=; b=Fp+bXguiPJtT1gakmurM1bhS7s
	8phKkzvT8dzJ5SLtWxABzOy/31gmPrIYZkQuI39eYFDxtWHvYbZpPGNfHJWV9/pVLWMOhdODtLqp/
	OjOUNTdFDZIkjng5jrp9LeWP4+Rn071RZKDyTLwfUH52NqbQn531dNSQy7DfJC2CFHXpaNohXuFPj
	VWBaQa7yjtbeAXU8jhZlk0q4/TqMaWTBPlRyZ59PL3m7/9e6FLxSSE2ZXv8Jw/DQUAvZA45iELDn5
	H14axh2VMKIh1bmJh9A4DUybG6Kc7F1C8+vONdyMxnZOjNA3aGoegT2S9+oF0N1MiNZWT/FQrixEd
	vfvzQI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43r0-0000000AM2H-00UB;
	Tue, 08 Sep 2026 21:59:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43qq-0000000ALvb-3fZi;
	Tue, 08 Sep 2026 21:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 790A860214;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 183BAC2BCFC;
	Tue,  8 Sep 2026 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788904774;
	bh=XNvMPjZX0+WXpT4mWFJChE+oCnrBaMYSvQo6qFGzXNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rMBpPynJ/jbBSHPVFb+iauYmGA+HS1B1MS6KAdbl4OiKfBQ/tVDzVG/cqL7krrwYh
	 KcEhNi90sKM5IYmuLrHPjMbahBH3pPW/EUCx3QCTcctXW/4ArWd8NTiqzW+QkvuqTn
	 RzOiH/z59YzsSLvmVb1fqKnOd8yUToAukoEVGtqJAQ4JGUw0534sajzbQVCXvZsVnZ
	 M6Re/HZEz2caGMeQR4NoWXBPN+KJlU+fDw5M6JgGCu57CjlGIOlpyWpl3Ov0D84yxk
	 DSiCancBm/Wu9wI4UOyxkoWlN8X1nvMPqO/x6H4FJXbEHgjO/mGG+SYBC28x2MKJDn
	 6025PxVujHJIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF59C79F82;
	Tue,  8 Sep 2026 21:59:33 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Date: Tue, 08 Sep 2026 23:59:14 +0200
Subject: [PATCH v3 1/4] dt-bindings: watchdog: mediatek: Add MT8127
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mt8127-amazon-ford-basic-v3-1-fc46bf1b6cb2@mailbox.org>
References: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
In-Reply-To: <20260908-mt8127-amazon-ford-basic-v3-0-fc46bf1b6cb2@mailbox.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788904772; l=1002;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=W+fYT6FEZ+BsGX4xaHNPJY7m/vM9qOAG6TkfJVwh8eg=;
 b=PCj7oU1XtdbOT9dwhnGljvOvur9e+ECwW7YUpNX1BodnT9teCU02+9L3pZFFViomE5NyniZw4
 hjGyJVQOETEBuADtfMYhrTrh6Bbtkq6O8PfUV611A1nx2e4QE1UizhY
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh@mailbox.org>

Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
one.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
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



