Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF4AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/G/O/Zyw1wKL+61ZIf71iZUhSIiLpUYSgFpa1qeafC4=; b=2EQr0r1kB81ZJ9z3360Q7BjDfX
	Si5pam45NkYiUlvMTt/YVaJMfln9zbPX4UuvxWr4dAAms3n8mtaVWcbi39R1Oiq2Sw+hKSJ6yMWnv
	szk5/HCIGztgpRgpREAXwApYsoxQrwww2KJW/xhXIV9N/MmSXcY2m5AL1EZUkG0ri0BrP1Bjpcgf2
	R+zoeI05dWSbpqkus3UG0FXDNJe5ChH3QcloQVxjh8HKVo0b1Oi+b7k5lnAeaqqc/cGqVv5wcgQtD
	hDqCyEjTZdBHHJ5keGGHgtGVboIeQg6/aQaKJz+lIrES+tL8d0dHwAddglQokqOqEuvFJnLyHl5rW
	DHMZdZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzev-000000063V3-2DD9;
	Thu, 06 Feb 2025 11:03:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWx-000000061Xk-31eA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/G/O/Zyw1wKL+61ZIf71iZUhSIiLpUYSgFpa1qeafC4=; b=gHlZ+wxP1G1aARfdhME4jfZsKv
	xiSucuQKsxVoS2SzrmqkzllJ5NYkd8c902dhBFnes4xC943l62SudVvBdH5GVtxy+5yjBf1Y8/bpO
	fdgXeHufP1UGOr5Sir1zts7SVNs4iM+U3eipgfkG8bhipgh7nJI/BgfwSebSoKeOlWwkZhocwkvwk
	2I3xiKfLkM3QxMPZXYExqTPQ6wuCT4h5VyOAedM22VkJ8zIwtFfYVbyWwNTAUKECQSuPDy/uazkkO
	t9k7Pa8y66pvlD4B8gZ9O2vxP1rPoiy8ZzdVFAdJeqMNsRhgCYPyNsIzMLXT156abNKVN+ouLPUQC
	/akRolXQ==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWu-0000000GurU-2nbj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43634b570c1so5003425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839282; x=1739444082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G/O/Zyw1wKL+61ZIf71iZUhSIiLpUYSgFpa1qeafC4=;
        b=Ha7P0sl5v99vcRlQt5wYTm8wuN8ha+JPKpOV+n8gB1XCyJ4Q4SP7veYLI+an/ZZwvQ
         +iMT37Dv2rOSS6DqifAaMRfTNtPJBgPOwh69rpRgV+cWiELhyAIcJCBOCpdnYPGtuR0Y
         0jFRhd70BG2cd81vHBUaWb4KnfupWVEERToeF+8b89Gzp3s6onL17PrlVhGD4Hp5pyO9
         CEok9cAyvM85NAYdlPYtico6dHfQ8ESNIUI1ZJKx3Dt4qFokNbFgEEIn8SMnH7Rtkp8b
         700SJERoO88UYR//l03RWeimkBIN2a9Bch2VuP1QdwoogqmlVVnVckqR0z/H7aAm9/wR
         bp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839282; x=1739444082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G/O/Zyw1wKL+61ZIf71iZUhSIiLpUYSgFpa1qeafC4=;
        b=gBkNnuF+F9Mxck0tnK2gscRS4qtgmfbtVf64orXEDjYG8GJb71hx0FrMoiRqKwjSM6
         /etpXAKQA39JsxDSQXeAQ/Y9C0bcTe+xaI877PIvPwUvP0A/cHsAx06KwPqPEzT/drDD
         b5qV6EPu+LmUXwYPtfIf5rTldgGg8sgJw/4ge+lK7ZVLK5X+BchztcOHN2CD624oXH6z
         cJnt5wd487EPX+0WplayOnl8h58W9B4RruhJNGBFDLEB+xTYeDbWaxKvK90Q1qao/z6C
         7pIuNUJuq/14BI9vKP91HWMYwt8ASFu3NH/TJHFHdKKmpRB1G7wp4NC4CvgTGxRkIAUA
         ImVw==
X-Forwarded-Encrypted: i=1; AJvYcCVfSTnSB5YylEH2k2efd2Rfynf4gYj9Pct0snacp+rlcru6wbja5WwgX8X7BDhxRum8sypyS3C09uYxnzrns/EF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywypd4OJiE3uvuKdPO6pkSgkB6LVICbe/wmPGnBHapdc7fkacId
	xr4GqRm4YADOjuoE25h8sbcI4TNr+Bgrz3nHCT84WimUR2RCK30V
