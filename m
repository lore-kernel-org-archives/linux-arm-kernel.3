Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81358C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAt2+GMHkV6u0TA94maAn32sJUQtTr+DnLbCHKU+jj4=; b=sN32YQvdNbrXnWWZmMxfHBAL4M
	mttjiS0ZDi0EmYC1uFQ/7lr8SvAZtSP7NYz/MLXw4xGIl+tIrMNhei6mGccHXZHTOpMYj0Xora0w9
	1AbH4Aklp5ZiXU62RSOxWWVDOoDoftDBmSobTKfWeH5yKyB3VbBtr9dcP3rziWPGJ8Zw0RecHP3SW
	8Uya2BKB40fQ+bSMpDv2kXmPgNnYDh3UJfIQWEacySSSHsu8eBw+rkfQxxE2tgK3QJV369Je3C/9S
	XijGPsbqlUSpZledBNd3bYpWl+ECyNXrt2W4rgNJNbg04zJkMFyqnA5f1R1LvJeohXCo5XJlDMEA1
	pALgkksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Reu-00000009BGd-41jr;
	Wed, 23 Sep 2026 18:25:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Reu-00000009BGG-0A8c
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iAt2+GMHkV6u0TA94maAn32sJUQtTr+DnLbCHKU+jj4=; b=gIP51za4b7bBMhvmtQldr2Mo2K
	RgC5Pv7xGkvn2oBAHVtzRNllHyzqnvhRzl5bL4MmpSd8yjzSmYnWPwuAFLU9a1Lt3VG56V7KAJ/OW
	3tjV9WYnsy5u7pFlSFtk/OKV6jQHhOSQnlFynmlUG/pSgHf7y8W8HLdJWRXEXOuTztyk3KUdK+JL5
	tbBld/Ktvlj4s1hGX4zIidp4Fg6uPSVa6QHIZ5bsD+n3xYj5Rd8w8iWi1KmIAYfdRvkyPlHYiZz61
	l4PXc626nesV3s/FngUbUMIdiGGNrx0Q/aOaFTmqIjdP1b4dafdb74yMAb+9hFExgBbDBZOoU7Sjq
	MaFki+QQ==;
Received: from out-81.mta0.migadu.com ([2001:41d0:1004:224b::51] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Rer-0000000F9H9-1rYm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:25:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eBhoSZys/skO8VhIcCPkCwRrgSwHPSgz35h6Fpfdqy0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790187927; v=1; x=1790792727;
 b=Z7ziTbHbwmayRVpmrTaiBdgfDpBhH00EGT1KO+Z4+tytUOMJnSWd8kf1fjma/TCZ9n3EWN2V
 1RLmm5zFQn1KmYPi1A7szKSSkA9fWN02yFWmU9vJC2mujYbrUBz9JmXL6TfwCkcPE4ak/SzpmYo
 EOLBR3lmrYWLe/MDNUfJPmlI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1ff1fac18346c06a;
	Wed, 23 Sep 2026 18:25:22 +0000
X-Mizu-Trace-ID: 1ff1fac18346c06a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1059e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7cofMGx4r4J+9aaBz4vSkFlJ2PUbLhyqPUsAunYOJDX7hT7XhwbN8zzGLEfX67Tf+UgsCEst+5IRFUsa63TX/@lists.infradead.org
X-Gm-Message-State: AFuF++l62Kb5aXHnEp+olyHpxSZmPjOMXkwNuZpV85Fj8tg3eWsOdPxP
	rnGN60SBaXO3oazeUixR8Dxz9HM33Jd/5Djyf2oUQJbwapvuyEBp0VtIOdm6C/x/+IhJhoruSMy
	qlN2GdDWbHM91UzwARu9+pVvCqx+oUHw4aUws93/5
X-Received: by 2002:a05:6512:2395:b0:5b8:b502:9a76 with SMTP id
 2adb3069b0e04-5b8de5cbe34mr31894e87.13.1790187921175; Wed, 23 Sep 2026
 11:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-2-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-2-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:24:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzAK5HvyQaGQyzA8KckLj8hhg2g=ibXVxLhpMd4akvrOA@mail.gmail.com>
X-Gm-Features: AclHuK-LVBecQrvB6_SGAbPJR_XCf_HtzjMFK7HtibXH2JM7oY3kOspYw5Nd0jM
Message-ID: <CA+EHjTzAK5HvyQaGQyzA8KckLj8hhg2g=ibXVxLhpMd4akvrOA@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] arm64: Add ESR fault helpers
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192529_548020_DB1BBBBE 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, 23 Sept 2026 at 16:16, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Add helper functions which operate directly on an ESR value rather than
> trying to access the register itself.
>
> These mirror equivalent KVM vCPU wrappers in kvm_emulate.h and allow those
> wrappers and KVM's stage-2 fault handling to operate on a plain ESR value.
>
> This is needed to later generate a synthetic fault for the stage-2 page
> table pre-faulting mechanism.
>
> No functional change intended.
>
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/esr.h         | 29 +++++++++++++++++++++++++++++
>  arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index f816f5d77f1a..86756fc9bb5a 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -437,6 +437,35 @@
>  #ifndef __ASSEMBLER__
>  #include <asm/types.h>
>
> +static __always_inline bool esr_trap_is_iabt(unsigned long esr)
> +{
> +       return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
> +}
> +
> +/* Always check for S1PTW *before* using this. */
> +static __always_inline bool esr_dabt_is_write(unsigned long esr)
> +{
> +       return esr & ESR_ELx_WNR;
> +}
> +
> +static __always_inline bool esr_dabt_is_cm(unsigned long esr)
> +{
> +       return esr & ESR_ELx_CM;
> +}
> +
> +static __always_inline bool esr_abt_is_sea(unsigned long esr)
> +{
> +       switch (esr & ESR_ELx_FSC) {
> +       case ESR_ELx_FSC_EXTABT:
> +       case ESR_ELx_FSC_SEA_TTW(-1) ... ESR_ELx_FSC_SEA_TTW(3):
> +       case ESR_ELx_FSC_SECC:
> +       case ESR_ELx_FSC_SECC_TTW(-1) ... ESR_ELx_FSC_SECC_TTW(3):
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
>  static inline unsigned long esr_brk_comment(unsigned long esr)
>  {
>         return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index a3c1928bdf74..654e8c1b4461 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -336,6 +336,16 @@ static __always_inline u64 kvm_vcpu_get_esr(const struct kvm_vcpu *vcpu)
>         return vcpu->arch.fault.esr_el2;
>  }
>
> +static __always_inline bool esr_abt_is_s1ptw(unsigned long esr)
> +{
> +       return esr & ESR_ELx_S1PTW;
> +}
> +
> +static __always_inline bool esr_abt_is_exec_fault(unsigned long esr)
> +{
> +       return esr_trap_is_iabt(esr) && !esr_abt_is_s1ptw(esr);
> +}
> +
>  static inline bool guest_hyp_wfx_traps_enabled(const struct kvm_vcpu *vcpu)
>  {
>         u64 esr = kvm_vcpu_get_esr(vcpu);
>
> --
> 2.55.0
>

