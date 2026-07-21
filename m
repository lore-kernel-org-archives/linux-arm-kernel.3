Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D47C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJeAdwdxWOOSys6gC+zXvLV8FMT7RnU+jSncR7MBcTQ=; b=dIq3PKiqZsf0rv6ERTG5cwJHUM
	n3hrEov/5A/FlmgZsckcdJpIQSdEtWBCgg1mcfZdEc5LSe+rE0D4uS0HM9FQcmVMX87qJ2DNF6ONZ
	h2rUQJ3SFkFfW46aq6DS16GmYJms21gQcEQ7DYb7hR/deG4KDePNQsCzfJxbG4kbYyW0/sd56i0tf
	fbAFfYnL5ObJ712anDDWaFVClGcYijsFEVgzIPN4NVSZRWZ+qu8AMN1nQfzyl2cqZmOtfwVowxGLM
	+NZqjdCu6FIW4NFV5s2Lg2QaKPA8VTvEVypGY9KGrF1ZIiwEBW0BMXvWWj359hz4+gC/wJbDTtrUf
	WAGxD1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5hE-00000008miT-2xw0;
	Tue, 21 Jul 2026 08:19:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5h8-00000008mbM-0QVU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 08:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NJeAdwdxWOOSys6gC+zXvLV8FMT7RnU+jSncR7MBcTQ=; b=QNrmgjZQH4h3rV9Q5k7i8S/LDC
	T+M7Oi92DsXvWYSQ9bq1j6QAgiq1M0fRl6SBpz6N4G+1miO1AUKsmouvIWVSHrTCu7BLkcQjQaKmP
	QAE9JlIlLN9KKdiW709G4EprINbI0sCy36TRMgUgjhiPer4jZEDg7ltUxIphpqTxoSBEkXBmP6362
	3R/3vJ0/TDEtpknHJkOc4tpXFOWPYWhY1RLC8XdQaeFCIpMEKl3WoggdXwt80nCv/dVkSbVGWhGUv
	kbdH/t4XOFv/Hpge1XC1+ucbJh5SoQGoZg5W9aAfwWH36guYBcR7+FkW1FG2ZFGpmS0FQ5cH4XxAl
	nvVpixsg==;
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm5h4-0000000HKcY-2rkW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:19:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NJeAdwdxWOOSys6gC+zXvLV8FMT7RnU+jSncR7MBcTQ=;
	b=TbmmB0khGaHtXpeDcUUIXptONjXPj43FzUyeUQ1RfNjScRToqG3B1xy+rOBAcV246tsnMce5c
	Tqz/Bcf/7v9QxN/Jti5CjoxBj4ZPbsoH8s4tzGPSo35jqsMfywnmUqAPtYxwg5b1MWQCHSlUZrN
	EI3lQedyWGYVe6IKy/936Do=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4h49652fj3zLlWC;
	Tue, 21 Jul 2026 16:09:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 63FD440565;
	Tue, 21 Jul 2026 16:19:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jul
 2026 16:19:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <kees@kernel.org>,
	<oleg@redhat.com>, <luto@amacapital.net>, <wad@chromium.org>,
	<thuth@redhat.com>, <peterz@infradead.org>, <mark.rutland@arm.com>,
	<linusw@kernel.org>, <ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <anshuman.khandual@arm.com>, <james.morse@arm.com>,
	<tglx@kernel.org>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v17 11/15] arm64: syscall: Simplify el0_svc_common() syscall exit path
Date: Tue, 21 Jul 2026 16:18:54 +0800
Message-ID: <20260721081858.1169276-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721081858.1169276-1-ruanjinjie@huawei.com>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_091915_448938_9FCBED48 
X-CRM114-Status: GOOD (  12.17  )
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

Remove the redundant nested conditional check within the system call
exit path of el0_svc_common() to streamline the exit sequence.

When entering this fast-path block, CONFIG_DEBUG_RSEQ is guaranteed to be
disabled so the call of rseq_syscall() is a no-op. Under this constraint,
the code logic inside the block becomes completely identical to what
the arm64_syscall_exit_to_user_mode_work() helper already does. Replace
that nested logic with a direct invocation of the helper, eliminating
redundant code.

Before:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
| 	flags = read_thread_flags();
| 	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
| 		arm64_syscall_exit_to_user_mode_work(regs);
| 	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

After simplify:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
|	arm64_syscall_exit_to_user_mode_work(regs);
|	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

Furthermore, Since both the conditional fast-path and the fallback
slow-path now uniformly invoke arm64_syscall_exit_to_user_mode_work(),
this explicit conditional branch is entirely redundant regardless of
whether the evaluation is true or false. Removing it collapses
the duplicated logic into a single, unconditional path.

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index a8e0bf8d362e..3488afd45d20 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -114,19 +114,6 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 	invoke_syscall(regs, scno, sc_nr, syscall_table);
-
-	/*
-	 * The tracing status may have changed under our feet, so we have to
-	 * check again. However, if we were tracing entry, then we always trace
-	 * exit regardless, as the old entry assembly did.
-	 */
-	if (!(unlikely(flags & _TIF_SYSCALL_WORK)) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
-		flags = read_thread_flags();
-		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
-			arm64_syscall_exit_to_user_mode_work(regs);
-		return;
-	}
-
 trace_exit:
 	arm64_syscall_exit_to_user_mode_work(regs);
 }
-- 
2.34.1


