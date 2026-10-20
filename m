Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bL2Cf5P1;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KUVgrnZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXThUahDPZjGbRfHjcT4v6EeFVqqPmsU8xiktNdbhT4=; b=bL2Cf5P14CnhFZj8+T1NqP5D4k
	/cGJ596wfNeg/CxKV0ci4lp11aOZjwbpC0SXDwf4jDfTd4DhtmDCiicmyckFd7JGRjXamgZh/6Izi
	a6QW9gUVkUWhXWzPMzy4wznlAKAGEM0REfsDV45qwa4PdwS3SG8squg5jS2DdHCo1Ak34JoiXrevu
	g8qzZ0Yesxl9ypTSj9pplPxFCGBqDdQRvn8/tU1q7weePf9je9mDVtrqIzCud/TKkR41vOj/MHcZC
	gISjlyTd8oOUDixJyU1KaK26osU5VrNAa9R9/PB561baB3j3SEQw82Xb/GvBCDxmxJbRn5lCPiLdp
	jdnxVfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Fw-00000009BeM-1lBj;
	Tue, 20 Oct 2026 08:31:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Fl-00000009BYp-0j22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:31:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so22515095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792485083; x=1793089883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aXThUahDPZjGbRfHjcT4v6EeFVqqPmsU8xiktNdbhT4=;
        b=KUVgrnZcyETlTohOhSVW39cGKGha49Ecn0P4jtBwvBaF1FBnfB+xyWuAE9gDXHoQHC
         bU3O4aNXpZIVqKP8uO7Tp3ZBlam2Sj/OySIukMTDESMeJ2SBtVWe2dndQbZ/egoSumPu
         mCeXY7IyoN9d2yn04RkyD4ERDkRtVHWxJ4oc0T2LRr4B+BwRp9TpmlZCv4577WCCOOe8
         rVpBeknGt1quFgPUBbCETFfk6O/6/v5qgZgEWC99MyhsjmWZim7Z78qhHYXTqF8kSXW+
         KseLvx3utH5AGZq3dKsXfN3D/s5V0FSW/RrHzmoKtqYUUQkvaTpMFmP98KDgcvlufq4b
         /oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485083; x=1793089883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXThUahDPZjGbRfHjcT4v6EeFVqqPmsU8xiktNdbhT4=;
        b=PrUA3Y2mBYOiup0x0f8DgLL3ZX+JanyB91uhqp+hcMCoV2tzbSIdWtXPltwsrSeEql
         uyWuZBLjjqk+G+oOiPGmI9oviEjorFlOY/fGE7AmqxAWxR8Cf0qto3oRR1QwlHUb7kj3
         aex5ny/kJ3/IYikZUSQdmdu0Ovmk4/iI9LP0O+/cNTVgTnh1mnMZv3gNx6h7uHYRxXtT
         /tsg7ShcZjoOp2G1ub91V7SYygTmdhlgTWNOx7U5T1544pMHN2qEWVS9Go+7PtWZLqGW
         i73jr43qUcYb3k8fuCxFqMA1TAiAQdNIsMJhryFLF5nP/mv6eJas6hIA29Yy98UkUA4u
         eu1w==
X-Forwarded-Encrypted: i=1; AKwUvByXOLs3v9067I1PxwHhH4eYWZEtfBTNmiRisWU3G0Xa6D1aPOQV9GVXMX3/60UiLaPn5cchimlASOP5Rwmkviai@lists.infradead.org
X-Gm-Message-State: AFq9FYL07D5meAgDA2pDOqo20/Uz3kXwQiHJBs2+gSFipIazTwQS4gOl
	ED2grDm4QhmDM7aaxIS2ZMzjzfFPSAdylJ59Aqrjg+mSSux/OVoZ7wsgYp8JrrSVQg==
