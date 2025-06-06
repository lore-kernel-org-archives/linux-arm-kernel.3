Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E649DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRd4ur1MxwweTZhmC9CjPu38e9ravuus4YivxoH7F70=; b=xK2KbXUA+SdMNXNHfYVpzqI1lr
	aznBJTsTFYZK7hiGCW9zwLSZqmd7IfljyBqTfUyaRu8/S9rziTUrNixieZv9s7k3+htU+ezB7OFkD
	yICZlktMOJSN8fE9IBN6BRn0Rb39DVz3OzomGX8UAPr2qO5dab5TPmY0flBZ+H7G9s1VN5SRFcjDH
	ONvD0BC6QFDyOSJ1Jwx/PlpDYEG1fvDzXgNO8TQbxgDu60O/KDFyFVyf+nU01nMg42Zqg1EfUxv06
	Wq+nQIIuPHwPEjiKZ5CtoxQvOEQzYsB3ipXxyjs4axCIbtz0WcjhutVbzsfGRJabtY6Ol/VnauYva
	DyY+BW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTFt-0000000HW0X-1tjw;
	Fri, 06 Jun 2025 09:20:53 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTDj-0000000HVbE-0A1D;
	Fri, 06 Jun 2025 09:18:41 +0000
X-UUID: 3707058a42b711f0b29709d653e92f7d-20250606
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ba957775-8084-4581-8059-f72bac177ada,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.45,REQID:ba957775-8084-4581-8059-f72bac177ada,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:7a7964884435b7d237d8f7b7833b5074,BulkI
	D:2506061718321CJJ18PR,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2,TC:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 3707058a42b711f0b29709d653e92f7d-20250606
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 726199745; Fri, 06 Jun 2025 17:18:31 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 1/2] ASOC: rockchip: fix capture stream handling in rockchip_sai_xfer_stop
Date: Fri,  6 Jun 2025 17:18:21 +0800
Message-Id: <c374aae92c177aaf42c0f1371eccdbc7e9615786.1749201126.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1749201126.git.xiaopei01@kylinos.cn>
References: <cover.1749201126.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_021839_411938_1EA185AD 
X-CRM114-Status: GOOD (  10.19  )
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

Correcting the capture stream handling which was incorrectly setting
playback=true for capture streams.

The original code mistakenly set playback=true for capture streams,
causing incorrect behavior.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/soc/rockchip/rockchip_sai.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 602f1ddfad00..916af63f1c2c 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -378,19 +378,9 @@ static void rockchip_sai_xfer_start(struct rk_sai_dev *sai, int stream)
 static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
 {
 	unsigned int msk = 0, val = 0, clr = 0;
-	bool playback;
-	bool capture;
-
-	if (stream < 0) {
-		playback = true;
-		capture = true;
-	} else if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		playback = true;
-		capture = false;
-	} else {
-		playback = true;
-		capture = false;
-	}
+	bool capture = stream == SNDRV_PCM_STREAM_CAPTURE || stream < 0;
+	bool playback = stream == SNDRV_PCM_STREAM_PLAYBACK || stream < 0;
+	/* could be <= 0 but we don't want to depend on enum values */
 
 	if (playback) {
 		msk |= SAI_XFER_TXS_MASK;
-- 
2.25.1


