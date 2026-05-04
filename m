Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE13CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wyQWAFQp3LGAr7U5fSrIJ2+rXIPTk9pvcU/79Oj4GGQ=; b=vL6mQG8gzz287xnYWuQ2TyH+Cb
	K6FxbfLIYJSNJVtntFQXnBqpy6jGFuYsAZShE2n3fWMm9DTP3N4514HujVQJ8C88axRHK3hc5lztG
	bHMXCHvgugH2evcycBH9ytPd7vpbLiOOm2LJzfJWaLSwV13pGHErJzGW/MftYIFXxg1dJ130mBhND
	uCzZP2jVgi90H8/efVAtsD0RYu+kbhfvEC/uunRDH9xMP8WvLtAiNUeN1kvMdIS9VFimVD0qNcoqx
	yqVBZdT+d1jlCEjLeIuFrwtvTaHbUkfCpLaEMxL2a8Zi2qRl0dkvpqjkLGn/SdkqOWwR94+mIDrb/
	neCnE+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnHn-0000000CYPa-3Arz;
	Mon, 04 May 2026 07:00:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnHm-0000000CYPH-2JWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 07:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7649E60120;
	Mon,  4 May 2026 07:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C23EC2BCC9;
	Mon,  4 May 2026 07:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777878009;
	bh=HYE+2VXomDM5alKWkGo/zugLFJRNpUaW/PT9zTrCdW0=;
	h=From:To:Cc:Subject:Date:From;
	b=HgWnepWUeIz0CCNkXwC7eHebgLU5wI2fbwVtCUditlMSUphZp8wbqiuACSxqgE4A0
	 /x0jVKOPCSfhN0JOHPHF/ywRivDdHqfE9+Uhyf3an1+dBtEIFZA+c2nSRGhBrzfZAl
	 nRgU6IvXAU0acGWgpc1OUnZ2Yh/PIW+CcReh2QZIty0OjB/0webTUH9mUpsvChkWwV
	 foFXiiAjGcHkAAIJo7tVdmoYPrOJs/wKYmhYlb7QnDTenx/C6wcbv8If06kDMqt29i
	 K1Ulem0E/BNjdv0jm0I/kILCE4Ufpl+FQxJ9Qh6C23n/f2VRswacN/Wr6nvzkzpzkT
	 Lnk9fS7/770SQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: kprobes: test: add MODULE_DESCRIPTION
Date: Mon,  4 May 2026 08:59:46 +0200
Message-Id: <20260504065957.2040055-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

All loadable modules must have a description, and since commit
6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()"), the kernel build
warns about it missing:

   WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o

Add the missing description tags. Noticing that the existing license tag
is unnecessarily hidden in an #ifdef section, remove the #ifdef and
use conventional placing of the initcall and module_exit tags as well
as the license and description.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/probes/kprobes/test-core.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
index 7a2baa135f0f..2de28088dac8 100644
--- a/arch/arm/probes/kprobes/test-core.c
+++ b/arch/arm/probes/kprobes/test-core.c
@@ -1649,24 +1649,16 @@ static int __init run_all_tests(void)
 
 	return ret;
 }
-
+late_initcall(run_all_tests);
 
 /*
  * Module setup
  */
 
-#ifdef MODULE
-
 static void __exit kprobe_test_exit(void)
 {
 }
-
-module_init(run_all_tests)
 module_exit(kprobe_test_exit)
-MODULE_LICENSE("GPL");
 
-#else /* !MODULE */
-
-late_initcall(run_all_tests);
-
-#endif
+MODULE_DESCRIPTION("Test code for ARM kprobes");
+MODULE_LICENSE("GPL");
-- 
2.39.5


