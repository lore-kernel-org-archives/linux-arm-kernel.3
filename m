Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683ADC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EkGPun7Mf1SwMti55JzBEC0aSDCyjyMtJCBge++9uc=; b=ldqPDy9xuPJf3boUzum/FTCFVy
	h3PYqY6GPAtCbD+s8Y+uJO2sPn5vXfHeA8DiTi79ip88CEs0BXrokdBM0EoHQ2JnXBeFRcmjpyedU
	hNO4QCyn+jMKUD/lxVGy9EBNe/tyANwPLbIfmQ5pcWf9qVhZo1wJJiVpQcA3OoYCvJIgQZkCJ+gjc
	vfdohLERqE7jkG5Xje9tm213orvmDUFISxjoORY4Jt4lNHinV1sgx60d4A97O26rANI32HXztpVIb
	UbYDok9V62rDJB+mG+ncu2sCD8poeiFWLr9QfBCWK16S7BNTm3sbveM3BQXdd1XM4M4LuYfyQSI34
	Slr7ZWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt7F-0000000DuGQ-2ZF1;
	Wed, 15 Jul 2026 06:29:09 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt7C-0000000DuFf-1UGH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:29:07 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrtyznVAQ2iLvzCwAbr9DiSa6Ob5EC3wgkmG24WjMKBzWkfDacgXEhH/si60nC6E8xZ5wTZAYfvgAoWmuQNDBQF@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784096943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6EkGPun7Mf1SwMti55JzBEC0aSDCyjyMtJCBge++9uc=;
	b=DkbnRCOEw4NauO/+UXj0ACNi3tc8zet5t2F5KtAqJUy04bF08oYCNkSa1OH6AAkpkNZkVt
	o+1nHXzCn/mLHCudLKVDW7oM477EwFRoDHNTM3VBpUV0+DceBs12psxXoK3OdKln0uH/AX
	qkMVfJ7j8KqcQSMB1L6fpn3oB0AfWHo=
X-Gm-Message-State: AOJu0YyE2Q7U1cV5+bBlFo9XsnLGSazj/plm0/D2QXXn6ogf/C31Dx0N
	EgYR3+V2PKKY7wHRiIK1EAmyzIFJRkF4zBynuYIr3HsD30bFiY29mkY0lNIgigzEu0WgX9DE7Q9
	hOOzk5nNY+UHIl3FozX0obM9+KKEoC82Y6Rmy+vOw
X-Received: by 2002:a05:622a:2590:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-51d7bd1d6damr24365831cf.15.1784096938033; Tue, 14 Jul 2026
 23:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-9-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-9-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 07:28:20 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzCaEnOJnbDk_9GTo1N0U95zFTEw-HGyBetx3RkOfX4wA@mail.gmail.com>
X-Gm-Features: AUfX_myt8i1XINmMoG2MOijeMuzd2suULSaK515-nalLslNoZEiQ5HOO1OeJh7I
Message-ID: <CA+EHjTzCaEnOJnbDk_9GTo1N0U95zFTEw-HGyBetx3RkOfX4wA@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] KVM: arm64: Handle PKVM_HYP_REQ_HYP_ALLOC request
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232906_541741_99CCB9B1 
X-CRM114-Status: GOOD (  15.51  )
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
> Introduce a new pkvm_hyp_request type asking the host to top up the pKVM
> heap allocator.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 0be1469e7874..99daa985856f 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -205,6 +205,7 @@ struct pkvm_mapping {
>
>  enum pkvm_hyp_req_type {
>         PKVM_HYP_NO_REQ = 0,
> +       PKVM_HYP_REQ_HYP_ALLOC,

Now that the enum has a request type the tracepoint can actually fire
for, would you be able to print it symbolically:
TRACE_DEFINE_ENUM(PKVM_HYP_REQ_HYP_ALLOC) plus __print_symbolic() in
kvm_handle_pkvm_hyp_req's TP_printk, so traces read HYP_ALLOC rather
than a raw number. I'm referring to trace_pkvm.h from the previous
patch.

Cheers,
/fuad



>         __PKVM_HYP_REQ_TYPE_MAX,
>  };
>
> @@ -226,9 +227,13 @@ struct pkvm_hyp_req {
>
>  static inline size_t pkvm_hyp_req_arg_size(u8 type)
>  {
> +       struct pkvm_hyp_req *req;
> +
>         switch (type) {
>         case PKVM_HYP_NO_REQ:
>                 return 0;
> +       case PKVM_HYP_REQ_HYP_ALLOC:
> +               return sizeof(req->mem);
>         default:
>                 WARN_ON(1);
>         }
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 5ba8b81b8c6c..adc418076cb0 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -626,6 +626,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
>         int ret = -EINVAL;
>
>         switch (req->type) {
> +       case PKVM_HYP_REQ_HYP_ALLOC:
> +               ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
> +               break;
>         }
>
>         trace_kvm_handle_pkvm_hyp_req(req, ret);
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

