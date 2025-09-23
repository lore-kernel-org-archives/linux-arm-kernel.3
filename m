Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2018CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WL6+OcHWTMgKHuaivRlMnnLbtbjl+x9y2TqhTItfus8=; b=ZjS/sJgJtjsMBnGVEWPlkwYoJc
	SXMlc238qON06iLELAgtVsuF8vkkdq2nrG7LALuz3L0tLVsiemhCJPPfDbd1qNUEu+ySpvmrAgYqy
	MacO0iGOKlApQsu3UUpUNmHjh0K+6TQCNjAXJ+MQJFLFjvL3sU5+eQY3G49N6AEAcfpRXIX+fUQTy
	/nMZ3cqo4fo91QuTsi7qxZq0Ahyp5K9U58dm8nCAGlwnrFPAClNxkxPdqrWTZGl39d2OeVrm48/VZ
	t1o9g3ZTYmQ3DEPckAVs4T441lanlkfBSp2q2VvgDZ+zGcqRO3KcQ9+6poPPjLkB+p4O4jh5Y9qm8
	5oK2j3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0u38-0000000CH83-2xkb;
	Tue, 23 Sep 2025 03:50:42 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0u34-0000000CH7a-2r7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 03:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758599431; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=WL6+OcHWTMgKHuaivRlMnnLbtbjl+x9y2TqhTItfus8=;
	b=KXSgXUfHOEuH0P30pHXcbWRNTjd3LGWMt5tG6NPoCAEnvGFyGNwzVYLKak9xmg6wKIfjAeFqqKtCatPJrR1ySgn4al5iLx2kNmQQrieHi3GxrnxTZlHa4gx77oqkkxjWXQBxrQIfQyKKGMR7ejFul7breeGSZz8PPsPchCSUSLE=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WodT9v5_1758599425 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 23 Sep 2025 11:50:30 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] arm64: cpufeature: Remove duplicate asm/mmu.h header
Date: Tue, 23 Sep 2025 11:50:23 +0800
Message-ID: <20250923035023.3166679-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_205039_371684_27DDFFA9 
X-CRM114-Status: UNSURE (   7.00  )
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

./arch/arm64/kernel/cpufeature.c: asm/mmu.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=25461
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/arm64/kernel/cpufeature.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4e8021a96993..164605da920a 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -86,7 +86,6 @@
 #include <asm/kvm_host.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
-#include <asm/mmu.h>
 #include <asm/mte.h>
 #include <asm/hypervisor.h>
 #include <asm/processor.h>
-- 
2.43.5


