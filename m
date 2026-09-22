Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E14FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noGYPtBF29ezg2BGUgsIlHi0D0r0wfEgpumvYvJTO6o=; b=s8q7pkne5fBOmGY+VX+eiPrLS0
	Ql1hi58qCWq5dUT9rQM7YARJAFBFeYwSUjK7aK3dX6+4mSvNIKeko0KJWZRownHh2qBME6JMmpIb8
	InTkCVFP5CAKLxOy7RsBvrnnFAEqAqgsVGxAS82omgX+188B/5KyaLip85mu6weBgkD9tpwfSOsHw
	7q3biMGzsHJ2v176rGgPXbQVGhBqG24/2k9j2usbu9DTIk6oT+JldgnoOSlDJghQ8L06hscjJ73gJ
	uxua84969vE6vcQ+26MbTmw4id/RS8mX9NKIkkw48yD5m0pdX+bqDV5SOlfygil3Nqrr4IOpcTsk1
	QkartupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xQ2-000000050ev-2uoF;
	Tue, 22 Sep 2026 10:08:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xQ1-000000050eb-2Lww
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 10:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=noGYPtBF29ezg2BGUgsIlHi0D0r0wfEgpumvYvJTO6o=; b=CMOHlPiJBbjdjVEYO3wtS1L65r
	/SVXW/CKjqMdJV5u7/yJ/znqATvSGX5xthNjJd2ZKDcIlR8Rq7Zc6GMoFRVTaFbyjwg2qwhGuzuSo
	ZInBcYQ7kCEFHqWQzjfJtkLfzYNe3m2SftlvRhlTMO3R2and1JmO7saveXnZERqPlFc4VV9MfdFL9
	NIZjSlPpXxPha60/QCGUnOU56XcmIdjVFNSwqH9g88WZEbhNbc5M0ySzl68KqVNlVMFiZJA4E+tkx
	EgT3s/tcwhL16SLwsfRTMRy6p/CRGdjju2NBVTKfo+Ejx3eVKUyJwbFulyMsM2wcpNnyrpw79pUvY
	HTu6Phhw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8xPy-0000000DQ0t-1IjJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:08:08 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso39933225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790071684; x=1790676484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noGYPtBF29ezg2BGUgsIlHi0D0r0wfEgpumvYvJTO6o=;
        b=WHk6ZO+mRIXQwYTDbYSBIqX66hAWnhLrNhxBwvjUBnKJtrziAWRlXwPiVrvwoJB2Dl
         XUQAJ5ArM9s+VNIR2HjWL3lAgJMC4dbpfUQlB/cIKZ+9mMfb+UOCdj1J0SPsajtwOZqI
         OPm9en4W5z/pX5wEJZ2aJYaNO1uZgt/UmoXtVzp5/dRgWZnQn9rLhrNZTbvmfOFp4Bz4
         Lqe1tKxbJcuIcpjo4n/HiTUGRlRDNaf1+nA3+iitxFHju3rtFMv28GwilgyIUX1pbhSC
         n9tyv7Mmfcggr6qDyZ7T82PiSfvAkgHJ8TDW/mrA8aENUjeFPzNlJpEoODrww8UUBrxm
         UvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071684; x=1790676484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noGYPtBF29ezg2BGUgsIlHi0D0r0wfEgpumvYvJTO6o=;
        b=lqtM20xn+1eviy7TfGJKYNmfE4bDJXgGPtAAl/Xp7+1MXA8H+Y2tx2VqqdQpoNEsk+
         eDfZunQfnkoAqh9FKONuAH5zRvL7Obz1Ybm5iR8PBlsSwHFTM3EoDvRLv20dScu6hvzk
         LEBtLUGp0OvpWil2glzaoFuQRjZZe3gmxrqOecBL1ud0dKkerhNxdP4gY6TxelSGRDMU
         Io8g8PebKJ/1L3xffKBFDN8v1ZruorswcKQFD8UHYmxSQ/nB+KnicByRE5PkTcl0eGwj
         0r1jN7j+X/SyzzP0Fymm8lzRrqAXJMIsjZCqUCdr+erXHY6R/IqdK61FAD/DdNNOl+2g
         RtYw==
