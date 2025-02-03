Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932BAC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVykWfPj6hH80UBabvF2jVot4ICLdWiycKbgvtjRQrc=; b=VHxRzge1xcCaK+rsnPBEvPtN/b
	gNVqLoMP4gXWa909rn7QmFUwlZTfb9hFW7zCFmxkuyZsTZjEOFHTG95fIIfQ5Q7cfc+J+HVWqArlJ
	ZanX3dJBnZCOoYydCMHt9IatuhkS07uNAbjeBKC6ugQ+7lISRZrsWu37jpuKej9HhgyCADWj+VlQ9
	DPZBXSYIPTB8ALJ3NmF9OPbJKBgbWxpUDLLg3uU419qSBobnODMoMmvWInkztB+xni/eYhcm0NhyI
	MhI8FLZstaz/YPY+6JvpCQDYpFHA0UvQgHQAM2HYVSSO5yJp13Z+kqefFxOnOvhAII7UYb9rSBBwZ
	jRZ18ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texIQ-0000000FdvH-039M;
	Mon, 03 Feb 2025 14:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texFq-0000000FdP7-2o0k
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 14:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JVykWfPj6hH80UBabvF2jVot4ICLdWiycKbgvtjRQrc=; b=DHdH0KPqmGSVrc4I/U/cfkzi3a
	It+q0lYm1VG0U0OqyjYbC8o5OJCLNelzQ7UHGJjCX3ip6tQPyKyfWYe7sA7E9XfQ6erKlH61CKR2Y
	6VhnboGTHbFgNvOGOrQNCgcNkV3mbT8rSZhjkdkLDxS86I9grV8eYrPLEK+v6/ac8yCt+1BYGvhVo
	HejwmAllBJCN8BwHZUIuzbxRJ6f40AVXcsvDf7mPU2dA/n/VdMA35UoRb7Qt4cDSBprLurs1sroOF
	Co+rmzhZGdqy1X+BPyv42OKKuRYOvr7yGugl6udAaGgGfd8iifSBBMOjWYOxHsk4nccXboJky81R7
	AWmdaLAg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texFn-0000000G67T-2x6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 14:16:49 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738592206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVykWfPj6hH80UBabvF2jVot4ICLdWiycKbgvtjRQrc=;
	b=OAAvsyVfJIXCTDV0jlmbfBRVNnFAHe2s/axWez929gL0/1SFj9CCtWFrIBDxrHVhLSdYt6
	fehMewweBdKqQrNTtqxuFAxGTa/EkHsWHrhIrsdfPP45R7Pgar0l2Tbx55CpVGtff4IjeY
	W55Ri92Fzj9mYUxW0WisFiJFO5anm/O6fakD3WdKbKg7EpuRWnr2W2zWp6YAxQT4Wzl5NI
	a8V5LZIFkVcvX+24mPhx0Xgo9r85e8rCmmu9gkDiGL2kjPRA0+IMX+h1tLJ38tTSu/FRBl
	3GFzrE+teMc8I/5iXnPIHH0BGy1aTzTw0V3+qAooJDXuDepXwDmlUZUXRQMQ9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738592206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVykWfPj6hH80UBabvF2jVot4ICLdWiycKbgvtjRQrc=;
	b=qQjoimeaG99ho0DbphIIPeIOyoN5S4z/BmH9EKPnuytCz1jWmC+iyLEcDyhSKbNEWQwAuB
	4pOonPeDJP1YFxAQ==
To: linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/9] arm64: Rely on generic printing of preemption model.
Date: Mon,  3 Feb 2025 15:16:27 +0100
Message-ID: <20250203141632.440554-5-bigeasy@linutronix.de>
In-Reply-To: <20250203141632.440554-1-bigeasy@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_141647_953684_F496A209 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

__die() invokes later show_regs() -> show_regs_print_info() which prints
the current preemption model.
Remove it from the initial line.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm64/kernel/traps.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 4e26bd356a482..529cff825531c 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -172,14 +172,6 @@ static void dump_kernel_instr(const char *lvl, struct =
pt_regs *regs)
 	printk("%sCode: %s\n", lvl, str);
 }
=20
-#ifdef CONFIG_PREEMPT
-#define S_PREEMPT " PREEMPT"
-#elif defined(CONFIG_PREEMPT_RT)
-#define S_PREEMPT " PREEMPT_RT"
-#else
-#define S_PREEMPT ""
-#endif
-
 #define S_SMP " SMP"
=20
 static int __die(const char *str, long err, struct pt_regs *regs)
@@ -187,7 +179,7 @@ static int __die(const char *str, long err, struct pt_r=
egs *regs)
 	static int die_counter;
 	int ret;
=20
-	pr_emerg("Internal error: %s: %016lx [#%d]" S_PREEMPT S_SMP "\n",
+	pr_emerg("Internal error: %s: %016lx [#%d] " S_SMP "\n",
 		 str, err, ++die_counter);
=20
 	/* trap and error numbers are mostly meaningless on ARM */
--=20
2.47.2


