Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E3FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z1c9KM3s7uvmjaAduy8hBILaS8R/eb6us35Q5ePZprY=; b=K8JTqs/bMypR117BqDdOgl8+b5
	Lq5Mmy45BL981sjmm/fKLNIDhSxuxa5tOPUFzEBgJ7Wq/uOgJIwrJLtUT2pny/Vyi26Kj9Ma5U6/+
	RoVP0fy4cqLZ0sCd+L1xmZrpGgsJOUfJm9bP3c7OsSnCDz0H3EPqJ1Mz6k6NEDqVDl6vBVYJNMVXS
	a98otVYWqshjvK0I6QWsZ0J5t1DGeEvt+7VjBmaGGhcWMzHVi5bfksGyMd2IZUEa8boKyGkotl4Wq
	DPcNFS7VNCpR/Sn+R8fZWj8Dz/3qw2pmERnzKviiry6BS+fBh3/h4M6TXZn9/xS0As4FeICI5OFMe
	QDb/lFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubomp-00000006NXM-0TjO;
	Tue, 15 Jul 2025 23:10:11 +0000
Received: from mail.adomerle.pw ([185.125.100.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubob7-00000006M5k-497L;
	Tue, 15 Jul 2025 22:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752620274; bh=Z1c9KM3s7uvmjaAduy8hBIL
	aS8R/eb6us35Q5ePZprY=; b=Es1/l0imZ+MADVUXPGvIWU38SBGD735Xt8cKpRCgqkdnpD6KVW
	2+YdMD3s/pzQCU9MDxYTA8BoO+nMvtXVBidA2ztNnI34z9CPpYKjI7E5N0Vhq+wDxt8Zp0c5ODu
	0Hjk9/DNfxjr5Ofk2WIa2f/tI8NXZd+kJnQXi0QYmL9nDqSCtnDMnRKwtaZ4FVzAMxkOqp4NEBg
	lC/DHIEsX02+h5ThOyFFdulwkyzIoxn96wi9iyyDTzHSYWoCibAiz2DVORetF/VW7WNtc2+JGqR
	HlLMQgVDYirDXCmATSju6HJMDQcstW+lTE1kCNVdcDTj7Otsr1Q5pQhIHJIQg34E8Tg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752620274; bh=Z1c9KM3s7uvmjaAduy8hBIL
	aS8R/eb6us35Q5ePZprY=; b=frj+uzZ1ZcH6Bon1HJxu/Nm7jjjmsLWcnm/KtdvX74j5Vp3qoV
	cxlp7/aZm9lBc+7qhZs9fwdMmPIOHhs1dGDg==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v1 1/2] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
Date: Wed, 16 Jul 2025 02:57:45 +0400
Message-ID: <20250715225746.1321-1-me@adomerle.pw>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_155806_194365_2CB5B6F0 
X-CRM114-Status: UNSURE (   7.54  )
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

Add a compatible for the PMIC Wrapper found on the MT6789 SoC.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 4737e5f45d54..b757cda1d32b 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt2701-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
+              - mediatek,mt6789-pwrap
               - mediatek,mt6795-pwrap
               - mediatek,mt6797-pwrap
               - mediatek,mt6873-pwrap
-- 
2.50.0

