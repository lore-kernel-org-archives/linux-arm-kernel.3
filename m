Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED7D6DDEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aon26weskPPBc9liMT3fcJXv2jkWh2cVhUaeDDglnDs=; b=Ikomfrn8DngzrbEkOB705jZsnv
	4e3ShRz6Py/IP/a18SONZgQRiQD0X6IYs+z+K+npIMdmziLC6iKVEMOzpvcpzGCpaghsTqZk8Ud00
	lpUx2zCcV2fIkYpiITXIz+4X1dTF6wyO+HOAAZNUXaB5gbvDZwBS/gK1t744ANC/EMCHQk4mGcLJG
	sRdau3KWccdu+vOmu6smn90KJP9s+MwCDXc41EoXu63wySgnMjgBLoASDSp/D87COnguRuxFofkfI
	IW97hvTtjS848SpV3CMCXDrez5Lv3xJIlOggoXc7CKNsrH+RaM7iY9lT0a82HA0JTwXW+RsoldOEg
	CRNE2gmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsyh-00000002FZo-04Zm;
	Fri, 15 Nov 2024 09:50:59 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBswy-00000002F6C-42Jr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:49:14 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee267371914a4e-62a6a;
	Fri, 15 Nov 2024 17:49:08 +0800 (CST)
X-RM-TRANSID: 2ee267371914a4e-62a6a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26737191374d-f98cd;
	Fri, 15 Nov 2024 17:49:08 +0800 (CST)
X-RM-TRANSID: 2ee26737191374d-f98cd
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	ardb@kernel.org,
	peterx@redhat.com,
	joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH v2] arm64: asm: Fix typo in pgtable.h
Date: Fri, 15 Nov 2024 01:49:04 -0800
Message-Id: <20241115094904.7682-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_014913_566383_E4877721 
X-CRM114-Status: UNSURE (   8.09  )
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

The word 'trasferring' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
v1->v2:
	modify cacography to typo

 arch/arm64/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c329ea061dc9..4a5acf522c82 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1338,7 +1338,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 }
 
 /*
- * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
+ * __ptep_set_wrprotect - mark read-only while transferring potential hardware
  * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
  */
 static inline void __ptep_set_wrprotect(struct mm_struct *mm,
-- 
2.17.1




