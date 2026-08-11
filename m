Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4107C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ey0wZ3MT1kRfT5xCM+oK1Q4GRW+KV/jkQgpJPPLj4qk=; b=uFO+JQKiR9TXtkuAVp7lPZHxPp
	qxLhKQgQwKHSTKDuKl89tPoeSRlkSnZ+GRR2i+H/LF7jHWDFuCQcAFpHKFVPKwIooH562ILZBp5o7
	+DCBqn6rTn5pG06mGMyP8Mt5ozxJZxTyKMv+9NexSmKTpSeMj/mnIEJKj32j0Gv0goAsNNzUWq8kW
	pOt+m2VZCLWW3HTimiuO2MtAuKYjzw9pPzUxfxeH2zvKwZ/UuLBmOdwucg5A/+AIfJfPH1gdTzc9Z
	yayh8gETJG/bTgr+FB5lF23MBsYuS1WwwuRqTsec+d63epxRDDCYC8ll4vJvF1Lpo8M6bXGHYj35U
	L3GnpirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoiy-0000000EOTt-0jws;
	Tue, 11 Aug 2026 15:49:08 +0000
Received: from latitanza.investici.org ([2a12:4180:dc1:929::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoiv-0000000EOT7-2SqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786463341;
	bh=Ey0wZ3MT1kRfT5xCM+oK1Q4GRW+KV/jkQgpJPPLj4qk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Kk8yDIB1bylWYp0qCBuZbD7XHeM32VMsFwvzESKy6ESPrvNGlkoggvLRZ7ndzNATf
	 xy9pbzl/t9Ha3UGIw7U4VfOLnLZfsU1+03ipXrDS2oPdnkjAXyizDYYXKvEIb/E9id
	 OzlRGLhNQvTUXiOaqOTFXyp3q1SvnmEijD6WU9wE=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4hKGJF6X6zzGpGr;
	Tue, 11 Aug 2026 15:49:01 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4hKGJF3f2mzGpGp;
	Tue, 11 Aug 2026 15:49:01 +0000 (UTC)
Date: Tue, 11 Aug 2026 16:49:00 +0100
From: Bradley Morgan <include@grrlz.net>
To: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, james.morse@arm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_hibernate=3A_pass_H?=
 =?US-ASCII?Q?VC=5FSET=5FVECTORS_args_to_the_resume_hvc?=
In-Reply-To: <anszjQ7jBeYDqesp@willie-the-truck>
References: <20260809213615.11646-1-include@grrlz.net> <anr28wUlKjci8JPn@willie-the-truck> <463DA5C2-C933-45EC-A200-21AAF6258418@grrlz.net> <anszjQ7jBeYDqesp@willie-the-truck>
Message-ID: <22B7543B-44D6-4820-9CCC-8FEAFAD30EC8@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084905_764919_3466E842 
X-CRM114-Status: GOOD (  31.99  )
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

On 11 August 2026 15:37:01 BST, Will Deacon <will@kernel.org> wrote:
>On Tue, Aug 11, 2026 at 01:50:14PM +0100, Bradley Morgan wrote:
>> On 11 August 2026 11:18:27 BST, Will Deacon <will@kernel.org> wrote:
>> >[+Maz, Pasha and James]
>> >
>> >On Sun, Aug 09, 2026 at 09:36:15PM +0000, Bradley Morgan wrote:
>> >> swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
>> >> vectors with an hvc, but never passes the arguments. x0 is not set to
>> >> HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
>> >> dispatch falls through and returns without writing vbar_el2. EL2 is
>> >> left pointing at the trans_pgd copy of the vectors, a page that
>> >> swsusp_free() releases right after resume.
>> >> 
>> >> Set the arguments up the same way __hyp_set_vectors() does.
>> >> 
>> >> Fixes: 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
>> >trans_pgd_copy_el2_vectors")
>> >> Cc: stable@vger.kernel.org
>> >> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> >> ---
>> >>  arch/arm64/kernel/hibernate-asm.S | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >> 
>> >> diff --git a/arch/arm64/kernel/hibernate-asm.S
>> >b/arch/arm64/kernel/hibernate-asm.S
>> >> index 0e1d9c3c6a93..2baefe7a82d3 100644
>> >> --- a/arch/arm64/kernel/hibernate-asm.S
>> >> +++ b/arch/arm64/kernel/hibernate-asm.S
>> >> @@ -89,6 +89,8 @@ alternative_insn "dc cvau, x4",  "dc civac, x4", 
>> >ARM64_WORKAROUND_CLEAN_CACHE
>> >>  	isb
>> >>  
>> >>  	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
>> >> +	mov	x1, x24
>> >> +	mov	x0, #HVC_SET_VECTORS
>> >>  	hvc	#0
>> >>  3:	ret
>> >>  SYM_CODE_END(swsusp_arch_suspend_exit)
>> >
>> >I'm having a really hard time figuring out what's supposed to be going
>> >on here!
>> >
>> >The original hibernation code added by James in 82869ac57b5d ("arm64:
>> >kernel: Add support for hibernate/suspend-to-disk") unconditionally
>> >set the vectors in the exception handler:
>> >
>> >+el1_sync:
>> >+       msr     vbar_el2, x24
>> >+       eret
>> >+ENDPROC(el1_sync)
>> >
>> >However, it _also_ set the vectors from C code in swsusp_arch_resume():
>> >
>> >+       if (el2_reset_needed()) {
>> >+               phys_addr_t el2_vectors = phys_hibernate_exit;  /* base
>*/
>> >+               el2_vectors += hibernate_el2_vectors -
>> >+                              __hibernate_exit_text_start;     /*
>offset */
>> >+
>> >+               __hyp_set_vectors(el2_vectors);
>> >+       }
>> >
>> >Later, Pasha refactored the assembly so that it could be shared with
>> >kexec in 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
>> >trans_pgd_copy_el2_vectors"), however this added arguments to the
>> >exception handler without updating the hypercall on the hibernation
>path.
>> >
>> >So I think we need to figure out:
>> >
>> >0. Whether this code is actually broken atm (I have a feeling it might
>> >   happen to work)
>> 
>> Yes, since 788bfdd97434.
>
>Right, but did you manage to reproduce a crash? 

No, I had a read of the code, yk, summer holidays are here for me, so
I have this kinda time

You're implying that this
>hasn't worked for five years, which makes me wonder why we bother to try
>to maintain this code!

the path only runs when is_hyp_nvhe(), hence VHE machines never get there, 



>
>> >1. Why the original hibernation code set the vectors twice.
>> 
>> They do different jobs. The C call parks EL2 on the safe page copy
>> before the restore overwrites the current table. The asm call installs
>> the final __hyp_stub_vectors afterwards.
>
>I think I probably need to spend some time understanding how all this is
>supposed to work. I can't currently tell how we end up with the stub
>vectors installed to start with nor why we can't do all this from C code.
>

head.S installs __hyp_stub_vectors in vbar_el2 before dropping to EL1.
The last set can't come from C code because at that point the image
has been restored over the kernel. The safe page copy is the only code
still running and it's about to hand control back. The hvc is how it
reaches EL2.

>> >2. Assuming they only need to be set once, whether we can drop the hvc
>> >   from the swsusp_arch_suspend_exit assembly code entirely.
>> 
>> No. After the restore vbar_el2 is only writable from EL2, and the
>> temporary copy cannot stay. swsusp_free() frees it right after resume.
>
>Isn't vbar_el2 always only writable from EL2?
>

Yes, that phrasing was sloppy on my end. All I meant was the safe page
code runs at EL1, so the hvc is the way it reaches EL2.

>> >3. Whether we can then drop the HVC_SET_VECTORS handling from this set
>> >   of vectors.
>> >
>> No, this hvc uses it, and so does kexec.
>
>Where does kexec use it? I could only spot it making use of
>HVC_SOFT_RESTART.
>


The non kexec_file path. machine_kexec.c calls
__hyp_set_vectors(kimage->arch.el2_vectors) before jumping to the
relocation code when is_hyp_nvhe(). The kexec_file path takes
cpu_soft_restart, which is where HVC_SOFT_RESTART comes in. So kexec
uses both, one per path........


Well, I also will think about this approach, if you have any suggestions,
feel free to show me. Please :)

>Will
>

Thanks!

