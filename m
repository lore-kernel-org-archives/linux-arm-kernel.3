Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BF4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ImMJOTmA;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OoGNASr8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUu8RpiRqtBaHObtAlgfcXnRFq0vqSVGatN9hi/iKOE=; b=ImMJOTmAqL0DUWk4yuhZDZiTd2
	dlOFWTSt0RjFh79UO5yQx6DUFL3jP3qyqvP7XKPN/seNPuE/WGgtrkmDZOU6LGFs2w0ckC5WSusXW
	FdSQFmF9FL2tooCLMYpWoq28OSEKZhjxbrmGOAZGVKxCdobTE6JJ/DMH4DhDP5Jj3vE4DC/X2/V/B
	U0NTni7OfEUKLZ0Kh45k2Rx8Bqd+/9URGaAqCdDDtdhuwL4gJRvaCC/a+P0eq2Rd5JJl+veNsZD/5
	x3xE6WN7qcRGeSdPsOPIh/3mFvtu/zHa1Db49QzqjwNUafbOlnrH6D8AvXfArwIkgam3pdj/2e0B5
	4rbG3clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Ap-00000009ZMV-1deQ;
	Tue, 20 Oct 2026 11:38:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Am-00000009ZLO-1TOG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:38:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a018493d57so62575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792496306; x=1793101106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUu8RpiRqtBaHObtAlgfcXnRFq0vqSVGatN9hi/iKOE=;
        b=OoGNASr8x/duHuIuViyB3uXrkfK6jg+s9EBT1uKIxg2Z1UUy7ERO4hgiFjg+2uQmAr
         EeSnx0jL4OIjCLi1HjUQ0DLs5RavArUQnrNj7W4r2BFbO+3IzzFteC16dyAkXZ2xQ144
         QG9KkSYNdskMfDnzvFoDWTSYppjKSPXyba5HHXodkxZBVkVfqtxFuVtWpcp9GxfPb8zC
         MSelZhb0Vuswl4eUHZRw6MG1pAC5wekpZGQtwLZeC6UEiQZb07oMeEIvM3fAW7KOYQC7
         EAUQCiIts15bDux5CvWRpwdQzhbmQ2cXTY3ss1dLxHAek1VroMgrSPaLTcmzBRYkJQGb
         vGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496306; x=1793101106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUu8RpiRqtBaHObtAlgfcXnRFq0vqSVGatN9hi/iKOE=;
        b=aNC/2mZriWN6NbzKiCRQLRwKuuPhJI9TrdDuKgiZ84JkwEws6CVpQmde110lpw6S5g
         nUkU5PZ2nh3lQOMEDrFnKDAIrtavmWiF7B5z39/4RnoIURZq9D/ab4lpRrsB4wZWYijQ
         lVTe7+emDGKelLrYxId5UaZyBtK/GMMhLoerAcP810KRfDocUmSBdrAkaaGOs8y2uXxL
         8eSD5lppIXw3jf5nWgUPph27H09DxVhIOpjr3zKt+9im7nNTstILTuzP82PSNOOYg2yt
         P2zvRFOXU7uEu3l7FyBZUac4D4D7K7g4Kc05T9UuPGgjtncz6kkP3oqQcVT/spUgm0KR
         Wt5w==
X-Forwarded-Encrypted: i=1; AKwUvBx+5hXZC5ypYRtulxIxCb2vkZvcA63jtQyzxA/Q+u9kwN6Tzw+6VeA586Ze8EQM7xqDr9JIjpFj80NQymQW26e4@lists.infradead.org
X-Gm-Message-State: AFq9FYLhjhK2ZglwcyMXVQt76kx1eK+nOkkfIvR9KLxAGrq5bAcrrloA
	1vK1sgTl/aryEG/JkGygIVq0zGj8mAtKOKYpBbJQ4GcMbXNCUTwhmBFD3haap10Wkg==