X-Forwarded-Encrypted: i=1; AKwUvBz9rGVNSQ3JoKVmKRI366FM8KfLEzZg3agYuk1ZfIJjyjNIgSBmqsG9t/+Odp3ir8q2Cc/no6xONBcI5Gp+89AG@lists.infradead.org
X-Gm-Message-State: AFuF++naAvn2MKP9XthhlK5XnNurkRTzR1tXpg8DpL7vgWMVMrl/t2Zu
	dO0cIlISINJxhGxSL9EWB2+b1I7joUn1scJ7u6hmED56NGPTlrU1FBgGMyqzAC6M8Q==
X-Gm-Gg: AYBFou2bB0O6/HStB3oW+vuCvPHxcTch+EwaH6FHXliikkzDtijVHS3ayyURcq1aRsu
	I2L5NofmcSb+KS32MnLVp33l8vNjhsu4m9Pxcqqhx7kSqCkPoaa14EkiOPJIswp+meo5odaDiw0
	LBAnT9IFC7B8cHKnzgTUvMxQIgZuVP9jLjr8qg7SLf5OlQaCrJL5UTK9Sn8heHnLw8QfP7EyMQU
	4CgF43NUs+UDuK/DYvv3vrQLUc7/r3kYXRv5LNlyMteCqrIB+mqEuPNLuqLFhbof4Y5G9aOzjsU
	xxbYwFA+ZcBunJoMrbYSgqQSR4bb6XQfj8l2hWMK12nY75mbyO3bWXXxxsQGlzLwrOHI+dJwYNj
	FBJ2qJliduBS5ZHzDopU4oJjyJ4VVlpsHZhLjMzFba97tYT60PFynmyOplj3IM+j0tvxvOeXpLN
	m/r/qrhHo5j+WyyohvjkfM+DlPptdlbnEgY74pYu3zkqG3dMtxKLFX7zPTq0HDY4/mFVHFlTG9Z
	YHa5XP5Ljsscd6PxW63+2O1eMJ1fjX8etLUJ6VnabU=
X-Received: by 2002:a05:600c:1f87:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49fc56ae924mr201756285e9.9.1790071683091;
        Tue, 22 Sep 2026 03:08:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccd0e1sm67777805e9.6.2026.09.22.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:08:02 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:07:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Snehal Koukuntla <snehalreddy@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host
 handler
Message-ID: <arJTf9C-dr3eMnsW@google.com>
References: <20260921164748.2958578-1-snehalreddy@google.com>
 <20260921164748.2958578-3-snehalreddy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921164748.2958578-3-snehalreddy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_110806_500937_F9CE7167 
X-CRM114-Status: GOOD (  27.41  )
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

