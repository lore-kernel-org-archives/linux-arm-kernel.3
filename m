Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3195606B229
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PH1ycYIl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBTFMgW6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xYhA+4xs8LRrA1wJe9S44qbgci30j0A5eEtwpktcSPc=; b=PH1ycYIlNV/jXb
	+8IUncxN8ufcRSyS3KpooACxXG/OC2gWDHuY68TcqyYCc1A9WSpITNVYNtRjKWoi0Jx47zRQQ453m
	ai1FUzSOCS+77pb8SemOfJ/lKvKoLk3orDnt2afkL8MbqUvBjN+60s9l3GyZKknnp+uxKKdW5io7P
	juU7BBbhRS/w6Ywwhy3AYNIoSDOMmKW5b/UgCkYNc049GAKM/HslMPmSs/jEpbNrhp5fo9tstNxp3
	y9LR/HAr+NXqc/VrN8Xb7gnIdX5MYkgHpOzws6VK9IHWxtbx5zSNjwzJLxmtyaKgfRjQLRG2jBtmp
	mt50mUyn2mq/853G0R+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfQo-00000006MBn-2BMN;
	Wed, 04 Nov 2026 18:09:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfQo-00000006MBW-0bOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E33F14168A;
	Wed,  4 Nov 2026 18:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CA01F00A02;
	Wed,  4 Nov 2026 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815793;
	bh=xYhA+4xs8LRrA1wJe9S44qbgci30j0A5eEtwpktcSPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oBTFMgW62r5H7V8sS25AUwVRE4dHUlCHbLianBddK8QCXaMNSR7HTCuk3K1KIYnm8
	 YH26cQ3rnhIp0RETUNghG8Nk4CZ0KXHTUBZRi0phWWqcjRWAn60+WFnr1I1R4T1/8e
	 zVaxVJDVdWMmhmMTrXh7jJJgOZj9mshXnSU8LeOCWjIADiXEu5eZgddXwRfw4iHzRB
	 1uQ57qLQniYlm+IKqtBHj2UCUszD8k3pDBJlptwugCWkYuGHPaEWuH8yf4ASnJplnG
	 8DC92oEE/eJeHy7niXTNqSgTLxgysGZ053dZ57UFzJF+2Fqfm5nzRz/+tI8RyXVm4l
	 C9VlibnGe1uWQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 24C2C1980047;
	Wed,  4 Nov 2026 13:09:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 04 Nov 2026 13:09:51 -0500
X-ME-Sender: <xms:7XTranAPcM4LawnNJPwlsrHWfMITdddSB9yfHMK_3JJ6T97qOSZ7bA>
    <xme:7XTras9WPApUeXcEwpcpSZt30tqYJA59ZFgFXZp-YnhQ_Pj-1QzbzD7lZzRsVmyFV
    s0F3vfRXYVUw0Bnjmrv9EWbIg3hmm7ddgprfHLOlEZCpxvSc2WaN3qH>
X-ME-Received: <xmr:7XTrajr1ra79sA8rD4zIqKus02GbKCePpz5_v1TCAmXAwQFpOKsJPDS0_rw>
X-ME-Proxy-Cause: dmFkZTEUECgwQL3C5tdkKY31fLAMH2TFPvlSFTmgoaQDjvGEstJkEbBuZhfW1c+T6XD2n+
    lW7bAtMeDt5da3vYSJBwd0X66UVSR7ch1n2g1lGpR0+xt0GpSQ7KAvlNKq5bl/O67KSF19
    HoiGuJKgrLbOr6wuxPPpDHzqOXbbSi2nDXwYdBnBynrAwMGXdCJ45MdnKqlmOm217SU07Z
    qCgmEhe6yRm/Dm+3upbU3Sx75TXlkGmrCgs9JDgItJZSc4mT3nNQUrhu67R8Yq/3eOlwag
    A/VaZl3IdrUgSgHNALxCDSb9KTbh4KVBahW7mmzVzC3kGcV5vpsReEU8nSqDOkRjRxXDkT
    29ghDJOB25oG2CHNpk8Xt7P0RvZvBUutX/Qxd/BqyiHZeNkHpLuFs5yrQzxFfhywy1ZbS9
    zdpBQ0aQqtVfdQbe98GJ1Z2SHx1H6GhD3WDxslll3xCHeNgWNGOkhATq/iyWAaDRa+7ZB8
    EtM1zsSZxwtqYxgIdiBhg0ag2Xp6O1nyUoAKBSjeSw2j+yp9KW+vIgJwtEfhJwYi6ejes2
    qyPEioxngkdRBVzUDJ9bLRswioJe7gleg7VQ4ERc8e3pIHnYk5rSNyxLa5QNIV8XnFqWRV
    GkQ1LkyqY4utAzEuhFFw8hZ2d9JQE2Y3Pmdx/gUAg4Swj3UU8aBUD9YgDnaw
X-ME-Proxy: <xmx:7XTrauH4hTvbflk7auVb12YBypY9KqHpfvTvNEpJKUELqtpBKe5nDw>
    <xmx:7XTrav-N9KMhPnU0X_HEN_hydbkEaGI7zfotzQJR6BvyPY27WuaR6g>
    <xmx:7XTrajRfWeYTEuWQdgCMueF8KCXWC9VmX5gIpuCAAFnlkLzmYA5P0Q>
    <xmx:7XTraspLMVZpf90tYxSqspq4vROkzk2NBqAl-QqjvYwK0tZj8QEhUw>
    <xmx:7XTraoMgALtYI31ry0oZy_55vtaVsNFEyWBcRB9qUVonX-GtNW_ZwIlj>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 13:09:49 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Usama Arif <usama.arif@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64: sdei: Preserve the interrupted context's exception registers
