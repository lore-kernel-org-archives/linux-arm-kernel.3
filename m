Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E682CC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=74/Est/1I0hUkH2GjNmWywg104Sz2SYPFXigCJk0h+I=; b=aGj5oIYnW+QjpNVPNtS5dTgXrE
	kPtT1pw1TS1ddU09DzvDiTMJydYUT591MVasY7x8pTSCdRJUnzxxuqvMxe31fHPsvxJ8qeVkrFkq0
	PdpZBPMEuWLfg8og/4FFnu9NOzixMQhOkMY32tLWGod7DWyQHwqQEq34oT5q483weThQb/LF1RPUt
	f2/ppeHXH5YdcTrJvuhr9n2RZwbm4vjk8b5VleJajSVu3VWrVe0A8P5Ig+Rqek+/m+bGsQnB/ik8g
	CQwJJ3o+JOn0M9uZI0Umb6jgJkJcGWNm9EDVAM8KJlZN0xrRX3It8g9ifLC6jul5CEOcJubqy0P07
	cYeONBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1m1r-0000000ExVW-0Eyc;
	Wed, 02 Sep 2026 14:33:31 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1m1n-0000000ExTg-0Oyf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:33:29 +0000
X-UUID: 33f6ea20a6db11f19a56ed5b684f684d-20260902
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR
	DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ca505616-d3c9-4786-86f7-e0b21795fe5d,IP:20,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:45
X-CID-INFO: VERSION:1.3.19,REQID:ca505616-d3c9-4786-86f7-e0b21795fe5d,IP:20,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:45
X-CID-META: VersionHash:7db8b62,CLOUDID:8f583ca6c1d2d7f08dbacca7cb9b78d8,BulkI
	D:260902223307NS5NBL2S,BulkQuantity:0,SF:10|66|78|102|127|850|865|898,TC:n
	il,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 33f6ea20a6db11f19a56ed5b684f684d-20260902
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(120.227.38.246)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 310101398; Wed, 02 Sep 2026 22:33:02 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: lpieralisi@kernel.org,
	maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()
Date: Wed,  2 Sep 2026 22:32:55 +0800
Message-Id: <20260902143255.182786-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_073327_806746_2C4904B9 
X-CRM114-Status: GOOD (  10.14  )
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

set_handle_irq() is irreversible: once installed, handle_arch_irq
points at gicv5_handle_irq, which dereferences the PPI/SPI/LPI
irqdomains.  If gicv5_irs_enable() fails afterwards, the error path
calls gicv5_free_domains() while handle_arch_irq still references
those domains.

Move set_handle_irq() after gicv5_irs_enable() so the handler is
only installed once all fallible steps have succeeded.  Drop the
no-op set_handle_irq(NULL) in the error path, which never worked
because set_handle_irq() returns -EBUSY once a handler is set.

Fixes: 183750b276c2 ("irqchip/gic-v5: Fix gicv5_init_common() error paths")
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/irqchip/irq-gic-v5.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b1723..37184942dc11 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1166,21 +1166,19 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 	if (ret)
 		goto out_int;
 
-	ret = set_handle_irq(gicv5_handle_irq);
+	ret = gicv5_irs_enable();
 	if (ret)
 		goto out_int;
 
-	ret = gicv5_irs_enable();
+	ret = set_handle_irq(gicv5_handle_irq);
 	if (ret)
-		goto out_handle;
+		goto out_int;
 
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
 	return 0;
 
-out_handle:
-	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
 	gicv5_free_domains();
-- 
2.25.1


