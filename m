Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQRWMCLIbwwl3gtvU+yvHpxzmURzRaIF72Grcm/CswY=; b=r6LydnCDpbf5oLuZ2BruUHHl1f
	Rq5gjsT8FQDleHLosL5PeZwNC1KQ31usa1Juzt136x8yV92h8NpgLSTQbF756kO6i7PRUH8n84M7o
	HUtKhzUOdtu3ui0JwwVYPmkJPar0L8HlK5LnoUP8n5gbLR2EabmK+O0n/Vh6CyFY59DEAUhxW9UD8
	H+k0mGDfXiB1uUNULjiMEEx/L99vRFha63VPF9UvIr1WiluNWuARjjnwQlgjv/9sxD8qgrYymL34m
	/hZcMpYjBRoZ1+qq+PpCbeC6mbjznUKNfz8DLnyBjsRrL+Fs6YuWGSm/AK4sz8F3HTtRSCNfwi14x
	jZc2hnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aIn-000000072cq-3thg;
	Mon, 07 Sep 2026 14:26:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aIm-000000072cf-1mte
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 14:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZQRWMCLIbwwl3gtvU+yvHpxzmURzRaIF72Grcm/CswY=; b=fxV7HGlQhr2HjFwFtXyKCLLrZ2
	PialisHoEe4Gfh+jeO0ueYoc+KEyNy7hN7+i2hgYQAlNFKPX0cbiQUefPLjTCz/+X3xozhZ/xadKs
	G5IUpZjGbRN9WMoU6EtwhHSLNj6ZD/d+w86VZn5aWMb3TK7fh/GaIBrJABr0lAmXJpyv86BNW1PLL
	gW1jQbHM7b7vF1exQ8Hs8p0lmTXho7o3YqyMpjlTYd2Ns/Cckj4VTS6fN2bHzeVktguHospbJRIcx
	03hQAr8/77YHxPr8L6I0IFSDDR2/9ITD70Vf+CqPh2He9Ki7kTj9ORjuTwbeL4H6pPZdjq6Z2DkNC
	70f4dAgA==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3aIi-0000000GKJF-2a3b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:26:27 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so13127a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788791182; x=1789395982; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQRWMCLIbwwl3gtvU+yvHpxzmURzRaIF72Grcm/CswY=;
        b=t1AwlYBHZbYDy2c1XaulOvmd5piMOcj27QkyMJW5cqD1mNZ0/D/VdneZLVQ4201uPa
         4ylXkwnbiLNtaZS0DB1kDkNHDc1+5is0tf5FFWNFZt4vbX/oKTPaMQPjHFWfHHcTSCLW
         7LqyLV88VY0+CQDxOixVpq9xgzI3oIJVXDWK7bcfluAQv4SomQh1ODSFwESSLwOVK5CK
         EKMVgPIxKWxar8f5gCTfQz5mgrpR2wqcDz8ESBX/PoyVq3USSHsonrNTd1tf6cZsKLmB
         /6bDe+nM86eryY31sDZGbu/koi1tvq35piY/odQ0qKvVjeH5tZX0USLDqx6ubIBfnPrj
         REuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791182; x=1789395982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZQRWMCLIbwwl3gtvU+yvHpxzmURzRaIF72Grcm/CswY=;
        b=fphKp0k0Ayep7PpF/oeFUi09fQ2EoCmt2u4dekJBYOKBq2NtipVWqayVVXLrN6fFPa
         pqpKOTR+5OLPmS+s1go8LOYX/6Sf7Ahwu+Iifwy5o7dHAzphLggvTSytR+0JNxYGuzvB
         Lz0slFsPOZu+VZpqco7cQSMJd0lo27qs1fwHjUYkBJhK471ZfJl4PQju2a9ACTyVZZE+
         cmptBPq+stzc6Bcmf3oU/iWoUFC4GrYJg7l420M8LrapJ8NgaqV0OpRxZ0u0UQy5BPMZ
         mM6ezGgQbNc1yqee+YN/x5P94+b5jZnOLETqzcwoZxfYttpou+q6kn6E9b4dNhd14RiJ
         swcA==
X-Forwarded-Encrypted: i=1; AKwUvBz/VmWaezR4AralWbC+wQzbiVOMmkn/1EWrCA/Y78ib0vkaJKd1uC4JuApYv725okEJcQOfDTL4WeV76tVSfxE6@lists.infradead.org
X-Gm-Message-State: AFuF++nh2w6hNXRwS2ry6EriE1Di/Cck7ymeITr4gb1MZJvTgJ5Hi41l
	Hssffk11ZvPfNZeAjVT2nRoXPfbfL/yyNvqkEA1igWP97l3r848nFRxaWK4DSUMshw==
