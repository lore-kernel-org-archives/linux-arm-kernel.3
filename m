Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43291C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6HfEz6FnLcnMW+Wa6mBmkJ5vtGaoNq/ogsTG9QK4tE=; b=FBLVSxtH56h2azrf662f7YE/o/
	8j5qcCko+RtuSnBYLCVcvF8LtQdfwcJRktS7oYAHVumpijukaORBMc0N8WeC1ZGyKGNSmD3OGZxhW
	3pA41kvYjy5KNglRRCDn/IbHcK8aZ3ZiCK+K+VwV1db/bPYo2JTUnp8dsqloudr1FTsTBXb0w9qdz
	ivnXLPrYPDkCF9vj508ifZDyBGsBiZEDw3ru+pRa9UvPiumQM3faoFGKzIoTaSfHzfZL7aSwAeIS8
	EsBydI3MFUrmHsSX2aXLtepVKMlFaSPIP2gxT+Iqw47G24Fq0fLAGtvn9ROjmGuWjwFtG9AL/2Yg7
	rn76wbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzkJ-000000064eQ-2sTU;
	Thu, 06 Feb 2025 11:08:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX2-000000061Zh-3Gut
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=u6HfEz6FnLcnMW+Wa6mBmkJ5vtGaoNq/ogsTG9QK4tE=; b=JMqdVXVI/H70quOW4ot+PXSFvl
	T1gmkfgdGaAFj83VsffSsAgw20fbtYKpwto37lWQZUUbvp9trONjuR/pDBWh8GH9kEKHZHPFm9bGf
	3KWLpkDOewCMLZ1UzvQ8tjgsRkF0eIJtxobywmvgpRgV7C8oAhB1YgD7A0YuiDNi/UrgNISwJExv8
	HjhGyvKE0d1xl3b42Z3n0t8p2Iv4SzObR4tZbbbrqfEpUF1LCZ0UZuuOk9vg3N2PPq8NC74tseyoI
	wdz2VeV2HCn5eqP5bw4omDMqAOp3/BbH0zaDuLyqfdVA3HrjkRugGLY5bE6lCp5fBBXRnD3wAQm0T
	jy46VRXg==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX0-0000000Gusx-01Jr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-38dabb11eaaso357089f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839288; x=1739444088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6HfEz6FnLcnMW+Wa6mBmkJ5vtGaoNq/ogsTG9QK4tE=;
        b=gV+Zwy/a1UALMSQyIyQT0o/Pin8nhGZTC5VutdSku83xdNhePIIRrELYXWfJvSSXVi
         Cku9DfKVkhR8RL8pJe3BP5YWQ2bpveZ8aFlTVBCMpC7UctNEUilOJuW9kS7hqgmawIJK
         RaOv5kg5Bu4wosi4T47asImnayxXMdh/hJUBKnRYYREw9JT2vblB3wsEtIZ53MW1kmdM
         DS9ER+++ME8BfRStgQprVT89AX3hOCdI1sAoa9Ey0RmdnCIrvSyF/futXaY7plXUb39D
         1MPMRB+aEr7D29Edv18ghGAo2PXRtl2t2Pgc1HcPbCBmz7jJVAoK8dxef8nz/hpUXEed
         CHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839288; x=1739444088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6HfEz6FnLcnMW+Wa6mBmkJ5vtGaoNq/ogsTG9QK4tE=;
        b=XZkqVJsl8w/EEcAGEnZYalslXt1gOnrs3NcJtbgBWV97AXEuTS7oAbLUPCMy6MrAOU
         9ZSdiD75C+KyRQjK5TbALflqcusJaRmvCI/0MZQ2ZQ1pQzoZxMrL1z3O7rAw02+hgaUW
         T6WnJv/ofvOkICeN8jOqqI/2nXWPFkXDh732uUdu/F54F0P5gjClmqy3MQ6IBl3fv6t8
         HWremoLtYwWXD5hEW/ffl1NZEXU4zOIbjOMe95M/bSKgZlP4DTA6iDC2l1xalgo/mits
         Bbb3pSZ5yfMWLUEYHHdVTN7LEl2IunS7RgfqV/ETUP3fogKDaHTfzF/tkvpMrBGA0l57
         indw==
