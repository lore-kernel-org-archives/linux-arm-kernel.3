Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10153FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qvzl1G+ZNXdTaAhdJXsk96+gOP43falCFaLL1T33Y9s=; b=nDHMa/J8AV/brz5qclsR8AUm7e
	5U9+iFRJ30wthUc4i8g7dLlSdVpfPDhvDgpTjveLmQERoKCVdIZkEM5GPo/e/HUqsnLqkVxPil5u5
	1ayvKt2KpWN7ZXyB+Z3dJR1F+SzS6UlJqLdkBHbFs9r8xxpby5lumBEehQLiybOlUNMAz5Cd5Y8/6
	bHJR1CT/lWqxpZbtgLMi8g3r7CODJg5Z9CaMvuX6/O2SWR8V6pDFRkzeb8FXjeuYwYmfZvaa14u4r
	DYD+dvPJwccrvc5yN90uidyCz+GOz7oNqoTlbODg7RwE44GaDJ4R8TgqEoiJZUb/B19ClAR1bxJ8x
	tdovTsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVno-0000000Ac7R-1O8T;
	Sun, 01 Mar 2026 01:41:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVnb-0000000Abuk-2FhJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CC824396F;
	Sun,  1 Mar 2026 01:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675FFC19421;
	Sun,  1 Mar 2026 01:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329247;
	bh=wRIuBqJa1mjTxbWlqcsQlvZamXHhr9wqwEByIjHA7Ds=;
	h=From:To:Cc:Subject:Date:From;
	b=OhAQgWSGtic9IU7X7ZS9/NuolwgI/jWjHDOe5Jbnw+5/0Vrw6Cs60oC2MYc0Ng7R8
	 Thw9y5jlz9Qv78mojBnHZJHg9ibHl0n2S7+7cny93++4N7hL3Q7+gGQDpMuTA4jZMh
	 okRjDYYdQ0LvJfwK50mgqmSYobMyyS0XSXnwNoXH2OjKWQsStr82KUqpS4h46GQdJ0
	 xiqES7d0/iVAooOMRbgJfubtNL3j5AtTkIUNeXkwsD4ARjwq+q/+rDLkQhO1xxcgmD
	 xBYwN0Xf/YY/TwodblKBr7Gz8qZvrYxm8SIS5gYN7Td8PdEQePo0hFrhmI2cMO/09Q
	 PUqpaiTGJztEw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	leitao@debian.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "arm64: Disable branch profiling for all arm64 code" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:40:45 -0500
Message-ID: <20260301014045.1702128-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174047_654407_0E4BA381 
X-CRM114-Status: GOOD (  14.26  )
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f22c81bebf8bda6e54dc132df0ed54f6bf8756f9 Mon Sep 17 00:00:00 2001
From: Breno Leitao <leitao@debian.org>
Date: Tue, 6 Jan 2026 02:16:35 -0800
Subject: [PATCH] arm64: Disable branch profiling for all arm64 code

The arm64 kernel doesn't boot with annotated branches
(PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.

Bisecting it, I found that disabling branch profiling in arch/arm64/mm
solved the problem. Narrowing down a bit further, I found that
physaddr.c is the file that needs to have branch profiling disabled to
get the machine to boot.

I suspect that it might invoke some ftrace helper very early in the boot
process and ftrace is still not enabled(!?).

Rather than playing whack-a-mole with individual files, disable branch
profiling for the entire arch/arm64 tree, similar to what x86 already
does in arch/x86/Kbuild.

Cc: stable@vger.kernel.org
Signed-off-by: Breno Leitao <leitao@debian.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kbuild | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99b..d876bc0e54211 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# Branch profiling isn't noinstr-safe
+subdir-ccflags-$(CONFIG_TRACE_BRANCH_PROFILING) += -DDISABLE_BRANCH_PROFILING
+
 obj-y			+= kernel/ mm/ net/
 obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/
-- 
2.51.0





