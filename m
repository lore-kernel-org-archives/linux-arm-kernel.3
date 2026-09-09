Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D19C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGGdfJqGLxmL+l/+Zw0i9CDtRwIkFkCEgtvhfab4zQI=; b=3QzZuRkNe39bvhit/mWVUdnMAr
	tdTTsonsT2IKcyNHFUfNAbeiCuwqb7+BfFGN+FoKB3wqIt5F3mG91SEGDlDMCoJBmQ1ZI6SbTdbrU
	62H8xZ9SCtY3CqA2ARKc8cPE1MIAPa/RiUmJgDISxua8tTOYIPfBzQmTuVYYazqqLOeKInq12sp0c
	pl/4x5tIzC4lydindekIUejA6wAuMygqFIbLuKO+aVJnVyUC2tWz6Eh3fBsRY6z56Z908Dlg8nb+m
	25Hb5JjHR2MuBzP/rrNuq+IWy40mPYCr8pN+ZBzT8Nf3U4bbVwIqxVtvTjDN2K2JO3Di1AgXHHkD1
	O+CvPY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FsB-0000000BTg8-1V9P;
	Wed, 09 Sep 2026 10:49:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Fs8-0000000BTeT-0DoY;
	Wed, 09 Sep 2026 10:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CA2C60219;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11957C2BCF5;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788950983;
	bh=OselYV9Z79ga+Tc9lAyWGhBokVgW3jNj53PuyfqBRz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pVFabxpeuid4J1XDLcZ8yOhWwD1/XLnDCbhlC1MT9qAQ0FDMHgtQK8OivDatQ1q4j
	 NEbabWkF9dm9tePDd8VGGhdOiR8MZRwQdCr7ECWY31IrxIEFYeBTl3kKgLCMSgn5at
	 GcCqvwCfTUw27Cl0H1c343pAHSacObNy8RE7t2t1clzxn4qEifslrCx89mG10ZSW8Z
	 BDQsImbM3oKZvtjDm5slSClAkSdGnd0h6qF0Fk7KarnNIZiqAg612d2qo8KwKiTzSB
	 DddMCr+843lxBv4591jU66WKAMZ9WpyvE6jOL4IFWjAG8n1nJPSP//KGxEwUTyw7Nd
	 mDf2LMookHh2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69FFC79FB6;
	Wed,  9 Sep 2026 10:49:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 09 Sep 2026 13:48:50 +0300
Subject: [PATCH v3 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-6572-nvmem-v3-1-c0c441656431@protonmail.com>
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788950981; l=1057;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=t4yY7jNJW5Ruu7MkWUJRRcVwM0ArbnLdvtu2KDe4Mvo=;
 b=YvUkqieMw0zQ/HK0FnVLCruW13b9WxcWXKDU9gpaJfUQTM6+gZ3se4/2+kmSWJdnOxUpBsjmE
 3JB1XTr2O8jB/Sa4+zik77Z6vLNrvdJYig0Nn9s0keEaoE4wiavkAGH
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



