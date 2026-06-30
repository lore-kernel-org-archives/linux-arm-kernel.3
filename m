Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E417C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hH1eMBtDdYYyVd4idAF6HraFj0giZ+dDBs2le3Kzd68=; b=ad17IucS3gLYB39cNGkiPHLoI+
	Sezz/24cZvVX8GvCLQ/Gp8ZWiU61DCO23k0A64/uMyBsQBER/YVA7OFUT7Q5XKUxBAKuqLS0lzTnl
	PA+/hWBDQjmBoWqAdpZm9TMRu+NdvCqtuVLxBeBNwzahB8UpsyjzL97ydqpxj2wy8qLY0CBH0JIBJ
	puGHvsLkO7VZujspvC9HHLdk0d/KP6NtefEZ0jkqVXk8ThJqDrb8vgllNEZUOLrCFRTV91Clcjcbg
	PBsurU++tZf0DxhN38b4eGwlixLx9ddQtVhnG6p0LebH5QskF0Eu0mG6pguSRD5h9mhqyEDbvFr81
	PTR+r5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUvl-0000000GTcU-2MtU;
	Tue, 30 Jun 2026 09:39:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUvj-0000000GTbJ-3Xjd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:38:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ECCC40730;
	Tue, 30 Jun 2026 09:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4351F000E9;
	Tue, 30 Jun 2026 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812339;
	bh=hH1eMBtDdYYyVd4idAF6HraFj0giZ+dDBs2le3Kzd68=;
	h=From:Date:Subject:To:Cc;
	b=iAH9STaSGTjs8TlkZVqvkr+owg/8PWLS0EQvEa9eNUa+TQRLYqz8MX42RrDPDX9wp
	 DQMr3kiKz5PY4IPYuzl4gd5U9l7Z6b4HciUpHi/Pe88nCE/Pfp8/jWf2h+w2Zw14Jt
	 EjnwwtOxfEPfZc31V+ntwvN1CKapEtwVyS1ntBgt0OUTcISoM5+m2CrqA6muOdyIuv
	 5OCVYHwqE71nOd+qsTBTsB1Fako4c2bHROdz8Z91amwSr8vtXiRiDqj3y//LjlhWdY
	 m/HIlbBlFKFTzcsc+mJPyP98fVWD74HgHN+fPhHgAm+wWxNnd+AiXWfBwHA1GnVfXd
	 395HJELXorZyQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 11:38:55 +0200
Subject: [PATCH v3] ARM: entry: expand comment in __switch_to
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-comments-in-switch-to-v3-1-87a946a3fddd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ6CMBCF4auQrh3TqQWKK+5hXCCMMBFa0xLUE
 O5uwbg0Lv+XzDezCOSZgjgms/A0cWBnYxx2iai7yrYE3MQWSiqNUhmo3TCQHQOwhfDgse5gdCB
 JaW0kGV2kIt7ePV35ubmnc+yOw+j8a3sz4br+EycECbkyspFFlmNlyp5t5d3e+Vas5KS+TIoKs
 1+MAgQsZGNyjc0FdXkjb6n/MMuyvAHX6yKTAgEAAA==
X-Change-ID: 20241028-comments-in-switch-to-0e24480e8495
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20251216-comments-in-switch-to-v2-1-190d8741db14@kernel.org

Changes in v2:
- Rebased on v6.19-rc1
- Link to v1: https://lore.kernel.org/r/20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org
---
 arch/arm/kernel/entry-armv.S | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index a3d050ce9b79..2d2ea3ca880c 100644
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
+	@ new task's stack. Do a dummy read from the new stack while
+	@ running from the old stack so that we can rely on
+	@ do_translation_fault() to populate missing PMD entries covering the
+	@ new task's stack in the old task's page tables.
 	@
 	ldr	r2, [ip]
 #ifdef CONFIG_KASAN_VMALLOC

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20241028-comments-in-switch-to-0e24480e8495

Best regards,
--  
Linus Walleij <linusw@kernel.org>


