Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E197C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKZmVnk3+DtSWK9hPhyNsOqbTmr3aNYxU7XwAwrYS8k=; b=XFt8kIEZixtmpKIyKzWtBdVD6o
	9aXuQqzmr1daJA5vCjqpvb8WHR7h9/PspduoldkOUnl9y6a1E21uw7/0XeeOPyYNMf4u+O1lanesG
	5zUosgrsB3zqe2QPDOqxu4rJT+NvBGRGBkYLHQgwaOiizkcnYhuGyHCYdjqQg/LQb2a01q+1J+wAe
	HL0x0IzD/AePgwYfSXwozOfhEhvN1GS9YXoR6xt2aDLTCMBFms0yRYFBR/3neC3AAjmIQHrGXxr1J
	OS+/ZygUJ2WMGlyDwHiGujM94Q7Ryzv6xAKF+HCkF78YmGQ/IglrFMDYb7kGqQk9w+K/o0H53ZGbp
	PH8yt+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyi3-0000000EmP9-0dsk;
	Wed, 15 Jul 2026 12:27:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyi1-0000000EmOQ-1Nt9;
	Wed, 15 Jul 2026 12:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB65B40398;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F514C2BCC7;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784118448;
	bh=/nmX94i7woECD9G9H99n5Oh/yeRI8rxdP01LoG01IWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l+n8mhFOetzl2nKeUetNMTzOi5aYzNWl3tgKFTocZaVcix4tFDRRbqkYRGJ0O23B+
	 lPWG7ldKNddpFDS5GuOm2sxFZLGFTDKRRZBlu09WzJBJQn8SqsmECF75aQK6X9efVC
	 ks7r+b+hPWr5AG/+yiuKo3fMqHOM3A73pKzWDxdmgaSkeQfJCNbqMLKjAWv66aacyk
	 7Vrotr4fyDCu6fN90YCSkNLH9jVRRGDQlQsrWy8bpJF7hNCdv8p4hv/u36nEptKDzL
	 15ESboduNfoZ7hEHIl5XAqxo/ywYJCOM62r/johkVvBYq+ZgEma4i+FeXn/2DNjE44
	 VQdcGJOzEvqlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD2C44501;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 15 Jul 2026 15:26:38 +0300
Subject: [PATCH v2 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-6572-pwrap-v2-1-bea1d801c81b@protonmail.com>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
In-Reply-To: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118429; l=921;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=BAi8UFC2xpwSSj8K8iWAUOKHGK6fMGisfalQqsjZVDM=;
 b=WZdjeLkVUX6/WzHVac1moHYvdUlfq8YtMBTKrlphWNkwB/sQKTS1sIKN6tHhAPcVYKBS39muA
 vqk0wnpsY1aCy9osGHkYge5/3c8C9PHm9ZDOVY/Pkr1RsT9nAlyVy+3
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a3cf11153fba 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.54.0



