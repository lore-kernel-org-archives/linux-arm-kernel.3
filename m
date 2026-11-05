Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zcr9dMFd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=ZrgEzNxZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gYnwjJAn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p3Xyi2FenVyC7IBy7SmlFnfPP6LDOy256ykx/QDxSWU=; b=Zcr9dMFdgh8fA0KHuVb97SG7bJ
	a576GYXPARjmH8NOpEDdsiHdpLo9wRhKS6YKK+0qac1yr1GgxsnEJkvdv2ZBtSiAKGPAFYEBcOUw6
	nDUcEqhnYPr/BJsW1+i5EvRX47vMbbvHj5nO6xB3um+Kowcyau+S2na00mBVmPwwx/S3++Ay3bCFD
	Jb2p3rFZRsYRsfe0ptKxokc/PxTsQ1Ljk7HX9pNQigdgwfubmqJp4fVBogU76aqC/wg+xv86pT2Ed
	WjjUxIwaxVMz6hEH28d+7Qj/FPN4LZwnujp1vgEPWlI5jKqwZWNj/TtLez17DJVjce3cI7O6LLrna
	r49dA2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwGv-00000008qB6-3ofs;
	Thu, 05 Nov 2026 12:08:49 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwGp-00000008q8L-0jRO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:08:45 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 54BC414001B6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 07:08:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 05 Nov 2026 07:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1793880519; x=1793966919; bh=p3Xyi2FenV
	yC7IBy7SmlFnfPP6LDOy256ykx/QDxSWU=; b=ZrgEzNxZCV2FKQwvqRTsQPgj3F
	wgqQhMhSkYvngHlFhx7z+1Xf7YjvfGTW7B0XPm6Pl/HsD4TvRJjUDYVVOcCZ0S6b
	JOmBTSGW31V6i+rIh9DYDV26mux/rP6VztMkf5V8feIXrvBQbmaD8UvuWsPQvahM
	rYOwEOdWGEVrs6U8eMWpUxTkQRhm5kjAV2AuUf41MFlv4dfTemfvBbU60Hx4BzG0
	4sCtWkwff2P9YEw86hllP/+r+/p5a27I9HC3M/KEPW5UNtUNZttRk2aZbSh83+Hq
	xA1mtif73UMF+n7egjj6GaEjF3ZyWi/IgaFIZYeb5YNVI+KdFUdCs/mqaYpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793880519; x=1793966919; bh=p3Xyi2FenVyC7IBy7SmlFnfPP6LDOy256yk
	x/QDxSWU=; b=gYnwjJAnPFQkHTQ8ZU2Jk/wj0pxhesnNj+1yuHmSGdliO5x6qiY
	ogH9xjHSgIgKlHm59gd0tIDlUYT/5FRvuEzBk5TwQRxrBEnO2M4ldDRHcyBBqf1i
	mq/8TJW7IlNXdvEIYdfOet2zhkh1VJ7w7jHFnPlf6+fTqgsFuuaFrpKALZlG38Cg
	E/zN9nQkKucqjwnh945LNZOM/obGybI38V3rKU5Ev+Lk3Ep74a00Q/mjbIhWkNHq
	jhsRt272eoJMP4i6NnduBum9ulH4kgbQ5AFssZsr7caCpyOB0AWo2N7ZKFVHTo45
	xuX8Zww8JJjIYXsf7kL2Vsskn1DnKgiHluQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793880519; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:HP3qyIutBHxW8Qvj4zC1FUXSu8Izj/ZIilIxpkfVvo6HQtj
	NCXgaoJ3cUMpt44obiX2kRSONYtBb3E6sOYUpmE58ct1noDcxfy/bYOCLsWMn/0r
	7hewrsJnv0zClmNukfDMOLQz9gtPkY01SDYbPRln38lboKTfwQCajikieZv5yuaS
	IgxUBNUJ4TDdFPW/AVSGJBO9Wx6oSA8PibnjK3G54Kv1h2niHn0Khzcsbc1N2am4
	4CAeN7ru2kmJFTs30wHBmQ2v2+X4vbuQkWKmzhUqrHtEwDMHJzyVluaGCXSGSJ3j
	vde8csF6a4Uac40qQPXC6unQVDdslq5344T0Jdg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:dHD/twnOzKncpD5LZfJjZ7tx41byi46oAAOILLGusM4=:2nDWhAMGM6gTvJP5CJNUMz0Z6aVtkgq7RSwTSE/CR+0=;
