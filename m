Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62DD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TJHenaf+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jpeR0+nt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw0/GmkNPakQA0/XiF/9z/+IJnZL/wHZ7HqV7JkBHeU=; b=TJHenaf+9Labui27JdRoyY15Pv
	JRzOaVCm+z0E8hXJtC37p3RYTpWVjH7fmSaUzptbouU//MhP/oYmoajnHHTLj/L84pCmIIRtXKMEY
	PHW6ROFBUFXIajVEGUagHnV4fDab4IbPItCCau6sTWUM4QEQs/3vmq/jKKsGXCCUnKs6g6YlDgJCe
	U+vV2hKUqYd6vNN77wgMjJ4+ijTDJaYkxwhC1Z8q+708uj6D2COmGreyPa3KqkNVYdM+5gNNAHZUD
	z1ZUnJ3EEj9EhFSkRE+IwwYhcGHOSPQN3RFuRydChrkVMCVQB4I0N5Hxunb2/trNVvkqgyOxt5aJe
	vgFFIfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7nV-00000009W4H-27rb;
	Tue, 20 Oct 2026 11:14:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7nS-00000009W3C-47kj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:14:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1de789b63so47525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792494861; x=1793099661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tw0/GmkNPakQA0/XiF/9z/+IJnZL/wHZ7HqV7JkBHeU=;
        b=jpeR0+ntdxt1C/Uk0BFuBJKkyMOQrMlWEpEOWUgdYcOkm3tNM43zGghDFhqazOVVwv
         l9kPztMy+NUUxYTBbHgG/8RT0UV3NASqlF5NEZORT2veS1EzRTPGvl6clg0F7R3F/juj
         nmqkVueXSmybjY3aJGOLgN0xNhtquIoQuEnfEbQs5UkwoslucJr6/mXNdpMeMwEPmk26
         M9fVBppw8XlMFMYtJ4iAwxUUCaUkYfb+674eTMkdMHaCL6A5upJSLVoH0+8Cyv/mQulA
         0Qn72z1dsvTkFERqTy12hvIBxpbuC6qI9FsEY7tc9HHeHefs7OqIZ8yfFU5/7d+flWz3
         aRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494861; x=1793099661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw0/GmkNPakQA0/XiF/9z/+IJnZL/wHZ7HqV7JkBHeU=;
        b=lC0CmoVLAk7GvcWU5JenGUqE1++HzW8ML1qiB1nipCeggmEMDpUwLTdZ8w0KIxQpfy
         Bfct7r+vAyvGqAcDuFObK1C0uiyxYpi0c+uvBtx35wjxC+fhuNBuIRVliM4saJ3Ba3P+
         EYRYxc8ib96dqtU+TiXGf/IHTa0Ql/xCb9nN7N5Y03FZ9F5sm0sBf0CmGZBT609kxb2f
         nb6a6y4lX1beVfHzfOsxiKRY/lUUaU3OE0gXoDx3m4nLFM2ag+LHH0EkceRwJtreDvom
         4j/VZ9iEJXyAqznE6BK0GMrhdYv5PZTgDzD9mKvY8HEUOVqEYzrFqv9TFu16E7/O918A
         +UWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzac+JzFah/DOyli3hWmIlJeoeeA5FC8zITaKxz4GYamFNufihFok1imvJC3uU5a4kqyP+tgOLt1hxDKJgnnqzW@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0/rX13z/n+2hrnlaEH5LMRwDK926/Xrw3JOTwMyuET2Nefu7K
	YXro9cyOx7NpccNjmZIhmMGyU26vIT8oa89iDQamk1p/2dmEzRLn2YmPjDcPRmOOYA==
X-Gm-Gg: AYBFou2IDYEKZoaSr8kUEfSbZUEn9mrZCPRUx+Zd8S9rfElkbJ5uGzqoM7W0LkkiNCS
	PVqgZhXm1GiudcrupZO2HDfS5wMifTaB+/dNwlUzLvp0AjjBLsYLHCO9R9iJV8vkWj1l4O3oV1K
	CLYq/KlGVhBvWm0LP5/MjnocbdVrIKA8+F0Vn834OPheTjh7kzA15CNx5czpVqnGWOFDpKdArCF
	mY1BMY4XKXJbIwXUONB5APUuCAcCAV1e1fluPtcoL7/i1drXJFunTQ+eEaBuL7LsNGWgFdGPK1T
	uisN1oNovhClqcmidXblN25Sx27NVgwv+UnyH8lLIplNujSzkXydtoONjAxaLEJLmYHCqC8DE0E
	tTgLWl0OMA2ws6gKuB9qBhw8Yl4bcRXwz943RAiaBX886j+Ehc/heAH2XU9c9SMjzrTwcRtBQbl
	a60FQUa14BZO4gaNKL+2IKl5NeuG2FQ8dzkg0s2x4FzEByoqEiHzD+uDAVJmCAeYCanhkwlk96a
	R6WwyBis6nzcmaxz/7YyxriH7NoUhR58bdzJNm5lQ==
X-Received: by 2002:a7b:cc99:0:b0:4a1:83f5:44ed with SMTP id 5b1f17b1804b1-4a1f59efdabmr598905e9.16.1792494860455;
        Tue, 20 Oct 2026 04:14:20 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33155fsm247590175e9.4.2026.10.20.04.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:14:19 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:14:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 02/11] iommu/arm-smmu-v3: Make the ASID space per
 SMMU instance