X-Gm-Gg: ASbGncvwlNhe5Za4RxOnVFvDLlas7CDrEKQ6Zr4jXu/sdkSRnSWb8HG8oa2eJEX2Fgh
	r/JAmeomvIv/e7gQz5QU+kt8NFiJp46FMcjYPLwgEe0vXq/nWoXjogmnpAXSuoC6iMbrfqOLpxE
	39LSwjwkG2SReIJvyl8SmFx7IgiEfx98iY8jEGwlf3ER4CBUwoKqvXotmPX+A7AnC4YyO+s4gjQ
	BT8+3I4cLxmhLh/zb/auDGwdGAuMHw4J/fGzodQt1evcdeJ/5e09oijfiBZVxZJK9VE2sq1iPod
	DnPEDw==
X-Google-Smtp-Source: AGHT+IED4qd4F+YsOBRJnZkqjdZ0qCWlhz5W6kmheG8y6eyBeQtVsfltvea7zK4aPaLbItj8zaxpkQ==
X-Received: by 2002:a5d:5850:0:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-38db490f8b3mr4373779f8f.46.1738839282225;
        Thu, 06 Feb 2025 02:54:42 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:1a::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1ddb9sm1382899f8f.84.2025.02.06.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:41 -0800 (PST)
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
Subject: [PATCH bpf-next v2 04/26] locking: Copy out qspinlock.c to rqspinlock.c
Date: Thu,  6 Feb 2025 02:54:12 -0800
Message-ID: <20250206105435.2159977-5-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14101; h=from:subject; bh=FYMfmdHhZVrUK2nS5jUp23jzoKxyU5CBSvGylajqNkU=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRkgODNr0FrQcgKvek25PD/Kof6Fg8QSVqhrY4b ll0Vr4eJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZAAKCRBM4MiGSL8RyjcyEA CWkEv1hNRGlRz7ngHfRjKSfdxkoW+Jesqf9WJHO5raMEArHLDtxB4dMXEW9mPu0R2nbppStFQt+zh4 Emq++RkywjOxaooDM0K4Iurr6vOdSmpHfMiuqB6mZ4kHQ8fLbplR9vkDxA89qbEo0xPKh8RkEMtnwB vQKt8yT7Ubg4GV2eG76RGhBn9nPueBqpO/5X++hWy32N74C5r0qYYBhROpXLqY/R5Rpn4lV8TqhdRk rdiQNpdPA716MET8PP5iDJ+o22hHBxGRZLsv6TcXimxObYAneQ3XcPzdZNeQ0Lu1lmUL0ItvP6uVj/ Txl2TNgwgBgAu0HO1D5mIlX0DjWhlO/uH28Av4PWzHG8tTbA/gu81NyPa2GLFla0L8uiluz1HnLnSg b5MHVmXaAlvzACli+/WGtI5LeXTHhpKwels4eBwH2wCTHh5PyhPAgMvnCwaX0iRES/oSEYMV80tDGI oXrop0LJRkfimay6TKAOynHmk8HjO2vvkVuZe5Uc48ycPaC6eVxVz/k1IUcuKo4Ucf2q1/9PKIYU18 TYQ60j+i23PPwphC6ianMx4TGKm7EF1yZKUpEw/Vu9biDK7WpNF4KKzhD74yMfEucCO5aVnYjoaNTj 5RlEy21xIyGTRCEgZQJDOJPB36mKO3NQmcDl4clT647X86fuZjC/mHeKcouA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105444_905211_E6774FDC 
X-CRM114-Status: GOOD (  33.17  )
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

In preparation for introducing a new lock implementation, Resilient
Queued Spin Lock, or rqspinlock, we first begin our modifications by
using the existing qspinlock.c code as the base. Simply copy the code to
a new file and rename functions and variables from 'queued' to
'resilient_queued'.

