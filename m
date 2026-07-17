Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC3BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e81EwndPalDoXzMLtNhDlxJZBeLj3gDP1COUL+//v8w=; b=1f1h45GoTz+S7gtVvFDpzb7v/K
	OPnyKB7t/6Yb84eyAPvGi0xltTR5tzOIFz3alqaoaO5PvZmv1G5jxyCx2ONRLkwaz09cMPs5Fipwt
	L5bXBwQSwSOxXM5K3HOiZgOEx7AgNYe4NIXFBkaFUJJUOLvWsiB+j3ZMmcsEmXy3fGV7sw85YnUcK
	+U91QLxatbA8D5ZYa712QpTrlwbh/Lulu3NF4bB1EkFWlTURr3duV9+pLqx0EYzDQKP5dxhPkkjA0
	yJlFLciF3+4iBlnIMrFYdWnoxkTKjPmZavhknbm9YPu+UUYXnkkZGpi86t/rNCrAaANdoAdCyaIRY
	FityoT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZ9u-000000012OZ-46Kf;
	Fri, 17 Jul 2026 03:22:43 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZ9s-000000012Mz-1aYF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 03:22:41 +0000
X-UUID: bf4dd862818e11f1aa26b74ffac11d73-20260717
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR
	SRC_UNFAMILIAR, DN_TRUSTED, SRC_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD_SPF, CIE_UNKNOWN
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a999c516-24a0-4573-88fe-43b39c85209c,IP:10,
	URL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:a999c516-24a0-4573-88fe-43b39c85209c,IP:10,UR
	L:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:4fb377d159e8226ace2a2365fec7b968,BulkI
	D:260717111720B6FB7LKL,BulkQuantity:1,Recheck:0,SF:17|19|38|66|78|102|127|
	850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:
	40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BR
	E:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf4dd862818e11f1aa26b74ffac11d73-20260717
X-User: wangyan01@kylinos.cn
Received: from localhost.localdomain [(39.144.194.166)] by mailgw.kylinos.cn
	(envelope-from <wangyan01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1467463435; Fri, 17 Jul 2026 11:22:32 +0800
From: Wang Yan <wangyan01@kylinos.cn>
To: xuwei5@hisilicon.com,
	linux@armlinux.org.uk
Cc: haojian.zhuang@linaro.org,
	nico@fluxnic.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Yan <wangyan01@kylinos.cn>
Subject: [PATCH] ARM: hisi: fix device_node reference leak in hip04_smp_init
Date: Fri, 17 Jul 2026 11:22:27 +0800
Message-Id: <20260717032227.64214-1-wangyan01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_202240_716843_0C96629D 
X-CRM114-Status: GOOD (  10.99  )
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

The function hip04_smp_init() uses of_find_compatible_node() to
acquire three device_node pointers (np, np_sctl, np_fab), but
none of them are released on the success path or on error paths.
This results in reference count leaks for the corresponding
device tree nodes.

Fix this by:
- Initializing the three pointers to NULL so that of_node_put(NULL)
  is safe if a node was never acquired but the error path is taken.
- Adding of_node_put() calls for each acquired node on both the
  success path and the common error path.

Fixes: 9cdc99919a95 ("ARM: hisi: enable MCPM implementation")
Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
---
 arch/arm/mach-hisi/platmcpm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-hisi/platmcpm.c b/arch/arm/mach-hisi/platmcpm.c
index 258586e31333..89c8271763c9 100644
--- a/arch/arm/mach-hisi/platmcpm.c
+++ b/arch/arm/mach-hisi/platmcpm.c
@@ -264,7 +264,7 @@ static bool __init hip04_cpu_table_init(void)
 
 static int __init hip04_smp_init(void)
 {
-	struct device_node *np, *np_sctl, *np_fab;
+	struct device_node *np = NULL, *np_sctl = NULL, *np_fab = NULL;
 	struct resource fab_res;
 	void __iomem *relocation;
 	int ret = -ENODEV;
@@ -331,6 +331,9 @@ static int __init hip04_smp_init(void)
 	iounmap(relocation);
 
 	smp_set_ops(&hip04_smp_ops);
+	of_node_put(np_fab);
+	of_node_put(np_sctl);
+	of_node_put(np);
 	return ret;
 err_table:
 	iounmap(fabric);
@@ -341,6 +344,9 @@ static int __init hip04_smp_init(void)
 err_reloc:
 	memblock_phys_free(hip04_boot_method[0], hip04_boot_method[1]);
 err:
+	of_node_put(np_fab);
+	of_node_put(np_sctl);
+	of_node_put(np);
 	return ret;
 }
 early_initcall(hip04_smp_init);
-- 
2.25.1


