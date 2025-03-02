Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9BBC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC5Q3ExFvTY3jQnzcaDXHRJ2zAAMr/qKR7aKCQmifUw=; b=pdk56p+C7MJnV6fjJERZidyN3D
	NsgdrFcrpCyX02WD0tEkX9JQtaep+gtGKVqWEMHOeUEqNmizCDUolr61VZYzM/lbl04YGjKyM7KyY
	kADbLZlvS32Rxh/u4WFS/Ny0Lhgr8sjzsGXiAm/9Xk6eFnmrmVSbv3wN88ACMiUb5U05+vT+keHDi
	msnXZlJlTtLVUHloF7vgNIihBwrLrKYZWxSrcdgHH19p7TGEg1jyz4mJWYDs7bKCL0dOMilc3phjl
	NAE0eWB4+O7jJ3Bgp4Nh2v0ujCti0BL9yFIAkOCM4u6hQiy4TQE8vbUc66vl2yn1H6PxN6Vkh6/9Z
	n5JDoz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomLD-0000000GLvk-1KIM;
	Sun, 02 Mar 2025 16:38:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomDp-0000000GKLl-3LBc;
	Sun, 02 Mar 2025 16:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933080;
	bh=7unty8UXqbw+pOftMZfZMEYJgXbtayExa3QUkhZmST8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UaRIm6i6/gnyeJ4Jf9B5DBRt77f7BV0RNT1JcapJDVY8j7UG3N4lu8SmBwvEDz3Uj
	 iCMGFABimrajrCW1Bnkvoy4kHJSQNR6M5G+A1McxMLKkbFJDRsPs7AcqMJ0rnDPjZr
	 y4KuMKT7mVjH24jjR9ZP1fGJ/LmBoJEXHGOp6MmcHKGWxkSpm0u44PvnYSUPR7fiyO
	 cBUi6Rxb8UZKoSeAmL1Actn36tEs6p3rFR5E6tOv34tU5D6pGUrtKY7rAWcNzn39PQ
	 vD4t+wR7Nro8UOpXHltRY9UKDUrqZDB0e4kY3Z47J2fZ0Dw751fLiuLbQEG6DrBWFL
	 bgjO31kYshU8g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 454CF17E0880;
	Sun,  2 Mar 2025 17:31:15 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:43 -0300
Subject: [PATCH v2 04/20] ASoC: mediatek: mt6359-accdet: Add compatible
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-4-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083121_981598_DB010360 
X-CRM114-Status: GOOD (  12.58  )
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

Add a compatible property and add it to the module device table for the
mt6359-accdet platform driver to allow automatic module loading and
probing when the compatible is present in DT.

Co-developed-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e856356c07fd53af22207124e0d19..9bbd4497e8d481ee125693be2fc576b439574b39 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1047,9 +1047,16 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	return ret;
 }
 
+const struct of_device_id accdet_of_match[] = {
+	{ .compatible = "mediatek,mt6359-accdet", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, accdet_of_match);
+
 static struct platform_driver mt6359_accdet_driver = {
 	.driver = {
 		.name = "pmic-codec-accdet",
+		.of_match_table = accdet_of_match,
 	},
 	.probe = mt6359_accdet_probe,
 };

-- 
2.48.1


