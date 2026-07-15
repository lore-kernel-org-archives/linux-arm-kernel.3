Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB89C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+guEC8Ex4qrqSkEdXMiwdsEhdbbOIt/n8ixzbFFm7I=; b=TwAaRHslzyo7sbNsPua6GHxaJ+
	PVnqmdn0QV4ja6TrQhFVzaTTHL3nszb1J6Ua0qO3V0E6/2RtlCGIy5mmdaKakArKo/KVqtf3pQeJJ
	krM1ChhgV3kR4epFtUdgRPKRY9XgqFMdPsdOsutLU1+Ejm8LzBRFHPuh6MKHorx7NtKiz1bxxDJEK
	j8dsDayK/vjzwq4kNFApyQbY/rdWY0VQpyGLo/BbKGQrFNDSMPkJzXPo1JKnfZEor5T3s3dKyCDlv
	JNwrbElSGcUw9AI1i17SycULVPN4MMzK77NI2H/8Fw/EKXlolty9onMo2oaMED1YqiUCVhgrgdYAx
	1V/aUR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyoI-0000000EoSg-3QSA;
	Wed, 15 Jul 2026 12:33:58 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyoD-0000000EoRF-1nbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:33:58 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rrj0L29+EiY1vq3ecFnFatvOvLbEvbUhD9ruyzfYieHSJu1xPGXcy0HmM9ECXDSKhplfMLLwKee57pbYrjxKlfD@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784118830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+guEC8Ex4qrqSkEdXMiwdsEhdbbOIt/n8ixzbFFm7I=;
	b=bETB2t8t6tiiZ2bpFNdHzLwp1XXPCpy/VeJLW1mVSUOjx9NohZQIw5Lp2R8XEJ2hAVtqWO
	rz00nGBaID1ZUu+4gnuiheWxtTUxk0cLjQDW9CgykrH7hfgOl/vRoJv9VCFSLDgfu96fyR
	rVP28AwxLYPveyo8J5X5eRq+/KZMBdg=
X-Gm-Message-State: AOJu0YzlW+br+wpmizkOx5Z+dc8clWdu7kcZN9Sj9SLmUDDg3xKgX1xP
	Qn1M1oorS25HAFf30wQBzGRM1RTky9iQ+oOMiNxouv24Pw4ghVszxA7vkWl8ZHHf5V7yhxU6PvM
	OvdU1mP0B5mLTrLcA7cEQjn/VLlJ/oqlw7yiU8bnH
X-Received: by 2002:ac8:6992:0:b0:51b:fe30:b8c5 with SMTP id
 d75a77b69052e-51d7bcc96e9mr20164071cf.6.1784118817577; Wed, 15 Jul 2026
 05:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-16-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-16-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 13:33:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzNMCMAt=VDnCuR2+Pfz9Qh5HmbEm6tdjpdcPBO+UchEg@mail.gmail.com>
X-Gm-Features: AUfX_mymo_D2O5n0ZAffEBP1RuvXf6XLBjc5Twl5xXcW05_4Gb4iBPyu-EXgdh8
Message-ID: <CA+EHjTzNMCMAt=VDnCuR2+Pfz9Qh5HmbEm6tdjpdcPBO+UchEg@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053353_986299_6AEB33EE 
X-CRM114-Status: GOOD (  12.60  )
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

On Mon, 6 Jul 2026 at 18:54, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:

...

> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -191,8 +191,8 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
>   */
>  static int __pkvm_create_hyp_vm(struct kvm *kvm)
>  {
> -       size_t pgd_sz, hyp_vm_sz;
> -       void *pgd, *hyp_vm;
> +       size_t pgd_sz;
> +       void *pgd;
>         int ret;
>
>         if (kvm->created_vcpus < 1)
> @@ -209,28 +209,15 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
>         if (!pgd)
>                 return -ENOMEM;
>
> -       /* Allocate memory to donate to hyp for vm and vcpu pointers. */
> -       hyp_vm_sz = PAGE_ALIGN(size_add(PKVM_HYP_VM_SIZE,
> -                                       size_mul(sizeof(void *),
> -                                                kvm->created_vcpus)));
> -       hyp_vm = alloc_pages_exact(hyp_vm_sz, GFP_KERNEL_ACCOUNT);
> -       if (!hyp_vm) {
> -               ret = -ENOMEM;
> -               goto free_pgd;
> -       }
> -
> -       /* Donate the VM memory to hyp and let hyp initialize it. */
> -       ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
> +       ret = pkvm_call_hyp_req(__pkvm_init_vm, kvm, pgd);

Sashiko might be right on the memcg point: hyp_vm used to be
GFP_KERNEL_ACCOUNT and now comes from the heap unaccounted, while pgd
next to it is still accounted, so it's inconsistent.

If we do want to fix it, would it go in pkvm_hyp_topup() to cover all
consumers rather than here?

Cheers,
/fuad

