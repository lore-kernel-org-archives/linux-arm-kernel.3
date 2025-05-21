Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467FDC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 00:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLMVg62D63jw2j3c0Fj1FO3so+LeBh6cMEhUELVQJls=; b=uZQkJnltYEOnsAr5xV3ButSojB
	xCxWXnhwoc+7vb+Pg5/t4Fzn6wwsNKkPsqezG+YbxuNmoCL3lje+tiN+ozKfK6bFNXouV79Z7TJzn
	UP4KzzOU5aCt3ZaUm6lkhK/TqHWJJIGbMQx+PHXuV5ZX+9zx6JjSGjigr1rKYANjIIKzKGZxxWNne
	LM6d3Sx7FFpwSjmS4aD9gmMkZpmdJ36O6pz+//9YRdr1K494bRZWPNh2FQN+M420G2tP0G8Sp88tM
	sg4mGNlYjh2tOzYd3PYcgc6T+BdyVlFLsD7MUrTaExswBlyWO8l7MJwOT/As8HaxJEUfCZVn11oAw
	amdLBCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHWwe-0000000EPnL-0r4R;
	Wed, 21 May 2025 00:04:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHWuV-0000000EPhK-06hY;
	Wed, 21 May 2025 00:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02AFA629D4;
	Wed, 21 May 2025 00:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6979FC4CEE9;
	Wed, 21 May 2025 00:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747785733;
	bh=jXl0OotgD+85DVFJREE1im9n5MMc1eZmHD6Z/7IoqVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xzpch6AxmJmqIKU1MNMhV6r+ZUcFyE6XLvHM/8foZm27SJCHk0oiZzxKvS94j6i/K
	 1gqDikjs90pIPcOhm2XSK5TxKNJvUREDIvThJh44OOl673K2lmROFMKRbpa3bnbh/1
	 bCCpoRvoukdb62EywWi100owxVeiKeKDkLxzO/beKegHX5lry/VkVsio4rmowXKUno
	 MsrSxLt3UGrVCEsi2aKgSw+gl/TARELO0fKD9zI/uxbra9Oc5ez+jXSNNIDAf80xkd
	 miNqtFsNT3w1dvKqVhTQq0t64LoiJsFxdXzPpQFSl+TKU0Q9eILO9w4f8DipERx8vZ
	 xDw+67LsUtugw==
Date: Tue, 20 May 2025 19:02:11 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 2/2] iommu/mediatek: Add support for Dimensity 1200
 MT6893 MM IOMMU
Message-ID: <20250521000211.GA1717916-robh@kernel.org>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
 <20250410144008.475888-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144008.475888-3-angelogioacchino.delregno@collabora.com>
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

On Thu, Apr 10, 2025 at 04:40:08PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the two MM IOMMUs found in the MediaTek Dimensity
> 1200 (MT6893) SoC, used for display, camera, imgsys and vpu.
> 
> Since the MT6893 SoC is almost fully compatible with MT8192, also
> move the mt8192_larb_region_msk before the newly introduced mt6893
> platform data, as the larb regions from mt8192 are fully reused.
> 
> Note that the only difference with MT8192 is that MT6893 needs the
> SHARE_PGTABLE flag.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/mtk_iommu.c | 37 ++++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index df98d0c65f54..0a54c6521bf5 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1550,6 +1550,31 @@ static const struct mtk_iommu_plat_data mt6795_data = {
>  	.larbid_remap = {{0}, {1}, {2}, {3}, {4}}, /* Linear mapping. */
>  };
>  
> +static const unsigned int mt8192_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK_LARB_NR_MAX] = {
> +	[0] = {~0, ~0},				/* Region0: larb0/1 */
> +	[1] = {0, 0, 0, 0, ~0, ~0, 0, ~0},	/* Region1: larb4/5/7 */
> +	[2] = {0, 0, ~0, 0, 0, 0, 0, 0,		/* Region2: larb2/9/11/13/14/16/17/18/19/20 */
> +	       0, ~0, 0, ~0, 0, ~(u32)(BIT(9) | BIT(10)), ~(u32)(BIT(4) | BIT(5)), 0,
> +	       ~0, ~0, ~0, ~0, ~0},
> +	[3] = {0},
> +	[4] = {[13] = BIT(9) | BIT(10)},	/* larb13 port9/10 */
> +	[5] = {[14] = BIT(4) | BIT(5)},		/* larb14 port4/5 */
> +};
> +
> +static const struct mtk_iommu_plat_data mt6893_data = {
> +	.m4u_plat     = M4U_MT8192,
> +	.flags        = HAS_BCLK | OUT_ORDER_WR_EN | HAS_SUB_COMM_2BITS |
> +			WR_THROT_EN | IOVA_34_EN | SHARE_PGTABLE | MTK_IOMMU_TYPE_MM,
> +	.inv_sel_reg  = REG_MMU_INV_SEL_GEN2,
> +	.banks_num    = 1,
> +	.banks_enable = {true},
> +	.iova_region  = mt8192_multi_dom,
> +	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
> +	.iova_region_larb_msk = mt8192_larb_region_msk,
> +	.larbid_remap    = {{0}, {1}, {4, 5}, {7}, {2}, {9, 11, 19, 20},
> +			    {0, 14, 16}, {0, 13, 18, 17}},
> +};
> +
>  static const struct mtk_iommu_plat_data mt8167_data = {
>  	.m4u_plat     = M4U_MT8167,
>  	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
> @@ -1673,17 +1698,6 @@ static const struct mtk_iommu_plat_data mt8188_data_vpp = {
>  			   27, 28 /* ccu0 */, MTK_INVALID_LARBID}, {4, 6}},
>  };
>  
> -static const unsigned int mt8192_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK_LARB_NR_MAX] = {
> -	[0] = {~0, ~0},				/* Region0: larb0/1 */
> -	[1] = {0, 0, 0, 0, ~0, ~0, 0, ~0},	/* Region1: larb4/5/7 */
> -	[2] = {0, 0, ~0, 0, 0, 0, 0, 0,		/* Region2: larb2/9/11/13/14/16/17/18/19/20 */
> -	       0, ~0, 0, ~0, 0, ~(u32)(BIT(9) | BIT(10)), ~(u32)(BIT(4) | BIT(5)), 0,
> -	       ~0, ~0, ~0, ~0, ~0},
> -	[3] = {0},
> -	[4] = {[13] = BIT(9) | BIT(10)},	/* larb13 port9/10 */
> -	[5] = {[14] = BIT(4) | BIT(5)},		/* larb14 port4/5 */
> -};
> -
>  static const struct mtk_iommu_plat_data mt8192_data = {
>  	.m4u_plat       = M4U_MT8192,
>  	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
> @@ -1777,6 +1791,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
>  	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
>  	{ .compatible = "mediatek,mt6795-m4u", .data = &mt6795_data},
> +	{ .compatible = "mediatek.mt6893-iommu-mm", .data = &mt6893_data},

Are you going to fix the typo>   ^

It is still warning with 'make dt_compatible_check' that it is 
undocumented.

Rob