X-Gm-Gg: AYBFou0XzFgQlx5TVXiZofmxAHzzAnN+ryRhh03oVcyO3XJoQLJXLHYPIB4LpRayvQ2
	VmHxISxdmSBAx7FMcQnhiwkQhMyKmmpSYMoA7BjNS0mVtKH6hLhpkQ5hZi7q/u4jeAu8o68tJCM
	lIFPb5tRbKc1rxdobAax/zHjlmP8m7zcx82hqpgs/mbq3dcUsKTJluL3z1XpTFw4gVf3zDBA91m
	I8z95rbC0JLcDnq5A2C+FdGPj0hLosVYBS7xP7fp35ppEb/PvBa5yjnNclBFJziNMQlZYrekv2Q
	1U4TEhHBg422gPQMgwjOUEAtPHy/zKeRfYFxHx1NcqgAalZ+zxUq6DUhlnfryYnJait1yLXKvUB
	q/yAtq1pbMthKxMBjmxtV3StPd2DHh8lgZrhr0SOnCQ7WceSii4AcfDwcwnUYPB9jHoifhwnm/u
	GJLwYmNNtu85lJM5By8pOnedHIT8tP3BtQHQAwR2R6vTvKrXQzcheAuIRNuLjIDq55V1C8SH1QZ
	NO5PT2CaRJSdy9n1NOAl5EcE5OGXutEW18E9jGI
X-Received: by 2002:a05:6402:517a:b0:6a7:453c:a166 with SMTP id 4fb4d7f45d1cf-6a7f68863cbmr57202a12.1.1788791181396;
        Mon, 07 Sep 2026 07:26:21 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3b6asm4462169a12.13.2026.09.07.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:26:20 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:26:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/9] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <ap7JiB36YSQOaV9a@google.com>
References: <0-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <4-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_152625_635520_B362B1BA 
X-CRM114-Status: GOOD (  60.94  )
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

