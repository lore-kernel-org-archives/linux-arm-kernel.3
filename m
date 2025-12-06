Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C67D3B7D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjwnmRwNJgra34vToCJ4x7gNRKm2tiUS3qQS46PNKRY=; b=hVYd0bKFkuorr62qnzLg6+WIiN
	Y5qTpKbdz5oSlnjrVuJmpfxwOAtgwx9RsEh6o7azQfnUJKm9hze+GdMNZyDxVEADwj1xKlPjO5wfS
	4HYsYmqdmPnSBMIeWN/bZ80xDVSK5nAnK5fYHriFz0d8zoS+uAsA5r42NdefIn53sqIcI4qjgexF1
	WK0VHrOxy8YEAXlcBrXrl36cYE7kLoeFhaKrm9MozJU+mL4JYnq6YHL2l0pa69NlTKxnvaKl2B7N2
	w6IoM/m3EWpswSQYzsHpvUCSUGYxZbSR5srFceKr41/wsXkYPK4VnQsSBSCMv6z/DlWnoRmc/tKtz
	tB+U9NgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRrUl-0000000AuSZ-2KU5;
	Sat, 06 Dec 2025 12:34:39 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRrUY-0000000AuRF-0AyU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 12:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765024455; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bjwnmRwNJgra34vToCJ4x7gNRKm2tiUS3qQS46PNKRY=;
	b=Pp4lvxs65tCPaR0pi76IlKQfu+99R0MtTdG3RBRtiv76DaYlWv9BQ5BjG/7VTfxKcCcEoWq0zrNXKGyL9j8CJrqpIEvVXXS3Edw0ojmyWNN0h7/j3d6mTBEcFtAKcV4IEC+fEwrLLEF85yXN9/cY+Y4yIQ++7X79lRmzH3BHOSw=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuB-biP_1765024449 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 06 Dec 2025 20:34:10 +0800
Message-ID: <703ba08f-eec0-44d8-a224-c96706df5fab@linux.alibaba.com>
Date: Sat, 6 Dec 2025 20:34:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v1 4/4] iommu/arm-smmu-v3-test: Add nested s1bypass
 coverage
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com
Cc: joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 skolothumtho@nvidia.com, praan@google.com
References: <cover.1764982046.git.nicolinc@nvidia.com>
 <3c838833d8bbb69a72a85ddbcc325b22ae7a7d6d.1764982046.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <3c838833d8bbb69a72a85ddbcc325b22ae7a7d6d.1764982046.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_043436_877665_A4796D83 
X-CRM114-Status: GOOD (  11.09  )
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



在 2025/12/6 08:52, Nicolin Chen 写道:
> STE in a nested case requires both S1 and S2 fields. And this makes the use
> case different from the existing one.
> 
> Add coverage for previously failed cases shifting between S2-only and S1+S2
> STEs.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 9287904c93a2..56bdcf5a517e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -553,6 +553,36 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
>   						       NUM_EXPECTED_SYNCS(3));
>   }
>   
> +static void
> +arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass(struct kunit *test)
> +{
> +	struct arm_smmu_ste s1_ste;
> +	struct arm_smmu_ste s2_ste;
> +
> +	arm_smmu_test_make_s2_ste(&s1_ste, ARM_SMMU_MASTER_TEST_ATS);
> +	arm_smmu_test_make_cdtable_ste(&s1_ste, STRTAB_STE_1_S1DSS_SSID0,

arm_smmu_test_make_s2_ste() makes a s2 ste and it will be overwrited by
arm_smmu_test_make_cdtable_ste(). Finnaly, we got a s1 STE, not a nested
s1dssbypass ste.

I think we need a function like arm_smmu_make_nested_cd_table_ste()
here.

Besides, from the function name, I think you mean
STRTAB_STE_1_S1DSS_BYPASS?

+	arm_smmu_test_make_s2_ste(&s2_ste, 0);
+	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s1_ste, &s2_ste,
+						       NUM_EXPECTED_SYNCS(3));

With get_ignored(), a nested s1dssbypass STE to a nested s1bypass STE
will be hitless, a.k.a, NUM_EXPECTED_SYNCS(1).

Thanks.
Shuai

