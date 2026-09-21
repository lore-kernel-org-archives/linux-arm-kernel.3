Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786F9C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE4c3YaJR7jDFl2y0TbFLq5M4OnIWzzs/dF5WjR2wKg=; b=M5C2eIYrbjmwbaAJoD+b/++Zmg
	Yig5WXVxc9cuDxqHKeiMgOnlvRkKXUDZ017R9jRyzgnRGYeVCVkB+utGt1jxQSPLjSxwDBG/onq3I
	qWmVtm8ASoqBwprVzP5F9F89IjdbHt8uc/6hJtOp8G9o6MFx0Cirfs5YHWem+J/BLqp84dcVaLy7R
	94ryzscXXTg8BmBwVhisR5gZL8W6Uz4MlRNQW3odghGjICUUbV83BWBrjH0gAN9X4V350ti6bjic4
	lkuMCTh/wvwMmRRTbb5G8awItPoupX9DjMvr/R/sUl2q8yUDO07nfGfAORlRspTdMtyJqG7tsgqWF
	dRkk5VYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7s-00000002Plg-2IuQ;
	Mon, 21 Sep 2026 14:36:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7r-00000002Pkg-19bQ;
	Mon, 21 Sep 2026 14:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E546404B4;
	Mon, 21 Sep 2026 14:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9E04C2BCB8;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790001370;
	bh=ZIK0xCkexQBqyQJA96xFqjCpNT9qXiTKF+FxrGI34Pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r05i/PejEXJfMAmTiMpbQ7/UfVCxSSEuKOGtiDxwd0JxdoDdbECGC3fpYHhVXOws0
	 J5CKtVmfMwXXe7EuvQjVsYm4MZj3kmTuGDHy0RrqmTspNWJu8Nn7LIHA+hH2tMnXRi
	 OxQY0RxbaUxXsGiRYPotTUtgHQhW7nnO271bchKy31D1tykTS9/OGYzijRoLSvDRiH
	 TqLEdl5CNDOqqMy+sSoZHFCT6IzDI9ibqTSvO0w2I9+jVJavHM3wWP1fMHOt6veFQD
	 wJU2rTRNQIhw+OvIhnEU7w4gMxQPbsI38/62ZhAQgfA7V0MwyMlM2/X86inCjfJCSU
	 Rg0CCJmgdkzWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C93C982EE;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 21 Sep 2026 17:35:47 +0300
Subject: [PATCH v4 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-6572-nvmem-v4-1-e9c14156559a@protonmail.com>
References: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
In-Reply-To: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790001369; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=5K32Q1swD4S3cSggeXC/0toQquH0mxZvBxfpkIPi+IU=;
 b=vN0LQ6RrUvamCnJ3YNAb1NmCBNxWbR1qb6O4xG+Yo+hFue9REj1sTD2uAKhHpARSpX17c7SlD
 0GPpYNQY6z6DrrpgVXrJH+q+uTxZ8jnCorvR57pliwVopbBLWNkC9Yp
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

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.55.0



