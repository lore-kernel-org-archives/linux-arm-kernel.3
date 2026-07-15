Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxp3fXNq8XYNE/nkPh7KFYIhP3YHcDVUtPAtTd5Tryg=; b=wbDwInMXc5snf/ithWN7PJM7Dw
	stModMJl55MHR6kUtRxsw1lhq+8EIQZkIrrK58lvthibvlDWLXloQIKSV1Fvdgqy9MIVxX2d+u0sF
	IP5yYEuOwfSF/6v1KjeBN54hMG2WbjIRbnq+O8zECyHGHq3gMmFC/cKcxXuR2LslDdJvuKKfAX5Zm
	CWcpZQ9O0rUO1xu9iAYTOso7ptUDZvt/4k87vLVCwsURttlrTfRj14C8QKAw6u6Af0nEz29aKjJBV
	IejgJ8oZrXsGpD5WdtBj4ACHksTiXUSx0qfBvAgyFDWnQFmuq7dDd52vR240seZuS0xj8YdTIGlHH
	TyV1qIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxpt-0000000Ea6l-19Sy;
	Wed, 15 Jul 2026 11:31:33 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxpq-0000000Ea4j-0ksd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:31:31 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoeHDlc1n5vs4eev89d16gpczymkaqMnq+AtZLrwBXOPuCSi4/xuANxdXHArZ5lpwXvo7XiLqPxoE8+Z6IX67x2@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784115086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gxp3fXNq8XYNE/nkPh7KFYIhP3YHcDVUtPAtTd5Tryg=;
	b=peSFJr/p0XHXDfujAtlLOkW0qK1fJSaa6MDAZznZeWi61tkx0ZrSxLstB7uf3LrJ2h8dw3
	rQuSQvFbLMRpxPXQieQhNRCUEWwx9wEE4awlJNpE/TWZu7bYYJm7JRFAyUKM0rabsDY2Ni
	4DYfTbOecIaLmv+hgBf+V8u+4HJpEmg=
X-Gm-Message-State: AOJu0YzU1vLdwsnQbexnSYDKk0tf62U172stsrUO5YLn7bp1B70S+EEI
	Iu0FTo5O+Cyy47IflJ/eu4edly2N9f//Tffn1+CSrvD6qTNRNy94YqiauwoC6mEUCagUlbjAkLx
	UckaAC4BOAjnH/brOb+F07AOmmwhzTcmF+Bkf4gJn
X-Received: by 2002:a05:622a:4d:b0:51c:ba4f:9d19 with SMTP id
 d75a77b69052e-51d7bd752e0mr24873701cf.19.1784115061509; Wed, 15 Jul 2026
 04:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-13-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-13-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 12:30:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTynPXq+h8z4U7kg6Vqh5+Jvi2dDY4w9eL_6YOW=yN=i-w@mail.gmail.com>
X-Gm-Features: AUfX_mxhMGLkpuT8Eh9JQ0ObVBlPYewUpp8cXDJp91EMiI7N1SswSQZWtF5PdKw
Message-ID: <CA+EHjTynPXq+h8z4U7kg6Vqh5+Jvi2dDY4w9eL_6YOW=yN=i-w@mail.gmail.com>
Subject: Re: [PATCH v2 12/18] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_043130_362237_23C1A685 
X-CRM114-Status: GOOD (  16.76  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> kern_hyp_va() is idempotent for the hypervisor linear space. This is
> handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
> pointers. Those pointers can originate from the hypervisor space (when
> protected mode is enabled, we don't trust the kernel and the hypervisor
> uses its own copy) or from the kernel space (we do trust the kernel in
> "non-protected" nVHE).
>
> This idempotence does not hold for addresses within the hypervisor
> private range, like the ones you get from the pKVM heap allocator
> (hyp_alloc()). To resolve this, filter out non-kernel addresses based on
> PAGE_OFFSET.
>
> Leave the assembly version untouched as it has no current users.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 6eae7e7e2a68..d60e5f2de10c 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
>   * replace the instructions with `nop`s.
>   */
>  #ifndef __KVM_VHE_HYPERVISOR__
> +       if (!is_ttbr1_addr(v))
> +               return v;
> +
>         asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
>                                     "ror %0, %0, #1\n"         /* rotate to the first tag bit */
>                                     "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

