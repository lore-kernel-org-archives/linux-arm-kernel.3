Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68972C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN6b/UPfDXrCo7Ut2Lz5ENKR4y0gjJfel1AumWeIeco=; b=Z9pMVgC0PY5h64talMaagtA72D
	Rv8qSDdV1rAJCI2ULjR02kUwywe1UVHEDDs76rk6FQcQxUA7Bf5UrITKT/8No+xEVemMw1t+rXRHQ
	JCjzXj11PAltyif7Q5MkNCAmDD9vfdTCOqFFx3HkGRXiQpT70bYTTlLWtBsnqNk55yluxskE54ZEQ
	SQI2HNsiJ3Vd1zn1bhNxVy/Q8MFWRXufX8B0zodEPZ/LVWCNO4AADbd5cMp9Qn87K2q+wi52nCfvl
	J90U2N3XiXWIUKkqLCfOvmqK7R8EpWG4C28p52aM1z2Y4ozMifEqvPpUGyJDHbm2knPgYKSkoi6s8
	4AAe51HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTK3-0000000HWbn-2Oc5;
	Fri, 06 Jun 2025 09:25:11 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTDj-0000000HVbF-1ZUG;
	Fri, 06 Jun 2025 09:18:42 +0000
X-UUID: 384fae7e42b711f0b29709d653e92f7d-20250606
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:07587476-8ac4-4c73-8c0b-f3e67721b9b3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:07587476-8ac4-4c73-8c0b-f3e67721b9b3,IP:0,URL
	:0,TC:0,Content:-25,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:9a30bf3b74591aedaf2c97aae7f9d25f,BulkI
	D:250606171835ZJIVP55Y,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2,TC:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 384fae7e42b711f0b29709d653e92f7d-20250606
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 774779148; Fri, 06 Jun 2025 17:18:33 +0800
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
Subject: [PATCH v2 2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
Date: Fri,  6 Jun 2025 17:18:22 +0800
Message-Id: <84bc40641d05596f1edf4f01d1e6aea16bdbeeb5.1749201126.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1749201126.git.xiaopei01@kylinos.cn>
References: <cover.1749201126.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_021839_703742_7A3A6450 
X-CRM114-Status: GOOD (  12.24  )
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
 sound/soc/rockchip/rockchip_sai.c | 35 +++++++++----------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 916af63f1c2c..0b9f54102d69 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1427,43 +1427,32 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, rockchip_sai_isr,
 				       IRQF_SHARED, node->name, sai);
-		if (ret) {
+		if (ret)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request irq %d\n", irq);
-		}
 	} else {
 		dev_dbg(&pdev->dev, "Asked for an IRQ but got %d\n", irq);
 	}
 
 	sai->mclk = devm_clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(sai->mclk)) {
+	if (IS_ERR(sai->mclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->mclk),
 				     "Failed to get mclk\n");
-	}
 
-	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
-	if (IS_ERR(sai->hclk)) {
+	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
+	if (IS_ERR(sai->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
-	}
-
-	ret = clk_prepare_enable(sai->hclk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
 
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize DAI: %d\n", ret);
-		goto err_disable_hclk;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
 
 	ret = rockchip_sai_parse_paths(sai, node);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to parse paths: %d\n", ret);
-		goto err_disable_hclk;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
@@ -1474,10 +1463,8 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	devm_pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	ret = rockchip_sai_runtime_resume(&pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to resume device: %pe\n", ERR_PTR(ret));
-		goto err_disable_hclk;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to resume device\n");
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
@@ -1504,8 +1491,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	/* If we're !CONFIG_PM, we get -ENOSYS and disable manually */
 	if (pm_runtime_put(&pdev->dev))
 		rockchip_sai_runtime_suspend(&pdev->dev);
-err_disable_hclk:
-	clk_disable_unprepare(sai->hclk);
 
 	return ret;
 }
-- 
2.25.1


