Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC19109190B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Cip3Uwd6CldEMD/McQSMu7fR/lxZffueL0iRK8N7eQ=; b=crnoxviy5sTbBthzEoe2hnRTEK
	Q+W4SXVIbKWivh4AH4YAljtzW7tfpDdCOyqERAyCVuJu1f+PouQPr7c5E9C+6vIBpT2aybozqseFx
	zhpWI3IXHs3oFTqQ+KEF8n6w7Yg9PRD3Y5M/5WPWBbyzIBlAHoXAAjzyXFSjWOE64WRDcTalDUBzz
	qHfRLsGYvrWyv+4SvQ+9VKZIyF7KCH4jhklpKDBSfooJ34x4ZoMeWa9mmzdIfgwDct8uhGbAkvD8U
	4IPA7BoaT8gbozA76Y3rBSVJYZvGquwPjjRA/0C2egEfNOyWPG6JXTM/8G2Q98oxOA+/rAk81OXLW
	HCWxjhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IUo-0000000BPQv-3LBq;
	Thu, 19 Mar 2026 18:53:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IUm-0000000BPQL-2ROH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:53:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2680522C7;
	Thu, 19 Mar 2026 11:53:17 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37603F7BD;
	Thu, 19 Mar 2026 11:53:19 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:53:13 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 45/48] arm64: RMI: Provide accurate register list
Message-ID: <iiyaphsgpo2f3wrrywggsten6c6lb4gxhiztah6jurtt25xepf@gpzdhw77oa4a>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-46-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318155413.793430-46-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_115324_712579_F3F7E4E6 
X-CRM114-Status: GOOD (  24.62  )
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

On Wed, Mar 18, 2026 at 03:54:09PM +0000, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Userspace can set a few registers with KVM_SET_ONE_REG (9 GP registers
> at runtime, and 3 system registers during initialization). Update the
> register list returned by KVM_GET_REG_LIST.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v11:
>  * Reworked due to upstream changes.
> Changes since v8:
>  * Minor type changes following review.
> Changes since v7:
>  * Reworked on upstream changes.
> ---
>  arch/arm64/kvm/guest.c      |  6 ++++++
>  arch/arm64/kvm/hypercalls.c |  4 ++--
>  arch/arm64/kvm/sys_regs.c   | 29 +++++++++++++++++++++++------
>  3 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 2c4db2d1a6ca..23fdb2ee8a61 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -620,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>  	if (!kvm_arm_vcpu_sve_finalized(vcpu))
>  		return 1; /* KVM_REG_ARM64_SVE_VLS */
>  
> +	if (kvm_is_realm(vcpu->kvm))
> +		return 1; /* KVM_REG_ARM64_SVE_VLS */
> +
>  	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>  		+ 1; /* KVM_REG_ARM64_SVE_VLS */
>  }
> @@ -647,6 +650,9 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>  	if (!kvm_arm_vcpu_sve_finalized(vcpu))
>  		return num_regs;
>  
> +	if (kvm_is_realm(vcpu->kvm))
> +		return num_regs;
> +
>  	for (i = 0; i < slices; i++) {
>  		for (n = 0; n < SVE_NUM_ZREGS; n++) {
>  			reg = KVM_REG_ARM64_SVE_ZREG(n, i);
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 58c5fe7d7572..70ac7971416c 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -414,14 +414,14 @@ void kvm_arm_teardown_hypercalls(struct kvm *kvm)
>  
>  int kvm_arm_get_fw_num_regs(struct kvm_vcpu *vcpu)
>  {
> -	return ARRAY_SIZE(kvm_arm_fw_reg_ids);
> +	return kvm_is_realm(vcpu->kvm) ? 0 : ARRAY_SIZE(kvm_arm_fw_reg_ids);
>  }
>  
>  int kvm_arm_copy_fw_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
>  {
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(kvm_arm_fw_reg_ids); i++) {
> +	for (i = 0; i < kvm_arm_get_fw_num_regs(vcpu); i++) {
>  		if (put_user(kvm_arm_fw_reg_ids[i], uindices++))
>  			return -EFAULT;
>  	}
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index ebb428b861f5..088d900b9c3a 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5436,18 +5436,18 @@ int kvm_arm_sys_reg_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg
>  				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
>  }
>  
> -static unsigned int num_demux_regs(void)
> +static inline unsigned int num_demux_regs(struct kvm_vcpu *vcpu)
>  {
> -	return CSSELR_MAX;
> +	return kvm_is_realm(vcpu->kvm) ? 0 : CSSELR_MAX;
>  }
>  
> -static int write_demux_regids(u64 __user *uindices)
> +static int write_demux_regids(struct kvm_vcpu *vcpu, u64 __user *uindices)
>  {
>  	u64 val = KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX;
>  	unsigned int i;
>  
>  	val |= KVM_REG_ARM_DEMUX_ID_CCSIDR;
> -	for (i = 0; i < CSSELR_MAX; i++) {
> +	for (i = 0; i < num_demux_regs(vcpu); i++) {
>  		if (put_user(val | i, uindices))
>  			return -EFAULT;
>  		uindices++;
> @@ -5491,11 +5491,28 @@ static bool copy_reg_to_user(const struct sys_reg_desc *reg, u64 __user **uind)
>  	return true;
>  }
>  
> +static inline bool kvm_realm_sys_reg_hidden_user(const struct kvm_vcpu *vcpu,
> +						 u64 reg)
> +{
> +	if (!kvm_is_realm(vcpu->kvm))
> +		return false;
> +
> +	switch (reg) {
> +	case SYS_ID_AA64DFR0_EL1:
> +	case SYS_PMCR_EL0:
> +		return false;
> +	}
> +	return true;
> +}
> +
>  static int walk_one_sys_reg(const struct kvm_vcpu *vcpu,
>  			    const struct sys_reg_desc *rd,
>  			    u64 __user **uind,
>  			    unsigned int *total)
>  {
> +	if (kvm_realm_sys_reg_hidden_user(vcpu, reg_to_encoding(rd)))

Hi,

Same as my comment for patch 39, I would suggest moving the
kvm_is_realm() check out of this function.

Thanks,
Wei-Lin Chang

> +		return 0;
> +
>  	/*
>  	 * Ignore registers we trap but don't save,
>  	 * and for which no custom user accessor is provided.
> @@ -5533,7 +5550,7 @@ static int walk_sys_regs(struct kvm_vcpu *vcpu, u64 __user *uind)
>  
>  unsigned long kvm_arm_num_sys_reg_descs(struct kvm_vcpu *vcpu)
>  {
> -	return num_demux_regs()
> +	return num_demux_regs(vcpu)
>  		+ walk_sys_regs(vcpu, (u64 __user *)NULL);
>  }
>  
> @@ -5546,7 +5563,7 @@ int kvm_arm_copy_sys_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
>  		return err;
>  	uindices += err;
>  
> -	return write_demux_regids(uindices);
> +	return write_demux_regids(vcpu, uindices);
>  }
>  
>  #define KVM_ARM_FEATURE_ID_RANGE_INDEX(r)			\
> -- 
> 2.43.0
> 

