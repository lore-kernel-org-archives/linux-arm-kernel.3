Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1vF3Pq5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e3D2wSaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=; b=C1vF3Pq5WYJr5sUHX86uXlRsqO
	4J/7sQkm674LV10K7ITw8h4Az1o5gZzjvjhBH7+iHlAuTbWt5QDy2CuYvxWfb1NNjWwRDDs44UryZ
	d+046dOx1iHPDCGGwPjTffZUhxlqM0wt6rMLrp9+1unXZC2Wexf2s5qyGl9lGM5e4/JKO2VFjLZHW
	EIXMlC/PatF4LNb/RvDuzOHsNbYl/v5uPgnwbBQa4frZodgg5xKPKpElA1kHseXKNSB9NvEaeJWYG
	geqmd45z78Rl3v5AuBvuu7u6wVadU8XN3vx3S/od5AYR5I1+K0aVQSYs0Ap3IGsWl7BX6uXuTM2e/
	90AMSr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERJ-0000000AQOK-0Pvf;
	Tue, 20 Oct 2026 18:19:57 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERD-0000000AQJn-3loo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:19:53 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-35d0be18c71so1105007eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520391; x=1793125191; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
        b=e3D2wSaXQ5/BNJSHfqOBbWUdTbpYf/AO5iGsl+GowT4sQVP2NncP8JUUb6+BZCyIYM
         nN9ppp0qLfvaQN9MKV3ZYkyttXYB3Tcuc+T9H/JWtnpQ+Bl/NyDpJqZXmM2h6aIWtejX
         reSbBMoCteAFpsizAxfQIEsZKD4Y9tT4K38tw6cJlK6hy1oFZHqWOEWpDcx5/tFV5R1T
         PGBh8SNvibxB7BI80/D+GR/FmQ65LC/w2p5/b34vWBOLPjCAFytn+Pxx65fjGHzmOK36
         MS2wl6qjtk5fwIsQg7ifC3Q3ZjAlgA68ujUUUYpMC6JbQAPS+cQwaNeysQWKRTDHnlVk
         D1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520391; x=1793125191;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
        b=ksWR2o4F8EEi3DUuaNYeFEi8ij6tW5GST61SKABfIfX9INXJElSofV5/uSvkK4OzTz
         zDPxR3X7fAqWpNW1OjQ94nEy0z12AXWJCJDYYRVrVIw1Qt9oAh6qfcU/+TZPeBYjcl/U
         v76gTSOPg17QQYvteK/jHjLYFoVnQeNivNQ6tW95pxnea71AL2De7Aj52gfQ/vFTTc95
         nhCQGKDCVFwA31PhZrdh5H9Qw5+EiwiKiZfTf2N2LefAthTp32XKdfHaIMt2AgcvCDns
         4s0gijt/pfYFmgv22ont+o6Cg4qjB8E/faIvVkNhoBbcV/xxf7w9Uh4gZwVPONxH0aLH
         fWtQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9iwqBnhqjo+0vD4UdlahIWKIxhFSeQj/HhQNH+le2Y4lFghQ9R9cSTpaPQMXWH665H8gGH2VhOFE2j0sG14CK@lists.infradead.org
X-Gm-Message-State: AFq9FYIpwZ65Nc8uDQVqCowQL7ThLw6oHNHqzWme2bHuLXnp4BFimRBU
	ksFkZ5fzexD4vAVj79V4BEHyMt58a/7XuNr5x/4AgtHq0gV6zt5lJM9X
X-Gm-Gg: AYBFou1snZ3fjNJWbYhJSJTWI3Ao3LpEpE7cpETlKUB1FDR4D+N/7mkcFM/YQ+i6/lb
	PMn5lYsANBbC467aoC/+upekWwn+FUlk56K3ldMsIwX+q94GKTR65CyzvZD0vZRmH7juqK0GUAw
	Spj4Kr2AWW8jgdGf0/r6zvYbGXMLAYry60j5fCokGtctMB9C1jHJg1NVQi8oNrHGHIgNzClKMws
	380bG3jja6mZ0uQ8G7llR5JVkOiIa1ChemhOTHkJBaitGTmfTDAcgxE1jMJtBxYCnp5DKeogUJD
	Hzh9nS6kfhYwJ+HQgRabtrgFx7i36c/vu64xHvJntXMpqKEr4eUsoCr5iyEBzezHJT+LIo9IJct
	4yj6E93Ifdaq/fIFfUK46UgJF3GJgtmPeXN6Q58s1gVKWLCF8kge+HEm5ItQdaxIyYF0oTUIZpi
	UG4lh0ldidfE8clL+3G0uMHTZowAajlcAgZJFCdtavhy/wymR469zJlsqLnh16BkHc0lzLpwE4R
	fI=
X-Received: by 2002:a05:7301:160a:b0:366:6c79:212b with SMTP id 5a478bee46e88-3666c792450mr2214856eec.25.1792520390778;
        Tue, 20 Oct 2026 11:19:50 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:50 -0700 (PDT)
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
Subject: [PATCH v2 2/4] riscv/shstk: release shadow stack on failed fork
Date: Tue, 20 Oct 2026 15:19:31 -0300
Message-ID: <639e84e5294f48e6b3d595161c42ebb7b89557ce.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_111951_952921_C792DC7C 
X-CRM114-Status: GOOD (  16.47  )
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

copy_thread() maps a shadow stack for a CLONE_VM child and can still
return 0. A later copy_process() failure, including clone3()
CLONE_PIDFD when put_user() fails, goes through
bad_fork_cleanup_thread and exit_thread(). riscv did not select
HAVE_EXIT_THREAD, so that free was a no-op. shstk_release() already
documents this call. Normal task exit reaches it through
deactivate_mm(), while the failed-fork path did not.

Select HAVE_EXIT_THREAD and call shstk_release() from
exit_thread(). The helper already refuses a different mm and a
cleared base, so CLONE_VFORK, !CLONE_VM, and a second call after
deactivate_mm() stay no-ops.

Do not free when shstk_alloc_thread_stack() fails. That error
returns from copy_thread() with the inherited parent base still in
place, and copy_process() skips exit_thread() on that path.

Tasks created through the args->fn path (kernel_thread(),
create_io_thread(), and similar) do not allocate a user shadow
stack in copy_thread(). They still inherit tracking via
arch_dup_task_struct(), and with CLONE_VM a later failed
copy_process() still shares the caller's mm, so shstk_release()'s
mm check does not save us. Clear that tracking with
set_shstk_base().

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          |  1 +
 arch/riscv/kernel/process.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..7635f8cb0397 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -169,6 +169,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..b9b765264cc8 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
@@ -213,6 +214,16 @@ void arch_release_task_struct(struct task_struct *tsk)
 		riscv_v_thread_free(tsk);
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/*
+	 * shstk_release() documents this call for a failed CLONE_VM
+	 * clone. copy_process() reaches it only after copy_thread()
+	 * returns 0; deactivate_mm() does not run on that path.
+	 */
+	shstk_release(tsk);
+}
+
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
@@ -261,6 +272,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/*
+		 * Tasks created through the args->fn path do not
+		 * allocate a user shadow stack here. Clear inherited
+		 * allocation tracking so a later failed copy_process()
+		 * cannot release the caller's stack when the mm is
+		 * still shared (CLONE_VM), as with kernel_thread() and
+		 * create_io_thread().
+		 */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0