X-Gm-Gg: AYBFou0TzQqTJfjJQRihxVJIJpyWBGwIN8878pq5pKv1Yi+mZ3Nx+MkBtGTV2QC9SmV
	eGckjcMfIR9AZnF63NPosxuF2ofC8Ec6Ww8a2mWbpWtX6Hhp4U06syKwkkmsQjeggVVXYg3u2ah
	lbCUW+yENzc90bnFaw2wIWoN1qssIvD46izBTrmjVH0YDHc8n0s1fGLJyNRYlj4xtRcMvLgaXdS
	ftTsa76inzkhZtutUyGHRhl1k0z70IUo3zQoTEGZOpa8HGTqmz2jgX2reQt4cqaui5FqujZCn/9
	kLZgmAWFQ2U9nCRUCioLPQANvBRkMToNIygqTjQ+iD2eCmKVZFQbjQvB5Oxnotov12RxgWAPEKc
	QQjyYWwWgtCuc+GJM82xKd42UPeE+z5GgaOciAjZueLWbFkVXUQXs+aAvUAWyjYNwdi7z+pbaXJ
	JtU+wK5ozJo85lWJpEyiMvMiGK57gQ3j938NMPrK56rJzBL1pgVhf5vCQnJYn5c8ohZXZwkMi7X
	3Kmq3BGwkamP7ZUSq+eNHU3di0Zz5B7JDJhKtj5
X-Received: by 2002:a05:600c:4b89:b0:4a1:e7d5:5132 with SMTP id 5b1f17b1804b1-4a1f383e580mr570175e9.3.1792496305643;
        Tue, 20 Oct 2026 04:38:25 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm49603205e9.1.2026.10.20.04.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:38:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:38:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <atdSrRwrphdI9ZQA@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_043828_610793_A0ABF355 
X-CRM114-Status: GOOD (  49.04  )
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

