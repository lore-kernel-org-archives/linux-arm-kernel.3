Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349960A262F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sz4ApF5D;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4hs0SOE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=; b=Sz4ApF5DMF5K5F
	XjWYDs/UeL+MQufKq8cT99NSO9FiUBI6EmNGkRLzt3N7dAE3rLNk2v8C55dRG4yhJ0IuF36cCcMxO
	15TqboptRug0zHSZSPD11TiILaAc9G8WOIr6b9nrYDlPMjrq/hqZZFRvjfxOhtvgFs4X9axWuVCQI
	30eXWuN4DZpiA4Vzio9JPsFyCqBmxAuyvVgjXWTPi1553aInpPhemuYRY1oKJzTKSusBct6Yw8rfi
	7cuK2LNQ+QZKVcg4QXn6+3+6SV7uqpygcG6h5Oa29ZK8F404tWQsmVi17hYAJL/Ha1vj2aUZL8vfw
	/ODU/1P6te/K6teKKKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pD-00000007RNs-1bSh;
	Wed, 28 Oct 2026 15:44:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pA-00000007RKu-3NUB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:44:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so10942975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202261; x=1793807061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=z4hs0SOEv0p/KKh5zFAK/E546ZfeQ7FtyzdYv/P+kA4i8FoLoTcN8F5BHJ0Dw6FFSt
         2UesXDl7el2IPKUQbYuKVBlPWh009dJ2ZITi3xXAXd+jySEU2/cTlgF77pO4G7fzerK0
         q4URLlN8oLtUMSQv01n4VwITvvD8v8ItlI002fOiKCz3IHYZAotdv5O3ya0e+CtgavyN
         QTRvRBdBfpTRAXaTpJxwPYMcxN4zs9ocb4tRS+P/ME0P3xMWbaI3ReAmCZ64eju49fBQ
         C0zmhIVGpXACBYI4byp8rQKe+my/fWonfjQzDUglxliI/x/diXIx/NHOeOH/ZQyWgX4N
         w14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202261; x=1793807061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=T3fwl8Q494sY4aCJUSJP99RyqO7DnUwFHLBgJgaGlU6bfQrCt7CkAmFpciTIacyozl
         6nkJq2MQ1w7etaXFcNAFUhVlDEXIBHwH/LaE+r9FRNl6jvYi567aonzr3Yxtavq06FrV
         VjSj2fnMZBSfgAoAxIh/l/44HS4q3zdE3NXdyLb/nqNT2RrC30g7EjFZSzyM6R1dbCSE
         P4/WOAkb66uIEdlvakDofTYGXaXlkBqmr/bJd65UU7xOL8qontKEh9+M2veDsrmJ6Q0n
         wO57yp1IUWhg/8RbavbepVlBLe6YnhvMkJpWZBeAOmOL/PbASHBCNVMl6C/UznivUPVK
         Vy5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXEcyjohIvY7e/+fSmyR8e1Giyv6e4fx3VqcPl/lDmi70QwyEopI2U7rGc5zHo4S1gVplgrYHzqMF65Gg13lxM@lists.infradead.org
X-Gm-Message-State: AFq9FYIDwalKf1jGa7twBseCSHeYpTpMUq3n3Vr3+n1WocBWoiVilorW
	qbkaFwoBo+OgblpfhEuqBZX4DRZhKOoKx6pAV0er9rWlvP+cev4Y8bTe
X-Gm-Gg: AYBFou1gfu2KGBgRNOSod4Au3A0g/6O6Q/ScFLU/vNk0PRSSHJaeEajYtIcIY3LrMgp
	JtIfZAO7FVpfzDyS/lS90+1PuDD4dEq2/U0cxBY5Ei0e9NuYi1n6A+8a1Hbvrr94mR6VtOkZfvA
	OBSfRkQNW4KJ2fEcdiOCOsfk8Koig9EkFjrZGBQpq5QkZBBpv59FbdPNQpFpAdfz4ZkZM9vrD62
	AD6wvZH3xioivWWeA4BQ2mDWbdjESoEm90LYcDz4D68I2kHDcO6glPct45uFczfhfABUJxg1PXH
	fjIFCwYBKouQPpYp6WzmheX4LbjWuW3tLeX/aAer4RHI6xlXg6eF/hKCaau0cnmeuIB5dqOCxyM
	7Ejwsn+vTRa0uQ9A1EpATulQRg4tJgmh5sV+eDfbx3ptsySetZeraxDSjiSZOWH7BXcVIjyGuFD
	G33ERr84f8Kl8uM9/kFFHTz2zmSRfCDwNVcoCh4565wevtkrfNR3WGpPf6Old1Yylz35726C5hJ
	FwvkeL1YrITT+Nicmn9kaFRI2uWtDHFs/YQNasqthc44bOX4TbCve2iOVP840+5rwFQP4ftCSSL
	TBfI4/xOHgfomuhewcwhv7W/h6qx9df32Cg8tBMUui9A+CnGUBXnfkanPzWVbEfgWQ==
X-Received: by 2002:a05:600c:8b6d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4a967f8c344mr59591525e9.31.1793202261496;
        Wed, 28 Oct 2026 08:44:21 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:20 -0700 (PDT)
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
Subject: [PATCH v3 2/4] riscv/shstk: release shadow stack on failed fork
Date: Wed, 28 Oct 2026 12:43:13 -0300
Message-ID: <20261028154315.1272705-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084424_865253_575837F2 
X-CRM114-Status: GOOD (  12.54  )
X-Spam-Score: 0.1 (/)
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

Same hole as arm64: copy_thread() maps a CLONE_VM shadow stack,
copy_process() fails later, exit_thread() ran but was never
implemented. Select HAVE_EXIT_THREAD and call shstk_release().

shstk_release() already documented this path; connect it. Clear
inherited tracking on the args->fn path for the same CLONE_VM
reason as arm64.

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6c9d61d83d71..ba1ee563aa54 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -168,6 +168,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..5bb93377d67f 100644
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
@@ -213,6 +214,12 @@ void arch_release_task_struct(struct task_struct *tsk)
 		riscv_v_thread_free(tsk);
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/* Failed fork after copy_thread(); deactivate_mm() does not run. */
+	shstk_release(tsk);
+}
+
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
@@ -261,6 +268,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/* No user shstk alloc here; drop inherited tracking for CLONE_VM. */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0