X-ME-Sender: <xms:xnHsat80G8zeq0Q5WErQ8GLnGIJjarIlyMlsIspa5txZAvWagafMdQ>
    <xme:xnHsag8VYJ1QkTp35aMJ3CxAPL-2NgaZSbIq_AlPS-XXsHgujrdReLqfRJEqei7YF
    3japJvaoYThqIPjF_I_sa302kcgisbShDLDLnxk6IYzvWQ381qMBYc>
X-ME-Received: <xmr:xnHsat1lB9tR1bM8OaOJJuKMB0Kdg09f75kBQIojQgcWFFm39GD7tNKBJOw>
X-ME-Proxy-Cause: dmFkZTGHSXF4B/s09MhloUXbeEW1Z0r9bcBRaXAhLjl7llcPWwXfg75sWHfXEgiqsEBn78
    qe1WxG6pHi54wc48VGLSAnBmrjNEbtfENOIN8TfpW4NPX7hqkGi2QRR979WFKJl7OcSDjb
    DJy8IZhD8voWgdotb6WaZqdijL4EKF0YJCpEne23pJEVVPG2Zl0Ls6BjyQek4riqK3NaJP
    iiTCW1nK5kSsAVda1+WdmSVx4JQLWtgqEH/80yo0H/oUJem46VCmGmYMWPL7ib2JIdwMLh
    ruBtTnJEthb6JqWiudbdRYy/SGvBe+R9vCHG14KH/F+0VREG4ZByfmpAVsYZLqypcOIVqy
    QFwgxpfMEdVuaAOLruih2Ij262AUv06mhYZZIZWpixk9Y3s94uakvBg90Ouu828ZBqqquj
    4qTx4qSgTnTpeMWX79hr4CuI5GD/pQK8PtloR8iRoFP3VjlrUBqQ+GZTAvvfsuDi7vDwDE
    GjH2FaN08HRfIgDfA8rL31d17dTJu0J+20Qa2QRpGrLLaPZ//Ep5HWDw8Dz+VVR5SbexQG
    YSHxNy/zT9zpHDWQtomgGbj+emMHo9fO8KYCRHzykjLcMRQtvzjsSzyy8oXC06T9q4HooN
    8guj8BYcqi+OLh8aC+X91eGh2LN3sXZgugZC7IB6dDk6ptggzO8woprm2HNQ
X-ME-Proxy: <xmx:xnHsao_EOPJunw-wAUzDM8OouyK4IWECQp2c7aoYM-nnHUk97Izafg>
    <xmx:xnHsamdz5Iv7GEGPxcMcnzkZJGU0sKNn7V0mepLYC1bCyPKXgES3-A>
    <xmx:xnHsasH76mCv8udEx7JXtp9UrOp_YqwmlrUwdUUXmmETyaQk_WPuCQ>
    <xmx:xnHsajB-PN8PHs8etuMkicApMbLI4zFlmagEFOaBaNz8053YmyF5-Q>
    <xmx:x3HsavVMlyjZdhZisrP0kuHgLiBejyCY8JeS_88AApJjnRW8KsSgGcKH>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 07:08:37 -0500 (EST)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v2 0/2] arm64: sdei: Handle exceptions taken inside the event handler
