Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62708CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pkFhCZSrm3tjoa8Idf0j+53x2+lM50lXzhwLJ2hVNWY=; b=Ch4R8YWzhnZXrKAgITQXa4L3O0
	qaMir3CWAjp0096QWXF9d5Y4Xbry33/rQLUbuxza5MOLizxzb8VcSHxGZlB7x/75SawC5J4dr55GQ
	Or5YySA+Jcll1ZdbDSOyljLJWhwACUMwRn7CtDliwQtJOT+5nhvgsp3nyleUPIWoIPrJMoKbWOvVj
	Uk1hZPBm3MavNyFSezyG2zp4XwSpAUS4C6/cs7wO1JCHnupig0LnnvXPRFYpZm0acQ5+oSpv3xRKY
	hR6ekhS5c0xeSWng597QD6ZFpOwOzokfMCj1qZ3k52X8lXuNlI3/qzdI0lHleMGKhC6BugcwhoKgS
	NmDUzouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Rj-0000000041D-2csy;
	Wed, 29 Oct 2025 07:18:15 +0000
Received: from unicom146.biz-email.net ([210.51.26.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Rg-000000003us-0YXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 07:18:14 +0000
Received: from jtjnmail201620.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202510291517433647;
        Wed, 29 Oct 2025 15:17:43 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 jtjnmail201620.home.langchao.com (10.100.2.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 29 Oct 2025 15:17:44 +0800
Received: from inspur.com (10.100.2.113) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 29 Oct 2025 15:17:44 +0800
Received: from localhost.localdomain.com (unknown [10.94.19.60])
	by app9 (Coremail) with SMTP id cQJkCsDwSHmXvwFpdDgHAA--.5676S2;
	Wed, 29 Oct 2025 15:17:44 +0800 (CST)
From: Bo Liu <liubo03@inspur.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH] arm64: Fix double word in comments
Date: Wed, 29 Oct 2025 15:17:42 +0800
Message-ID: <20251029071742.17732-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cQJkCsDwSHmXvwFpdDgHAA--.5676S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DGFyfAw47Zr1ftryDAwb_yoW8Grykp3
	4DurykAw4kC3WYka4DCwsxXFs8A395trWUGw1UZrWrtr90k348Wrn2vr1Y9rWrXrWrXayf
	uFyqyr15W3WkArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
	6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU122NtUUUUU==
X-CM-SenderInfo: xolxu0iqt6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?073cd2LVRuiwy3Lqe5bb/wL3YD0Z3+qys2oM3YyJaJDj+48qHwuUARU7xYOAI0q1Re
	KIpW5E45D/ppzVTEP3m+j7VajTAnWQJGywx+S+ZzlAJpWdDBKU+9ND03LjUKXr5WWebhqV
	UxgGA21U09ARJ3pXvdw=
Content-Type: text/plain
tUid: 2025102915174356467725e5a955cb26b5d87bf08cd158
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_001812_458260_852D33BB 
X-CRM114-Status: GOOD (  11.56  )
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

Remove the repeated word "the" in comments.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 arch/arm64/kernel/entry-ftrace.S | 2 +-
 arch/arm64/kvm/arm.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 169ccf600066..025140caafe7 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -94,7 +94,7 @@ SYM_CODE_START(ftrace_caller)
 	stp	x29, x30, [sp, #FREGS_SIZE]
 	add	x29, sp, #FREGS_SIZE
 
-	/* Prepare arguments for the the tracer func */
+	/* Prepare arguments for the tracer func */
 	sub	x0, x30, #AARCH64_INSN_SIZE		// ip (callsite's BL insn)
 	mov	x1, x9					// parent_ip (callsite's LR)
 	mov	x3, sp					// regs
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a7..9886bebc7263 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2448,7 +2448,7 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(__icache_flags) = __icache_flags;
 	kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
 
-	/* Propagate the FGT state to the the nVHE side */
+	/* Propagate the FGT state to the nVHE side */
 	kvm_nvhe_sym(hfgrtr_masks)  = hfgrtr_masks;
 	kvm_nvhe_sym(hfgwtr_masks)  = hfgwtr_masks;
 	kvm_nvhe_sym(hfgitr_masks)  = hfgitr_masks;
-- 
2.31.1