On Tue, Sep 01, 2026 at 02:49:53PM -0300, Jason Gunthorpe wrote:
> The server IOMMU drivers focus on invalidation latency by default,
> over-invalidating if necessary, to round the invalidation range up to a
> single command. I think this represents a trade off for DMA non-FQ and SVA
> where stalling the operation is overall worse than re-loading the IOTLB.
> 
> For instance AMD and VT-d both round the range up to the largest aligned
> power of two and invalidate that. This causes over-invalidation but that
> is preferred on real HW over trying to issue a number of smaller
> range invalidations.
> 
> SMMUv3 on the other hand will try to do up to 512 single invalidations,
> otherwise falls back to full invalidation, or it will try to issue an
> string of RIL invalidations for every 5 bits of IOVA range to perfectly
> cover it.
> 
> While the RIL optimization is pretty good we can still do better and
> reduce it to only 2 invalidations at maximum using the idea Robin came up
> with to overlap two RILs in the middle. This preserves the exact coverage
> of the current RIL and still caps the number of RILs at 2.
> 
> This works because the RIL can start at any IOVA, so we can place a RIL
> forwards from the start and backwards from the end, overlapping in the
> middle if the scale isn't precise enough.
> 
> In the cases where this produces 2 RILS it continues to produce RILs that
> don't overlap, but the exact split point is different than the original
> algorithm due to the new calculation method. In cases where the original
> algorithm would produce 3 or more RILs this will produce 2 RILS with an
> overlap.
> 
> The SVA under invalidation errata work around is maintained by "rounding up" to
> generate a single RIL that over-covers the entire range.
> 
> Since the normal path is now the only one with a loop, split them into two
> functions and fold a simplified version of arm_smmu_inv_size_too_big()
> directly into the normal flow in a way that directly limits the number of
> single invalidation commands generated, again focusing on controlling
> latency.
> 
> The end result is any gather is converted into either:
>  - One invalidate all
>  - One or two range invalidate ops
>  - At most 512 single invalidation ops
> 
> arm_smmu_domain_inv() is modified to always pass in the tgsz because the
> new logic relies on it being valid.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 354 ++++++++++++--------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   3 +-
>  2 files changed, 210 insertions(+), 147 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6413eb4021ce22..9b79d7a5389812 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2460,166 +2460,219 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	arm_smmu_domain_inv(smmu_domain);
>  }
>  
> -static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
> +/*
> + * Check address alignment for TTL hint per SMMUv3 H.a Section 4.4.1.
> + * Address bits below the alignment must be zero, otherwise UNPREDICTABLE.
> + */
> +static bool arm_smmu_ttl_addr_aligned(u64 address, unsigned int tg,
> +				      unsigned int ttl)
> +{
> +	unsigned int pgsz_lg2 = (tg - 3) * (3 - ttl) + tg;
> +
> +	return !(address & GENMASK_U64(pgsz_lg2 - 1, 0));
> +}
> +
> +struct arm_smmu_ril_range {
> +	u64 start_tg;
> +	/* Normal integer, not encoded. 0 means 0.*/
> +	u64 num;
> +	unsigned int scale;
> +};
> +
> +/*
> + * Initialize the smallest RIL covering num_tg and ending at last_tg.
> + */
> +static struct arm_smmu_ril_range arm_smmu_ril_init_end(u64 last_tg, u64 num_tg)
> +{
> +	struct arm_smmu_ril_range ril = {};
> +
> +	if (!num_tg)
> +		return ril;
> +
> +	ril.scale = fls64((num_tg - 1) / 32);
> +	ril.num = DIV_ROUND_UP_ULL(num_tg, 1ULL << ril.scale);
> +	ril.start_tg = last_tg - ((ril.num << ril.scale) - 1);
> +	return ril;
> +}
> +
> +static void arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
> +					struct arm_smmu_cmdq_batch *cmds,
> +					struct arm_smmu_cmd *ref_cmd,
> +					bool leaf_only,
> +					const struct arm_smmu_ril_range *ril,
> +					u8 ttl, u8 tg_enc)
> +{
> +	struct arm_smmu_cmd cmd;
> +	unsigned int tgsz_lg2 = tg_enc * 2 + 10;
> +	u64 iova = ril->start_tg << tgsz_lg2;
> +	unsigned int num = ril->num - 1;
> +
> +	/* 16K granule TTL=1 is reserved (Section 4.4.1) */
> +	if (WARN_ON(tgsz_lg2 == 14 && ttl == 1))
> +		ttl = 0;
> +
> +	/* Verify address alignment for the TTL hint */
> +	if (ttl && !arm_smmu_ttl_addr_aligned(iova, tgsz_lg2, ttl))
> +		ttl = 0;

Is that a separate fix? Can this be a separate patch in that case.

Also, in what cases can this happen? io-pgtable-arm should do the
right thing and SVA will use ttl=0

> +
> +	/*
> +	 * SMMUv3 H.a Section 4.4.1: TG!=0, NUM==0, SCALE==0, TTL==0 is Reserved
> +	 * and causes CERROR_ILL. Single tg uses NUM=0, SCALE=0 with a TTL hint
> +	 * to target only the exact leaf entry.
> +	 *
> +	 * For a single tg invalidation a 0 TTL can come from places like the
> +	 * SVA path that don't have enough information to get a TTL, or as a
> +	 * side of effect of the splitting.
> +	 *
> +	 * A single-TG invalidation cannot reach this point if it is part of a
> +	 * CONT group, so it is safe to transform it into a single invalidation.
> +	 * The ARM_SMMU_OPT_FULL_CONT_RIL errata does not apply.
> +	 */
> +	if (!num && !ril->scale && !ttl)
> +		tg_enc = 0;
> +
> +	cmd.data[0] = ref_cmd->data[0] | FIELD_PREP(CMDQ_TLBI_0_NUM, num) |
> +		      FIELD_PREP(CMDQ_TLBI_0_SCALE, ril->scale);
> +	cmd.data[1] = ref_cmd->data[1] |
> +		      FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf_only) |
> +		      FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> +		      FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) | iova;
> +	arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, &cmd);
> +}
> +
> +/*
> + * Issue up to two range TLBI commands covering [iova, iova+size). Returns true
> + * if successful, false if the range is too large to fit into RIL commands.
> + *
> + * Normally the first RIL is the largest representable span which does not
> + * exceed the requested range. If necessary, the second RIL is the smallest
> + * representable range covering the remainder and is anchored at the end. Any
> + * excess coverage from the second RIL overlaps the first instead of exceeding
> + * the requested range.
> + *
> + * If a SVA is being invalidated and the SMMU has the ARM_SMMU_OPT_FULL_CONT_RIL
> + * errata this produces only a single RIL and overinvalidates to ensure any
> + * potential CONT is covered with a single RIL.
> + */
> +static bool arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  					  struct arm_smmu_cmdq_batch *cmds,
>  					  struct arm_smmu_cmd *cmd,
>  					  struct arm_smmu_tlbi *tlbi)
>  {
> -	size_t inv_range = tlbi->iopte_size;
> -	unsigned long iova = tlbi->iova;
> -	unsigned long end = iova + tlbi->size;
> -	unsigned long num_pages = 0;
> -	u8 tg = tlbi->tgsz_lg2;
> -	u64 orig_data0 = cmd->data[0];
> -	u8 ttl = 0, tg_enc = 0;
> +	u8 tgsz_lg2 = tlbi->tgsz_lg2;
> +	struct arm_smmu_ril_range first = { .start_tg = tlbi->iova >>
> +							tgsz_lg2 };
> +	u64 last_tg = (tlbi->iova + tlbi->size - 1) >> tgsz_lg2;
> +	u64 num_tg = last_tg - first.start_tg + 1;
> +	u8 tg_enc = (tgsz_lg2 - 10) / 2;
> +	struct arm_smmu_ril_range trail;
> +	u8 ttl = 0;
>  
> -	if (WARN_ON_ONCE(!tlbi->size))
> -		return;
> -
> -	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		num_pages = tlbi->size >> tg;
> -
> -		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
> -		tg_enc = (tg - 10) / 2;
> -
> -		/*
> -		 * Determine what level the granule is at. For non-leaf, both
> -		 * io-pgtable and SVA pass a nominal last-level granule because
> -		 * they don't know what level(s) actually apply, so ignore that
> -		 * and leave TTL=0. However for various errata reasons we still
> -		 * want to use a range command, so avoid the SVA corner case
> -		 * where both scale and num could be 0 as well.
> -		 */
> -		if (tlbi->leaf_only)
> -			ttl = 4 - ((ilog2(tlbi->iopte_size) - 3) / (tg - 3));
> -		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
> -			num_pages++;
> -	}
> -
> -	while (iova < end) {
> -		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -			/*
> -			 * On each iteration of the loop, the range is 5 bits
> -			 * worth of the aligned size remaining.
> -			 * The range in pages is:
> -			 *
> -			 * range = (num_pages & (0x1f << __ffs(num_pages)))
> -			 */
> -			unsigned long scale, num;
> -
> -			/* Determine the power of 2 multiple number of pages */
> -			scale = __ffs(num_pages);
> -
> -			/* Determine how many chunks of 2^scale size we have */
> -			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
> -
> -			/* Keep the pre-DS 5-bit truncation when scale > 31 */
> -			cmd->data[0] = orig_data0 |
> -				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
> -				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);

