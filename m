Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E85CEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 03:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om5dsQvWzxASHszoSFGJ5FtUBquX+4l8f6iGkR80jFU=; b=DLx2qhIGNPSdZf+9ApRb9rH0Ag
	hCWfsAtfTvN/WpWv5dX3VqlkvewAsXN2d4g5xZr/ASfsb41fTATkZzfKuixtclnCmMZ6N+9is0tok
	jmhA0wvRzINfjKjVGKZVAeN8N+EHE12sNufc2+/jvVD1TwnnyVumMbK2YQtk4sdg5t4A4GB/TwoM6
	bz8wqphwd/qQyYGUFR14aMkNFRIJ+Y4VAUgYQzjmAD2iGwTOUvorRbNROYXR2RjvdJFPnY3HplfXk
	2S487/m+/pObP85U/Nxxd7qHRYT9LwCkfD8uSkF0dswN9VE9FtCEoeMRF1Fd5BzFbdApzO1YT2jp/
	iNs+4F+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSAE-0000000CXVy-3bRt;
	Mon, 08 Dec 2025 03:43:54 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSAB-0000000CXVY-1ESV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 03:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765165426; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=om5dsQvWzxASHszoSFGJ5FtUBquX+4l8f6iGkR80jFU=;
	b=v5/0mtdK1a8XeNn6rnfobtE+F8cb+H/tQAtN1yUpk1F+/aHotArRN99bxR1nRMPrSYtrkuVHq15nHurvXQ1mizDLGeYA/3yUtMNox1noc/ocX7W6OXvDaRIls8ENUuK55lmEdHgifqLqHFUK4B9W6d1cqlEEiDgcZ0wcPYvUnQk=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuFEAl9_1765165423 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 08 Dec 2025 11:43:43 +0800
Message-ID: <f52c705d-6032-4d85-b902-dd6d0a40b9ec@linux.alibaba.com>
Date: Mon, 8 Dec 2025 11:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v2 4/4] iommu/arm-smmu-v3-test: Add nested
 s1bypass/s1dssbypass coverage
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com
Cc: joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 skolothumtho@nvidia.com, praan@google.com
References: <cover.1765140287.git.nicolinc@nvidia.com>
 <b6d87901f89c05dd9e1d0c1e819040d205f569a7.1765140287.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <b6d87901f89c05dd9e1d0c1e819040d205f569a7.1765140287.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_194352_301725_5BB0DA0A 
X-CRM114-Status: GOOD (  14.65  )
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



在 2025/12/8 04:49, Nicolin Chen 写道:
> STE in a nested case requires both S1 and S2 fields. And this makes the use
> case different from the existing one.
> 
> Add coverage for previously failed cases shifting between S2-only and S1+S2
> STEs.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 3556e65cf9ac..1672e75ebffc 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -555,6 +555,65 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
>   						       NUM_EXPECTED_SYNCS(3));
>   }
>   
> +static void arm_smmu_test_make_nested_cdtable_ste(
> +	struct arm_smmu_ste *ste, unsigned int s1dss, const dma_addr_t dma_addr,
> +	enum arm_smmu_test_master_feat feat)
> +{
> +	bool stall_enabled = feat & ARM_SMMU_MASTER_TEST_STALL;
> +	bool ats_enabled = feat & ARM_SMMU_MASTER_TEST_ATS;
> +	struct arm_smmu_ste s1ste;
> +
> +	struct arm_smmu_master master = {
> +		.ats_enabled = ats_enabled,
> +		.cd_table.cdtab_dma = dma_addr,
> +		.cd_table.s1cdmax = 0xFF,
> +		.cd_table.s1fmt = STRTAB_STE_0_S1FMT_64K_L2,
> +		.smmu = &smmu,
> +		.stall_enabled = stall_enabled,
> +	};
> +
> +	arm_smmu_test_make_s2_ste(ste, ARM_SMMU_MASTER_TEST_ATS);
> +	arm_smmu_make_cdtable_ste(&s1ste, &master, ats_enabled, s1dss);

Hi, Nicolin,

Nit. Instead of duplicating this code, we can leverage the existing
arm_smmu_test_make_cdtable_ste() helper here.

> +
> +	ste->data[0] = cpu_to_le64(
> +		STRTAB_STE_0_V |
> +		FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
> +	ste->data[0] |= s1ste.data[0] & ~cpu_to_le64(STRTAB_STE_0_CFG);
> +	ste->data[1] |= s1ste.data[1];
> +	/* Merge events for DoS mitigations on eventq */
> +	ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +}
> +
> +static void
> +arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass(struct kunit *test)
> +{
> +	struct arm_smmu_ste s1_ste;
> +	struct arm_smmu_ste s2_ste;
> +
> +	arm_smmu_test_make_nested_cdtable_ste(&s1_ste,
> +					      STRTAB_STE_1_S1DSS_BYPASS,
> +					      fake_cdtab_dma_addr,
> +					      ARM_SMMU_MASTER_TEST_ATS);
> +	arm_smmu_test_make_s2_ste(&s2_ste, 0);
> +	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s1_ste, &s2_ste,
> +						       NUM_EXPECTED_SYNCS(3));
> +}
> +
> +static void
> +arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass(struct kunit *test)
> +{
> +	struct arm_smmu_ste s1_ste;
> +	struct arm_smmu_ste s2_ste;
> +
> +	arm_smmu_test_make_nested_cdtable_ste(&s1_ste,
> +					      STRTAB_STE_1_S1DSS_BYPASS,
> +					      fake_cdtab_dma_addr,
> +					      ARM_SMMU_MASTER_TEST_ATS);
> +	arm_smmu_test_make_s2_ste(&s2_ste, 0);
> +	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s2_ste, &s1_ste,
> +						       NUM_EXPECTED_SYNCS(2));

It would be better to add comments explaining why the number of syncs differs
between the reverse transitions.

> +}
> +
>   static void arm_smmu_v3_write_cd_test_sva_clear(struct kunit *test)
>   {
>   	struct arm_smmu_cd cd = {};
> @@ -601,6 +660,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
>   	KUNIT_CASE(arm_smmu_v3_write_cd_test_s1_change_asid),
>   	KUNIT_CASE(arm_smmu_v3_write_ste_test_s1_to_s2_stall),
>   	KUNIT_CASE(arm_smmu_v3_write_ste_test_s2_to_s1_stall),
> +	KUNIT_CASE(arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass),
> +	KUNIT_CASE(arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass),
>   	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_clear),
>   	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_release),
>   	{},

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

