Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C14DC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 04:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V63vTjuwoFtgGMpJOlXqXBxEmJHYPs9tb/LadwgzozM=; b=3BKZC/S48khnGNWnRmwGRIq6gZ
	0X5mYPlZGMkx7CiG61t9HvyS9pmQCrTJrIrbnSKTB7n2kfn+pEXkTVfbaZ8kLIjpvtfpJ7Pv9d5sn
	BRKz94K0sAbYAgpDyABZR78m/V9IEv985adjAy6iEccZ/IYoMwRLmbShZqKqEv96BUFkEswxqCm6l
	9/mYJYT4rPvOuz575sU6VmPMYQ0rbd/AyMt9+c6j795uyKBmOOFlj8sEHKWijpV7wTMMW0eVM0er8
	x7qElhxT3emh5TVpbCfttFuTsYEA6Tcqc/KzecTh4yDvJ4N3GPI6m9R+B9N99UaWLuSq6ADdgDAEU
	wySGCdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfWl-0000000CWxq-3CXK;
	Wed, 04 Jun 2025 04:14:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMean-0000000CQCD-25fa;
	Wed, 04 Jun 2025 03:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V63vTjuwoFtgGMpJOlXqXBxEmJHYPs9tb/LadwgzozM=; b=mZUcvcCtHnGkCwp/ePixawuAzF
	fAQG/pdUDFyGJUy8X45nQf5G5x642JbNAyNJxzL4uHiqKsuyXvYcfVtMonWShXovzWWCWvYIBMMSW
	cNVYYdPTJFyGNHnIqfnaSF+qUcpA6WspkFPrDdG5cEkIcfQIT44q4vho4sAuHjRjOss9+89UuQ6Ta
	Zn1IbvYlaKzlESYdYE8sqVK6OsEkhEl2AfVblJCAb34AGzkElBmyweFMlfaIiu9+ONi/f/rho+cCF
	lH3aMpPMu0MUOafB4Jiztd/JQ+3QgXQadCnDiusLvvKq4SuaSu/w8WyICPg0b+lGKJgRgc2fNc/G3
	SUj7Wj+Q==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeah-00000000quC-3gWh;
	Wed, 04 Jun 2025 03:15:03 +0000
X-UUID: e9d6c1a440f111f0b29709d653e92f7d-20250604
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:20a17d1e-75ba-47a2-ba7d-a6d74aa42065,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:15
X-CID-INFO: VERSION:1.1.45,REQID:20a17d1e-75ba-47a2-ba7d-a6d74aa42065,IP:0,URL
	:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:6493067,CLOUDID:6caa1a8caebfa93cf8e8ac62306754ce,BulkI
	D:250604111342F3O22LJQ,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2,TC:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: e9d6c1a440f111f0b29709d653e92f7d-20250604
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1678508614; Wed, 04 Jun 2025 11:13:40 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
Date: Wed,  4 Jun 2025 11:13:30 +0800
Message-Id: <3b3d8f60e553af09a51b501b8ff5406fa5e898dd.1749006565.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1749006565.git.xiaopei01@kylinos.cn>
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_041500_626880_2CC8DCC3 
X-CRM114-Status: UNSURE (   9.64  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables the clocks for the
whole lifetime of the device. Moreover, it is no longer necessary to
unprepare and disable the clocks explicitly.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/soc/rockchip/rockchip_sai.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 79b04770da1c..2ec675708681 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1448,16 +1448,12 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 				     "Failed to get mclk\n");
 	}
 
-	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
+	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
 	if (IS_ERR(sai->hclk)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
 	}
 
-	ret = clk_prepare_enable(sai->hclk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
-
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
@@ -1512,8 +1508,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	if (pm_runtime_put(&pdev->dev))
 		rockchip_sai_runtime_suspend(&pdev->dev);
 err_disable_hclk:
-	clk_disable_unprepare(sai->hclk);
-
 	return ret;
 }
 
-- 
2.25.1


