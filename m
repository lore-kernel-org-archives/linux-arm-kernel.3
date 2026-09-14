Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F46C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYUARRf2DFyo9d70NpYfeL3NviZDSlAY8ITwJB7ZCq4=; b=UqZsTYbmcE/ldprTtZU027AYOH
	Bsp7Z6WtgVkbdUEA+K/S8kYTjkFE/67UayjZZhxYUwUb2v/gUlJtJ9aBCCKWynRLGbpR7BQo+uOkC
	N+FewnK8MeIey9rzkKJfjdMVJANKNzXHHHAt08c4uUyIPgZUndcjr3S+9/psdPi/1h12lnW+cUq6G
	2g9V4Fk08f/1/EINV2SkIuQKljGwsEefJWVdmyFn9gWjyaJphqJRIzlyVE9trXUzLDbZyFDPJauk9
	EwJ/vnmcZRzwdGy+Fme47hV1nDOdVObKFYBiyCpa3joOFcJ3xIHX8fJdXmm7J/XiqJcEu42hNJg6p
	eXD0TwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Ws-00000003Uuy-3Ppb;
	Mon, 14 Sep 2026 12:11:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Wq-00000003Uup-3VPa;
	Mon, 14 Sep 2026 12:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BC4D60142;
	Mon, 14 Sep 2026 12:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A27A4C2BCB8;
	Mon, 14 Sep 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789387879;
	bh=Wl3ENf6BnjTaC8yIrHzo+jFAUyZCF78AjgSJCTeDpsQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kCpdq6DtgJOWAmHAVesZBQZ3QI3SR0VjjqtVlKVxBD2DzeEDSud0cbzcFUbNA68yq
	 ORRzC9AsXJPmMfMv+RlMxcS4C0HRLOBslEYWt+WKG1bzOXPi8FsgiaCDWJxQ9Lvpb+
	 vmA1aYFhe3qrv9pdnyD30TxdyNyuGDmLA6gfwWEFq09qwFakjxWVxf1lUNKnYf/rqi
	 CxRxkCZ6rJjx/GlrKVvJoVrUbR7eYpWARCOtZogFrgLJK+Mu8e7NaQddF/88S4+vFD
	 ktV0yt0p+0Xk6LszE8bxenBNoNwsrDvy1V9oqDrW45NzS62t3wBhZFUM430LVhEJkx
	 iB9AfEM7tdP4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB02C88E66;
	Mon, 14 Sep 2026 12:11:19 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 14 Sep 2026 15:10:52 +0300
Subject: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB1IQv2pVxEXcTLqFGoliUUQ7
 27U5bd4b4fAXjhAk+3g+S9BfnOCzjOgyc4jo7hkMMqUqtYvLIvKoIu4Wh/d16J5MzmtqposQao
 Wz4Ns97HtHoe1/zDFawPHcQI3ahAucwAAAA==
X-Change-ID: 20260814-6572-dt-uartdma-29ecd1078cac
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789387877; l=1054;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=R/+/MvTbfqvkqZYPWb9QyO+k6HKf/kl6ZguY9m0N+VQ=;
 b=vHFQ8nf+Cscdtn5vC9FyI/0sorPVchBdXpOIQ+fzj8SGBcpe4ZMoTKRWZGvDpsjerB48ledz2
 KESJiMeDfqWDtBQYWIV6sKsJwpR3GB4+CKVowCWSei6VHMLmKXh0tdV
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

Add a compatible string for the mt6572 APDMA, that is compatible with
mt6577 IP.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Based on next-20260813 tag.
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index bba20e88a6dc..bd5f5260613b 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-uart-dma
+              - mediatek,mt6572-uart-dma
               - mediatek,mt6795-uart-dma
               - mediatek,mt8173-uart-dma
               - mediatek,mt8183-uart-dma

---
base-commit: 2697ef8943c9985c14708a6429e21812693857b2
change-id: 20260814-6572-dt-uartdma-29ecd1078cac

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



