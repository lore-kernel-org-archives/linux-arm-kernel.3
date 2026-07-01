Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3608DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0/k6NP1CONPA6mIbLeBum3L61m4KS18+AQvqwmp8abM=; b=htwcFWeR1Ljy2gJV/xOogZjPK1
	VcXGS9N/1ih8ldsWOXRPfm2HFVJAbZPY1Yk+l1YlsVbm5JXaTULgwokj+z3C0GlHxF8FPWyoxSNqk
	QGhk/ja/yRqRh7IabD/YHv78+DRu00PUgo0iAojhiIypiYldwxeIjEF0P43j4GAxok3QBciAMHpTx
	aGTfr1ztOZp5DSz7Ma26iuMLLPqVD2hz4tJciuqrPh+Q77cMy6DmLx2VlLHluhZlXCqEb2X0osotm
	i1qrNYYFZ9pzRLLcUK+NWGyh5h4h8vN5HXR1/bnTy2Rij71bH9+Rr4oOAhBT5CepvOuIm9bveKK4j
	7SRsW/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wex01-00000002PT6-39Le;
	Wed, 01 Jul 2026 15:37:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewzz-00000002PSi-1UrA;
	Wed, 01 Jul 2026 15:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782920232;
	bh=B2XyVL7QuZTHg/QCA4ERiK9bSp3FRiqNCvgt9Ow2ZVM=;
	h=From:Date:Subject:To:Cc:From;
	b=ZsR7GGxQRS+K6ITU00OcjTBndc0C7IbFsE7CU8t/s4x4wsTpimz8V9BkdekluR86l
	 PhFHwjUMtxHfdE9/ts0zjTnkp2pUbyCItWGkK5nBVPNW0/mPrTLVH0pOz8jmQEZTE7
	 Jg0bgORrQT3+8c+QiYWgwig7H7Tgs4eqFxK9Z3ri2WGYZh9jJRPr4y6TO5rKzI1rxM
	 rvvNWg4Qa3HdoSjOB9u1JjULbIjlrvQcfa3DJzW0jUdp56ZPEh5T+X9kSYmeZrQThf
	 iG3H5prtdW0AWgNLwvbHYzigOvwFjcEJtSZBxaqlgxfzGYOHtU9h+Oar9QCkPxtKKV
	 W35OUKwQ+yrjA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C51D717E0432;
	Wed,  1 Jul 2026 17:37:11 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 17:36:49 +0200
Subject: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6DIBBFr0Jm3UlAW6pexbgAmeosQAu0sTHev
 USX7yf/vR0SRaYEndgh0pcTL6GAugkYZxMmQnaFoZKVlk+p0OdGNS26jJaD4zAlzOv8w7vVWlF
 tWnpIKO810ou309wPF0d6f0ogXyNYkwjHxXvOnQi0ZTwjupYwHMcfb4JeIpoAAAA=
X-Change-ID: 20260701-mt8189-dt-bindings-tphy-4b661e3a9e50
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920231; l=1052;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=B2XyVL7QuZTHg/QCA4ERiK9bSp3FRiqNCvgt9Ow2ZVM=;
 b=tYvNgQLRRhU0C6Mq2zqKSPuBUtv6H016NPf0CmvwYW6Ejy3fZHF9iyT/E70wJUS8INuSEPCMY
 t3sGUZ6Yyd4B6QuzRwA6L7pTAun4Kxr/gr5XjLWn7Kt9lFmirYLf8HF
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_083715_552013_42D575A3 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

Add a compatible string for the MediaTek MT8189 SoC, that integrates a
MediaTek generic T-PHY version 3.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index ff5c77ef1176..8b240cfd537d 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -90,6 +90,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-tphy
+              - mediatek,mt8189-tphy
               - mediatek,mt8195-tphy
           - const: mediatek,generic-tphy-v3
       - const: mediatek,mt2701-u3phy

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-dt-bindings-tphy-4b661e3a9e50

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


