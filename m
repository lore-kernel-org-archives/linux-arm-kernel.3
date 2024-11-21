Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E378D75BA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfR0TzUMvq7KDfEvPpiSoNUR3NrHiRq6/8t1PUDZT/A=; b=lvdX2Ns+fWM18pnu3DmNhnMB4Y
	mtAsihTKk7d7wVN6Ny5yAIejj5VQYDDZd+08zpzOjMHo24ikHwpFkfJlLgmXSESm5jvszf58vZ5F6
	3WIV1IjPiGZQo/gRfCrS2BUcRxOI5eek7+3gSpZw/Ki3TR1jyIdtlwVG//+0lm4GlCOH17zuqiz2/
	xugKmbqUwtnWqPrI9Qnt0ESRxgXcbbvYw4aTN80GZbvk98vyvaqEFOnOj4Po14tyo2nPYGJ752ze6
	6lMs7QkhSOCw1wUbgTMfwoi9Z+8lmBXbq2uz2uvAojb45zJ+LkEefcJX/ho6FuBxnQzaTUNoYZg8I
	7Rljv1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDx8K-0000000Gc6L-2wcD;
	Thu, 21 Nov 2024 02:41:28 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDx7N-0000000Gbwx-3rAx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:40:31 +0000
X-UUID: ebeacc80a7b111efa216b1d71e6e1362-20241121
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:85a52618-bc1c-4517-88d6-fd6292af722f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:15
X-CID-INFO: VERSION:1.1.38,REQID:85a52618-bc1c-4517-88d6-fd6292af722f,IP:0,URL
	:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:82c5f88,CLOUDID:9141f5d206595f2c7eeb1c3031ef7f88,BulkI
	D:241121104009WRZHCVZB,BulkQuantity:0,Recheck:0,SF:19|66|841|38|17|102,TC:
	nil,Content:0,EDM:5,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS
X-UUID: ebeacc80a7b111efa216b1d71e6e1362-20241121
X-User: xiaopei01@kylinos.cn
Received: from xiaopei-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 153133919; Thu, 21 Nov 2024 10:40:08 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] coresight: Fix dsb_mode_store() unsigned val is never less than zero
Date: Thu, 21 Nov 2024 10:40:03 +0800
Message-Id: <122503017ada249fbf12be3fa4ee6ccb8f8c78cc.1732156624.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202410150702.UaZ7kvet-lkp@intel.com>
References: <202410150702.UaZ7kvet-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_184030_287926_C522F21B 
X-CRM114-Status: UNSURE (   8.93  )
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

dsb_mode_store() warn: unsigned 'val' is never less than zero.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410150702.UaZ7kvet-lkp@intel.com/
Fixes: 018e43ad1eee ("coresight-tpdm: Add node to set dsb programming mode")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index b7d99e91ab84..158950243d83 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -640,8 +640,7 @@ static ssize_t dsb_mode_store(struct device *dev,
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val;
 
-	if ((kstrtoul(buf, 0, &val)) || (val < 0) ||
-			(val & ~TPDM_DSB_MODE_MASK))
+	if ((kstrtoul(buf, 0, &val)) || (val & ~TPDM_DSB_MODE_MASK))
 		return -EINVAL;
 
 	spin_lock(&drvdata->spinlock);
-- 
2.34.1