X-Forwarded-Encrypted: i=1; AJvYcCWGCZmJG3OK56ebDvUC/y9x7tIjGjSJ9V8TkrgRUogNxtJRPZsVGOnUa+SzPq9QwbSO+XycJ2YvaKQu7hB4KmAR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qh73/35hyexMzZmK8I9ppdZS/7StpvuLlqkFDNtUxeHscLXQ
	wDAZZXhUAwHdbcFr856swyb9K8aGT4DfwFQQ3u3Xfp7VLq9HRFdJ
X-Gm-Gg: ASbGnctDIo7evZ7YrhtEZiwgm+VPicpPdqpeecz6xdWzS6d+RKfYAqNTSANi7RRITDo
	okuVAmfQPv4dMdxqCboD3QxJJcnBeBdvbf5lYK78eFSjgmCAz/vqVoiEw0YxlzLCjYlqqv0gt2F
	ckxIYlxFDyOfdNc+U/Yb2uXYtrtarTsxoZ4YJoClCW3SglmsKfUkHFJG0xbncXUScsuz1fZeYfU
	JmTKowJ5n/rKpfn8+ipGOmNugiPBSJQ6WvOdM+VnX4XkHUXQBCoAMixbIB8P2C6adUqdKybX/6l
	9TkAiA==
X-Google-Smtp-Source: AGHT+IEFTmIDnkApoCxo9XEdAou5ZGEMDlqk297HAU+HLuXK1+LhNaJhCM/rdUs7kriHnIXhGFI/oA==
X-Received: by 2002:a5d:5988:0:b0:38c:1362:41b5 with SMTP id ffacd0b85a97d-38db486108amr4754830f8f.6.1738839287460;
        Thu, 06 Feb 2025 02:54:47 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:72::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd3csm1414640f8f.62.2025.02.06.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:46 -0800 (PST)
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
Subject: [PATCH bpf-next v2 08/26] rqspinlock: Protect pending bit owners from stalls
Date: Thu,  6 Feb 2025 02:54:16 -0800
Message-ID: <20250206105435.2159977-9-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4602; h=from:subject; bh=PZAstj2WMwdJ5zpDKugp3FElz+LV+4cvINkXq1LfzVc=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRlQkqPybkJ7GSLq/QqBmQtgES+UrYcxxOebbfU QQitnoeJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZQAKCRBM4MiGSL8RyrK9D/ 9TAnlSHxA1Q3uFCYcCdMIawjW1IJgTMIKG08AH5HflcEBfh12ex5nIURCNNtVmT8KNdznwDtmSyf9F Dz9E3Hb1omPeX7fZXLE7IFq92YLTS8ZhF954tYzs/ccHTnFSiRQUEYaPNN5BjAreKu7VsuNJTWWwh2 Zk18PTGBgcCoITYY2U9kPpt8H0ss5SjjE/v472ug3Sxr+ikSfRFCNfqHQlM07gdJeffwM2YhPLmyrA pS/ZOZBqjyv6FJgGZvfHKwzMoadC1/BvbPU7eQpAJasZGBSDhGpgWqGWPnrkd1Xx+Qpo5SaJTQv2Bf FVE3fsLPC8zh8SYzTkjlRiUuMQDkkUeC71FmooULzLbfpkqhhr5IlQIpcVaKafW3bGY7gkNkxgbUcR ZjGTHp06O6I30+WbvFpEoQXIBKla/RBxSi2qHXXdZ5xlHp/f0BpJfujOwZr5R+QHWNX4h8hvTigyRu JMiZjgK3a/DfYdZdkC7+3+Y4IWzCH5XFsthPvV6ZgI+HUdIaJu6gLuw1LHLahy0sUtSdl3j3nbkdnN nk5039QdF/msE7FiR8sEyIhyL9JjjIcbswOwvAx+cPa7i/XoU9RVLyZ+toJUpPQsXNfR7MRq1YEGFC OwvNNjfgANI5dQmuZkKEQfmCLhErAm7WdD82gJqews3JIUZe0bapo/LeUq6A==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105450_176740_6C3191BF 
X-CRM114-Status: GOOD (  19.62  )
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

