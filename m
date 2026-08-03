Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74318C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR++r527W94xfQdEsxvKm6tGy0wq5RNvP/m4bM8F0Ww=; b=niFEkTggdFJ+Y77WnozRfK9nnC
	b0qwQtSoJOT2NrkGo7VG2tnB7fM0+OkkhkW10DnLTXJID0w03jftFCSfvUjQa8wL7Y6pH+W+X/uVS
	0VKT00NByVTJaqw7DqzWyfNYtO+nTWDnVC02UZs++PQQDnwzgBR38z7isPWhSxAp5S2iDvw1368DF
	XeaKelmM3tgSegr57SOOJEEzvL34wpg4EAtYZTWmNOEwbNuc4841WfwgrqKmBFNhj3hP0la+KKbdH
	H+LYA9k+6Uf9WuCwZUkgjYCHaBNQiEYvRVjGycxUO/B5e47hBYDx4yCFh4lHWiVosLd6WiCBRyejo
	EAGz9mAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxUu-00000000NTM-0qX3;
	Mon, 03 Aug 2026 18:34:48 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxUq-00000000NSy-2IbJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:34:46 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrJMPh+D0jdowdA4XJ4CPXunDrNvfvLG8Ea5y3bDLgEbRssiT37QMVqmCdJlQf7/HpsHmfnDElHQYOogUBM770w@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785782079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XR++r527W94xfQdEsxvKm6tGy0wq5RNvP/m4bM8F0Ww=;
	b=TLcfibXteu8BIULimjvRFXQhSfUJ3X5jMTYeQfAlGFZyrVaU0q3ESknkjeVApWzGjyilU1
	ryeiM8Hihf1HvTeIowravIwq3IWHme8JFf8tPvECs1HypoLR5L4tI/hmcTvhbobF19wxKJ
	PPLfWPdVCa8WQKzty7cuZ+T50IK5ZYQ=
X-Gm-Message-State: AOJu0Yy0JKymvazRubUBxsW+2B91AEVFNvkSdDC/j/WVYigHJgRYNrAe
	HGzD4RRL0BNqh1kzF7ZBjrB6rQwn3jLycBDernbx2fHsXkOsOsTEw7dwnqrTq5z373KRiRbZoVY
	Z0BQ49+jbDKq5ifdduK+MsAb7nbt8plP8WEIWNz6V
X-Received: by 2002:ac8:6f1b:0:b0:52c:d3a1:358a with SMTP id
 d75a77b69052e-52cd4fc8ac0mr1363411cf.14.1785782050144; Mon, 03 Aug 2026
 11:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260803124220.332248-1-fuad.tabba@linux.dev> <20260803124220.332248-10-fuad.tabba@linux.dev>
 <86se4vaxvf.wl-maz@kernel.org>
In-Reply-To: <86se4vaxvf.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 3 Aug 2026 19:33:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxZt8cUdUnfaO+RKxirgwSQe9rM1hqgOMrTq+DqC2t8CA@mail.gmail.com>
X-Gm-Features: AUfX_mxi4ObuHGTk_sJo4xYYR_UKv6xK4IG_KWJSzkKX7KyI0YYHqs_yapMU1CA
Message-ID: <CA+EHjTxZt8cUdUnfaO+RKxirgwSQe9rM1hqgOMrTq+DqC2t8CA@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] KVM: arm64: Type-check hypercall arguments at
 the caller
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com, 
	vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	ardb@kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_113444_817821_962F86B0 
X-CRM114-Status: GOOD (  22.80  )
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

On Mon, 3 Aug 2026 at 18:59, Marc Zyngier <maz@kernel.org> wrote:
...
> > +/*
> > + * Generate a typed stub for each declared hypercall. kvm_call_hyp_nvhe()
> > + * resolves to the stub, so a call with the wrong argument count or types
> > + * fails to compile instead of being silently truncated to an SMCCC function
> > + * number and a pile of registers. The stub inlines to the same SMCCC call
> > + * the untyped macro used to make.
> > + */
> > +#define DECLARE_KVM_HOST_HCALL(ret, name, ...)                               \
> > +     static __always_inline                                          \
> > +     ret nvhe_hvc_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__)) \
> > +     {                                                               \
> > +             return (ret)__kvm_call_hyp_nvhe(name,                   \
> > +                     __KVM_HCALL_MAP(__KVM_HCALL_ARGS, __VA_ARGS__));\
> > +     }
> > +
> > +#define DECLARE_KVM_HOST_HCALL_VOID(name, ...)                               \
> > +     static __always_inline                                          \
> > +     void nvhe_hvc_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__)) \
> > +     {                                                               \
> > +             __kvm_call_hyp_nvhe(name,                               \
> > +                     __KVM_HCALL_MAP(__KVM_HCALL_ARGS, __VA_ARGS__));\
> > +     }
>
> I'll bite! ;-) void is a type, not the absence of a type. And
> returning void is perfectly valid.
>
> So with this in mind, I got rid of the *_VOID() helpers altogether,
> see below.

