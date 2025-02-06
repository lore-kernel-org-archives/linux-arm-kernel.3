Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C923C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joZkmdV/dAzLK1UShpkitp+TG0brsNHWZrt+dWRUiK4=; b=lr8mGUcUXtw8SZ9fc+QCbFI6mh
	D7WAUpISNsoIsjBiI1HzmJFeJvh3pNfY5t1MHkm8pApGkufZz6dptSBonG2W1sBqdzgOV7ldtsn56
	rp8k6Ovj9njF2Bx9e9U0ZIsZWu8wjfrEY+eK1JwhmhGlWZ4CivTJLCmpWAKZqOstKS3yDkXxPESaK
	93TvKTuxnCG4Vpi0xiDzVlqRhX/L9Jj38JijQVM0D96duyGuxAHcEwcSJViMDL5t5rKHapyHfnBIh
	U/EnHsq4cCLhKY+ZxlTCC4/gw6THPvBjAqNhAUz/JSunugC3nAOs2IIslh+DW1wqBZ2gHSboxSubP
	2H8tQ0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzgH-000000063kR-1Amj;
	Thu, 06 Feb 2025 11:04:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWy-000000061Y0-2Wef
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=joZkmdV/dAzLK1UShpkitp+TG0brsNHWZrt+dWRUiK4=; b=nmRH2Q/i02L0sIDqicBUkoaney
	a8ISkL7DNIX2uHTBm0DS+1LVu8LPmB2TfN7JEXLv/L7kK53Qllsn3k48l011/1SLl6mdlGE8on93e
	bt0EKtrS/iIGTgKHG4L45Lpk/AQxQZbM3ZvjWov2rilPAxjLHXWKcRN4bx2vmUGYJ9DwyQJ3Tyb94
	x1M7U5E2mOOsbYwd+A+GZgwIaSBtp8s/MKxZMMgtQ2lo8Que+09TSCW1R+tZbnGvfoTfc7e8NQZrI
	81QVt6UKoUJImn4G99kpIl1y9l1K1+m87znVLDQKt6TBm0Q4U/TEnl7ye7PpRWAH8usYmxTBgkpGZ
	n9iZI4ug==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWv-0000000Gurp-2pno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43621d27adeso4636125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839283; x=1739444083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joZkmdV/dAzLK1UShpkitp+TG0brsNHWZrt+dWRUiK4=;
        b=Ex80tVEk/ixteZeSbAvEcG7VW/wYjVD6Ygn9nCQ9tUPDOUux9ze4RfSQVAuvFwi6pG
         VDvT9XBgOsHGdSXEShaqZdIOKdqHoyNDNkgmfe+nPNShWNShJuOfJ0+2THg3ocRHnd0L
         eZ6KhFnKrquP7W2M5BCSQFjLnn19eiZl4k1YC2kuYHx1IbrnFJZ5iQQEYMMb973CCRPj
         GoXr1BNDZD1H4b2ZT/wRfn5ptU/tUDgg+EndtqMvSQ+EYXtrd1mh6P3+hnsrAl+OoTmv
         UDPUPdB5gMMN2dfpfYTm7J5+E/pSfXracar/1OzZx8Yh1QBeY90jK1RPO5PgMPxXR/O/
         7LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839283; x=1739444083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joZkmdV/dAzLK1UShpkitp+TG0brsNHWZrt+dWRUiK4=;
        b=VVt8zfujMzud2UItjLnHlLdrcN4DW96Yr1vaRh6T3LTA8t1klK+tu54cHQ81xD/bwS
         U+1MpkHy+Nlnt9qKtjvkb7jhxMR83X5cjqeNtZSy243eX9DCa06PZeF5tFb+1peuDwKF
         5KPR5I0STznVjMvdtq14slKa4yUHo927x1rg5fbM6YgeHYywortv+y/+jX0BfWwFYrM3
         yjIpBPdiHqwjqH1mHaBbX3gC/5LFmFmVl1H5PCU2lmV4F/5ht+538JX3Q6zJQwu53wJy
         dLJZfVqgs81cxfGRKqiNO2P3GbhVV03jKnPTGTJelGP5SGcztcTeZBriKQRW65ExR+Dh
         LCmg==
X-Forwarded-Encrypted: i=1; AJvYcCUHEIsu/N9r11XYXxe2G7DB97q/dpTrZxzoXcY0DQ1WcM2CKhqvIH6rFEc7KwmqbupV94+rJkA3sF1jvbjRhcum@lists.infradead.org
X-Gm-Message-State: AOJu0YyZgRYNoYcyWpxr5pncFA8x8SK1Aq0mp307D0tZMkN7vWsohBmF
	B0jHamOcL6eNLArjkTIT5viB8JLjUgE5ZmI0SOI/wmxudidfw33A