That just deletes the DS code which was recently merged.
I see that is added again in the last patch, but it would make more
sense to do it in the same patch I guess.

Thanks,
Mostafa

> -
> -			/* range is num * 2^scale * pgsize */
> -			inv_range = num << (scale + tg);
> -
> -			/* Clear out the lower order bits for the next iteration */
> -			num_pages -= num << scale;
> -		}
> -
> -		/*
> -		 * IPA has fewer bits than VA, but they are reserved in the
> -		 * command and something would be very broken if iova had them
> -		 * set.
> -		 */
> -		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
> -			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> -			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
> -			       (iova & ~GENMASK_U64(11, 0));
> -
> -		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
> -		iova += inv_range;
> -	}
> -}
> -
> -/*
> - * Generate a RIL for ARM_SMMU_OPT_FULL_CONT_RIL by ensuring the entire SVA
> - * requested range is covered with a single RIL command. The scale is adjusted
> - * so that the RIL may extend past the end of the requested range. This ensures
> - * that any CONT the MM is invalidating is covered by a single RIL. TTL and LEAF
> - * are always 0 because this is only used by SVA.
> - */
> -static bool arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
> -					struct arm_smmu_cmdq_batch *cmds,
> -					struct arm_smmu_cmd *cmd,
> -					unsigned long iova, size_t size,
> -					u8 tgsz_lg2)
> -{
> -	u64 cur_tg = iova >> tgsz_lg2;
> -	u64 num_tg = ((iova + size - 1) >> tgsz_lg2) - cur_tg + 1;
> -	unsigned int scale = fls64((num_tg - 1) / 32);
> -
> -	if (scale > 31)
> -		return false;
> -
> -	cmd->data[0] |=
> -		FIELD_PREP(CMDQ_TLBI_0_NUM,
> -			   DIV_ROUND_UP_ULL(num_tg, 1ULL << scale) - 1) |
> -		FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
> -	cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_TG, (tgsz_lg2 - 10) / 2) |
> -		       (cur_tg << tgsz_lg2);
> -	arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
> -	return true;
> -}
> -
> -static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu,
> -				      struct arm_smmu_tlbi *tlbi)
> -{
> -	size_t max_tlbi_ops;
> -
> -	/* 0 size means invalidate all */
> -	if (!tlbi->size || tlbi->size == SIZE_MAX)
> -		return true;
> -
> -	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV)
> +	if (!tlbi->size)
>  		return false;
>  
>  	/*
> -	 * Borrowed from the MAX_TLBI_OPS in arch/arm64/include/asm/tlbflush.h,
> -	 * this is used as a threshold to replace "size_opcode" commands with a
> -	 * single "nsize_opcode" command, when SMMU doesn't implement the range
> -	 * invalidation feature, where there can be too many per-granule TLBIs,
> -	 * resulting in a soft lockup.
> +	 * Determine what level the granule is at. For non-leaf, both
> +	 * io-pgtable and SVA pass a nominal last-level granule because they
> +	 * don't know what level(s) actually apply, so leave TTL=0.
>  	 */
> -	max_tlbi_ops = 1 << (ilog2(tlbi->iopte_size) - 3);
> -	return tlbi->size >= max_tlbi_ops * tlbi->iopte_size;
> +	if (tlbi->leaf_only)
> +		ttl = 4 - ((ilog2(tlbi->iopte_size) - 3) / (tgsz_lg2 - 3));
> +
> +	/*
> +	 * The spec defines the invalidated range as:
> +	 *   Range = ((NUM+1) * 2^SCALE) * Translation_Granule_Size
> +	 * NUM is 5 bits, so (NUM+1) covers 1..32 granules. Find the smallest
> +	 * SCALE at which a single command could cover num_tg.
> +	 *
> +	 * Unlike other IOMMUs the spec has no alignment requirement on the
> +	 * address beyond alignment to tg (so long as TTL=0).
> +	 */
> +	first.scale = fls64((num_tg - 1) / 32);
> +	if (first.scale > 31) {
> +		/* Range too large for a single command do full invalidation */
> +		return false;
> +	}
> +
> +	if (tlbi->has_cont && (smmu->options & ARM_SMMU_OPT_FULL_CONT_RIL)) {
> +		/*
> +		 * Produce a single invalidation by rounding up and disabling
> +		 * the trailer.
> +		 */
> +		first.num = DIV_ROUND_UP_ULL(num_tg, 1ULL << first.scale);
> +		trail.num = 0;
> +	} else {
> +		/*
> +		 * Produce two invalidations by rounding down and adding a
> +		 * second trailing RIL anchored at the end.
> +		 */
> +		first.num = num_tg >> first.scale;
> +		trail = arm_smmu_ril_init_end(
> +			last_tg, num_tg - ((u64)first.num << first.scale));
> +	}
> +	arm_smmu_cmdq_batch_add_ril(smmu, cmds, cmd, tlbi->leaf_only, &first,
> +				    ttl, tg_enc);
> +
> +	if (trail.num)
> +		arm_smmu_cmdq_batch_add_ril(smmu, cmds, cmd, tlbi->leaf_only,
> +					    &trail, ttl, tg_enc);
> +	return true;
>  }
>  
> -/* Used by non INV_TYPE_ATS* invalidations */
> -static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
> +/*
> + * One TLBI command per IOTLB entry, assuming the entries are all at least
> + * iopte_granule sized. Returns false if too many commands would be needed which
> + * indicates too high a latency. The threshold is similar to MAX_DVM_OPS in
> + * arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
> + */
> +static bool arm_smmu_cmdq_batch_add_single(struct arm_smmu_device *smmu,
> +					   struct arm_smmu_cmdq_batch *cmds,
> +					   struct arm_smmu_cmd *cmd,
> +					   struct arm_smmu_tlbi *tlbi)
> +{
> +	unsigned long num_ops = tlbi->size / tlbi->iopte_size;
> +	unsigned long iova = tlbi->iova;
> +	unsigned long i;
> +
> +	if (!num_ops || num_ops > 512)
> +		return false;

I am guessing "!num_ops" is impossible as both params are passed from
io-pgtable-arm so size must be >= iopte_size. However, in case size
was less than the  iopte_size, wouldn’t we need to round up in that case?


> +
> +	for (i = 0; i < num_ops; i++) {
> +		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
> +			       (iova & ~GENMASK_U64(11, 0));
> +		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
> +		iova += tlbi->iopte_size;
> +	}
> +	return true;
> +}
> +
> +static void arm_smmu_inv_all_cmd(struct arm_smmu_inv *inv,
> +				 struct arm_smmu_cmdq_batch *cmds,
> +				 struct arm_smmu_cmd *cmd)
> +{
> +	u64p_replace_bits(&cmd->data[0], inv->nsize_opcode, CMDQ_0_OP);
> +	arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds, cmd);
> +}
> +
> +/*
> + * Used by non INV_TYPE_ATS* invalidations. Returns true if it fell back to
> + * full invalidation using nsize_opcode.
> + */
> +static bool arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  				       struct arm_smmu_cmdq_batch *cmds,
>  				       struct arm_smmu_cmd *cmd,
>  				       struct arm_smmu_tlbi *tlbi)
>  {
> -	struct arm_smmu_cmd nsize_cmd;
> -
> -	if (arm_smmu_inv_size_too_big(inv->smmu, tlbi))
> -		goto full_inv;
> -
> -	if (tlbi->has_cont && tlbi->size > tlbi->iopte_size &&
> -	    (inv->smmu->options & ARM_SMMU_OPT_FULL_CONT_RIL)) {
> -		if (!arm_smmu_cmdq_batch_add_ril(inv->smmu, cmds, cmd,
> -						 tlbi->iova, tlbi->size,
> -						 tlbi->tgsz_lg2))
> -			goto full_inv;
> -		return;
> +	if (inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> +		if (arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi))
> +			return false;
> +	} else {
> +		if (arm_smmu_cmdq_batch_add_single(inv->smmu, cmds, cmd, tlbi))
> +			return false;
>  	}
>  
> -	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi);
> -	return;
> -
> -full_inv:
> -	nsize_cmd = *cmd;
> -	u64p_replace_bits(&nsize_cmd.data[0], inv->nsize_opcode, CMDQ_0_OP);
> -	arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds, &nsize_cmd);
> +	arm_smmu_inv_all_cmd(inv, cmds, cmd);
> +	return true;
>  }
>  
>  static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
> @@ -2641,6 +2694,7 @@ static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
>  static void __arm_smmu_domain_inv_range(struct arm_smmu_tlbi *tlbi,
>  					struct arm_smmu_invs *invs)
>  {
> +	struct arm_smmu_inv *used_s12_vmall = NULL;
>  	struct arm_smmu_cmdq_batch cmds = {};
>  	struct arm_smmu_inv *cur;
>  	struct arm_smmu_inv *end;
> @@ -2674,11 +2728,19 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_tlbi *tlbi,
>  		case INV_TYPE_S2_VMID:
>  			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
>  						     0, cur->id);
> -			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, tlbi);
> +			if (arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, tlbi))
> +				used_s12_vmall = cur + 1;
>  			break;
>  		case INV_TYPE_S2_VMID_S1_CLEAR:
> -			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
> -			if (arm_smmu_inv_size_too_big(cur->smmu, tlbi))
> +			/*
> +			 * S2_VMID used CMDQ_OP_TLBI_S12_VMALL which already
> +			 * flushed S1 entries. These two types always come in
> +			 * pairs and arm_smmu_inv_cmp() ensures that they are
> +			 * consecutive in the list for the same SMMU. There may
> +			 * be several pairings so check this is paired with the
> +			 * one that did the full invalidation.
> +			 */
> +			if (used_s12_vmall == cur)
>  				break;
>  			arm_smmu_cmdq_batch_add_cmd(
>  				smmu, &cmds,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 3e7f94339ab60e..8b075e05d900aa 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1173,7 +1173,8 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  
>  static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
>  {
> -	arm_smmu_domain_inv_range(smmu_domain, 0, 0, 0, false);
> +	arm_smmu_domain_inv_range(smmu_domain, 0, 0, 1 << smmu_domain->tgsz_lg2,
> +				  false);
>  }
>  
>  void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
> -- 
> 2.43.0
> 