Date: Thu,  5 Nov 2026 12:08:32 +0000
Message-ID: <20261105120835.3321912-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040843_365088_7F3C1A02 
X-CRM114-Status: GOOD (  25.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

An SDEI event can land anywhere, and a synchronous exception taken by its
handler breaks the context it interrupted:

 - With KPTI, an event that lands in user space runs the handler on the
   trampoline vectors, whose current-EL half is empty. The exception
   loops there and the CPU is lost.

 - The exception overwrites ELR, SPSR, ESR and FAR. If the event landed
   in exception entry or return, the interrupted context runs on the
   handler's values: a task gets SIGILL, or the kernel oopses on a fault
   it never took.

Patch 1 runs the handler on the kernel vectors. Patch 2 saves and
restores the exception registers around it.

Handlers take such exceptions in normal operation now that SDEI delivers
NMI backtraces: show_regs() reads through _nofault() accessors that
fault, and a kprobe or WARN anywhere in the path takes a BRK.

Tested under QEMU TCG with TF-A, 4 CPUs, 20 x sysrq-l under load, with a
test-only copy_from_kernel_nofault() of address 0x10 in
sdei_nmi_handler():

 - v7.4-rc1, KPTI on: CPUs stuck in the trampoline vectors, RCU stalls.
 - v7.4-rc1, KPTI off: 60 "unsafe: exception during handler" warnings,
   SIGILL and SIGSEGV in user tasks, and an oops in execve().
 - With the series, KPTI on and off: no warnings, no stalls. The same
   with an eprobe on irq_disable that reads address 0x10, which faults
   inside irqentry_nmi_enter() when the event lands in user space.

An earlier revision of patch 2 was also run on arm64 hardware with
firmware SDEI, where a plain sysrq-l was enough to trigger the warning
without it.

Changes since v1
================

  https://lore.kernel.org/all/20261104180936.2981070-1-kas@kernel.org/

 - Switch VBAR and save the exception registers in __sdei_handler(),
   before irqentry_nmi_enter(), and restore them after
   irqentry_nmi_exit(). Both can take an exception too: the eprobe above
   wedged v1 with KPTI on (Usama). do_sdei_event() takes the interrupted
   VBAR for the IRQ-like resume.

Kiryl Shutsemau (Meta) (2):
  arm64: sdei: Run the event handler on the kernel vectors
  arm64: sdei: Preserve the interrupted context's exception registers

 arch/arm64/include/asm/sdei.h    |  3 +-
 arch/arm64/kernel/entry-common.c | 40 +++++++++++++++++++++-
 arch/arm64/kernel/sdei.c         | 59 ++++++++++++++++++++++++++------
 3 files changed, 89 insertions(+), 13 deletions(-)

Range-diff against v1:
1:  f3e1e7fd09f7 ! 1:  93ef4a287a4c arm64: sdei: Run the event handler on the kernel vectors
    @@ Commit message
         path does it: a WARN, a kprobe hit, or a fault fixed up by a _nofault()
         accessor.
     
    -    Install the kernel vectors in do_sdei_event() when VBAR_EL1 holds the
    -    trampoline vectors, and restore it before returning to firmware,
    -    including when the handler fails. The IRQ-like resume into user space
    -    keeps using the interrupted value, as it must go through the trampoline
    -    to map the kernel.
    +    Install the kernel vectors in __sdei_handler() when VBAR_EL1 holds the
    +    trampoline vectors, and restore it before returning to firmware. The
    +    switch covers irqentry_nmi_enter() and irqentry_nmi_exit() too, as Usama
    +    Arif pointed out: their tracepoints and context tracking WARNs can take
    +    an exception as well.
    +
    +    The IRQ-like resume into user space must still go through the
    +    trampoline to map the kernel. do_sdei_event() takes the interrupted
    +    VBAR_EL1 and keeps basing the resume address on it.
     
         Fixes: 79e9aa59dc29 ("arm64: sdei: Add trampoline code for remapping the kernel")
         Cc: stable@vger.kernel.org
         Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
     
    - ## arch/arm64/kernel/sdei.c ##
    + ## arch/arm64/include/asm/sdei.h ##
    +@@ arch/arm64/include/asm/sdei.h: asmlinkage unsigned long __sdei_handler(struct pt_regs *regs,
    + 					struct sdei_registered_event *arg);
    + 
    + unsigned long do_sdei_event(struct pt_regs *regs,
    +-			    struct sdei_registered_event *arg);
    ++			    struct sdei_registered_event *arg,
    ++			    unsigned long vbar);
    + 
    + unsigned long sdei_arch_get_entry_point(int conduit);
    + #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
    +
    + ## arch/arm64/kernel/entry-common.c ##
     @@
    - #include <asm/sections.h>
      #include <asm/stacktrace.h>
      #include <asm/sysreg.h>
    + #include <asm/system_misc.h>
     +#include <asm/vectors.h>
    - #include <asm/vmap_stack.h>
      
    - unsigned long sdei_exit_mode;
    -@@ arch/arm64/kernel/sdei.c: unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
    - 	if (arm64_kernel_unmapped_at_el0())
    - 		clobbered_registers++;
    + /*
    +  * Where the context being returned to had an active percpu GPR critical
    +@@ arch/arm64/kernel/entry-common.c: asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
    + asmlinkage noinstr unsigned long
    + __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
    + {
    ++	unsigned long vbar;
    + 	irqentry_state_t state;
    + 	unsigned long ret;
    + 
    +@@ arch/arm64/kernel/entry-common.c: __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
    + 	else if (cpu_has_pan())
    + 		set_pstate_pan(0);
      
     +	/*
     +	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
     +	 * EL0 until the next exception from EL0 maps the kernel. They only
    -+	 * handle exceptions from EL0: an exception taken by the handler would
    -+	 * run their empty current-EL half and never come back. Run the handler
    -+	 * on the kernel vectors. The IRQ-like resume below keeps using the
    -+	 * interrupted VBAR, so it still goes through the trampoline.
    ++	 * handle exceptions from EL0: an exception taken here would run their
    ++	 * empty current-EL half and never come back. Switch to the kernel
    ++	 * vectors. The IRQ-like resume keeps using the interrupted VBAR, so it
    ++	 * still goes through the trampoline.
     +	 */
    ++	vbar = read_sysreg(vbar_el1);
     +	if (arm64_kernel_unmapped_at_el0() &&
    -+	    vbar == (unsigned long)this_cpu_read(this_cpu_vector)) {
    ++	    vbar == (unsigned long)__this_cpu_read(this_cpu_vector)) {
     +		write_sysreg((unsigned long)vectors, vbar_el1);
     +		isb();
     +	}
     +
    - 	/* Retrieve the missing registers values */
    - 	for (i = 0; i < clobbered_registers; i++) {
    - 		/* from within the handler, this call always succeeds */
    -@@ arch/arm64/kernel/sdei.c: unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
    - 	}
    - 
    - 	err = sdei_event_handler(regs, arg);
    --	if (err)
    --		return SDEI_EV_FAILED;
    - 
    - 	if (elr != read_sysreg(elr_el1)) {
    - 		/*
    -@@ arch/arm64/kernel/sdei.c: unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
    - 		pr_warn("unsafe: exception during handler\n");
    - 	}
    + 	state = irqentry_nmi_enter(regs);
    +-	ret = do_sdei_event(regs, arg);
    ++	ret = do_sdei_event(regs, arg, vbar);
    + 	irqentry_nmi_exit(regs, state);
      
     +	write_sysreg(vbar, vbar_el1);
     +
    -+	if (err)
    -+		return SDEI_EV_FAILED;
    -+
    - 	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
    + 	return ret;
    + }
    + #endif /* CONFIG_ARM_SDE_INTERFACE */
    +
    + ## arch/arm64/kernel/sdei.c ##
    +@@ arch/arm64/kernel/sdei.c: unsigned long sdei_arch_get_entry_point(int conduit)
    +  *  SDEI_EV_HANDLED -  success, return to the interrupted context.
    +  *  SDEI_EV_FAILED  -  failure, return this error code to firmware.
    +  *  virtual-address -  success, return to this address.
    ++ *
    ++ * vbar is the interrupted context's VBAR_EL1, for the IRQ-like resume.
    +  */
    + unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
    +-				      struct sdei_registered_event *arg)
    ++				      struct sdei_registered_event *arg,
    ++				      unsigned long vbar)
    + {
    + 	u32 mode;
    + 	int i, err = 0;
    + 	int clobbered_registers = 4;
    + 	u64 elr = read_sysreg(elr_el1);
    + 	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
    +-	unsigned long vbar = read_sysreg(vbar_el1);
      
    - 	/*
    + 	if (arm64_kernel_unmapped_at_el0())
    + 		clobbered_registers++;
2:  ba422c8220e5 ! 2:  07d3078373ee arm64: sdei: Preserve the interrupted context's exception registers
    @@ Commit message
         kworker that is not running a work item, and a single sysrq-l warned
         once per such kworker.
     
    -    Save ELR, SPSR, ESR and FAR on entry to do_sdei_event() and restore them
    -    before returning to firmware.
    +    Save ELR, SPSR, ESR and FAR in __sdei_handler() before
    +    irqentry_nmi_enter(), which can take an exception too, and restore them
    +    after irqentry_nmi_exit().
     
         Once they are restored, a nested exception is harmless if its handler is
         safe in NMI context. That holds for EL1 data aborts on translation,
    @@ Commit message
         Cc: stable@vger.kernel.org
         Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
     
    + ## arch/arm64/kernel/entry-common.c ##
    +@@ arch/arm64/kernel/entry-common.c: asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
    + asmlinkage noinstr unsigned long
    + __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
    + {
    +-	unsigned long vbar;
    ++	unsigned long elr, spsr, esr, far, vbar;
    + 	irqentry_state_t state;
    + 	unsigned long ret;
    + 
    +@@ arch/arm64/kernel/entry-common.c: __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
    + 	else if (cpu_has_pan())
    + 		set_pstate_pan(0);
    + 
    ++	/*
    ++	 * Nothing saved the interrupted context's exception registers on the
    ++	 * way in, and it may be in the middle of exception entry or return
    ++	 * (SDEI ignores DAIF). Save them before anything can take an exception
    ++	 * and overwrite them.
    ++	 */
    ++	elr = read_sysreg(elr_el1);
    ++	spsr = read_sysreg(spsr_el1);
    ++	esr = read_sysreg(esr_el1);
    ++	far = read_sysreg(far_el1);
    ++
    + 	/*
    + 	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
    + 	 * EL0 until the next exception from EL0 maps the kernel. They only
    +@@ arch/arm64/kernel/entry-common.c: __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
    + 	ret = do_sdei_event(regs, arg, vbar);
    + 	irqentry_nmi_exit(regs, state);
    + 
    ++	/*
    ++	 * Put them back unconditionally. An unchanged ELR does not rule out a
    ++	 * nested exception: one may have returned to the same address.
    ++	 */
    ++	write_sysreg(elr, elr_el1);
    ++	write_sysreg(spsr, spsr_el1);
    ++	write_sysreg(esr, esr_el1);
    ++	write_sysreg(far, far_el1);
    + 	write_sysreg(vbar, vbar_el1);
    + 
    + 	return ret;
    +
      ## arch/arm64/kernel/sdei.c ##
     @@ arch/arm64/kernel/sdei.c: unsigned long sdei_arch_get_entry_point(int conduit)
      	return 0;
      }
      
     +/*
    -+ * Exceptions an SDEI handler may take without harm once do_sdei_event() has
    ++ * Exceptions an SDEI handler may take without harm once __sdei_handler() has
     + * restored the interrupted context's exception registers. Their handlers are
     + * safe in NMI context:
     + *  - EL1 data aborts on translation, permission and access-flag faults:
    @@ arch/arm64/kernel/sdei.c: unsigned long __kprobes do_sdei_event(struct pt_regs *
      	int i, err = 0;
      	int clobbered_registers = 4;
      	u64 elr = read_sysreg(elr_el1);
    -+	u64 spsr = read_sysreg(spsr_el1);
    -+	u64 esr = read_sysreg(esr_el1);
    -+	u64 far = read_sysreg(far_el1);
     +	u64 nested_elr, nested_esr, nested_far;
      	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
    - 	unsigned long vbar = read_sysreg(vbar_el1);
      
    + 	if (arm64_kernel_unmapped_at_el0())
     @@ arch/arm64/kernel/sdei.c: unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
    + 	}
      
      	err = sdei_event_handler(regs, arg);
    - 
    --	if (elr != read_sysreg(elr_el1)) {
    --		/*
    --		 * We took a synchronous exception from the SDEI handler.
    --		 * This could deadlock, and if you interrupt KVM it will
    --		 * hyp-panic instead.
    --		 */
    --		pr_warn("unsafe: exception during handler\n");
    ++
     +	/*
    -+	 * SDEI is not an architectural exception: nothing saved the
    -+	 * interrupted context's exception registers on the way in, and it may
    -+	 * be in the middle of exception entry or return (SDEI ignores DAIF).
    -+	 * Any synchronous exception the handler took has overwritten them.
    -+	 * Only the last one's syndrome survives; report it if it is not one
    -+	 * known to be harmless.
    ++	 * A synchronous exception taken by the handler has overwritten the
    ++	 * exception registers; __sdei_handler() puts them back. Only the last
    ++	 * one's syndrome survives; report it if it is not one known to be
    ++	 * harmless.
     +	 *
     +	 * If the event interrupted a KVM world switch, VBAR points at the KVM
     +	 * hyp vectors and any such exception is a hyp panic instead.
    @@ arch/arm64/kernel/sdei.c: unsigned long __kprobes do_sdei_event(struct pt_regs *
     +	if (nested_elr != elr && !sdei_nested_exception_ok(nested_esr)) {
     +		pr_warn_once("unexpected exception during handler: ESR %#llx FAR %#llx near %pS\n",
     +			     nested_esr, nested_far, (void *)nested_elr);
    - 	}
    - 
    -+	/*
    -+	 * Put them back unconditionally. An unchanged ELR does not rule out a
    -+	 * nested exception: one may have returned to the same address.
    -+	 */
    -+	write_sysreg(elr, elr_el1);
    -+	write_sysreg(spsr, spsr_el1);
    -+	write_sysreg(esr, esr_el1);
    -+	write_sysreg(far, far_el1);
    - 	write_sysreg(vbar, vbar_el1);
    - 
    ++	}
    ++
      	if (err)
    + 		return SDEI_EV_FAILED;
    + 
    +-	if (elr != read_sysreg(elr_el1)) {
    +-		/*
    +-		 * We took a synchronous exception from the SDEI handler.
    +-		 * This could deadlock, and if you interrupt KVM it will
    +-		 * hyp-panic instead.
    +-		 */
    +-		pr_warn("unsafe: exception during handler\n");
    +-	}
    +-
    + 	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
    + 
    + 	/*

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0


