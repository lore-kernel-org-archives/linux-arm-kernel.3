Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1389DC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzFkdvKaxH4Hel5gdQlPGogDXbokx4DTWEowJWNszls=; b=3K5fd1wtBRFR/rXHEROfLM6cYh
	by/exw0rUOl9bgI2+yPcysoFH+ouGTuZ0OpoPYmZAQkZEE6bFsX6Ky6dz24f/gekeZh9jHvsXtlVY
	KLZWC5S8qf8Y1bQZIldoYplNluBUnKvjAFmOfpJHjVPCfV28AhomWCdWdWEK47PNVK/IjPAZYTGzi
	ln4sNNtQxMxZOMVylY5rugDrvbHE2FnKCFFJ1V6Y+GUfI8nPX3yNcWCNXhxNbo5hMCMFjkKRJIL5W
	/6dbDOJQGlWLclXKcMQMeRZCdMXAYQ27vfBj9oU3W9M8dpZdyjZoFFp5GUPZymZplZbzEwI0vETzx
	jt9pIZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiKm-0000000GXGb-0rr4;
	Fri, 20 Jun 2025 20:27:36 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiIW-0000000GX7C-10Gv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 20:25:17 +0000
Date: Fri, 20 Jun 2025 13:25:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750451114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzFkdvKaxH4Hel5gdQlPGogDXbokx4DTWEowJWNszls=;
	b=WNCqy5yC5MX/HewEIIsCqlmZEpdwRBR7Eu9ebrC5gbzo0wO891VjXDboDIhMH/JvlSc97B
	HbOotk0k+L9BOaQZfdEbVCIgUE3YI5dKoAxwqSeQVk1x/sRb9+g4/qKO4G3tmcCve82DXF
	pkT8e0KeLMe843FhbKYPHU9TMSzzPFk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 5/5] KVM: arm64: gic-v5: Probe for GICv5
Message-ID: <aFXDobZ2GXPC4wOJ@linux.dev>
References: <20250620160741.3513940-1-sascha.bischoff@arm.com>
 <20250620160741.3513940-6-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620160741.3513940-6-sascha.bischoff@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132516_431059_060F4573 
X-CRM114-Status: GOOD (  18.89  )
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

On Fri, Jun 20, 2025 at 04:07:52PM +0000, Sascha Bischoff wrote:
> +/**
> + * vgic_v5_probe - probe for a VGICv5 compatible interrupt controller
> + * @info:	pointer to the GIC description
> + *
> + * Returns 0 if the VGICv5 has been probed successfully, returns an error code
> + * otherwise.
> + */

nit: avoid kerneldoc style

This actually generates documentation as well as build warnings when we
screw up the format. I'd only do this sort of thing for sufficiently
public functions.

Thanks,
Oliver

> +int vgic_v5_probe(const struct gic_kvm_info *info)
> +{
> +	u64 ich_vtr_el2;
> +	int ret;
> +
> +	if (!info->has_gcie_v3_compat)
> +		return -ENODEV;
> +
> +	kvm_vgic_global_state.type = VGIC_V5;
> +	kvm_vgic_global_state.has_gcie_v3_compat = true;
> +	static_branch_enable(&kvm_vgic_global_state.gicv5_cpuif);
> +
> +	/* We only support v3 compat mode - use vGICv3 limits */
> +	kvm_vgic_global_state.max_gic_vcpus = VGIC_V3_MAX_CPUS;
> +
> +	kvm_vgic_global_state.vcpu_base = 0;
> +	kvm_vgic_global_state.vctrl_base = NULL;
> +	kvm_vgic_global_state.can_emulate_gicv2 = false;
> +	kvm_vgic_global_state.has_gicv4 = false;
> +	kvm_vgic_global_state.has_gicv4_1 = false;
> +
> +	ich_vtr_el2 =  kvm_call_hyp_ret(__vgic_v3_get_gic_config);
> +	kvm_vgic_global_state.ich_vtr_el2 = (u32)ich_vtr_el2;
> +
> +	/*
> +	 * The ListRegs field is 5 bits, but there is an architectural
> +	 * maximum of 16 list registers. Just ignore bit 4...
> +	 */
> +	kvm_vgic_global_state.nr_lr = (ich_vtr_el2 & 0xf) + 1;
> +
> +	ret = kvm_register_vgic_device(KVM_DEV_TYPE_ARM_VGIC_V3);
> +	if (ret) {
> +		kvm_err("Cannot register GICv3-legacy KVM device.\n");
> +		return ret;
> +	}
> +
> +	static_branch_enable(&kvm_vgic_global_state.gicv3_cpuif);
> +	kvm_info("GCIE legacy system register CPU interface\n");
> +
> +	return 0;
> +}
> +
>  inline bool kvm_vgic_in_v3_compat_mode(void)
>  {
>  	if (static_branch_unlikely(&kvm_vgic_global_state.gicv5_cpuif) &&
> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> index 5c78eb915a22..a5292cad60ff 100644
> --- a/arch/arm64/kvm/vgic/vgic.h
> +++ b/arch/arm64/kvm/vgic/vgic.h
> @@ -308,6 +308,8 @@ int vgic_init(struct kvm *kvm);
>  void vgic_debug_init(struct kvm *kvm);
>  void vgic_debug_destroy(struct kvm *kvm);
>  
> +int vgic_v5_probe(const struct gic_kvm_info *info);
> +
>  static inline int vgic_v3_max_apr_idx(struct kvm_vcpu *vcpu)
>  {
>  	struct vgic_cpu *cpu_if = &vcpu->arch.vgic_cpu;
> -- 
> 2.34.1

