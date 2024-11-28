Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BE5D66BAD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XrzDEONmewWeqLKfsNBp1wCda05Ygprbfvn32s6YrCI=; b=u4Rlhjp2XFmwgIxWu9HO7XyKTy
	bS7mj3Apct0gyV1Z2sIIAtd062sbEXVmlaOvG3Cz8u3jmvsjp6/zfZAgLjLkiryh8PS0O7Obu0aiz
	KS1aO8DU4A7PGE6NY6NKynJvptvP1DJ8jmrsk9BlCddtja6LZlep84jqM82VKAOL37zoATsUGMtb/
	qDqL493c6ih9IB9L4zCEt4KsIj3o9L3LxJhilHgPgcReLzKOHZhHtHtKmuy6xKDle4abeyXGgUTFJ
	Ie6Cvyc4kLulYE8eNkBSFqJtxs+z/BtjT9LtqnmZRwBY1x9zu6B31JUlSuTuNX6vDvQTYMe7LqzwI
	VT/Yr29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYIu-0000000EpEs-3XlZ;
	Thu, 28 Nov 2024 06:47:08 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYHs-0000000Ep6T-2Q0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 06:46:09 +0000
X-UUID: 6b2886d4ad5411efa216b1d71e6e1362-20241128
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:54dd7897-df25-4d86-b676-eedd053d6e51,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.38,REQID:54dd7897-df25-4d86-b676-eedd053d6e51,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:82c5f88,CLOUDID:d0922f9f7799d0b610411b8e44fcc665,BulkI
	D:241128144558SQCFMD0J,BulkQuantity:0,Recheck:0,SF:17|19|38|66|102,TC:nil,
	Content:0,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 6b2886d4ad5411efa216b1d71e6e1362-20241128
X-User: xiaopei01@kylinos.cn
Received: from xiaopei-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1842071045; Thu, 28 Nov 2024 14:45:55 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: eugen.hristev@linaro.org,
	jic23@kernel.org,
	lars@metafoo.de,
	nicolas.ferre@microchip.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] iio: adc: at91-sama5d2_adc: Fix use-after-free in sama5d2_adc driver
Date: Thu, 28 Nov 2024 14:45:50 +0800
Message-Id: <1c67249dbc78678c451a155c04ef908627da6d1a.1732776187.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_224604_914390_5296E89C 
X-CRM114-Status: UNSURE (   9.18  )
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

at91_adc_interrupt can call at91_adc_touch_data_handler function
to start the work by schedule_work(&st->touch_st.workq).

If we remove the module which will call at91_adc_remove to
make cleanup, it will free indio_dev through iio_device_unregister
while the work mentioned above will be used. The sequence of operations
that may lead to a UAF bug is as follows:

CPU0                                      CPU1

                                     | at91_adc_workq_handler
at91_adc_remove                      |
iio_device_unregister(indio_dev)     |
device_release                       |
//free indio_dev                     |
                                     | iio_push_to_buffers(indio_dev)
                                     | //use indio_dev

Fix it by ensuring that the work is canceled before proceeding with
the cleanup in at91_adc_remove.

Fixes: 27e177190891 ("iio:adc:at91_adc8xx: introduce new atmel adc driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 8e5aaf15a921..4ba52b500054 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2491,6 +2491,7 @@ static void at91_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct at91_adc_state *st = iio_priv(indio_dev);
 
+	cancel_work_sync(&st->touch_st.workq);
 	iio_device_unregister(indio_dev);
 
 	at91_adc_dma_disable(st);
-- 
2.34.1