This looks better. I've built and boot tested it, and the generated
code is identical.

I noticed is that gcc and clang complain about "return (void)expr"
under -Wpedantic, since ISO C only allows it from C23. We never build
with that, right? So it doesn't bite ;)

Cheers,
/fuad



>
> Thanks,
>
>         M.
>
> diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
> index 3958396a83345..0b1b10d4212da 100644
> --- a/arch/arm64/include/asm/kvm_hcall.h
> +++ b/arch/arm64/include/asm/kvm_hcall.h
> @@ -88,26 +88,12 @@ struct vgic_v5_cpu_if;
>                         __KVM_HCALL_MAP(__KVM_HCALL_ARGS, __VA_ARGS__));\
>         }
>
> -#define DECLARE_KVM_HOST_HCALL_VOID(name, ...)                         \
> -       static __always_inline                                          \
> -       void nvhe_hvc_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__)) \
> -       {                                                               \
> -               __kvm_call_hyp_nvhe(name,                               \
> -                       __KVM_HCALL_MAP(__KVM_HCALL_ARGS, __VA_ARGS__));\
> -       }
> -
>  #define DECLARE_KVM_HOST_HCALL0(ret, name)                             \
>         static __always_inline ret nvhe_hvc_##name(void)                \
>         {                                                               \
>                 return (ret)__kvm_call_hyp_nvhe(name);                  \
>         }
>
> -#define DECLARE_KVM_HOST_HCALL0_VOID(name)                             \
> -       static __always_inline void nvhe_hvc_##name(void)               \
> -       {                                                               \
> -               __kvm_call_hyp_nvhe(name);                              \
> -       }
> -
>  #define kvm_call_hyp_nvhe(f, ...)      nvhe_hvc_##f(__VA_ARGS__)
>
>  /*
> @@ -148,12 +134,8 @@ struct vgic_v5_cpu_if;
>   */
>  #define DECLARE_KVM_HOST_HCALL(ret, name, ...)                         \
>         typedef ret kvm_host_hcall_sig_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__));
> -#define DECLARE_KVM_HOST_HCALL_VOID(name, ...)                         \
> -       typedef void kvm_host_hcall_sig_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__));
>  #define DECLARE_KVM_HOST_HCALL0(ret, name)                             \
>         typedef ret kvm_host_hcall_sig_##name(void);
> -#define DECLARE_KVM_HOST_HCALL0_VOID(name)                             \
> -       typedef void kvm_host_hcall_sig_##name(void);
>  #endif /* __KVM_NVHE_HYPERVISOR__ */
>
>  /* Hypercalls that are unavailable once pKVM has finalised. */
> @@ -164,52 +146,52 @@ DECLARE_KVM_HOST_HCALL(unsigned long, __pkvm_create_private_mapping,
>         phys_addr_t, phys, size_t, size, u64, prot)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_cpu_set_vector,
>         enum arm64_hyp_spectre_vector, slot)
> -DECLARE_KVM_HOST_HCALL0_VOID(__kvm_enable_ssbs)
> -DECLARE_KVM_HOST_HCALL0_VOID(__vgic_v3_init_lrs)
> +DECLARE_KVM_HOST_HCALL0(void, __kvm_enable_ssbs)
> +DECLARE_KVM_HOST_HCALL0(void, __vgic_v3_init_lrs)
>  DECLARE_KVM_HOST_HCALL0(u64, __vgic_v3_get_gic_config)
>
>  DECLARE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
>
>  /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_adjust_pc,
> +DECLARE_KVM_HOST_HCALL(void, __kvm_adjust_pc,
>         struct kvm_vcpu __kern *, vcpu)
>  DECLARE_KVM_HOST_HCALL(int, __kvm_vcpu_run,
>         struct kvm_vcpu __kern *, vcpu)
> -DECLARE_KVM_HOST_HCALL0_VOID(__kvm_flush_vm_context)
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa,
> +DECLARE_KVM_HOST_HCALL0(void, __kvm_flush_vm_context)
> +DECLARE_KVM_HOST_HCALL(void, __kvm_tlb_flush_vmid_ipa,
>         struct kvm_s2_mmu __kern *, mmu, phys_addr_t, ipa, int, level)
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa_nsh,
> +DECLARE_KVM_HOST_HCALL(void, __kvm_tlb_flush_vmid_ipa_nsh,
>         struct kvm_s2_mmu __kern *, mmu, phys_addr_t, ipa, int, level)
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid,
> +DECLARE_KVM_HOST_HCALL(void, __kvm_tlb_flush_vmid,
>         struct kvm_s2_mmu __kern *, mmu)
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_range,
> +DECLARE_KVM_HOST_HCALL(void, __kvm_tlb_flush_vmid_range,
>         struct kvm_s2_mmu __kern *, mmu, phys_addr_t, start, unsigned long, pages)
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_flush_cpu_context,
> +DECLARE_KVM_HOST_HCALL(void, __kvm_flush_cpu_context,
>         struct kvm_s2_mmu __kern *, mmu)
> -DECLARE_KVM_HOST_HCALL_VOID(__kvm_timer_set_cntvoff,
> +DECLARE_KVM_HOST_HCALL(void, __kvm_timer_set_cntvoff,
>         u64, cntvoff)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_load,
>         void __kern *, desc_hva, size_t, desc_size)
> -DECLARE_KVM_HOST_HCALL0_VOID(__tracing_unload)
> +DECLARE_KVM_HOST_HCALL0(void, __tracing_unload)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_enable,
>         bool, enable)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_swap_reader,
>         unsigned int, cpu)
> -DECLARE_KVM_HOST_HCALL_VOID(__tracing_update_clock,
> +DECLARE_KVM_HOST_HCALL(void, __tracing_update_clock,
>         u32, mult, u32, shift, u64, epoch_ns, u64, epoch_cyc)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_reset,
>         unsigned int, cpu)
>  DECLARE_KVM_HOST_HCALL(int, __tracing_enable_event,
>         unsigned short, id, bool, enable)
> -DECLARE_KVM_HOST_HCALL_VOID(__tracing_write_event,
> +DECLARE_KVM_HOST_HCALL(void, __tracing_write_event,
>         u64, id)
> -DECLARE_KVM_HOST_HCALL_VOID(__vgic_v3_save_aprs,
> +DECLARE_KVM_HOST_HCALL(void, __vgic_v3_save_aprs,
>         struct vgic_v3_cpu_if __kern *, cpu_if)
> -DECLARE_KVM_HOST_HCALL_VOID(__vgic_v3_restore_vmcr_aprs,
> +DECLARE_KVM_HOST_HCALL(void, __vgic_v3_restore_vmcr_aprs,
>         struct vgic_v3_cpu_if __kern *, cpu_if)
> -DECLARE_KVM_HOST_HCALL_VOID(__vgic_v5_save_apr,
> +DECLARE_KVM_HOST_HCALL(void, __vgic_v5_save_apr,
>         struct vgic_v5_cpu_if __kern *, cpu_if)
> -DECLARE_KVM_HOST_HCALL_VOID(__vgic_v5_restore_vmcr_apr,
> +DECLARE_KVM_HOST_HCALL(void, __vgic_v5_restore_vmcr_apr,
>         struct vgic_v5_cpu_if __kern *, cpu_if)
>
>  /* Hypercalls that are available only when pKVM has finalised. */
> @@ -232,7 +214,7 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_host_test_clear_young_guest,
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_host_mkyoung_guest,
>         u64, gfn)
>  DECLARE_KVM_HOST_HCALL0(int, __pkvm_reserve_vm)
> -DECLARE_KVM_HOST_HCALL_VOID(__pkvm_unreserve_vm,
> +DECLARE_KVM_HOST_HCALL(void, __pkvm_unreserve_vm,
>         pkvm_handle_t, handle)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vm,
>         struct kvm __kern *, host_kvm, void __kern *, vm_hva,
> @@ -249,10 +231,10 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_start_teardown_vm,
>         pkvm_handle_t, handle)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_finalize_teardown_vm,
>         pkvm_handle_t, handle)
> -DECLARE_KVM_HOST_HCALL_VOID(__pkvm_vcpu_load,
> +DECLARE_KVM_HOST_HCALL(void, __pkvm_vcpu_load,
>         pkvm_handle_t, handle, unsigned int, vcpu_idx, u64, hcr_el2)
> -DECLARE_KVM_HOST_HCALL0_VOID(__pkvm_vcpu_put)
> -DECLARE_KVM_HOST_HCALL_VOID(__pkvm_tlb_flush_vmid,
> +DECLARE_KVM_HOST_HCALL0(void, __pkvm_vcpu_put)
> +DECLARE_KVM_HOST_HCALL(void, __pkvm_tlb_flush_vmid,
>         pkvm_handle_t, handle)
>
>  #endif /* __ARM64_KVM_HCALL_H__ */
>
> --
> Without deviation from the norm, progress is not possible.