Date: Wed,  4 Nov 2026 18:09:34 +0000
Message-ID: <20261104180936.2981070-3-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104180936.2981070-1-kas@kernel.org>
References: <20261104180936.2981070-1-kas@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An SDEI event is dispatched by firmware regardless of PSTATE.DAIF, so it
can interrupt the kernel where the exception registers are live:

 - exception entry, before kernel_entry has saved ELR_EL1/SPSR_EL1 and
   before the C handler has read ESR_EL1/FAR_EL1;
 - exception return, after kernel_exit has loaded ELR_EL1/SPSR_EL1 and
   before the ERET.

An IRQ or pseudo-NMI cannot arrive there with PSTATE.I set. Firmware
saves only x0-x17, PC and PSTATE around an SDEI event, so a synchronous
exception taken by the handler overwrites the interrupted context's
ELR, SPSR, ESR and FAR. do_sdei_event() only notices that ELR changed,
and warns.

The interrupted context then carries on with the handler's state. A
task interrupted on its way into the kernel can be sent SIGILL for the
handler's kernel data abort. A task interrupted on its way back to user
space ERETs to EL1, at the handler's fixup address, with user registers
loaded.

With SDEI delivering NMI backtraces, this happens in normal operation.
The handler runs show_regs(), which reads through possibly-NULL pointers
with the _nofault() accessors. print_worker_info() faults this way for a
kworker that is not running a work item, and a single sysrq-l warned
once per such kworker.

Save ELR, SPSR, ESR and FAR on entry to do_sdei_event() and restore them
before returning to firmware.

Once they are restored, a nested exception is harmless if its handler is
safe in NMI context. That holds for EL1 data aborts on translation,
permission and access-flag faults, which never take the mmap lock in NMI
context, and for BRK. Warn once, with the syndrome, about any other
exception class.

Fixes: f5df26961853 ("arm64: kernel: Add arch-specific SDEI entry code and CPU masking")
Cc: stable@vger.kernel.org
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 arch/arm64/kernel/sdei.c | 61 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 9fa2a3aeed48..1ea566f30586 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -196,6 +196,31 @@ unsigned long sdei_arch_get_entry_point(int conduit)
 	return 0;
 }
 
+/*
+ * Exceptions an SDEI handler may take without harm once do_sdei_event() has
+ * restored the interrupted context's exception registers. Their handlers are
+ * safe in NMI context:
+ *  - EL1 data aborts on translation, permission and access-flag faults:
+ *    faulthandler_disabled() is true in NMI context, so do_page_fault() never
+ *    takes the mmap lock. This covers the _nofault() accessors used by the
+ *    generic dump_stack()/show_regs() code (e.g. print_worker_info()).
+ *  - BRK: kprobes, WARN/BUG, kCFI and UBSAN traps, all NMI-capable.
+ * Anything else taken at EL1 is fatal on its own, or unexpected here.
+ */
+static bool sdei_nested_exception_ok(unsigned long esr)
+{
+	switch (ESR_ELx_EC(esr)) {
+	case ESR_ELx_EC_DABT_CUR:
+		return esr_fsc_is_translation_fault(esr) ||
+		       esr_fsc_is_permission_fault(esr) ||
+		       esr_fsc_is_access_flag_fault(esr);
+	case ESR_ELx_EC_BRK64:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * do_sdei_event() returns one of:
  *  SDEI_EV_HANDLED -  success, return to the interrupted context.
@@ -209,6 +234,10 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	int i, err = 0;
 	int clobbered_registers = 4;
 	u64 elr = read_sysreg(elr_el1);
+	u64 spsr = read_sysreg(spsr_el1);
+	u64 esr = read_sysreg(esr_el1);
+	u64 far = read_sysreg(far_el1);
+	u64 nested_elr, nested_esr, nested_far;
 	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
 	unsigned long vbar = read_sysreg(vbar_el1);
 
@@ -237,15 +266,33 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 
 	err = sdei_event_handler(regs, arg);
 
-	if (elr != read_sysreg(elr_el1)) {
-		/*
-		 * We took a synchronous exception from the SDEI handler.
-		 * This could deadlock, and if you interrupt KVM it will
-		 * hyp-panic instead.
-		 */
-		pr_warn("unsafe: exception during handler\n");
+	/*
+	 * SDEI is not an architectural exception: nothing saved the
+	 * interrupted context's exception registers on the way in, and it may
+	 * be in the middle of exception entry or return (SDEI ignores DAIF).
+	 * Any synchronous exception the handler took has overwritten them.
+	 * Only the last one's syndrome survives; report it if it is not one
+	 * known to be harmless.
+	 *
+	 * If the event interrupted a KVM world switch, VBAR points at the KVM
+	 * hyp vectors and any such exception is a hyp panic instead.
+	 */
+	nested_elr = read_sysreg(elr_el1);
+	nested_esr = read_sysreg(esr_el1);
+	nested_far = read_sysreg(far_el1);
+	if (nested_elr != elr && !sdei_nested_exception_ok(nested_esr)) {
+		pr_warn_once("unexpected exception during handler: ESR %#llx FAR %#llx near %pS\n",
+			     nested_esr, nested_far, (void *)nested_elr);
 	}
 
+	/*
+	 * Put them back unconditionally. An unchanged ELR does not rule out a
+	 * nested exception: one may have returned to the same address.
+	 */
+	write_sysreg(elr, elr_el1);
+	write_sysreg(spsr, spsr_el1);
+	write_sysreg(esr, esr_el1);
+	write_sysreg(far, far_el1);
 	write_sysreg(vbar, vbar_el1);
 
 	if (err)
-- 
2.54.0


