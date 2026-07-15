Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5DEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOmlU98Tn8WQrxJpAsKiZ5s1ug4NysPpH6JwN6nnsxk=; b=rwKhOG+3tbrFbvhnQeyLsiqAvQ
	dxwGzFPKG6uj59u7ZDxshuWlYp1EkdV7rPYKspUGoYc7B31cCwBhTsMFzPNac08x27jvaM8V8CWA5
	VYcB+Zxl0jDOwyoKjjaNhmEumssWOMIrA5oUZwR8RAEWNGQJdQjUr/OJec299Oa3nHZwlNZMvf0oF
	0wckfMRzcc8fGdEdBaiYG3PIASlPlNjMWSytBwUzLcyz6LFTd9RWE6t74S232jBrqcUNbs1qE2QJx
	ixXkiNboUoefpQMdERZ7vFkc0crZm69dXMogGkZuAUcU36+aW1cT4ySa0lEgzG5UsEZlAzUCRGszx
	vS2VKdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dP-0000000F9TU-3Qho;
	Wed, 15 Jul 2026 14:30:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dL-0000000F9Mr-465e;
	Wed, 15 Jul 2026 14:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0237161389;
	Wed, 15 Jul 2026 14:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3D83C2BCB7;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784125846;
	bh=IGpNS9aue5JzXuYKLafA/B2nUokxJGp04bNGnTYUqSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OmwXA2pZGkk4P/JYrIGe95nEsxY2/flkbIbuy+ZgPtAeWtgjG5KE2vHFqbC2mlWR0
	 8vRKoUF1CdlAdk8aLWrVeGFpMmkMLtYSVkRJUajXEJF+l0oRAIPO1heD2XQugoJf8v
	 2elx0+F17+4CRam+30bg8cMGSGf7Dm8XQXjOgmhpnwAZkM6/p8HZt8xdtTU0Lb4wJ3
	 /MZh9eNCJ0R6PozHsKnn3dXctNCtg0M01T6E5yrdl4FPomYO2niMCgxO32pcivn/bu
	 39z1FeSzaNTxU99Sq/m/TuPLL0g1GqDb8QuYJWsxGg6sJrwMP6YsFHe1QNDrRaeWRC
	 VKeQOOThRIa2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF4BC44501;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 15 Jul 2026 17:27:46 +0300
Subject: [PATCH 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-6572-nvmem-v1-1-9c13be99d077@protonmail.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
In-Reply-To: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125843; l=783;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=6rsiJE+m+kSdFo7mQes/iDioeo1J+zD87d8WvcT3BfE=;
 b=hqCbIqp5vmmknQd+J44Xt579ZcLZFLWvnYZXMSPmyC/4j3yjrZvGG6bPQ4xyeCQvU1k6tu6QX
 GLTBeHaLUalDEXXbWJ2TrYgMGQQ/4Qua0vYtwJVDwZ/QMf350B3aj7Z
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

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..269e2b09f5c8 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -44,6 +44,7 @@ properties:
 
       - items:
           - enum:
+              - mediatek,mt6572-efuse
               - mediatek,mt7622-efuse
               - mediatek,mt7623-efuse
               - mediatek,mt7981-efuse

-- 
2.54.0



