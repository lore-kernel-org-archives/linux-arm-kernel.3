Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790F7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kXg7h5ibQHAv0aq8+Kplnd8Fmsvni+vugX6wdZt9Uc=; b=VjIXrqiZMlxwKDj4QBz/YKU3q1
	HahEDapfublqVt/erwOVJPpz3ZWYrydNdD5KtsWuxrv0nbTsgWFD74D+NUtimo9s9fzurbG5sHzFu
	eQkUTQ+vPGyw3s7tC/LzwDoBzBmMr0VjHjD1yqYt/vJQeNqer2mcCxRquSiW6+4L3KooVJMJTaQ56
	fD6s2u+aRM+rnlEXYa8gS/+JiJz2jZHaOEu8me3ra2FpuFoEpoXKf+i4uAdOhDmTFo6DyQoAkS/78
	zelr/By7BmB7ajuscbt58wvE9f8HdC/2KgIMg8IE9HqeKdbPE1M4xk950wQQs3HjS34P3xcEB8Ran
	8TWKrW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fqF-0000000FQXh-1FcM;
	Fri, 18 Apr 2025 07:08:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fjX-0000000FOqx-1uGx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16280A4B266
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AB4C4CEED
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744959714;
	bh=SbxhvwW/dI2cwkKwqXns6VqYn5IUb1s1Pg95tBOSVRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=faTowbcCXfekvtxTs5wDEv+FPToczT88KM1QepQ3DlFozwDJiz69/AT8bQircR1Am
	 P4TBruU9R32eJPYNSKRPiIq+DlvvsslSaGNzBwEc6yY2Vzg/FxGuHZrkEgJBvUQ/q7
	 LEapjdmD6u+I33rdbiE6KkWCePu3qLP0IxDxSHEm0Ag8AI/sYhafrzUwKcBq6CAqUM
	 RF0Bw2mYHFLU7OoEa7fVPOkD7inCjOYl8Ghhq3ctPHslYmHmJJoGJrGvr2SIH4M2lO
	 mvYdcF3z6k+YCH7reyHG2n2NaEVbM3sJSMxWrSV8g/brPfNTPW2i0PhJOOOns9MPs5
	 FcYuDU8c9yalA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfed67e08so16461891fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:01:53 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz4UqAfKYuuwWOtVB9lBo8NDGoqEYlzA1l+FREtO54y66yYUgM/
	ntdMtxwpON38g6WCHjXQCj8CxIibqiVUNO5Y0/ZMky0hCFQWJ4AtI9oLG5+lATyg6+5mMDMBr8c
	BuI4hvw0wtZ0kquhPymYDDnH2304=
X-Google-Smtp-Source: AGHT+IGQK4ZLrqBwmxUgeBqAOhDO8nVJNTTnpza7A5c9ARC3B7hZoNQyqaunqOT+wxFz9n2VblnRB0s5lfrbFJxX5Vk=
X-Received: by 2002:a05:651c:510:b0:30b:c96a:74c with SMTP id
 38308e7fff4ca-310904b8523mr5819201fa.1.1744959712354; Fri, 18 Apr 2025
 00:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250416035604.2717188-1-anshuman.khandual@arm.com>
In-Reply-To: <20250416035604.2717188-1-anshuman.khandual@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Apr 2025 09:01:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGbJ4q1rchCbDp35rdWRyzuG-nZnQ2KgE46FtkPUg-+SQ@mail.gmail.com>
X-Gm-Features: ATxdqUFTI04jZnPSrI5f53pfqrNAWo1abGiP_x_hkRRGXb35DQgpl2R0nSQWmIE
Message-ID: <CAMj1kXGbJ4q1rchCbDp35rdWRyzuG-nZnQ2KgE46FtkPUg-+SQ@mail.gmail.com>
Subject: Re: [PATCH V2] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_000155_619992_BA7B69D5 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, 16 Apr 2025 at 05:56, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> that are required for D128 page tables. The primary issue is that for D128,
> PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
> which the assembler can't accommodate.
>
> Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
> based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.
>
> While here also move PTE_MAYBE_NG/PTE_MAYBE_SHARED assembly overrides into
> arch/arm64/kernel/asm-offsets.c to ensure PIRE0_EL1/PIR_EL1 are calculated
> in assembly without arm64_use_ng_mappings and lpa2_is_enabled() symbols
> being accessible. Also move the corresponding comment as well.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
>
> Changes in V2:
>
> - Added asm-offsets.c based PIE_E0_ASM and PIE_E1_ASM symbols as per Ard
> - Moved PTE_MAYBE_NG and PTE_MAYBE_SHARED overrides inside asm-offsets.c
>   along with the corresponding comment as per Ard
>
> Changes in V1:
>
> https://lore.kernel.org/linux-arm-kernel/20250410074024.1545768-1-anshuman.khandual@arm.com/
>
>  arch/arm64/kernel/asm-offsets.c | 16 ++++++++++++++++
>  arch/arm64/mm/proc.S            | 19 ++-----------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

