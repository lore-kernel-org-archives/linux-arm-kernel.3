Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A627FC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtFazJ4eDGxBIgrdgTbaPfe+cY7I7ADhXSuwt5WpCYE=; b=XZbFtGsODAaL800qEecApFomAq
	Wso2SYec8DWmPxUlatqDq28d5cq2ei37Vre2h1sA5/e4FEH0iLadnYSKPctBfO6EC0YPDymS0fe/z
	V49/zMHZ+ynzCqbsM74v38B/uoPCSGjGnsg/r/U8TlzM/Kb0Hs+LUqT/jQuaxS89kqJz47ZDEIyF9
	hNclWVe+a08QnDOZwVkvsa2WErZgeotxYPf8nf/pcG17p2eLokMEgzf6MOlRNnmoNeQ67aIJehpVh
	F0LRQhPy33FRgzhnTYFM0eaX1V3HRgH6UaNJNs9MvCF8YustjHfT27/Mw6BA2+ryw/QRX66qmu5w1
	H7DX0xLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlw8-0000000E3HY-1LSf;
	Tue, 11 Aug 2026 12:50:32 +0000
Received: from latitanza.investici.org ([185.218.207.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlw4-0000000E3Fp-3h50
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786452614;
	bh=WtFazJ4eDGxBIgrdgTbaPfe+cY7I7ADhXSuwt5WpCYE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=uUW+LGl4DKK98b94JOiKvdRuX8FKmHHlnfE7vjYqdQvtlLFweHJfdoB+eo8UXODm1
	 L9xCNo4WtWVwKoCH3tv3v3ofr0MSpT+AsmCQhnl7uNuOUvyX7uHIciF4QaWaAgWTjF
	 nI1h7MzEGScJWS71J3QLiZV8FUEKPNiHsqM73qWM=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4hKBKy5SgWzGpHK;
	Tue, 11 Aug 2026 12:50:14 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4hKBKy364HzGpDr;
	Tue, 11 Aug 2026 12:50:14 +0000 (UTC)
Date: Tue, 11 Aug 2026 13:50:14 +0100
From: Bradley Morgan <include@grrlz.net>
To: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, james.morse@arm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_hibernate=3A_pass_H?=
 =?US-ASCII?Q?VC=5FSET=5FVECTORS_args_to_the_resume_hvc?=
In-Reply-To: <anr28wUlKjci8JPn@willie-the-truck>
References: <20260809213615.11646-1-include@grrlz.net> <anr28wUlKjci8JPn@willie-the-truck>
Message-ID: <463DA5C2-C933-45EC-A200-21AAF6258418@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_055029_060422_33479952 
X-CRM114-Status: GOOD (  20.88  )
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

On 11 August 2026 11:18:27 BST, Will Deacon <will@kernel.org> wrote:
>[+Maz, Pasha and James]
>
>On Sun, Aug 09, 2026 at 09:36:15PM +0000, Bradley Morgan wrote:
>> swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
>> vectors with an hvc, but never passes the arguments. x0 is not set to
>> HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
>> dispatch falls through and returns without writing vbar_el2. EL2 is
>> left pointing at the trans_pgd copy of the vectors, a page that
>> swsusp_free() releases right after resume.
>> 
>> Set the arguments up the same way __hyp_set_vectors() does.
>> 
>> Fixes: 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
>trans_pgd_copy_el2_vectors")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> ---
>>  arch/arm64/kernel/hibernate-asm.S | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/arch/arm64/kernel/hibernate-asm.S
>b/arch/arm64/kernel/hibernate-asm.S
>> index 0e1d9c3c6a93..2baefe7a82d3 100644
>> --- a/arch/arm64/kernel/hibernate-asm.S
>> +++ b/arch/arm64/kernel/hibernate-asm.S
>> @@ -89,6 +89,8 @@ alternative_insn "dc cvau, x4",  "dc civac, x4", 
>ARM64_WORKAROUND_CLEAN_CACHE
>>  	isb
>>  
>>  	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
>> +	mov	x1, x24
>> +	mov	x0, #HVC_SET_VECTORS
>>  	hvc	#0
>>  3:	ret
>>  SYM_CODE_END(swsusp_arch_suspend_exit)
>
>I'm having a really hard time figuring out what's supposed to be going
>on here!
>
>The original hibernation code added by James in 82869ac57b5d ("arm64:
>kernel: Add support for hibernate/suspend-to-disk") unconditionally
>set the vectors in the exception handler:
>
>+el1_sync:
>+       msr     vbar_el2, x24
>+       eret
>+ENDPROC(el1_sync)
>
>However, it _also_ set the vectors from C code in swsusp_arch_resume():
>
>+       if (el2_reset_needed()) {
>+               phys_addr_t el2_vectors = phys_hibernate_exit;  /* base */
>+               el2_vectors += hibernate_el2_vectors -
>+                              __hibernate_exit_text_start;     /* offset */
>+
>+               __hyp_set_vectors(el2_vectors);
>+       }
>
>Later, Pasha refactored the assembly so that it could be shared with
>kexec in 788bfdd97434 ("arm64: trans_pgd: hibernate: Add
>trans_pgd_copy_el2_vectors"), however this added arguments to the
>exception handler without updating the hypercall on the hibernation path.
>
>So I think we need to figure out:
>
>0. Whether this code is actually broken atm (I have a feeling it might
>   happen to work)

Yes, since 788bfdd97434.


>1. Why the original hibernation code set the vectors twice.

They do different jobs. The C call parks EL2 on the safe page copy
before the restore overwrites the current table. The asm call installs
the final __hyp_stub_vectors afterwards.


>2. Assuming they only need to be set once, whether we can drop the hvc
>   from the swsusp_arch_suspend_exit assembly code entirely.

No. After the restore vbar_el2 is only writable from EL2, and the
temporary copy cannot stay. swsusp_free() frees it right after resume.

>3. Whether we can then drop the HVC_SET_VECTORS handling from this set
>   of vectors.
>

No, this hvc uses it, and so does kexec.

>Will
>

Thanks!

