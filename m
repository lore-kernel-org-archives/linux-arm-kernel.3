Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C604606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZmyIPx1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WK+whklS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=; b=gZmyIPx1vO37BqqQg0wGx+PwKq
	i7JzILEYxvgFcA0YR5RnIrqCJf04mADXG5Ul2SVrkY3MOcwuyP+z6ndA6dFCNT2lpZI4LJVFu3QRt
	ziy0Jh1+pzILODhZsg8zHc2Wn5YeJgeQqRvhompM7Y4IsKSx7KYBC9Dp6WAu7lfv0OU6ES8Av2dl/
	qokCOJQ7+scpgV81JKmxnUXxbpv2Ng3s56k8flrlK1WRRCOUYLy8jXIdXtIWDPcK5NNKDu62JcnIL
	CkD6Wiav5l1/TXX1CcJzio/B3yLoswcJq+cjkh5zhd3cRJITC2ZhmIvg98/i5VkeyMR603NCJAA+b
	mZ4JfeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERD-0000000AQJt-2w1N;
	Tue, 20 Oct 2026 18:19:51 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJER8-0000000AQHb-2cAM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:19:47 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-354ba08cfd1so6404880eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520386; x=1793125186; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
        b=WK+whklS36hfBjKi6x9yGjAS6Or1Ch/aqZUSoS35VZWd3wsXcrTnZCEN0pplPy9X32
         Miab/69Z+DFnf+7p+wZPt4D5U/xWY5mJv7m+26TXqQHpB093d1ukZtjh9Kx/zp2mrr62
         HFl6HutvJmcqdqLxgGZg3b2fu3UHVN348LtRoKYtpNFj/JtDKdq6oQVWIwwY+TKRnbG2
         JLyNkAetncpUvZEfi5oaiH5DfBPPVK6MXqBwbM3+U/8G8sesp8s6Mywz7yRzs7Ez+8Um
         mvhVba8FVeHcz1NrqdzoddJU5IPgsT6JEnDpS2mv6ljpNI6g1eZen8pHuZuFkD+BJDRX
         B4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520386; x=1793125186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
        b=fwDFDrDg8P+3j9CjrOpVPilh+Wf6KchLR49cl3qw8yUXITjnrreBIkSv6ZVRx00rbs
         gfdWSbXC9NwxhkU+GnQBKDXspN5nVrIVXphrYCy9Gxpz5CcmYYWtF86fkVR+I7tyKaUP
         lqKWeIbmWjpzPa1iswPo/ZWBovviuMy+QGCOBRHEL6VtkDPHAuWETJKAtcOF8/tntmw5
         a29ASeier22qceI2tm9HkHsPW2LLjcM69F4lMc2eEgr3iJ89vc/QA/V0nQpMcPw1Lyir
         4ss6BT/zJ6FxGrseFIxb9js7CZjbRtIh3TmAE+73yV0cwOWsjthInq43W7sBTVmT/wh1
         J+DQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6i+y2QHyNiu5ag48sHEycV+XBTujaWZWZzIsE0Ar2sGsda1YwAItlqIwPKVdpmSPSrbnNmbGfNsLNs6B6PEZP@lists.infradead.org
X-Gm-Message-State: AFq9FYJHEjl/aFqomh2MUTtjMtOu2g+uSoy3QQiwdtVlT1ewVIy/Y6qq
	qtnCY0kb5twaYEdAHUAQEhefv9y8//9kYDkcGAohtubC8WlT04spK0IAkiHp/rcMwpEcyw==
X-Gm-Gg: AYBFou3eVo4pjaTftO0H8SGVypm1H3KyURwBbKnZ1K7yqexWNbj172NBm5MY1ENOpfO
	Q6IET+QMzfpGOEUv/7xHSLV/GGbtmSIjvVIIgWflfmsCUbHX75GOqR06K9mxfseFyAWLPlpRZh2
	IassrWZQuGaB+Gv84wToZOFo4tCAF81QK5gqgLCoUoWq8DBG70BYWg7RQzR9uSeqgb/AEvRHYVR
	fnItlEzARCFS7b21rlACGqY0rzxMnprebgSggUknUn8GqeGDXtwwtgvru/1UGWfmpIZfiNpWR+R
	3t6O0d6HXuFwHNHvCNbnTtQUUQB3NEpYBX8C31Bt5Sne6UP+q0wn2p2dt7HXBtk5b9fh6oSvcWl
	HH4hZ70Jqu+ZRLYWs2zor95/3T7JOFWWn9bYQXcEtNrjggL8tZK/TUqb19rnCHlyYqo4RQYA6Ls
	sIQU3/t0BhvO7bJe5khz0397JPU38pguBMQNXqieaXoCOsW6FtFw5hZ6ndyIQaO4/S