The pending bit is used to avoid queueing in case the lock is
uncontended, and has demonstrated benefits for the 2 contender scenario,
esp. on x86. In case the pending bit is acquired and we wait for the
locked bit to disappear, we may get stuck due to the lock owner not
making progress. Hence, this waiting loop must be protected with a
timeout check.

To perform a graceful recovery once we decide to abort our lock
acquisition attempt in this case, we must unset the pending bit since we
own it. All waiters undoing their changes and exiting gracefully allows
the lock word to be restored to the unlocked state once all participants
(owner, waiters) have been recovered, and the lock remains usable.
Hence, set the pending bit back to zero before returning to the caller.

Introduce a lockevent (rqspinlock_lock_timeout) to capture timeout
event statistics.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h  |  2 +-
 kernel/locking/lock_events_list.h |  5 +++++
 kernel/locking/rqspinlock.c       | 28 +++++++++++++++++++++++-----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index c89733cbe643..0981162c8ac7 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -20,6 +20,6 @@ typedef struct qspinlock rqspinlock_t;
  */
 #define RES_DEF_TIMEOUT (NSEC_PER_SEC / 2)
 
-extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
+extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
 
 #endif /* __ASM_GENERIC_RQSPINLOCK_H */
diff --git a/kernel/locking/lock_events_list.h b/kernel/locking/lock_events_list.h
index 97fb6f3f840a..c5286249994d 100644
--- a/kernel/locking/lock_events_list.h
+++ b/kernel/locking/lock_events_list.h
@@ -49,6 +49,11 @@ LOCK_EVENT(lock_use_node4)	/* # of locking ops that use 4th percpu node */
 LOCK_EVENT(lock_no_node)	/* # of locking ops w/o using percpu node    */
 #endif /* CONFIG_QUEUED_SPINLOCKS */
 
+/*
+ * Locking events for Resilient Queued Spin Lock
+ */
+LOCK_EVENT(rqspinlock_lock_timeout)	/* # of locking ops that timeout	*/
+
 /*
  * Locking events for rwsem
  */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 200454e9c636..8e512feb37ce 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -138,12 +138,12 @@ static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
  * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
  *   queue               :         ^--'                             :
  */
-void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout)
+int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout)
 {
 	struct mcs_spinlock *prev, *next, *node;
 	struct rqspinlock_timeout ts;
+	int idx, ret = 0;
 	u32 old, tail;
-	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
@@ -201,8 +201,25 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 * clear_pending_set_locked() implementations imply full
 	 * barriers.
 	 */
-	if (val & _Q_LOCKED_MASK)
-		smp_cond_load_acquire(&lock->locked, !VAL);
+	if (val & _Q_LOCKED_MASK) {
+		RES_RESET_TIMEOUT(ts);
+		smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret));
+	}
+
+	if (ret) {
+		/*
+		 * We waited for the locked bit to go back to 0, as the pending
+		 * waiter, but timed out. We need to clear the pending bit since
+		 * we own it. Once a stuck owner has been recovered, the lock
+		 * must be restored to a valid state, hence removing the pending
+		 * bit is necessary.
+		 *
+		 * *,1,* -> *,0,*
+		 */
+		clear_pending(lock);
+		lockevent_inc(rqspinlock_lock_timeout);
+		return ret;
+	}
 
 	/*
 	 * take ownership and clear the pending bit.
@@ -211,7 +228,7 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 */
 	clear_pending_set_locked(lock);
 	lockevent_inc(lock_pending);
-	return;
+	return 0;
 
 	/*
 	 * End of pending bit optimistic spinning and beginning of MCS
@@ -362,5 +379,6 @@ void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 * release the node
 	 */
 	__this_cpu_dec(qnodes[0].mcs.count);
+	return 0;
 }
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
-- 
2.43.5


