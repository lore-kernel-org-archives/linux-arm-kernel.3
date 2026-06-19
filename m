Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBB3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VTiiOQPPFZ1ZED+8W3L25wQImaP/t6mbZOaw33wpzs=; b=Mg9R8QWUZiQrWXwPUiqlQyDv7I
	wTYLTfXUo1cIO4J+nOTNw/1SdomBicFCjrEeeuz9UDvkyGlMv7JNsMhD6BU+zGPezppfTrmHXPPBs
	NC0BTisvk87NmLtpM8RJyufbOUrmkRTj73HnrmXfbg01PRZEsFhgL+5hWdWWt716msWXGRreT5jGo
	kL1AYUlt03rpGFWUz/t7W5a5s0hFY+uI/Go74uihxmnVp+VOZF+OdIFvPlAjZabOxmw/fk52IDp+T
	m6wMUoqGH/GrcmDcEIboKUMi4vbdOQq0UcBfGJLEEKinqjg2BISWrqHF4wCdH4uxiTtg6f8WEv4oR
	43Cc4qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaMg-00000002aRN-19UI;
	Fri, 19 Jun 2026 14:38:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaMe-00000002aRF-3LR5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:38:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E65CE601E2;
	Fri, 19 Jun 2026 14:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F481F000E9;
	Fri, 19 Jun 2026 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781879915;
	bh=4VTiiOQPPFZ1ZED+8W3L25wQImaP/t6mbZOaw33wpzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isBuugKc25Pd/ADQQ0fzwHiZh3E/l5Ebf3ulcZefIjWau/xFLL5tBScIkwLAEJZ5g
	 gerrDg225TCLgSZBAmObbhBvrVhdSfFeAark0ldlRwlnbZucqSuKS59QY1Rrjjhm17
	 yQ2ZCTIk9LvcSh8FAKv4VuaOWxUtjlfactb38NwbFfw0zsyOkNvuZs+a1u8Sd9o31p
	 mplFQo6nsc2BxEbgr31NzFqSCnFr7TkZbY3P0vcZOR/XfgMW/t0xx8V9mf2r2h7Qh4
	 +87oMQgUVQinRuIouPkNm5eFcNzdRfkJXJqlu7cAmEHcFIpDsnD7ry3uzvROxfbgW1
	 TQyPHv2ENuK1A==
Date: Fri, 19 Jun 2026 15:38:30 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Declare eats_s1chk and eats_trans as
 host-endian u64
Message-ID: <ajVUZkHcGp-PHkmO@willie-the-truck>
References: <20260615194533.3290010-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615194533.3290010-1-nicolinc@nvidia.com>
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

On Mon, Jun 15, 2026 at 12:45:33PM -0700, Nicolin Chen wrote:
> arm_smmu_get_ste_update_safe() declares the eats_s1chk and eats_trans
> locals as __le64, but initializes them from FIELD_PREP(), which returns a
> host-endian value, and passes them through cpu_to_le64() at the use sites.
> 
> Sparse reports the following warnings:
> 
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse: sparse: cast from restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1124:33: sparse: sparse: cast from restricted __le64
> 
> Declare both locals as u64 so the type matches FIELD_PREP() and the
> existing cpu_to_le64() at the use sites performs the host-to-little-endian
> conversion. No functional change.
> 
> Fixes: 7cad80048595 ("iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202606151017.QU0evpH9-lkp@intel.com/
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8ce3e801eda3b..4c0f7b17b1f37 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1240,9 +1240,9 @@ VISIBLE_IF_KUNIT
>  void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
>  				  __le64 *safe_bits)
>  {
> -	const __le64 eats_s1chk =
> +	const u64 eats_s1chk =
>  		FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_S1CHK);
> -	const __le64 eats_trans =
> +	const u64 eats_trans =
>  		FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS);

Aha, this is the fix for that sparse report from the kbuild robot. Thanks!

Will

