Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB5CDB46D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 01:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92K3IY/Zx8G6RPoa0Q63VX/iKUcwd0tQL10r4/DzRkE=; b=SGGlpNQ1EhKnCbxScJul2Z5ADu
	scSN0Hi91X++75Sfegbhxe9feGhupMAhnGaBwooCaHHxMiQR9IgbK5Tt5WcfCYutSjHi2hOsGDSWq
	VZqxRGAMHd0hoV8oV4NHvfxKSKa/99xIsSZIzlgHjXeDHCPD/gwVafQ6/0I0faAwMdkQgsH9mMI8p
	JGJXK2+6ihfwYev+GpfW68cua5mlashamYStnmtCS66N6QsuKkDKvJvC7LOH7RrVBLMeH2GyKayrr
	mTLtGKtDKk4izMw5u0nK8h5gCCEmuHCnwOjrsaS10hqMh8kqKaFhHXq9UMH+oDu6649aqi/dUomSo
	0w2kya0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJj29-0000000BOdw-1QfJ;
	Fri, 14 Nov 2025 01:55:29 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJj25-0000000BOd9-3kV6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 01:55:28 +0000
Received: from Jtjnmail201616.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202511140954592736;
        Fri, 14 Nov 2025 09:54:59 +0800
Received: from jtjnmailAR02.home.langchao.com (10.100.2.43) by
 Jtjnmail201616.home.langchao.com (10.100.2.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 09:55:00 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR02.home.langchao.com
 (10.100.2.43) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 09:55:00 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDweM_zixZpolYNAA--.21005S4;
	Fri, 14 Nov 2025 09:54:59 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Chu Guangqing <chuguangqing@inspur.com>
Subject: [PATCH 1/1] watchdog: at91sam9: Fix a spelling mistake
Date: Fri, 14 Nov 2025 09:53:58 +0800
Message-ID: <20251114015358.1614-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDweM_zixZpolYNAA--.21005S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWUGFyxAr4rKw4xKw43GFg_yoW3AFgEkr
	WxGa9xWr1rGFW5tr18Zw17XrWFv3WF93Z3uay3Jry3G3y5JrZrurZ2yFyxZw15Xay3Gr15
	AF1DXFsY9F9rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
	3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?nKiBT5RRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KYseAVAYCq0o/n+EQ6lxsTF7AlshF3e2mr2ZRJ6OErjk9hLNC1ZPBp6JPn+jNJ0856dF
	k60rjf2lxx7QdEnl3fw=
Content-Type: text/plain
tUid: 20251114095500bc3efe0f34628d824a63042a2f99fe87
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_175526_212879_EDFFAFEC 
X-CRM114-Status: UNSURE (   8.43  )
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

The spelling of the word "regster" is incorrect; it should be "register".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/at91sam9_wdt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
index 298d545df1a1..cc5d36213aea 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -6,7 +6,7 @@
  * Copyright (C) 2007 Atmel Corporation.
  * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
  *
- * Watchdog Timer (WDT) - System peripherals regsters.
+ * Watchdog Timer (WDT) - System peripherals registers.
  * Based on AT91SAM9261 datasheet revision D.
  * Based on SAM9X60 datasheet.
  *
-- 
2.43.7


