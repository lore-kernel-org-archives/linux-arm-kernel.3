Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4A1D6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cSfbpLVsX9/TkPoZeYAo1LTKkWTtGCuWPTBpyIKZtrA=; b=ofh0bJV4Nzb1x/L1EvYw45iPjN
	A44G3RjudlchlJhTzV8MIy/mMyAaJsbnKxjsdJEVwTuL1Y0PZ+nEa9D6HdevZUbups67KFDPT4zxk
	vzKlMrkmCckmUsWEhB/9w1gfRhuho88mwnselPpdrqbylJF6Q9uTz3XH6ZoUrAkO5IGNi4EWyu7ym
	yk/BHVR3gMNbc7+B44XT/hVA+UByUr0rBO4yTdBVj3FA7ZZT/e7Fb3p2SnVyINETrDmyYG/z9GQ1B
	aknPYow5GPAbeAdkyEUoHS8gQ/LdmCJtSX4OLBqbPLdWjW54OxTdK/kPTOgnGCY8ra666MLD+uvho
	JREPeTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBskJ-00000002DNf-0KPx;
	Fri, 15 Nov 2024 09:36:07 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsjM-00000002DCo-3CHZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:35:10 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7673715c17d9-2c7f6;
	Fri, 15 Nov 2024 17:34:58 +0800 (CST)
X-RM-TRANSID: 2ee7673715c17d9-2c7f6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1673715c2037-f4c40;
	Fri, 15 Nov 2024 17:34:58 +0800 (CST)
X-RM-TRANSID: 2ee1673715c2037-f4c40
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	ardb@kernel.org,
	peterx@redhat.com,
	joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] arm64: asm: Fix the cacography in pgtable.h
Date: Fri, 15 Nov 2024 01:34:56 -0800
Message-Id: <20241115093456.7310-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_013509_371170_6FBE28FB 
X-CRM114-Status: UNSURE (   8.32  )
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




