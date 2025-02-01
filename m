Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAD9C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 00:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yUp8gIamITNTXKVgHV8c7KipsP99RyQ4CH6ynQ6dYic=; b=XvdePSqi6WD5dbuVplkcn3kBdQ
	z/C+YtiIonP4XfIxPxiU8+Ftj6yzsqlpOykyu0yj8/LdpBSMUHUgT5WpLPdAtJy3wExvxmw4e1937
	c946ehZJOaW3Tmt2rEutglEWxwXeok60DinodB0hdEOWuUC+0rsj0RpGK2owW3+++KFXsh2Tqabhu
	HszUXPTtuFGKjcJ+ViHwPhV3LGrRKM9U0SizYBQ0Iv5bPl8M4d3CdXNl0VWCULSzN+/4IgzrkO8ih
	HJhoOq/kVKBysvvvbayoICwTcaaNMbf0+TwF+GlZnk2EzZTolVKVVyMhy6enx1ITL29Tk1L5wibqe
	iNSEB0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te1jn-0000000Bhz6-3bxf;
	Sat, 01 Feb 2025 00:51:55 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te1iU-0000000Bhl3-0VhU;
	Sat, 01 Feb 2025 00:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=yUp8gIamITNTXKVgHV8c7KipsP99RyQ4CH6ynQ6dYic=; b=HUJcy39lMxUXStXz
	6bUsXiUrd/32C/YFSorb+y7RKX6GZoMOhHg+GA5l4mbVhRYm6CK5gcj0UvwR7OSeuJmM9Q6DfzUpK
	XjSrJdpwrBOezf2U939lpIkEUkIeRACZWYKl7/Jd0jIHPI4Av/hKgFFxti4eILQlFTbYhRj49vl2q
	ygCL0ae+9L/9NfkDnuREx6JUU5surcQViAllbpnYIUSQjioDVCR6OiUkzFAwtWDWKkfN9eBd7pHy4
	0TzTnE1KkwMo9yxXaNgxnLEudxkk32i/mPKWpfBOIuS0HCT/mVn9IorxULM4ScLYysprtHXUjovYR
	rssdPKVQjOHqiAod6g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1te1iH-00D1GY-2d;
	Sat, 01 Feb 2025 00:50:21 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: mediatek: Remove unused mtk_memif_set_rate
Date: Sat,  1 Feb 2025 00:50:21 +0000
Message-ID: <20250201005021.447726-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_165034_250629_3199C1F6 
X-CRM114-Status: UNSURE (   8.38  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mtk_memif_set_rate() has been unused since it was added in the 2019
commit 9cdf85a19b3a ("ASoC: mediatek: common: add some helpers to control
mtk_memif")

Remove it.

(The _substream version is used, and is left in)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 20 --------------------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  2 --
 2 files changed, 22 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3044d9ab3d4d..3809068f5620 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -500,26 +500,6 @@ static int mtk_memif_set_rate_fs(struct mtk_base_afe *afe,
 	return 0;
 }
 
-int mtk_memif_set_rate(struct mtk_base_afe *afe,
-		       int id, unsigned int rate)
-{
-	int fs = 0;
-
-	if (!afe->get_dai_fs) {
-		dev_err(afe->dev, "%s(), error, afe->get_dai_fs == NULL\n",
-			__func__);
-		return -EINVAL;
-	}
-
-	fs = afe->get_dai_fs(afe, id, rate);
-
-	if (fs < 0)
-		return -EINVAL;
-
-	return mtk_memif_set_rate_fs(afe, id, fs);
-}
-EXPORT_SYMBOL_GPL(mtk_memif_set_rate);
-
 int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
 				 int id, unsigned int rate)
 {
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index 8cec90671827..b6d0f2b27e86 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -42,8 +42,6 @@ int mtk_memif_set_addr(struct mtk_base_afe *afe, int id,
 		       size_t dma_bytes);
 int mtk_memif_set_channel(struct mtk_base_afe *afe,
 			  int id, unsigned int channel);
-int mtk_memif_set_rate(struct mtk_base_afe *afe,
-		       int id, unsigned int rate);
 int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
 				 int id, unsigned int rate);
 int mtk_memif_set_format(struct mtk_base_afe *afe,
-- 
2.48.1