X-Gm-Gg: AYBFou1Q/xbiurOHX3oTeTqyTA+zum9YErvCGyxOC7qzF1W0o0qrw97kH3tC2NqinXM
	YyTUsX+4rbFCYNbDf9N/2UKXZpDk1G+d3vNbLQ6fHpeAZhP9g7AC4IanH2u7Z1THKZJvRVeYkcv
	vcwZhnNvO64au9nZjIhvEAB3ybQDTNHoEBLpsMJQa9QHkuFhQA02mAawNawMgl0VECXeQfJU8yp
	3Dji+4gJvpXreOQtBqwSUEHzlzEBT64uShBKEvyO4IPtllZfvaQTm6n6ccAhhOWwKcr385I3izf
	WIViCMQXBLzFnhHS15esIo/0wqRVpYGXFqSvYasMLTpHcjFPXoHvCZy4IhuozldrG0zeWM4qCmT
	Rh0h/FdwksVVs5Ysd+u1/mFTeZhZ6lSi4A3YiZSVVq2xU7jI7T25jG8cW+0oe38/hwpT4SfMviy
	yhw7QuMfjQNXolXe/xw5/25VMsGhhmImlPeDsorj/Boid+IaqB6oYMCDqRqFoXnJ+//2JLKtnME
	6RoMM9nNYoKwi5Wq40GoeiMmj/nP0f1T0oVAwIBAik=
X-Received: by 2002:a05:600c:8709:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a1d75f8f28mr203436305e9.18.1792485082200;
        Tue, 20 Oct 2026 01:31:22 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm48973225e9.6.2026.10.20.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:31:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:31:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atcmp8kdDdoM4RnR@google.com>
References: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013125_654170_EA502A25 
X-CRM114-Status: GOOD (  31.79  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 08:43:11AM +0100, Fuad Tabba wrote:
> All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
> and I-cache for the VM whenever a different vCPU of that VM is loaded
> there. pKVM guests, protected or not, run on the hypervisor's stage-2
> and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
> instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
> the same VM left on that CPU.
> 
> Track at EL2 the last vCPU of each VM loaded on each CPU, and flush
> when it changes. EL2 can't allocate per-CPU memory for each VM, as the
> host does, so use one per-CPU array indexed by the VM's table entry.
> Reset the entry's slot on every CPU when a VM reserves it, so that a new
> VM starts with no last vCPU, whether the entry is unused or was left by
> a VM that was torn down.
> 
> Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> Changes since v1 [1]:
>   - Dropped patch 1, which added a CPU number at EL2. The last vCPU is
>     now tracked in a per-CPU array indexed by VM table entry. (Marc)
>   - Moved the check from __pkvm_vcpu_load() to pkvm_load_hyp_vcpu().
>   - The array is unsigned int, initialised to UINT_MAX. (Vincent)
>   - Dropped Joey's Reviewed-by, since the patch changed.
> 
> Based on kvmarm/next (dd0bc00e3e920).
> 
> [1] https://lore.kernel.org/all/20261014125510.2928306-1-fuad.tabba@linux.dev/
> 
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ac020d0501d2e..1fc59229c8e86 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -38,6 +38,9 @@ unsigned int kvm_host_sve_max_vl;
>   */
>  static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
>  
> +/* Per VM table entry, the vcpu_idx of the last vCPU of that VM loaded on this CPU. */
> +static DEFINE_PER_CPU(unsigned int, last_vcpu_ran[KVM_MAX_PVMS]);
> +
>  static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
> @@ -261,6 +264,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
>  	struct pkvm_hyp_vm *hyp_vm;
> +	unsigned int *last_ran;
>  
>  	/* Cannot load a new vcpu without putting the old one first. */
>  	if (__this_cpu_read(loaded_hyp_vcpu))
> @@ -290,8 +294,18 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  unlock:
>  	hyp_spin_unlock(&vm_table_lock);
>  
> -	if (hyp_vcpu)
> -		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +	if (!hyp_vcpu)
> +		return NULL;
> +
> +	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +
> +	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
> +	last_ran = this_cpu_ptr(&last_vcpu_ran[vm_handle_to_idx(handle)]);
> +	if (*last_ran != vcpu_idx) {
> +		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
> +		*last_ran = vcpu_idx;
> +	}
> +
>  	return hyp_vcpu;
>  }
>  
> @@ -652,6 +666,7 @@ static int find_free_vm_table_entry(void)
>   */
>  static int allocate_vm_table_entry(void)
>  {
> +	unsigned int cpu;
>  	int idx;
>  
>  	hyp_assert_lock_held(&vm_table_lock);
> @@ -670,6 +685,9 @@ static int allocate_vm_table_entry(void)
>  
>  	vm_table[idx] = RESERVED_ENTRY;
>  
> +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
> +		per_cpu(last_vcpu_ran[idx], cpu) = UINT_MAX;
> +
>  	return idx;
>  }
>  
> 
> base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
> -- 
> 2.47.3
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

