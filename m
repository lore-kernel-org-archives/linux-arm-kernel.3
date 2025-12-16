Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEAFD5E370
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TMQjV9M6xknV3fX6npfTwFh5rCyAtMk1NHWm6l2FYsM=; b=T+5IF/kBbK6iR0/MFkY3Cl+kBr
	ztCt8AKYXl1Df+mWsSbAQvx3xxIZ4+bWwbU58sYef5WGU1DXjlzUUmM7+Pir6RoESzW4oVK8EhBlX
	BRJVZaD1pKRCZ+Fcja1ErM/JXDU+yHMKL2GCfByMB04pNyyZBOPVVpXIa+XhP0oNsJUxhD7HuBCqH
	6kBcf3RW/n3T1DuX5/l7tWb/wt3rWQVvQjIvpq3hQBNn86uCnVW7n/+nw7mT/UEO4YiPxNkFsraOU
	GOgoDrrWCDMH8r/ZO+YGeS59vizQUMLzl5tnY82bnAieQJNjXEwn5IfRUhvu3ZXa5dJ4vjyzQbjRT
	qRCqgFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW1g-00000005LHR-2AMx;
	Tue, 16 Dec 2025 14:27:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW1f-00000005LH5-03Uy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B225C40346;
	Tue, 16 Dec 2025 14:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C76EC4CEF1;
	Tue, 16 Dec 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895261;
	bh=QdLkOuh3yfjXqnCRwL0PfHBAIt4oRHGu7KJeW9xmhOU=;
	h=From:Date:Subject:To:Cc:From;
	b=ljkMt4zTzCcpZyKjnyxGNKK97xqdcxvqWjkHMjzeoIh0h0vVSYHMw0PrGXdiaZIDz
	 kDamfR/BFIYixgOaR/UTD0A7EJW5ZeIONIhCgf91cICjVypVEhDz/F6mjvdBGlJF8C
	 rsNA/qV4yj7OzGViZdPexf9MBhqapNySzMKTvjkIWvTzo4i4eL29+boKErsR5GhQlK
	 P13EhrAye++z7++KcyTa2nFMp6oCQV9U9fnWTTEyybO5Gl3yUfn0aVk19vXHelRTOo
	 xe1A2an8MymMMgpWBhbRsUr/eu6pAMTByZq+nFbcvoN6bDYNeUapvzzmL6XKZQWlzK
	 uOH6JjFh+6jdw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 16 Dec 2025 15:27:37 +0100
Subject: [PATCH v2] ARM: entry: expand comment in __switch_to
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-comments-in-switch-to-v2-1-190d8741db14@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQrCMBBFr1Jm7cgkRJu68h7SRUjHdsAmkoSql
 N7d2Au4fA/++ytkTsIZLs0KiRfJEkMFfWjATy6MjDJUBk3aKNIWfZxnDiWjBMwvKX7CEpFYG2O
 JrelOULfPxHd5791bX3mSXGL67DeL+tl/xUUhYastDdSdW+Xs9SHBpXiMaYR+27YvhTIGjbsAA
 AA=
X-Change-ID: 20241028-comments-in-switch-to-0e24480e8495
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_062743_082738_912E9365 
X-CRM114-Status: GOOD (  13.59  )
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

From: Linus Walleij <linus.walleij@linaro.org>

As per discussion between the developers in the mail thread
linked, expand the comment in __switch_to so that readers
of the code understand what is going on.

Link: https://lore.kernel.org/linux-arm-kernel/ZxDh9biUbf9W8gNN@J2N7QTR9R3/
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebased on v6.19-rc1
- Link to v1: https://lore.kernel.org/r/20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org
---
 arch/arm/kernel/entry-armv.S | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ef6a657c8d13..5c016c68b5a3 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -557,9 +557,16 @@ ENTRY(__switch_to)
 	ldmia	r4, {r4 - sl, fp, ip, lr}	@ Load all regs saved previously
 #ifdef CONFIG_VMAP_STACK
 	@
-	@ Do a dummy read from the new stack while running from the old one so
-	@ that we can rely on do_translation_fault() to fix up any stale PMD
-	@ entries covering the vmalloc region.
+	@ For a non-lazy mm switch, check_vmalloc_seq() has ensured that
+	@ that the active mm's page tables have mappings for the prev
+	@ task's stack and the next task's stack.
+	@
+	@ For a lazy mm switch the active mm's page tables have mappings
+	@ for the prev task's stack but might not have mappings for the
+	@ new taks stack. Do a dummy read from the new stack while
+	@ running from the old stack so that we can rely on
+	@ do_translation_fault() to fix up any stale PMD entries
+	@ covering the vmalloc region.
 	@
 	ldr	r2, [ip]
 #ifdef CONFIG_KASAN_VMALLOC

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20241028-comments-in-switch-to-0e24480e8495

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


