Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80AE109190B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06bM/osBXRBC/N4sQ+w0sMd4YrqW1pAzXh4CEwcOut0=; b=zr22OJdiiQjPmLgcjvqDSkT/8u
	E5VJlY7M1UU0lw2y59VUDF6ddrSWZ9IY0z/eXBSlmWN85WDXhnbPQsQESXR7BB//YvW68urOonFnE
	fPR97K4ETxIdQSWNXFWkzCvTqV3AAo0qnDiC8Cqa5dmmJnLda0zuah8uzVTZ1h7StQZagZMhp+xyY
	D2xMFIOT4A7jsASUxDUBk01GlcenxXdG/aiM/TL1kq1HDEUsxzAhgSEKAAehgmZAHzxdR65ztodHQ
	DdK8mEVPSv2e4xphmUR80nZic6Y1sbINNbY/47NMH+X/RrtIhTWzoSpoGERjVhwjnlxJ8XPOPMUGp
	ovVI0irQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I3e-0000000BKan-3m8r;
	Thu, 19 Mar 2026 18:25:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I3c-0000000BKXA-1oIA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=06bM/osBXRBC/N4sQ+w0sMd4YrqW1pAzXh4CEwcOut0=; b=ePBtQ+3pnwiBiR3oUXDItgMSCx
	OfgBOrmbMnaovc9WH9UD0UULKu/6eiKyDabbTJcK3J0bL7GOdQ5ks70XCEIC4fUAsqblbHta1gW7G
	8F9Ib4GBBrV4amMxxcNsIqeW4hSO4ZP3g7WuYnt+DbYlmQni1F7FF5YVOxBI/gekVLL6FkC2YsK8J
	b0ZcQyvdFar7RePQ5MGY3CSmehIifQpn9NQxlVkqDFATdnrgBerIahBCNt3udXmyxTNAnn1jdnd7P
	MgMa+1YDWP5+iiu2OJeSDwYwr9ZM0yS3xPl+QxY3A2jXqM7AJGk//4g0MYWFr12uiLpLpNThsCn5V
	X3KJAvWQ==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I3Y-00000006VRJ-3fi4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:25:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E08E2247;
	Thu, 19 Mar 2026 11:25:07 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD523F7BD;
	Thu, 19 Mar 2026 11:25:08 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:25:02 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 26/48] arm64: RMI: Create the realm descriptor
Message-ID: <oukw53xfroe32rb26jy365nqsuttlakkjgpmh6sszdprx6nqfc@qfmwsob2ewa4>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-27-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318155413.793430-27-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_182517_208006_161755A1 
X-CRM114-Status: GOOD (  23.00  )
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

On Wed, Mar 18, 2026 at 03:53:50PM +0000, Steven Price wrote:
> Creating a realm involves first creating a realm descriptor (RD). This
> involves passing the configuration information to the RMM. Do this as
> part of realm_ensure_created() so that the realm is created when it is
> first needed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v12:
>  * Since RMM page size is now equal to the host's page size various
>    calculations are simplified.
>  * Switch to using range based APIs to delegate/undelegate.
>  * VMID handling is now handled entirely by the RMM.
> ---
>  arch/arm64/kvm/rmi.c | 94 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 38349c7b34f4..d5fee203824b 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -649,6 +649,83 @@ static void realm_unmap_shared_range(struct kvm *kvm,
>  			     start, end);
>  }
>  
> +static int realm_create_rd(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	struct realm_params *params = realm->params;
> +	void *rd = NULL;
> +	phys_addr_t rd_phys, params_phys;
> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
> +	int i, r;
> +
> +	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +
> +	if (WARN_ON(realm->rd || !realm->params))
> +		return -EEXIST;
> +
> +	rd = (void *)__get_free_page(GFP_KERNEL);

Hi,

Should this be GFP_KERNEL_ACCOUNT?

> +	if (!rd)
> +		return -ENOMEM;
> +
> +	rd_phys = virt_to_phys(rd);
> +	if (delegate_page(rd_phys)) {
> +		r = -ENXIO;
> +		goto free_rd;
> +	}
> +
> +	if (delegate_range(kvm->arch.mmu.pgd_phys, pgd_size)) {
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +	params->rtt_level_start = get_start_level(realm);
> +	params->rtt_num_start = pgd_size / PAGE_SIZE;
> +	params->rtt_base = kvm->arch.mmu.pgd_phys;
> +
> +	if (kvm->arch.arm_pmu) {
> +		params->pmu_num_ctrs = kvm->arch.nr_pmu_counters;
> +		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
> +	}
> +
> +	if (kvm_lpa2_is_enabled())
> +		params->flags |= RMI_REALM_PARAM_FLAG_LPA2;
> +
> +	params_phys = virt_to_phys(params);
> +
> +	if (rmi_realm_create(rd_phys, params_phys)) {
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
> +		WARN_ON(rmi_realm_destroy(rd_phys));
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	realm->rd = rd;
> +	WRITE_ONCE(realm->state, REALM_STATE_NEW);
> +	/* The realm is up, free the parameters.  */
> +	free_page((unsigned long)realm->params);
> +	realm->params = NULL;
> +
> +	return 0;
> +
> +out_undelegate_tables:
> +	if (WARN_ON(undelegate_range(kvm->arch.mmu.pgd_phys, i))) {
> +		/* Leak the pages if they cannot be returned */
> +		kvm->arch.mmu.pgt = NULL;

Did you mean kvm->arch.mmu.pgd_phys = NULL; ?

Thanks,
Wei-Lin Chang

> +	}
> +	if (WARN_ON(undelegate_page(rd_phys))) {
> +		/* Leak the page if it isn't returned */
> +		return r;
> +	}
> +free_rd:
> +	free_page((unsigned long)rd);
> +	return r;
> +}
> +
>  static void realm_unmap_private_range(struct kvm *kvm,
>  				      unsigned long start,
>  				      unsigned long end,
> @@ -893,8 +970,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
>  
>  static int realm_ensure_created(struct kvm *kvm)
>  {
> -	/* Provided in later patch */
> -	return -ENXIO;
> +	int ret;
> +
> +	switch (kvm_realm_state(kvm)) {
> +	case REALM_STATE_NONE:
> +		break;
> +	case REALM_STATE_NEW:
> +		return 0;
> +	case REALM_STATE_DEAD:
> +		return -ENXIO;
> +	default:
> +		return -EBUSY;
> +	}
> +
> +	ret = realm_create_rd(kvm);
> +	return ret;
>  }
>  
>  static int set_ripas_of_protected_regions(struct kvm *kvm)
> -- 
> 2.43.0
> 

