Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBBCD637D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJFVC3fis/05UsQDK8qfEkwI5n2lDb6/nzguQjtJm6o=; b=pXR6ye9anmIcuT5gcOPHbq2r3Q
	ZKDPCpdUSO3/Z2Y8qiW5hWxJryuOSYyHUnMzr8hPZA9zztuOOnffMx6nPz+PCDhI1MQ3JXUeCiMX1
	fVMoLd2QVzlLabnY/yyrClQVFjUOf737NE4PudyZeDerXvURsdNjH5vsOHyRD47mYQYTmClvMiLRY
	R/m4+RoFRPyTZiaPFF2KDJWWjapS4rTFZGlmInQ3S5d0f6riu9w/EDts4p+DfUZZmGLciKeQOupR5
	ljkQqgeR7iYCfMb63JiURCnn9RKyZ0MOA0EYiLL/95z9UKLJjXoK8yWaE4Sv00It8b8VSyUq86scZ
	ZGBLA+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOYg-00000008QNz-0xwK;
	Thu, 14 Nov 2024 01:22:06 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOWp-00000008Q5x-2YY9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 01:20:14 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1673550426e3-ecff8;
	Thu, 14 Nov 2024 09:20:02 +0800 (CST)
X-RM-TRANSID: 2ee1673550426e3-ecff8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee467355041d0f-8b5be;
	Thu, 14 Nov 2024 09:20:02 +0800 (CST)
X-RM-TRANSID: 2ee467355041d0f-8b5be
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: linus.walleij@linaro.org,
	linux@armlinux.org.uk
Cc: ardb@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Luo Yifan <luoyifan@cmss.chinamobile.com>
Subject: [PATCH v2] ARM: vfp: Fix typographical errors in vfpmodule.c
Date: Thu, 14 Nov 2024 09:19:39 +0800
Message-Id: <20241114011939.296230-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACRpkdb6T5dqgmcVi5m_52uQ4F_wESv4K95Fk1hsZcSaUsY8xA@mail.gmail.com>
References: <CACRpkdb6T5dqgmcVi5m_52uQ4F_wESv4K95Fk1hsZcSaUsY8xA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_172012_207998_6D617705 
X-CRM114-Status: GOOD (  11.94  )
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

Correct the misspellings of "noftify" (should be "notify") and "swtich"
(should be "switch").

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 arch/arm/vfp/vfpmodule.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
index b68efe643..409165077 100644
--- a/arch/arm/vfp/vfpmodule.c
+++ b/arch/arm/vfp/vfpmodule.c
@@ -140,7 +140,7 @@ static void vfp_thread_copy(struct thread_info *thread)
 /*
  * When this function is called with the following 'cmd's, the following
  * is true while this function is being run:
- *  THREAD_NOFTIFY_SWTICH:
+ *  THREAD_NOTIFY_SWITCH:
  *   - the previously running thread will not be scheduled onto another CPU.
  *   - the next thread to be run (v) will not be running on another CPU.
  *   - thread->cpu is the local CPU number
-- 
2.27.0