On Mon, Sep 21, 2026 at 04:47:48PM +0000, Snehal Koukuntla wrote:
> FF-A v1.3 ALP5 (DEN0140 rev J) adds the FFA_MEM_RECLAIM2 interface,
> allowing an Owner to reclaim a subset of pages from a shared or lent
> memory region by populating constituent memory region descriptors in
> its TX buffer along with a starting descriptor byte offset and initial
> page index. Upon completion, the Relayer returns the number of 4K pages
> reclaimed in x3.
> 
> Support FFA_FN64_MEM_RECLAIM2 in the host FF-A proxy handler. Validate
> the register arguments, descriptor bounds, and initial page index
> against the host TX buffer before forwarding the SMC call to the SPMD,
> and unshare the reclaimed page ranges in the host stage-2 page tables.
> 
> Link: https://support.arm.com/documentation/den0140/j
> Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 117 ++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 5ad74ab265b5..e0fba07a67bc 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -232,6 +232,19 @@ static void ffa_mem_reclaim(struct arm_smccc_1_2_regs *res, u32 handle_lo,
>  	}, res);
>  }
>  
> +static void ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res, u64 handle,
> +			     u64 flags, u64 x3, u64 x4, u64 x5)
> +{
> +	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
> +		.a0 = FFA_FN64_MEM_RECLAIM2,
> +		.a1 = handle,
> +		.a2 = flags,
> +		.a3 = x3,
> +		.a4 = x4,
> +		.a5 = x5,
> +	}, res);
> +}
> +
>  static void ffa_retrieve_req(struct arm_smccc_1_2_regs *res, u32 len)
>  {
>  	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
> @@ -611,6 +624,107 @@ static void __do_ffa_mem_xfer(const u64 func_id,
>  		__do_ffa_mem_xfer((fid), (res), (ctxt));	\
>  	} while (0);
>  
> +static void do_ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res,
> +				struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u64, handle, ctxt, 1);
> +	DECLARE_REG(u64, flags, ctxt, 2);
> +	DECLARE_REG(u64, x3, ctxt, 3);
> +	DECLARE_REG(u64, x4, ctxt, 4);
> +	DECLARE_REG(u64, x5, ctxt, 5);
> +	u32 req_desc_cnt = (u32)(x3 >> 32);
> +	u32 total_pages = (u32)x3;
> +	u32 desc_size = (u32)x4;
> +	u32 offset = (u32)x5;
> +	u32 page_index = (u32)(x5 >> 32);
> +	struct ffa_mem_region_addr_range *range;
> +	u32 reclaimed_pages;
> +	u32 reclaimed_count = 0;
> +	u32 in_idx;
> +	int ret = 0;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 6) || (flags & ~1ULL) || (x4 >> 32)) {

nit: (flags > 1) ?

> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (!req_desc_cnt || !total_pages) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (desc_size != sizeof(struct ffa_mem_region_addr_range)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if ((u64)req_desc_cnt * desc_size > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (offset % desc_size != 0) {

nit: 

if (offset % desc_size) is enough

> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (offset >= (u64)req_desc_cnt * desc_size) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}

Not sure I understand what Sashiko means here offset can not be bigger than the
number of constituents we have...

> +
> +	hyp_spin_lock(&host_buffers.lock);
> +	if (!host_buffers.tx) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}
> +
> +	memcpy(hyp_buffers.tx, host_buffers.tx, (u64)req_desc_cnt * desc_size);

Either I or Sashiko is confused here. The invocation will not do more than
req_desc_cnt will it?

> +
> +	range = (void *)hyp_buffers.tx + offset;
> +	if (page_index >= range->pg_cnt) {
> +		ret = FFA_RET_INVALID_PARAMETERS;
> +		goto out_unlock;
> +	}

Should we also verify total_pages here?

> +
> +	ffa_mem_reclaim2(res, handle, flags, x3, x4, x5);
> +	if (res->a0 != FFA_SUCCESS)
> +		goto out_unlock;
> +
> +	reclaimed_pages = res->a3;
> +
> +	for (in_idx = offset / desc_size; in_idx < req_desc_cnt; in_idx++) {
> +		struct ffa_mem_region_addr_range temp;
> +		u32 pg_cnt, to_reclaim;
> +
> +		if (reclaimed_count >= reclaimed_pages)
> +			break;
> +
> +		range = (void *)hyp_buffers.tx + in_idx * desc_size;
> +		if (!range->pg_cnt)
> +			continue;
> +
> +		pg_cnt = range->pg_cnt - page_index;
> +		to_reclaim = min(pg_cnt, reclaimed_pages - reclaimed_count);
> +
> +		temp = (struct ffa_mem_region_addr_range) {
> +			.address = range->address + (u64)page_index * FFA_PAGE_SIZE,
> +			.pg_cnt = to_reclaim,
> +		};
> +
> +		WARN_ON(ffa_host_unshare_ranges(&temp, 1));
> +
> +		reclaimed_count += to_reclaim;
> +		page_index = 0;
> +	}
> +
> +out_unlock:
> +	hyp_spin_unlock(&host_buffers.lock);
> +
> +	if (ret)
> +		ffa_to_smccc_res(res, ret);
> +}
> +
>  static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  			       struct kvm_cpu_context *ctxt)
>  {
> @@ -1107,6 +1221,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_MEM_RECLAIM:
>  		do_ffa_mem_reclaim(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_FN64_MEM_RECLAIM2:
> +		do_ffa_mem_reclaim2(&res, host_ctxt);
> +		goto out_handled;
>  	case FFA_MEM_LEND:
>  	case FFA_FN64_MEM_LEND:
>  		do_ffa_mem_xfer(FFA_FN64_MEM_LEND, &res, host_ctxt);
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 

-- 
Vincent

