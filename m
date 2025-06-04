Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AB4C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5tJfWsZg4D5KKF09o2j+UH7TIHcW+5LN/4ZYf9xWmI=; b=nbpFfOMsEzmPz+FoGaigSgsiUL
	QAVtosnRg4c24VtCK6uIiepY8PPifRgG1Q60uFq2Nj3hdmNGoA5uY0hj2qL0afpJ5aicoWudcf0al
	HgWAZwPQczjVUgjg2tag/UUCHsrkwuAJSeR6SjRZrZ1L2XPKrNOOsnaVKSNUgb0pZ7JAXX3DKCb7C
	6CNHk/ZzDvo2qSLDYlvVjBg6ZnqfFuq+gp0j3Otrg+kWv8NszQZz2FNUKt6cfGX+cgOoHqRyPl1Yd
	6ChPnkuQ3Ew8/uniXl6bqTTi/QodmaIWZAf3niISUGl8xvKE9lvDe1IWeJaYZRh2VpEtrUCP1omgj
	bPVkJaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfb3-0000000CXpJ-1S2d;
	Wed, 04 Jun 2025 04:19:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMefR-0000000CQY2-3gjo;
	Wed, 04 Jun 2025 03:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K5tJfWsZg4D5KKF09o2j+UH7TIHcW+5LN/4ZYf9xWmI=; b=dRRBp8IhXQ7nzLDC67Y5Y4rsWN
	KoQ5nNRcukBWbWTHGmBI6wmk3JCBMnCSl4mk5eicizOkXITFuyH31whmnFzH69xVAKjAJ9En3glOr
	4TA/iwkqbq+zGuyVGYaBT9QEt5qqH23DMqK03lfFmpzrSBLoIwX8Ht+leVSyMtuTPlV+89UHZDdom
	SnjEkLQhHt/aBhReBcDNhPyLUWUUj0s0KavpqItUv6q820iDkCpOxAUrvXXDpP5Tszyy70U6uMsSe
	W4lNNKLgCiWb/KWJEtM3nuZP6HPpkCfbTuo0VEHXW1REV4sBusShxVKKGAt3pxQ/mAhj6q2h2JMzy
	cOAV2IDw==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMefO-00000000qvn-1jph;
	Wed, 04 Jun 2025 03:19:52 +0000
X-UUID: e81f4cd240f111f0b29709d653e92f7d-20250604
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:346cf5ee-0cb7-48fc-945a-500199bca67b,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.45,REQID:346cf5ee-0cb7-48fc-945a-500199bca67b,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:9f2decd7cee3c8013ae9919a70940931,BulkI
	D:250604111339G3SRF8AR,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2,TC:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: e81f4cd240f111f0b29709d653e92f7d-20250604
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1639636581; Wed, 04 Jun 2025 11:13:37 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/2] ASOC: rochchip: Simplify the condition logic in rockchip_sai_xfer_stop
Date: Wed,  4 Jun 2025 11:13:29 +0800
Message-Id: <81c7955216f5cc7565a396e50e5474ec8f6e3017.1749006565.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1749006565.git.xiaopei01@kylinos.cn>
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_041951_100246_60A22204 
X-CRM114-Status: UNSURE (   7.47  )
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

cocci warning:
./sound/soc/rockchip/rockchip_sai.c:387:8-10:
	WARNING: possible condition with no effect (if == else)

Simplify the condition logic in rockchip_sai_xfer_stop() by removing the
redundant SNDRV_PCM_STREAM_PLAYBACK branch. The modified logic now:
1. For stream < 0: handles both playback and capture
2. For all other cases (both PLAYBACK and CAPTURE):
   sets playback = true and capture = false

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/soc/rockchip/rockchip_sai.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 602f1ddfad00..79b04770da1c 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -384,9 +384,6 @@ static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
 	if (stream < 0) {
 		playback = true;
 		capture = true;
-	} else if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		playback = true;
-		capture = false;
 	} else {
 		playback = true;
 		capture = false;
-- 
2.25.1


