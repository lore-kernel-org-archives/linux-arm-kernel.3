Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C10E10775FC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3ietH/6KXnrcHoacqF0eIQ/NgUxU5kWosETVrJGVYs=; b=OAAOcVib6DRADIHRxm+ru5i4cn
	z6Lsz/GUzWN2mLHjA39o95WgiTkObRI/4SbvDE3OozKORaC0NkG4hLOXnFomJ1NTrFSqSDGl6Fx3W
	R28OMbuLTG9XU3sYcX+2C3DsTmrZxRjvrjFx4WYPCUV4qm6ClKU07zmJxj76M5hxUzPZXxj+m04ID
	L+PvAAsPRI9nrcJ1JnzkXq67GyW8VReWvyD2E7pM4WuHzUItgCKny7HylWKa8nNzcbUk5VEILpJR1
	0DbJwu26Xh+VDlfML0mWh6IeI02XKRIL6etSOsGITVCdYen/K0SkMT8tqNPRl5RnZ5RfLoxjS/eVi
	8CzXj5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v1Z-000000097Km-2U3X;
	Wed, 18 Mar 2026 17:49:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v1Y-000000097KW-1EKN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 17:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O3ietH/6KXnrcHoacqF0eIQ/NgUxU5kWosETVrJGVYs=; b=lC+tDl+If8TgCoMiRUVxXVQf43
	2o33J5hco2n55E8dDNn5COEjBsZhKI2/I9gvZyROYQ5sa/VDixe8TJIei8XtwR1u6Ip4LGZC1rJWV
	S1CZLn3uho7u4IqBmXSG8rLJbwFkIte9Aq29+76t8Jw/cKDStNxjdqaD3BIpQ8YzrjQEiHlRRyy6K
	Nsq61N3acBOLX0a4vSXpE0IUwu+YS98RL4N32hh/5gapchQPmXsu8KFZd1tqiKfFvu1eyRCPeD7RW
	4QBeXkaSSYfPMD/qWKWwAltJbll40SNwdpiizocODkOyu5ML5ZOYOoIZEsHr1w8lNMPwfZDKe2mxe
	oWlGnAnw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v1V-0000000BwAF-0OKG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 071A641722;
	Wed, 18 Mar 2026 17:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF2CC2BCAF;
	Wed, 18 Mar 2026 17:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856173;
	bh=wT/iYNzCm2V9NPLbTEHHOe/QpojvcSnk86PQ+66AEt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkSQV6twayNsM864uyXHJbD3Bz09Zv3RgGje9V3ZbME8R/H1Wh1obgiGhENM+mggW
	 D5ABCcEiuY5rZeHWUNjiyLOpjfOczS0ca6yNrSRX1Rr0r4vL4Ya/GVwnTxaB09HX3Y
	 EV0u7knDwunWhKyXhLzFTXZ4MPZOFTT5szpZn0dgZHQeJXD72GZhwujl8G3tbxZlo1
	 lgnHzLej7fBKuQKZZ8br9V3tdiJRm5POUPxOJvnqXb//ozruODKZ+3iFXOb7rRed4w
	 IffUWkwA6iRO/DW2NQihZNs7JzfIcHAZ6Zb87phBm9GB52j3cSNwRiLQkQZtRDAADg
	 dqnhkjtDLNflA==
Date: Wed, 18 Mar 2026 17:49:46 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 12/30] KVM: arm64: Factor SVE code out of
 fpsimd_lazy_switch_to_host()
Message-ID: <20260318174946.GJ2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-12-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-12-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_174937_447144_CFF6656F 
X-CRM114-Status: GOOD (  21.81  )
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

On Fri, Mar 06, 2026 at 05:01:04PM +0000, Mark Brown wrote:
> Since the function will grow as a result of adding SME support move the
> SVE code out of fpsimd_lazy_switch_to_host(). No functional change, just
> code motion.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

>  arch/arm64/kvm/hyp/include/hyp/switch.h | 46 +++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 4e38610be19a..5b99aa479c59 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -483,11 +483,11 @@ static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> -static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
> +static inline void sve_lazy_switch_to_host(struct kvm_vcpu *vcpu)
>  {
>  	u64 zcr_el1, zcr_el2;
>  
> -	if (!guest_owns_fp_regs())
> +	if (!vcpu_has_sve(vcpu))
>  		return;
>  
>  	/*
> @@ -498,29 +498,35 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
>  	 * synchronization event, we don't need an ISB here to avoid taking
>  	 * traps for anything that was exposed to the guest.
>  	 */
> -	if (vcpu_has_sve(vcpu)) {
> -		zcr_el1 = read_sysreg_el1(SYS_ZCR);
> -		__vcpu_assign_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu), zcr_el1);
> +	zcr_el1 = read_sysreg_el1(SYS_ZCR);
> +	__vcpu_assign_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu), zcr_el1);
>  
> -		/*
> -		 * The guest's state is always saved using the guest's max VL.
> -		 * Ensure that the host has the guest's max VL active such that
> -		 * the host can save the guest's state lazily, but don't
> -		 * artificially restrict the host to the guest's max VL.
> -		 */
> -		if (has_vhe()) {
> -			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> -			write_sysreg_el2(zcr_el2, SYS_ZCR);
> -		} else {
> -			zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
> -			write_sysreg_el2(zcr_el2, SYS_ZCR);
> +	/*
> +	 * The guest's state is always saved using the guest's max VL.
> +	 * Ensure that the host has the guest's max VL active such
> +	 * that the host can save the guest's state lazily, but don't
> +	 * artificially restrict the host to the guest's max VL.
> +	 */
> +	if (has_vhe()) {
> +		zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> +		write_sysreg_el2(zcr_el2, SYS_ZCR);
> +	} else {
> +		zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
> +		write_sysreg_el2(zcr_el2, SYS_ZCR);
>  
> -			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
> -			write_sysreg_el1(zcr_el1, SYS_ZCR);
> -		}
> +		zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
> +		write_sysreg_el1(zcr_el1, SYS_ZCR);
>  	}
>  }
>  
> +static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
> +{
> +	if (!guest_owns_fp_regs())
> +		return;
> +
> +	sve_lazy_switch_to_host(vcpu);
> +}
> +
>  static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
>  {
>  	/*
> 
> -- 
> 2.47.3
> 
> 