X-Received: by 2002:a05:693c:65cc:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-3674e355183mr55514eec.38.1792520385832;
        Tue, 20 Oct 2026 11:19:45 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:45 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] arm64/gcs: release GCS on failed fork
Date: Tue, 20 Oct 2026 15:19:30 -0300
Message-ID: <8522b8d3d3ecda7474d0af8b8517c1f5d708ecc2.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_111946_672640_5069BB4B 
X-CRM114-Status: GOOD (  17.94  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

copy_thread() maps a GCS for a CLONE_VM child and can still return
0. A later copy_process() failure then goes through
bad_fork_cleanup_thread, which calls exit_thread(). The hole this
series hits is clone3(CLONE_VM|CLONE_PIDFD) when put_user() of the
pidfd fails after that mapping. arm64 did not implement
exit_thread(). deactivate_mm() is what normally calls gcs_free(),
and it does not run on this path. Each rejected clone leaves one
GCS VMA in the parent's mm until the mm dies.

Select HAVE_EXIT_THREAD and free the child's GCS from
exit_thread(). gcs_free() already ignores a cleared base and a
different mm, so the usual exit path (deactivate_mm() then this) is
a no-op the second time. copy_thread_gcs() zeros the inherited
tracking before a user-thread allocation, so an allocation error
still skips exit_thread() with nothing to unmap.

Tasks created through the args->fn path (kernel_thread(),
create_io_thread(), and similar) do not allocate a user GCS in
copy_thread(). They still inherit GCS tracking via
arch_dup_task_struct(), and with CLONE_VM a later failed
copy_process() still shares the caller's mm, so gcs_free()'s mm
check does not save us. Clear that tracking with
gcs_reset_thread(), an empty stub when !CONFIG_ARM64_GCS.

x86 does not need the same args->fn clear: copy_thread() runs
shstk_alloc_thread_stack() before both the PF_KTHREAD and later
args->fn return paths, so CLONE_VM replaces the inherited tracking
first.

Tested with CONFIG_ARM64_GCS on QEMU 11.1.2 -machine virt -cpu max.
Sixteen clone3() calls with CLONE_VM|CLONE_PIDFD and an unwritable
pidfd pointer leaked 16 GCS VMAs without the fix. With it, the VMA
count was unchanged.

Fixes: 506496bcbb42 ("arm64/gcs: Ensure that new threads have a GCS")
Cc: stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/gcs.h |  8 ++++++++
 arch/arm64/kernel/process.c  | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..c7fc79409f98 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -177,6 +177,7 @@ config ARM64
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
+	select HAVE_EXIT_THREAD
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 8fa0707069e8..f47aaad30d7d 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -67,6 +67,13 @@ void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 				     const struct kernel_clone_args *args);
 
+static inline void gcs_reset_thread(struct task_struct *task)
+{
+	task->thread.gcs_base = 0;
+	task->thread.gcs_size = 0;
+	task->thread.gcspr_el0 = 0;
+}
+
 static inline int gcs_check_locked(struct task_struct *task,
 				   unsigned long new_val)
 {
@@ -167,6 +174,7 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 static inline void gcs_set_el0_mode(struct task_struct *task) { }
 static inline void gcs_free(struct task_struct *task) { }
 static inline void gcs_preserve_current_state(void) { }
+static inline void gcs_reset_thread(struct task_struct *task) { }
 static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
 				int *err) { }
 static inline void push_user_gcs(unsigned long val, int *err) { }
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..83d5a07a238f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,6 +341,16 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/*
+	 * copy_process() calls this after copy_thread() returns 0.
+	 * deactivate_mm() does not run on that failure path.
+	 * gcs_free() is a no-op once gcs_base is cleared.
+	 */
+	gcs_free(tsk);
+}
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
@@ -503,6 +513,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
+		/*
+		 * Tasks created through the args->fn path do not
+		 * allocate a user GCS here. Clear inherited allocation
+		 * tracking so a later failed copy_process() cannot
+		 * release the caller's GCS when the mm is still shared
+		 * (CLONE_VM), as with kernel_thread() and
+		 * create_io_thread().
+		 */
+		gcs_reset_thread(p);
 
 		if (system_supports_poe())
 			p->thread.por_el0 = POR_EL0_INIT;
-- 
2.43.0


