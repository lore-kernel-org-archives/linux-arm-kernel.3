Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A64D0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlFSgCpWfqNBK4f1x98sDOS6n1P78Wz1gsMpEHSJw9c=; b=d19ID7rBdde7JvUlnqMDlHYTqo
	fMBJZ6ckZM1nNMQ6nTxO2o+QFsi6nDqpx5kgZVaJhKm7P2m9BPiDcm+2TEwCaGUg4KCtUmmM1bKRi
	HEnspyk3BPlcCqqC1n2mKe29yqDC8dO39N2eg5MyQi5HkXInRwq4qVExy6/5w0PRN95Iw35aamTRo
	nEwWIV7YWrgd82CwFRgt7eubES7ksBnRL1j557tjnhKtJ713XdzFDjayShun2ybUiFrubhz2tgDYE
	FbX7gV+2341rBmCy2OEqkCkQ0Ztvi1uqTvdCti1r6+tbyWEya3Jh0MLOF3XuIvSb1mxLQe8xscAJx
	O5BGjDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8D-00000006wzz-1l5C;
	Tue, 13 Jan 2026 11:00:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc89-00000006wuF-1Qdh;
	Tue, 13 Jan 2026 11:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302006;
	bh=YrrX4LhkIqhiJ1xMnYBI7HsHkhFKyR5kTvGyFViGPiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dI8R5Q8vld24qRwJNodGjix4Zz9uisevI8kIPKqTZRNe0eLhRBxANCyYmNBH4nW2u
	 jEDrci1Epx+jv1X5mLqScrcPntPDHy39dqcXsEGX+uBhPbv/nrWJcE5Y38NTjY7da2
	 lT35tyVC/r7xkjDnnaeVIZZ1YL4EAi6mDMBw0jo4CfIUgJm5vO546zZPAyg/LGUkxP
	 RAeYx86Q3FVVCRNW9/cF8J6RgOoq6uAY0vHz/56udMTqyxgKRiY/95ZvW0i63K3O0i
	 cauCRPOWFSiasmdhZ/UodGK/jwur88HvHYcTfV91wdFDNP+xG3kTMtUahtZ5NK3dO+
	 rCCvZrfS/sfvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A53F17E10F4;
	Tue, 13 Jan 2026 12:00:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/6] dt-bindings: mfd: mediatek,mt8195-scpsys: Add mediatek,mt6795-scpsys
Date: Tue, 13 Jan 2026 11:59:55 +0100
Message-ID: <20260113110000.36953-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030009_555020_F930C03B 
X-CRM114-Status: UNSURE (   8.16  )
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

Add a new compatible for the SCPSYS IP block found in the MT6795
Helio X10 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 1cb9d6797b92..4cafa381979b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mediatek,mt6795-scpsys
           - mediatek,mt6893-scpsys
           - mediatek,mt8167-scpsys
           - mediatek,mt8173-scpsys
-- 
2.52.0


