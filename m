Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EEDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zi9Cb0JXIv6qknzxniEvO9UIstkZaMDWbi894gneAi8=; b=BwkaZJZaj9FaGgLWqrvfkfzpIl
	cbmqa4+WcvT7sduIVHSOD8kPoRB6PqAGk4EqqSbx4h0Db9xpsj2IVtMxM0648MHU49XSTF17UTydX
	i5jM0ZxA4FNpOhb88hdAjbQgrv/jqoBywq3TQ6Upkbz2zKunNZaBnISvqfKR/2l8dTu9t312Tekia
	AUYj/IYkjn1JwM+VC+shs9ObPBQemeZ/wGHGi0K6SqCLr3S5vHY3jTCAXLLpxEbANYoAxmKXgZmcm
	3Z+R8hxhyeANbrdjz0Qn0xovkoT/7zoYhapwlN3XWEoCe2zf9E44S5GLKXmBlHuBns/N6hJWuKkAT
	hGx0pYHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTg5-0000000CroU-3nML;
	Tue, 17 Dec 2024 09:15:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTPC-0000000Cnu6-0HZI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:58:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso39725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425893; x=1735030693; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zi9Cb0JXIv6qknzxniEvO9UIstkZaMDWbi894gneAi8=;
        b=QCwhWeebt2Mg/VKgypl/K2aKMJ48NdenkUrArbnp4tzDJ3dERP6TlYFULu6wUkNC0S
         GazCvK52wHFS3s2i+zAlQ+LavRrBUyngjpX9Q68YyE/36n2J1/9qVLDZYxEqfv1U9kwe
         zMMsXwzL5dfdNOjK5Y8U0MikvrGH7sOZZk50Svbym8PnMAEqo29xxt+USd9FFB1I69N+
         ie0u6pfYYvH2ASNeOOANor81UftH5akCtQvqUIQuEM64c0MZ79bhBAkJcmM3rm+sdmOg
         8S2SYm+0iswIoGio5DTkCkrloEGSS18saUTTgPf06iqMwIMZRHzdZWb3PR9HRA6pnnQc
         8XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425893; x=1735030693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zi9Cb0JXIv6qknzxniEvO9UIstkZaMDWbi894gneAi8=;
        b=tQ+KuiNhSPLEls6VFheWci8mxNx5hEtCAW+1HMqqQ+3Ujpph4gBAqTkA9LWBV9Td/r
         tpT/Q3STg0b/L+urlAwf3TipnWbf261tuW6Y2UJ+DlJVVeUutwFnORKW5ZcsUyMKiB9m
         mTwy6zpTguvnKjpF3DtCKV/KCwiT9SytaOEAKABWi92sJ80uD5Dwpf6cwbuVYqtObjlT
         pZ+PiVfSAsEQg5EdfTdkaXb2ecS8+X+jG9/g5sG+2SLiYloAC2dsdxbHXeUNPMlD3VAf
         6m2lJQzLfV2xcNznBYIt+0guhwcqa3rORya1Lf7hcrJ7NgslwUNBOdaCon4wTL9lK9oI
         G+HA==
X-Forwarded-Encrypted: i=1; AJvYcCWNy/qc8H1u+f8eq5YdS3aIdRVhd/MdwQpLBy+dlYIUUm5HvuGPlUoPw6pZERuXtR5/PPul8lWm3zfNfpqHCdSV@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0jdy0DNeEowFPa9BDkGbNcFUZuR51cyMVsUO6OkXqoNDqgOC
	zkcIr/D1D7iCarAVMtsjbDOIlOsIplxHIZmCBtQCXp0Y8gzsL4//bWITBc0tX3rLpFInXoagfxA
	K4hbPpfNcca2cDPlBQZ6vi/ZQmC37pr7j+4K7
X-Gm-Gg: ASbGncvaYgZScsptvaq/lX3cLz9LKxkLy+7mdSUASzqLYLWD9Tye4xr8cM8xWTIEEUY
	Vqsue7zcU+WHPUmgXOtE4gXBEpwUu42lh9ZaUex+uxKMqgyW1K9EtkNwxb/yeq/TZtdM=
X-Google-Smtp-Source: AGHT+IH6cdmhYpwRWiZB/ZV5vSi18IhtigKu9D+VojiJ+Wuao7fHQY46QuAyKXvWoaUnPqjxiHSCHKPg3eD4TVHISuM=
X-Received: by 2002:a7b:ce88:0:b0:436:186e:13a6 with SMTP id
 5b1f17b1804b1-436492cf51dmr1049705e9.6.1734425892536; Tue, 17 Dec 2024
 00:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-15-qperret@google.com>
In-Reply-To: <20241216175803.2716565-15-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:57:36 +0000
Message-ID: <CA+EHjTz0sC4idnRMLjVoOcbyZ3kTXM3+hkPHdo=V1XZ3aJ6BbQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005814_107162_ED5975D2 
X-CRM114-Status: GOOD (  17.77  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> Plumb the kvm_stage2_test_clear_young() callback into pKVM for
> non-protected guest. It will be later be called from MMU notifiers.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 22 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 ++++++++++++++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 8663a588cf34..4f97155d6323 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index fc9fdd5b0a52..b3aaad150b3e 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum k
>  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>  int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> +int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 98d317735107..616e172a9c48 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -303,6 +303,27 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
>         cpu_reg(host_ctxt, 1) = ret;
>  }
>
> +static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> +       DECLARE_REG(bool, mkold, host_ctxt, 3);
> +       struct pkvm_hyp_vm *hyp_vm;
> +       int ret = -EINVAL;
> +
> +       if (!is_protected_kvm_enabled())
> +               goto out;
> +
> +       hyp_vm = get_np_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               goto out;
> +
> +       ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
> +       put_pkvm_hyp_vm(hyp_vm);
> +out:
> +       cpu_reg(host_ctxt, 1) = ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -516,6 +537,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
>         HANDLE_FUNC(__pkvm_host_relax_perms_guest),
>         HANDLE_FUNC(__pkvm_host_wrprotect_guest),
> +       HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 94e4251b5077..0e42c3baaf4b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1530,3 +1530,22 @@ int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
>
>         return ret;
>  }
> +
> +int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
> +{
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 phys;
> +       int ret;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_shared_guest(vm, &phys, ipa);
> +       if (!ret)
> +               ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