Message-ID: <atdNCInkAepLyMow@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <e027296ac9db58fb7d69b1b4b5e4a2ed192dd401.1791226953.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e027296ac9db58fb7d69b1b4b5e4a2ed192dd401.1791226953.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_041423_060916_545A0E02 
X-CRM114-Status: GOOD (  30.31  )
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

On Mon, Oct 05, 2026 at 12:30:45PM -0700, Nicolin Chen wrote:
> An ASID tags the TLB entries within one SMMU, so two instances can use the
> same ASID without ever aliasing each other. Yet the driver allocates them
> out of a single global xarray, which makes the instances share a space that
> the hardware keeps apart, and lets one instance exhaust the IDs of another.
> 
> That global space is a leftover from the BTM support that shared ASIDs with
> the CPU. Now ARM_SMMU_FEAT_BTM is never set, nothing looks a domain up by
> its ASID, and a domain is pinned to one SMMU at the attach.
> 
> Give each SMMU its own asid_map, mirroring the per-SMMU vmid_map, and clean
> it up with devres, so that both of the ID maps get the same lifetime as the
> SMMU device structure that holds them. An upcoming change will need this,
> to reserve the crashed kernel's in-use ASIDs in the new map during a kdump
> kernel's stream table adoption.
> 
> This also eases the BTM work that Jason's working on:
> https://lore.kernel.org/linux-iommu/20261004162219.GA4064@nvidia.com/
> 
> Note that arm_smmu_asid_lock stays global, as it serializes the STE and CD
> updates against any ASID change rather than guarding the map itself, which
> does its own locking. Giving each SMMU its own lock looks possible now, but
> that would touch every attach path and belongs to a separate change.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h    |  2 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    |  6 +++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c    | 18 +++++++++++++++---
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index bb048e08d613d..8f2c0b1cc4a8d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1003,6 +1003,7 @@ struct arm_smmu_device {
>  #define ARM_SMMU_MAX_VMIDS		(1 << 16)
>  	unsigned int			vmid_bits;
>  	struct ida			vmid_map;
> +	struct xarray			asid_map;
>  
>  	unsigned int			ssid_bits;
>  	unsigned int			sid_bits;
> @@ -1180,7 +1181,6 @@ to_smmu_nested_domain(struct iommu_domain *dom)
>  	return container_of(dom, struct arm_smmu_nested_domain, domain);
>  }
>  
> -extern struct xarray arm_smmu_asid_xa;
>  extern struct mutex arm_smmu_asid_lock;
>  
>  struct arm_smmu_domain *arm_smmu_domain_alloc(void);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index faeec656da9e7..489531e0027bd 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -311,7 +311,7 @@ static void arm_smmu_sva_domain_free(struct iommu_domain *domain)
>  	 * reused, and if there is a race then it just suffers harmless
>  	 * unnecessary invalidation.
>  	 */
> -	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
> +	xa_erase(&smmu_domain->smmu->asid_map, smmu_domain->cd.asid);
>  
>  	/*
>  	 * Actual free is defered to the SRCU callback
> @@ -352,7 +352,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
>  	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
>  	smmu_domain->smmu = smmu;
>  
> -	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
> +	ret = xa_alloc(&smmu->asid_map, &asid, smmu_domain,
>  		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
>  	if (ret)
>  		goto err_free;
> @@ -366,7 +366,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
>  	return &smmu_domain->domain;
>  
>  err_asid:
> -	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
> +	xa_erase(&smmu_domain->smmu->asid_map, smmu_domain->cd.asid);
>  err_free:
>  	arm_smmu_domain_free(smmu_domain);
>  	return ERR_PTR(ret);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 792627e1c790e..aeace4335abfe 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -90,7 +90,6 @@ struct arm_smmu_option_prop {
>  	const char *prop;
>  };
>  
> -DEFINE_XARRAY_ALLOC1(arm_smmu_asid_xa);
>  DEFINE_MUTEX(arm_smmu_asid_lock);
>  
>  static struct arm_smmu_option_prop arm_smmu_options[] = {
> @@ -3015,7 +3014,7 @@ static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
>  	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>  		/* Prevent SVA from touching the CD while we're freeing it */
>  		mutex_lock(&arm_smmu_asid_lock);
> -		xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
> +		xa_erase(&smmu->asid_map, smmu_domain->cd.asid);
>  		mutex_unlock(&arm_smmu_asid_lock);
>  	} else {
>  		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
> @@ -3035,7 +3034,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_device *smmu,
>  
>  	/* Prevent SVA from modifying the ASID until it is written to the CD */
>  	mutex_lock(&arm_smmu_asid_lock);
> -	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
> +	ret = xa_alloc(&smmu->asid_map, &asid, smmu_domain,
>  		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
>  	cd->asid	= (u16)asid;
>  	mutex_unlock(&arm_smmu_asid_lock);
> @@ -4741,6 +4740,13 @@ static void arm_smmu_destroy_vmid_map(void *data)
>  	ida_destroy(ida);
>  }
>  
> +static void arm_smmu_destroy_asid_map(void *data)
> +{
> +	struct xarray *xa = data;
> +
> +	xa_destroy(xa);
> +}
> +
>  static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>  {
>  	int ret;
> @@ -4848,6 +4854,12 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
>  	if (ret)
>  		return ret;
>  
> +	xa_init_flags(&smmu->asid_map, XA_FLAGS_ALLOC1);
> +	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_asid_map,
> +				       &smmu->asid_map);
> +	if (ret)
> +		return ret;
> +
>  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
>  		ret = arm_smmu_init_strtab_2lvl(smmu);
>  	else
> -- 
> 2.43.0
> 

