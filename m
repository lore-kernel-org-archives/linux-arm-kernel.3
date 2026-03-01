Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7263BFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rkNCIwpd95gM6UrpQvY3OVBpw/8KBNodVmM7Ta8x7Hg=; b=l5A2O7ZTmm+Ln7wrjTkvYLUKsC
	Ugvnd67jCGQHoxHqU2j5eAN+qQfLEA/CZsgV3vuQiRcitC2a+IwZLmyqY1Jph3xmEFB6RcDIhKuJO
	PYWp1IHip2J1oUUQREVUuyKwEDbUWjQ6NsgRavjG1SsidW7Kjhkb2MuM7G9HDX8WHn9Yv6OFziNTX
	g9yyJ45Za75jF3N/5lvMW/0NH9QpzBBTDpjBz8i05lawg5401KiHLF0loE6A7isXbFyVTkI4RtfQF
	jrKU56YcuwuDPkSEYeBV9OEEIxZVZFpBWUTaSRF4Ym5zFq/cwyuW9WM89DTrQUE+jBqQGoBQhynAn
	DsjuTNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVvu-0000000AfGg-35Rn;
	Sun, 01 Mar 2026 01:49:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVvq-0000000AfBi-2R2s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 215E341A28;
	Sun,  1 Mar 2026 01:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF25C19421;
	Sun,  1 Mar 2026 01:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329758;
	bh=2f/4LlmLaQdv+rQoNNgthrk/pCl5uvXoFWD9PYlqA7o=;
	h=From:To:Cc:Subject:Date:From;
	b=KKqwxiQgwcNiWNWjNOKAWiv4oC3v+zNIhPqc0toix+VUe1ES7G7JEpMb7ueGA6WOa
	 dFB18fiKLHukcXw+67if/36+WrD3iELhqlsKuTPUHe+O9fxqsD4NV//M1SWWVHJsyj
	 9RjRtOsoHDmlnbmC3naJUr0xXvoNCzlGu2MbYA4CjS1E3qYKevQjTb4TZ+k5YsK1/h
	 3J6+gkluXolBo5PY8PqoSN9ja62C8AUfaWRRfG4uX1CRk7ZAQTZyZtrtxx0DeJCkB7
	 fmOhy0RW6rSgbhaHAiYOROBxClpLXF565ld176lWD0OX6YsbU9RbC573/lQQxacZ5S
	 +u2VvgQQNfsJg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	leitao@debian.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "arm64: Disable branch profiling for all arm64 code" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:16 -0500
Message-ID: <20260301014916.1713684-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174918_648470_1DD9D496 
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

The patch below does not apply to the 5.15-stable tree.
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