X-Gm-Gg: ASbGncsh3TcB0M1G0uS3DpqRcTLwFAQkxG8VYXILL4SzUVurrayc7x3RJojVuv6WP74
	FPG0lVvyQ7Efl/FyGfkXlhVMwRyTzCzwxaWDpCv0r2JKlsK3NWXkySchpawddRHqH538me6odF9
	xVDuMQxDSRCXfFQuRyQHIDipDUMThVhHR04RBpsHNM9yRmLUmDy+tfsKfRboqiDw88vHOGDLVoA
	TqXMdmuSm0ALc/8F2SZVdjYQP1rnnBWP6zamt5rNr3i5lkWTgy/WS4lkxJyOuVuLxkRz1pqLP9D
	d6htVA==
X-Google-Smtp-Source: AGHT+IFy0RXuexUHa3kfjyL19mkyb1nAWPyntJqslgT3n34npIvK+M2FW7T6Phh8AkNO/tuBPU7EAg==
X-Received: by 2002:a05:6000:1886:b0:385:db39:2cf with SMTP id ffacd0b85a97d-38db48b9e8emr4235856f8f.12.1738839283504;
        Thu, 06 Feb 2025 02:54:43 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:1d::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd35e9esm1390719f8f.25.2025.02.06.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:42 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 05/26] rqspinlock: Add rqspinlock.h header
Date: Thu,  6 Feb 2025 02:54:13 -0800
Message-ID: <20250206105435.2159977-6-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297; h=from:subject; bh=AVuKKIzjLnum/Q8Jp3BllOKRS5yuVDUgY1U4pKev08I=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRkAUSLUoqJ61KHJqVww5VkHo5XuLe/f7xDpkMh vShNwMCJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZAAKCRBM4MiGSL8RyoE9EA ChWskn+IPkSTn/DMBwsfvx6EWqIgzdLCOdPnNCPTWMG8F+qUgNrWq+hnY2AEcF0ceG8KE69wHJ0cLI VBN9DG6qMLro8x1voPjPdK+aL1HAKDexxzJsUGqXzwcJ7tvBu+6aJto1dqMnI/iAjErkVXhTfeeDnQ HE8Vc8ft+nREngcb+k2A3S+vnI7cNgZyEtUXn3mX+4C1e0siL9PCKWRbCj7Dd8CIyhr+I6iVZdwGNy fYfSZBupBuq5C4yvcYeJ8shIaV3bkO04VogVyYLEi/QVP8pKyI8R+EBtKWqigsXI6383C8YLtrbQGd 6GU/QIqvFWawk/4RAnRUbHrfbE0pEX9aYKhgNEqv6/kqUCtYlJg+UsJtP63tthsVPkwsBYSzNyoHbB 0DutHelI8e77l5BQjjBxlxrXXTwKwflGFaPet1F3lFUu5Cq2PuJNvOGpz9xnFAi/8jxZY9QaxMKAUg Xr5iqvWwjk83bjYdoRMl/jswMGFWaFmpSrDUvrXM43JJVq/Jip610cxzOu92F+nVn1lWFbMEC4Bpva mhfxqax6cnPG6vhnjpN4uowxGnWFTJUwdYsICJWIXeHdbiXs3WJOtEvcwisb0n3r1F6T8NtLM+7Mdu KrBmyKQ6ZIowge2wnwHfNovFg8fEt4LhwMndrwjiFM78K91D7w+iuxRUPVLw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105445_856187_7D7764A5 
X-CRM114-Status: GOOD (  15.53  )
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

This header contains the public declarations usable in the rest of the
kernel for rqspinlock.

Let's also type alias qspinlock to rqspinlock_t to ensure consistent use
of the new lock type. We want to remove dependence on the qspinlock type
in later patches as we need to provide a test-and-set fallback, hence
begin abstracting away from now onwards.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 19 +++++++++++++++++++
 kernel/locking/rqspinlock.c      |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/rqspinlock.h

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
new file mode 100644
index 000000000000..54860b519571
--- /dev/null
+++ b/include/asm-generic/rqspinlock.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Resilient Queued Spin Lock
+ *
+ * (C) Copyright 2024 Meta Platforms, Inc. and affiliates.
+ *
+ * Authors: Kumar Kartikeya Dwivedi <memxor@gmail.com>
+ */
+#ifndef __ASM_GENERIC_RQSPINLOCK_H
+#define __ASM_GENERIC_RQSPINLOCK_H
+
+#include <linux/types.h>
+
+struct qspinlock;
+typedef struct qspinlock rqspinlock_t;
+
+extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+
+#endif /* __ASM_GENERIC_RQSPINLOCK_H */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index caaa7c9bbc79..18eb9ef3e908 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -23,6 +23,7 @@
 #include <asm/byteorder.h>
 #include <asm/qspinlock.h>
 #include <trace/events/lock.h>
+#include <asm/rqspinlock.h>
 
 /*
  * Include queued spinlock definitions and statistics code
@@ -127,7 +128,7 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
  * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
  *   queue               :         ^--'                             :
  */
-void __lockfunc resilient_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 {
 	struct mcs_spinlock *prev, *next, *node;
 	u32 old, tail;
-- 
2.43.5


