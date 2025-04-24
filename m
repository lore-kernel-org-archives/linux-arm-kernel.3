Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53E7C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=; b=L4CeFcHzIHulRDjvJznWqjzLxj
	x2jhHfhqtNzaU4oRnJEq15hr/NcBfcmtCOBDh9NzCPuqmMRtn+GXwC8m/au/FBhv1NPn6WbSJALSA
	90W1/lduwA52YIKPkCeeBEkwcUAjWFUBmHYZgQ7PdfF6buNCksHpneZOGOjX7d/8YeeXH56rrALaE
	St644uyhUmIqVJ0gfiQA+IIPb4Dc1FKJD4nwNL0VLzgMZnUJW6dlGt4T8cqLRAq1Hb9DWJWa9Omtx
	MVJvs5nksUVtsjlPJyLHkjN8KptRvwD7BQbvIP9Iq4cke6PocvyP7sQ5ohV+PLtxL2BRbuKbMgvfF
	zsFauTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vXb-0000000E0Xn-129q;
	Thu, 24 Apr 2025 12:18:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm9-0000000DfYj-2lCL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2264aefc45dso12694505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490349; x=1746095149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=;
        b=ajZRLtwhQ3cZOxg88HOa59iHyhyli2o2ge3jSi5egScKBAasattan+rTD7G6QENoC4
         uAipZipzROmgWjZbNs9leV8uJiJWd3TXxqDYd6zO0aoYmx+yf1mMwk4s/0BudZz+9bDQ
         CtoUf/XpGOgehj6Xe0UGCSFcOl2cWLDLf5e7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490349; x=1746095149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=;
        b=XLrG+tvTDqBCoMwvxh9rolo8dZTI0PuTaWkhkLyVPDgiAnigZuFPUjX6Wxxd7CywP7
         muWRCD5DveVqxTX6zoWujgKS3eeIviF+IX3bWaaW2F7pK5/4nlFXTYUIYH/+xhbg/wqS
         1iHoZOn9TAetQW+n6Kg45cTYoiGim6YpVz+Gd/ib1qFi2DEx+dMadsLk35oHOnIWZqqG
         ey2bNSm7UKTMeHAr62S976LgDb2slNfS8YMFhzRJeOW+L5y2YuIJZgGo3v7RGdvIZ2bd
         rQ7kGhf6oR/RyQrGsIzb0ejP5vFOBljymz2Org+LkfzjkOiePl9g8KludqEykZLVZcqC
         QWOw==
X-Forwarded-Encrypted: i=1; AJvYcCVY2ezl2A6IPyibSR5dps8OJflDXZsU+7u97l8TLQsM0c3LEmwNdNX/9ng93s84ofQe7WBxM+6VCiaQXGbvhIH0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuz/zz4YgH0yK8NF3hVdY+99SECUB7BCiNavUSH+Ca8Ru+rN2t
	U1VWPZ8LFj7lyYdmu7pwk8uvHqOaOR6B1q41hyO8JZtfNR0jivekNb9qfLhIkg==
X-Gm-Gg: ASbGncsO6ba2eUANl4Eigy8it305eZN2ozTBN09AI66LWACuL2kI7L55k4EwuuC2brm
	tu/LxFcJEq2j7TxXG5smCf5uzbjrMX6KdVsYYCmwoQ2x4qIu/QdaEklUPCmRshstGNL953ZkE9e
	PGiWtQLvsxXXkyS3R6GuZc/rp03dR+2HS69aUI8u1jjiCRNPDgstwSpYN12BboNhMIN2OV3Vt4F
	j85o4Bg5TWJgwheT5oRFcRR/DWbfJJ9M3oiqO0DsT/YXH4idbn2mGZ9hXWzy/kGNADooTF6En4t
	fh8k41aFe7D9brs3QENn5+xk0UWy7SMA5fLgbIuhTSdlGSn/d55fe7k5zA==
X-Google-Smtp-Source: AGHT+IFt0XUOGJk3Ud4+wtbFjwGwTHDAiFvZxN/Xk3zgndqYjVRMpy5Cx4zWYWH17RjjMOdqNLFarQ==
X-Received: by 2002:a17:903:183:b0:223:8256:533d with SMTP id d9443c01a7336-22db3dd0a8cmr28683815ad.46.1745490348905;
        Thu, 24 Apr 2025 03:25:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 24 Apr 2025 18:25:03 +0800
Message-ID: <20250424102509.1083185-10-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032549_697253_E9556286 
X-CRM114-Status: GOOD (  18.77  )
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

The probe and remove functions in the mt8183-afe-pcm driver repeatedly uses
`&pdev->dev` for |struct device *|, but then assigns this value to
`afe->dev` and uses that in other places in the same function.

Store `&pdev->dev` in a local pointer and use that exclusively to avoid
the numerous dereferences and to make the code more consistent. Lines
are reflowed where it makes sense.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 37 ++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a3c8054a434f..d63b7fe19fbf 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1114,27 +1114,25 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8183_afe_private *afe_priv;
-	struct device *dev;
+	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
 	if (ret)
 		return ret;
 
-	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, afe);
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
 	if (!afe->platform_priv)
 		return -ENOMEM;
 
 	afe_priv = afe->platform_priv;
-	afe->dev = &pdev->dev;
-	dev = afe->dev;
+	afe->dev = dev;
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -1179,7 +1177,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
@@ -1187,7 +1185,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -1245,7 +1243,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
 		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
+			dev_warn(dev, "dai register i %d fail, ret %d\n",
 				 i, ret);
 			goto err_pm_disable;
 		}
@@ -1254,8 +1252,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
 	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
+		dev_warn(dev, "mtk_afe_combine_sub_dai fail, ret %d\n", ret);
 		goto err_pm_disable;
 	}
 
@@ -1267,16 +1264,14 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
 
 	/* register component */
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mtk_afe_pcm_platform,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_disable;
 	}
 
-	ret = devm_snd_soc_register_component(afe->dev,
-					      &mt8183_afe_pcm_dai_component,
+	ret = devm_snd_soc_register_component(dev, &mt8183_afe_pcm_dai_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret) {
@@ -1287,15 +1282,17 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8183_afe_runtime_suspend(&pdev->dev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8183_afe_runtime_suspend(dev);
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
-- 
2.49.0.805.g082f7c87e0-goog