On Mon, Oct 05, 2026 at 12:30:49PM -0700, Nicolin Chen wrote:
> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>    PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> 
> To safely absorb in-flight DMAs, a kdump kernel will have to leave SMMUEN=1
> intact and avoid modifying STRTAB_BASE, allowing HW to continue translating
> in-flight DMAs reusing the crashed kernel's page tables until the endpoint
> device drivers probe and quiesce their respective hardware.
> 
> However, the ARM SMMUv3 architecture specification states that updating the
> SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> 
> This leaves a kdump kernel no choice but to adopt the stream table from the
> crashed kernel.
> 
> Introduce ARM_SMMU_OPT_KDUMP_ADOPT and adoption functions that memremap the
> stream tables extracted from STRTAB_BASE and STRTAB_BASE_CFG.
> 
> Note that the adoption of the crashed kernel's stream table follows certain
> strict rules, since the old stream table might be compromised. Thus, apply
> some basic validations against the values read from the registers. If tests
> fail, it means the stream table cannot be trusted, so toss it entirely. To
> avoid OOM due to a potentially corrupted stream table, the memremap for l2
> tables is done lazily on the kdump kernel's demand.
> 
> The new option will be set in a following change, once the device reset and
> the RMR setup are reworked not to overwrite the adopted stream table, and
> the crashed kernel's in-use ASIDs and VMIDs are reserved.
> 
> Keep all kdump functions and kexec helpers in a new arm-smmu-v3-kexec file,
> which will be shared with the liveupdate series in the future.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/Kconfig                     |   3 +
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  21 +
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c | 398 ++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  21 +-
>  5 files changed, 441 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
> 
> diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
> index 5fac08b89deea..9a7bebe16f395 100644
> --- a/drivers/iommu/arm/Kconfig
> +++ b/drivers/iommu/arm/Kconfig
> @@ -109,6 +109,9 @@ config ARM_SMMU_V3_IOMMUFD
>  
>  	  Say Y here if you are doing development and testing on this feature.
>  
> +config ARM_SMMU_V3_KEXEC
> +	def_bool CRASH_DUMP
> +
>  config ARM_SMMU_V3_KUNIT_TEST
>  	tristate "KUnit tests for arm-smmu-v3 driver"  if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> index 493a659cc66bb..89a27de8dd2f0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
>  arm_smmu_v3-y := arm-smmu-v3.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
> +arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_KEXEC) += arm-smmu-v3-kexec.o
>  arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
>  
>  obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 559bfa8cbc5e0..a1f947e7d9fe4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -986,6 +986,7 @@ struct arm_smmu_device {
>   * invalidated CONT
>   */
>  #define ARM_SMMU_OPT_FULL_CONT_RANGE_INV (1 << 6)
> +#define ARM_SMMU_OPT_KDUMP_ADOPT	(1 << 7)
>  	u32				options;
>  
>  	struct arm_smmu_cmdq		cmdq;
> @@ -1312,6 +1313,26 @@ tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
>  }
>  #endif /* CONFIG_TEGRA241_CMDQV */
>  
> +#ifdef CONFIG_CRASH_DUMP
> +int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu);
> +int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
> +					    u32 sid, phys_addr_t base, u32 span,
> +					    struct arm_smmu_strtab_l2 **l2table);
> +#else /* CONFIG_CRASH_DUMP */
> +static inline int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int
> +arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> +					phys_addr_t base, u32 span,
> +					struct arm_smmu_strtab_l2 **l2table)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif /* CONFIG_CRASH_DUMP */
> +
>  struct arm_vsmmu {
>  	struct iommufd_viommu core;
>  	struct arm_smmu_device *smmu;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
> new file mode 100644
> index 0000000000000..6bbc369df86bb
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
> + */
> +
> +#define dev_fmt(fmt) "kexec: " fmt
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +
> +#include "arm-smmu-v3.h"
> +
> +/*
> + * Common helpers for a kexec'd kernel to parse, validate, and walk through the
> + * previous kernel's SMMU table structures, shared by the kdump adoption and a
> + * future live-update restoration.
> + *
> + * The common helpers are read-only against the previous kernel's structures: a
> + * table that is not yet mapped by this kernel gets a transient memremap during
> + * a walk, followed by an immediate memunmap. They never allocate memory or take
> + * ownership of the previous kernel's tables; the callers make those decisions.
> + */
> +
> +/**
> + * arm_smmu_kexec_parse_strtab_2lvl() - Validate a 2-level stream table
> + * @smmu: SMMU device of this kernel
> + * @cfg_reg: STRTAB_BASE_CFG register value set by the previous kernel
> + * @base: stream table base address extracted from the STRTAB_BASE register
> + * @num_l1_ents: pointer to return the number of L1 entries
> + *
> + * Validate the 2-level stream table geometry in @cfg_reg and @base's alignment
> + * against this kernel's hardware limits.
> + *
> + * Return: 0 on success with @num_l1_ents set, or -EINVAL on a bad geometry
> + */
> +static int arm_smmu_kexec_parse_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, phys_addr_t base,
> +					    u32 *num_l1_ents)
> +{
> +	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
> +	u32 split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, cfg_reg);
> +	u32 num_ents;
> +	size_t size;
> +
> +	if (log2size < split || log2size > smmu->sid_bits) {
> +		dev_err(smmu->dev, "log2size %u out of range [%u, %u]\n",
> +			log2size, split, smmu->sid_bits);
> +		return -EINVAL;
> +	}
> +	if (split != STRTAB_SPLIT) {
> +		dev_err(smmu->dev,
> +			"unsupported STRTAB_SPLIT %u (expected %u)\n", split,
> +			STRTAB_SPLIT);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Bound the entry count before the shift, as a log2size wider than what
> +	 * this kernel itself supports would overflow it.
> +	 */
> +	if (log2size - split > ilog2(STRTAB_MAX_L1_ENTRIES)) {
> +		dev_err(smmu->dev, "l1 entries 2^%u exceeds max %u\n",
> +			log2size - split, STRTAB_MAX_L1_ENTRIES);
> +		return -EINVAL;
> +	}
> +
> +	num_ents = 1U << (log2size - split);
> +
> +	size = num_ents * sizeof(struct arm_smmu_strtab_l1);
> +	/*
> +	 * According to spec (6.3.24), HW aligns the base down to the L1 table
> +	 * size, i.e. min 64 bytes, so an unaligned base would make this kernel
> +	 * read another table.
> +	 */
> +	if (!IS_ALIGNED(base, size)) {
> +		dev_err(smmu->dev, "unaligned l1 stream table base %pa\n",
> +			&base);
> +		return -EINVAL;
> +	}
> +
> +	*num_l1_ents = num_ents;
> +	return 0;
> +}
> +
> +/**
> + * arm_smmu_kexec_parse_strtab_linear() - Validate a linear stream table
> + * @smmu: SMMU device of this kernel
> + * @cfg_reg: STRTAB_BASE_CFG register value set by the previous kernel
> + * @base: stream table base address extracted from the STRTAB_BASE register
> + * @num_ents: pointer to return the number of STEs
> + *
> + * Validate the linear stream table geometry in @cfg_reg and @base's alignment
> + * against this kernel's own limits.
> + *
> + * Return: 0 on success with @num_ents set, or -EINVAL on a bad geometry
> + */
> +static int arm_smmu_kexec_parse_strtab_linear(struct arm_smmu_device *smmu,
> +					      u32 cfg_reg, phys_addr_t base,
> +					      u32 *num_ents)
> +{
> +	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
> +	unsigned int max_log2size = smmu->sid_bits;
> +	size_t size;
> +
> +	/* Cap the size at what this kernel itself would have allocated */
> +	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
> +		max_log2size = min_t(
> +			unsigned int, max_log2size,
> +			ilog2(STRTAB_MAX_L1_ENTRIES * STRTAB_NUM_L2_STES));
> +
> +	/* num_ents is limited to a u32, so cap log2size at 31 */
> +	max_log2size = min(max_log2size, 31U);
> +	if (log2size > max_log2size) {
> +		dev_err(smmu->dev, "unsupported log2size %u (> %u)\n", log2size,
> +			max_log2size);
> +		return -EINVAL;
> +	}
> +
> +	size = (1U << log2size) * sizeof(struct arm_smmu_ste);
> +	/*
> +	 * According to spec (6.3.24), HW aligns the base down to the table size
> +	 * and ignores the low bits, so an unaligned base would make this kernel
> +	 * read a different table.
> +	 */
> +	if (!IS_ALIGNED(base, size)) {
> +		dev_err(smmu->dev, "unaligned stream table base %pa\n", &base);

I understand these are best effort, but what happens if the address
corrupted and happens to be aligned?

> +		return -EINVAL;
> +	}
> +
> +	*num_ents = 1U << log2size;
> +	return 0;
> +}
> +
> +/**
> + * arm_smmu_kexec_check_strtab_l1_desc() - Check one stream table L1 descriptor
> + * @smmu: SMMU device of this kernel
> + * @l1_desc: L1 descriptor value from the previous kernel's stream table
> + * @idx: index of the L1 descriptor, for diagnostics
> + * @l2_base: pointer to return the L2 table's physical address
> + *
> + * Return: 1 if the descriptor is unused, 0 if it is valid with @l2_base set, or
> + * -EINVAL if it is malformed
> + */
> +static int arm_smmu_kexec_check_strtab_l1_desc(struct arm_smmu_device *smmu,
> +					       u64 l1_desc, u32 idx,
> +					       phys_addr_t *l2_base)
> +{
> +	phys_addr_t base = l1_desc & STRTAB_L1_DESC_L2PTR_MASK;
> +	u32 span = FIELD_GET(STRTAB_L1_DESC_SPAN, l1_desc);
> +
> +	/* L1STD.L2Ptr is invalid */
> +	if (!span)
> +		return 1;
> +
> +	if (span != STRTAB_SPLIT + 1) {
> +		dev_err(smmu->dev, "L1[%u] unsupported span %u (vs %u)\n", idx,
> +			span, STRTAB_SPLIT + 1);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * A valid descriptor never carries a null pointer. Also, HW aligns the
> +	 * pointer down to the L2 table size, so an unaligned pointer would make
> +	 * this kernel read a different table.
> +	 */
> +	if (!base || !IS_ALIGNED(base, sizeof(struct arm_smmu_strtab_l2))) {
> +		dev_err(smmu->dev, "L1[%u] bad l2 table base %pa\n", idx,
> +			&base);
> +		return -EINVAL;
> +	}
> +
> +	*l2_base = base;
> +	return 0;
> +}
> +
> +#ifdef CONFIG_CRASH_DUMP
> +/*
> + * Helper functions of the kdump stream table adoption for ARM SMMUv3
> + *
> + * When the crashed kernel left the SMMU enabled with in-flight DMAs, the kdump
> + * kernel adopts the crashed kernel's stream tables, instead of doing a regular
> + * reset, to keep in-flight DMAs translating until the endpoint device drivers
> + * re-probe and quiesce their devices.
> + *
> + * Note:
> + *  - Adoption only starts on an SMMU that the crashed kernel left enabled, as a
> + *    disabled SMMU (CR0_SMMUEN=0) could hold meaningless register values.
> + *  - Values read from the crashed kernel's registers get structural validation
> + *    only (format, size, span, alignment, and ID range); the physical addresses
> + *    are not vetted, as the kdump kernel has no record of which pages held the
> + *    tables.
> + *  - A structural inconsistency at adoption time tosses the entire adoption and
> + *    makes the SMMU fall back to a full reset blocking in-flight DMAs.
> + *  - L2 stream tables are adopted lazily at master-inserting time, to bound the
> + *    peak memory use against a corrupted L1 table; any lazy L2 adoption failure
> + *    rejects that device alone, as its blast radius is bounded to the bus.
> + *  - Only a coherent SMMU (ARM_SMMU_FEAT_COHERENCY) is supported, as the stream
> + *    table adoption is done by memremap with MEMREMAP_WB, which is verified on
> + *    the real hardware. Callers of these functions are responsible for gating
> + *    ARM_SMMU_FEAT_COHERENCY once during the probe.
> + */
> +
> +int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
> +					    u32 sid, phys_addr_t base, u32 span,
> +					    struct arm_smmu_strtab_l2 **l2table)
> +{
> +	struct arm_smmu_strtab_l2 *table;
> +	size_t size;
> +
> +	/*
> +	 * Retest the span in case the L1 descriptor has been overwritten since
> +	 * the adopt. Reject this master's insert; panic or SMMU-disable would
> +	 * either lose the vmcore or cascade aborts. Do not try to fix it, as it
> +	 * would break all other SIDs in the same bus (PCI case). The corruption
> +	 * blast radius is already bounded to that bus range.
> +	 */
> +	if (span != STRTAB_SPLIT + 1) {
> +		dev_err(smmu->dev,
> +			"L1[%u] span %u changed since adopt (was %u)\n",
> +			arm_smmu_strtab_l1_idx(sid), span, STRTAB_SPLIT + 1);
> +		return -EINVAL;
> +	}
> +
> +	size = (1UL << (span - 1)) * sizeof(struct arm_smmu_ste);
> +
> +	/* Same live-corruption check as the span; reject an overwritten base */
> +	if (!base || !IS_ALIGNED(base, size)) {
> +		dev_err(smmu->dev, "L1[%u] bad l2 table base %pa\n",
> +			arm_smmu_strtab_l1_idx(sid), &base);
> +		return -EINVAL;
> +	}
> +

Those are a bit similar to arm_smmu_kexec_parse_strtab_2lvl() is it
possible to have some helpers instead?

> +	/*
> +	 * This L2 table is mapped lazily per master; devres frees it at unbind,
> +	 * as with the dmam_alloc_coherent() used for a fresh L2.
> +	 */
> +	table = devm_memremap(smmu->dev, base, size, MEMREMAP_WB);
> +	if (IS_ERR(table)) {
> +		dev_err(smmu->dev,
> +			"failed to adopt l2 stream table for SID %u\n", sid);
> +		return PTR_ERR(table);
> +	}
> +
> +	*l2table = table;
> +	return 0;
> +}
> +
> +static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, phys_addr_t base)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 num_l1_ents;
> +	size_t size;
> +	int ret, i;
> +
> +	ret = arm_smmu_kexec_parse_strtab_2lvl(smmu, cfg_reg, base,
> +					       &num_l1_ents);
> +	if (ret)
> +		return ret;
> +
> +	cfg->l2.num_l1_ents = num_l1_ents;
> +
> +	size = num_l1_ents * sizeof(struct arm_smmu_strtab_l1);
> +	cfg->l2.l1tab = memremap(base, size, MEMREMAP_WB);
> +	if (!cfg->l2.l1tab)
> +		return -ENOMEM;
> +
> +	cfg->l2.l2ptrs =
> +		kcalloc(num_l1_ents, sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
> +	if (!cfg->l2.l2ptrs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_l1_ents; i++) {
> +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
> +		phys_addr_t l2_base;
> +
> +		ret = arm_smmu_kexec_check_strtab_l1_desc(smmu, l2ptr, i,
> +							  &l2_base);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * If the crashed kernel's l1 descriptors are deeply corrupted,
> +		 * blindly memremapping every l2 table here could lead to OOM.
> +		 *
> +		 * Defer the l2 memremap to arm_smmu_init_l2_strtab(), so peak
> +		 * memory is bounded by the kdump kernel's actual demand.
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_kdump_adopt_strtab_linear(struct arm_smmu_device *smmu,
> +					      u32 cfg_reg, phys_addr_t base)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 num_ents;
> +	size_t size;
> +	int ret;
> +
> +	ret = arm_smmu_kexec_parse_strtab_linear(smmu, cfg_reg, base,
> +						 &num_ents);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * We might end up with a num_ents != sid_bits, which is fine, since the
> +	 * ARM_SMMU_OPT_KDUMP_ADOPT case bypasses arm_smmu_write_strtab().
> +	 */
> +	cfg->linear.num_ents = num_ents;
> +
> +	size = num_ents * sizeof(struct arm_smmu_ste);
> +	cfg->linear.table = memremap(base, size, MEMREMAP_WB);
> +	if (!cfg->linear.table)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +static void arm_smmu_kdump_adopt_cleanup(void *data)
> +{
> +	struct arm_smmu_device *smmu = data;
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +
> +	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
> +		kfree(cfg->l2.l2ptrs);
> +		if (cfg->l2.l1tab)
> +			memunmap(cfg->l2.l1tab);
> +	} else {
> +		if (cfg->linear.table)
> +			memunmap(cfg->linear.table);
> +	}
> +}
> +
> +int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> +{
> +	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
> +	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
> +	bool was_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
> +	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
> +	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
> +	int ret;
> +
> +	dev_dbg(smmu->dev, "adopting crashed kernel's stream table\n");
> +
> +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> +		/*
> +		 * Both kernels run on the same hardware, so it's impossible for
> +		 * kdump kernel to see the support for linear stream table only.
> +		 */

STRTAB_SPLIT which influences ARM_SMMU_FEAT_2_LVL_STRTAB is a SW choice, so it is
possible to get such mismatch if STRTAB_SPLIT of the newer kernel is larger than the
older kernel.
However, I agree that in that case it's better to refuse the adoption.

> +		if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
> +			ret = -EINVAL;
> +		else
> +			ret = arm_smmu_kdump_adopt_strtab_2lvl(smmu, cfg_reg,
> +							       base);
> +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> +		/*
> +		 * The kdump kernel need not match the crashed kernel. An older
> +		 * crashed kernel that predates two-level stream table support
> +		 * may have used a linear table on 2-level-capable hardware, so
> +		 * enforce the same format here to match the adopted table.
> +		 */
> +		ret = arm_smmu_kdump_adopt_strtab_linear(smmu, cfg_reg, base);
> +		if (!ret)
> +			smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;

For simplicity, it is better to enforce the same table formats between
kernels as the rest of the file, for example,
arm_smmu_kexec_parse_strtab_2lvl() refuses different STRTAB_SPLIT.
Some checks can be removed and the was_2lvl error path. It's
very unlikely to hit such case anyway.

> +	} else {
> +		dev_err(smmu->dev, "invalid STRTAB format %u\n", fmt);
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret) {
> +		arm_smmu_kdump_adopt_cleanup(smmu);

Probably easier to inline the error handling after each call and remove this?

Thanks,
Mostafa