This helps each subsequent commit in clearly showing how and where the
code is being changed. The only change after a literal copy in this
commit is renaming the functions where necessary.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 410 ++++++++++++++++++++++++++++++++++++
 1 file changed, 410 insertions(+)
 create mode 100644 kernel/locking/rqspinlock.c

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
new file mode 100644
index 000000000000..caaa7c9bbc79
--- /dev/null
+++ b/kernel/locking/rqspinlock.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Resilient Queued Spin Lock
+ *
+ * (C) Copyright 2013-2015 Hewlett-Packard Development Company, L.P.
+ * (C) Copyright 2013-2014,2018 Red Hat, Inc.
+ * (C) Copyright 2015 Intel Corp.
+ * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
+ *
+ * Authors: Waiman Long <longman@redhat.com>
+ *          Peter Zijlstra <peterz@infradead.org>
+ */
+
+#ifndef _GEN_PV_LOCK_SLOWPATH
+
+#include <linux/smp.h>
+#include <linux/bug.h>
+#include <linux/cpumask.h>
+#include <linux/percpu.h>
+#include <linux/hardirq.h>
+#include <linux/mutex.h>
+#include <linux/prefetch.h>
+#include <asm/byteorder.h>
+#include <asm/qspinlock.h>
+#include <trace/events/lock.h>
+
+/*
+ * Include queued spinlock definitions and statistics code
+ */
+#include "qspinlock.h"
+#include "qspinlock_stat.h"
+
+/*
+ * The basic principle of a queue-based spinlock can best be understood
+ * by studying a classic queue-based spinlock implementation called the
+ * MCS lock. A copy of the original MCS lock paper ("Algorithms for Scalable
+ * Synchronization on Shared-Memory Multiprocessors by Mellor-Crummey and
+ * Scott") is available at
+ *
+ * https://bugzilla.kernel.org/show_bug.cgi?id=206115
+ *
+ * This queued spinlock implementation is based on the MCS lock, however to
+ * make it fit the 4 bytes we assume spinlock_t to be, and preserve its
+ * existing API, we must modify it somehow.
+ *
+ * In particular; where the traditional MCS lock consists of a tail pointer
+ * (8 bytes) and needs the next pointer (another 8 bytes) of its own node to
+ * unlock the next pending (next->locked), we compress both these: {tail,
+ * next->locked} into a single u32 value.
+ *
+ * Since a spinlock disables recursion of its own context and there is a limit
+ * to the contexts that can nest; namely: task, softirq, hardirq, nmi. As there
+ * are at most 4 nesting levels, it can be encoded by a 2-bit number. Now
+ * we can encode the tail by combining the 2-bit nesting level with the cpu
+ * number. With one byte for the lock value and 3 bytes for the tail, only a
+ * 32-bit word is now needed. Even though we only need 1 bit for the lock,
+ * we extend it to a full byte to achieve better performance for architectures
+ * that support atomic byte write.
+ *
+ * We also change the first spinner to spin on the lock bit instead of its
+ * node; whereby avoiding the need to carry a node from lock to unlock, and
+ * preserving existing lock API. This also makes the unlock code simpler and
+ * faster.
+ *
+ * N.B. The current implementation only supports architectures that allow
+ *      atomic operations on smaller 8-bit and 16-bit data types.
+ *
+ */
+
+#include "mcs_spinlock.h"
+
+/*
+ * Per-CPU queue node structures; we can never have more than 4 nested
+ * contexts: task, softirq, hardirq, nmi.
+ *
+ * Exactly fits one 64-byte cacheline on a 64-bit architecture.
+ *
+ * PV doubles the storage and uses the second cacheline for PV state.
+ */
+static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
+
+/*
+ * Generate the native code for resilient_queued_spin_unlock_slowpath(); provide NOPs
+ * for all the PV callbacks.
+ */
+
+static __always_inline void __pv_init_node(struct mcs_spinlock *node) { }
+static __always_inline void __pv_wait_node(struct mcs_spinlock *node,
+					   struct mcs_spinlock *prev) { }
+static __always_inline void __pv_kick_node(struct qspinlock *lock,
+					   struct mcs_spinlock *node) { }
+static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
+						   struct mcs_spinlock *node)
+						   { return 0; }
+
+#define pv_enabled()		false
+
+#define pv_init_node		__pv_init_node
+#define pv_wait_node		__pv_wait_node
+#define pv_kick_node		__pv_kick_node
+#define pv_wait_head_or_lock	__pv_wait_head_or_lock
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#define resilient_queued_spin_lock_slowpath	native_resilient_queued_spin_lock_slowpath
+#endif
+
+#endif /* _GEN_PV_LOCK_SLOWPATH */
+
+/**
+ * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
+ * @lock: Pointer to queued spinlock structure
+ * @val: Current value of the queued spinlock 32-bit word
+ *
+ * (queue tail, pending bit, lock value)
+ *
+ *              fast     :    slow                                  :    unlock
+ *                       :                                          :
+ * uncontended  (0,0,0) -:--> (0,0,1) ------------------------------:--> (*,*,0)
+ *                       :       | ^--------.------.             /  :
+ *                       :       v           \      \            |  :
+ * pending               :    (0,1,1) +--> (0,1,0)   \           |  :
+ *                       :       | ^--'              |           |  :
+ *                       :       v                   |           |  :
+ * uncontended           :    (n,x,y) +--> (n,0,0) --'           |  :
+ *   queue               :       | ^--'                          |  :
+ *                       :       v                               |  :
+ * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
+ *   queue               :         ^--'                             :
+ */
+void __lockfunc resilient_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+{
+	struct mcs_spinlock *prev, *next, *node;
+	u32 old, tail;
+	int idx;
+
+	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
+
+	if (pv_enabled())
+		goto pv_queue;
+
+	if (virt_spin_lock(lock))
+		return;
+
+	/*
+	 * Wait for in-progress pending->locked hand-overs with a bounded
+	 * number of spins so that we guarantee forward progress.
+	 *
+	 * 0,1,0 -> 0,0,1
+	 */
+	if (val == _Q_PENDING_VAL) {
+		int cnt = _Q_PENDING_LOOPS;
+		val = atomic_cond_read_relaxed(&lock->val,
+					       (VAL != _Q_PENDING_VAL) || !cnt--);
+	}
+
+	/*
+	 * If we observe any contention; queue.
+	 */
+	if (val & ~_Q_LOCKED_MASK)
+		goto queue;
+
+	/*
+	 * trylock || pending
+	 *
+	 * 0,0,* -> 0,1,* -> 0,0,1 pending, trylock
+	 */
+	val = queued_fetch_set_pending_acquire(lock);
+
+	/*
+	 * If we observe contention, there is a concurrent locker.
+	 *
+	 * Undo and queue; our setting of PENDING might have made the
+	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
+	 * on @next to become !NULL.
+	 */
+	if (unlikely(val & ~_Q_LOCKED_MASK)) {
+
+		/* Undo PENDING if we set it. */
+		if (!(val & _Q_PENDING_MASK))
+			clear_pending(lock);
+
+		goto queue;
+	}
+
+	/*
+	 * We're pending, wait for the owner to go away.
+	 *
+	 * 0,1,1 -> *,1,0
+	 *
+	 * this wait loop must be a load-acquire such that we match the
+	 * store-release that clears the locked bit and create lock
+	 * sequentiality; this is because not all
+	 * clear_pending_set_locked() implementations imply full
+	 * barriers.
+	 */
+	if (val & _Q_LOCKED_MASK)
+		smp_cond_load_acquire(&lock->locked, !VAL);
+
+	/*
+	 * take ownership and clear the pending bit.
+	 *
+	 * 0,1,0 -> 0,0,1
+	 */
+	clear_pending_set_locked(lock);
+	lockevent_inc(lock_pending);
+	return;
+
+	/*
+	 * End of pending bit optimistic spinning and beginning of MCS
+	 * queuing.
+	 */
+queue:
+	lockevent_inc(lock_slowpath);
+pv_queue:
+	node = this_cpu_ptr(&qnodes[0].mcs);
+	idx = node->count++;
+	tail = encode_tail(smp_processor_id(), idx);
+
+	trace_contention_begin(lock, LCB_F_SPIN);
+
+	/*
+	 * 4 nodes are allocated based on the assumption that there will
+	 * not be nested NMIs taking spinlocks. That may not be true in
+	 * some architectures even though the chance of needing more than
+	 * 4 nodes will still be extremely unlikely. When that happens,
+	 * we fall back to spinning on the lock directly without using
+	 * any MCS node. This is not the most elegant solution, but is
+	 * simple enough.
+	 */
+	if (unlikely(idx >= _Q_MAX_NODES)) {
+		lockevent_inc(lock_no_node);
+		while (!queued_spin_trylock(lock))
+			cpu_relax();
+		goto release;
+	}
+
+	node = grab_mcs_node(node, idx);
+
+	/*
+	 * Keep counts of non-zero index values:
+	 */
+	lockevent_cond_inc(lock_use_node2 + idx - 1, idx);
+
+	/*
+	 * Ensure that we increment the head node->count before initialising
+	 * the actual node. If the compiler is kind enough to reorder these
+	 * stores, then an IRQ could overwrite our assignments.
+	 */
+	barrier();
+
+	node->locked = 0;
+	node->next = NULL;
+	pv_init_node(node);
+
+	/*
+	 * We touched a (possibly) cold cacheline in the per-cpu queue node;
+	 * attempt the trylock once more in the hope someone let go while we
+	 * weren't watching.
+	 */
+	if (queued_spin_trylock(lock))
+		goto release;
+
+	/*
+	 * Ensure that the initialisation of @node is complete before we
+	 * publish the updated tail via xchg_tail() and potentially link
+	 * @node into the waitqueue via WRITE_ONCE(prev->next, node) below.
+	 */
+	smp_wmb();
+
+	/*
+	 * Publish the updated tail.
+	 * We have already touched the queueing cacheline; don't bother with
+	 * pending stuff.
+	 *
+	 * p,*,* -> n,*,*
+	 */
+	old = xchg_tail(lock, tail);
+	next = NULL;
+
+	/*
+	 * if there was a previous node; link it and wait until reaching the
+	 * head of the waitqueue.
+	 */
+	if (old & _Q_TAIL_MASK) {
+		prev = decode_tail(old, qnodes);
+
+		/* Link @node into the waitqueue. */
+		WRITE_ONCE(prev->next, node);
+
+		pv_wait_node(node, prev);
+		arch_mcs_spin_lock_contended(&node->locked);
+
+		/*
+		 * While waiting for the MCS lock, the next pointer may have
+		 * been set by another lock waiter. We optimistically load
+		 * the next pointer & prefetch the cacheline for writing
+		 * to reduce latency in the upcoming MCS unlock operation.
+		 */
+		next = READ_ONCE(node->next);
+		if (next)
+			prefetchw(next);
+	}
+
+	/*
+	 * we're at the head of the waitqueue, wait for the owner & pending to
+	 * go away.
+	 *
+	 * *,x,y -> *,0,0
+	 *
+	 * this wait loop must use a load-acquire such that we match the
+	 * store-release that clears the locked bit and create lock
+	 * sequentiality; this is because the set_locked() function below
+	 * does not imply a full barrier.
+	 *
+	 * The PV pv_wait_head_or_lock function, if active, will acquire
+	 * the lock and return a non-zero value. So we have to skip the
+	 * atomic_cond_read_acquire() call. As the next PV queue head hasn't
+	 * been designated yet, there is no way for the locked value to become
+	 * _Q_SLOW_VAL. So both the set_locked() and the
+	 * atomic_cmpxchg_relaxed() calls will be safe.
+	 *
+	 * If PV isn't active, 0 will be returned instead.
+	 *
+	 */
+	if ((val = pv_wait_head_or_lock(lock, node)))
+		goto locked;
+
+	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK));
+
+locked:
+	/*
+	 * claim the lock:
+	 *
+	 * n,0,0 -> 0,0,1 : lock, uncontended
+	 * *,*,0 -> *,*,1 : lock, contended
+	 *
+	 * If the queue head is the only one in the queue (lock value == tail)
+	 * and nobody is pending, clear the tail code and grab the lock.
+	 * Otherwise, we only need to grab the lock.
+	 */
+
+	/*
+	 * In the PV case we might already have _Q_LOCKED_VAL set, because
+	 * of lock stealing; therefore we must also allow:
+	 *
+	 * n,0,1 -> 0,0,1
+	 *
+	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
+	 *       above wait condition, therefore any concurrent setting of
+	 *       PENDING will make the uncontended transition fail.
+	 */
+	if ((val & _Q_TAIL_MASK) == tail) {
+		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
+			goto release; /* No contention */
+	}
+
+	/*
+	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
+	 * which will then detect the remaining tail and queue behind us
+	 * ensuring we'll see a @next.
+	 */
+	set_locked(lock);
+
+	/*
+	 * contended path; wait for next if not observed yet, release.
+	 */
+	if (!next)
+		next = smp_cond_load_relaxed(&node->next, (VAL));
+
+	arch_mcs_spin_unlock_contended(&next->locked);
+	pv_kick_node(lock, next);
+
+release:
+	trace_contention_end(lock, 0);
+
+	/*
+	 * release the node
+	 */
+	__this_cpu_dec(qnodes[0].mcs.count);
+}
+EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
+
+/*
+ * Generate the paravirt code for resilient_queued_spin_unlock_slowpath().
+ */
+#if !defined(_GEN_PV_LOCK_SLOWPATH) && defined(CONFIG_PARAVIRT_SPINLOCKS)
+#define _GEN_PV_LOCK_SLOWPATH
+
+#undef  pv_enabled
+#define pv_enabled()	true
+
+#undef pv_init_node
+#undef pv_wait_node
+#undef pv_kick_node
+#undef pv_wait_head_or_lock
+
+#undef  resilient_queued_spin_lock_slowpath
+#define resilient_queued_spin_lock_slowpath	__pv_resilient_queued_spin_lock_slowpath
+
+#include "qspinlock_paravirt.h"
+#include "rqspinlock.c"
+
+bool nopvspin;
+static __init int parse_nopvspin(char *arg)
+{
+	nopvspin = true;
+	return 0;
+}
+early_param("nopvspin", parse_nopvspin);
+#endif
-- 
2.43.5


