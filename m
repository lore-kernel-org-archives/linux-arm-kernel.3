Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB4EC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZICVMivXasoTNpnkCDEcwiEM2lJS8pq6Ov9c9qt5PY=; b=a9BmWOOmQtco+OkK+rnQfQXIcs
	s1w7zDLVuJd0rgk9m3a1npFSxpVvSBRfgWe0Vl6RbIQpY6xpeL4ZViII9e6yNzUFYH5Zz2cxRZBMR
	uNEg2Uo9ed6ku1mId24DxvnyBX9BsNunRGCDhk/zWRPrf3mFq6Zx5nzgY6OA9aUHsULWwkpZrjVAK
	mDqMuNh4qRwNQjRdIf67A7f743oWTlSr5ZmIFlLb/YqnnDSDXGdushLgj5MD0Yr6SyQjW3jkCn/sq
	VTnKQNJbIPBGYcQE5JiZ/T2zx4HEszL4B+8SUEhaD28s3i8iAqb7tRet+/jKQdluUoRcHYZxMSJAN
	oRmGvJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghi-0000000FSkt-3jB0;
	Wed, 21 May 2025 10:29:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfwM-0000000FLqD-3lyN;
	Wed, 21 May 2025 09:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE9A43474;
	Wed, 21 May 2025 09:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F64AC4CEE4;
	Wed, 21 May 2025 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820446;
	bh=yhP6RYW9dqB8JMXo88zjJmunfH6pOCZWTpDZQbfq8nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzZiJuhedKMD6D/oNExLGoyRWAc0fD1zTIF7Ogb5etlZmYfnpEM3EoGpygsTuCDWe
	 UhXKwssazdkQ+nX8RYpNE2xQuu56iYGEpqIi74apeZvkZhw8z84Y1IajCq7+QdvD5D
	 ka/IKOfwwdW2bldAIODOUciwgk4jemCongSEdL8ocE4pICu9pM+9jDOZ4Wotp5F2G+
	 OrTdAVw4CJAGTN0IpDnLYmqSs4zQ4M+RucMOtEPsCIz8Zh8Ivc/ALf7+BAkXBX1Os6
	 5gHrC4sSU55AZQNS3VUPhT9zBmUzMMk4E+GevJz5ky/AntM+46ualdzrCiubtKZIOf
	 lG81rsCJrUeWA==
Date: Wed, 21 May 2025 11:40:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com
Subject: Re: [PATCH 08/10] phy: exynos: Add PCIe PHY support for FSD SoC
Message-ID: <20250521-certain-quoll-from-vega-11885b@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193256epcas5p442e9549fd8fd810522f960df74c22e34@epcas5p4.samsung.com>
 <20250518193152.63476-9-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-9-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_024046_985084_B6503028 
X-CRM114-Status: GOOD (  22.90  )
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

On Mon, May 19, 2025 at 01:01:50AM GMT, Shradha Todi wrote:
> Add PCIe PHY support for Tesla FSD SoC.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos-pcie.c | 357 +++++++++++++++++++++++++-
>  1 file changed, 356 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
> index 53c9230c2907..0e4c00c1121e 100644
> --- a/drivers/phy/samsung/phy-exynos-pcie.c
> +++ b/drivers/phy/samsung/phy-exynos-pcie.c
> @@ -34,11 +34,121 @@
>  /* PMU PCIE PHY isolation control */
>  #define EXYNOS5433_PMU_PCIE_PHY_OFFSET		0x730
>  
> +/* FSD: PCIe PHY common registers */
> +#define FSD_PCIE_PHY_TRSV_CMN_REG03	0x000c
> +#define FSD_PCIE_PHY_TRSV_CMN_REG01E	0x0078
> +#define FSD_PCIE_PHY_TRSV_CMN_REG02D	0x00b4
> +#define FSD_PCIE_PHY_TRSV_CMN_REG031	0x00c4
> +#define FSD_PCIE_PHY_TRSV_CMN_REG036	0x00d8
> +#define FSD_PCIE_PHY_TRSV_CMN_REG05F	0x017c
> +#define FSD_PCIE_PHY_TRSV_CMN_REG060	0x0180
> +#define FSD_PCIE_PHY_TRSV_CMN_REG062	0x0188
> +#define FSD_PCIE_PHY_TRSV_CMN_REG061	0x0184
> +#define FSD_PCIE_PHY_AGG_BIF_RESET	0x0200
> +#define FSD_PCIE_PHY_AGG_BIF_CLOCK	0x0208
> +#define FSD_PCIE_PHY_CMN_RESET		0x0228
> +
> +/* FSD: PCIe PHY lane registers */
> +#define FSD_PCIE_PHY_LANE_OFFSET	0x400
> +#define FSD_PCIE_PHY_TRSV_REG001_LN_N	0x404
> +#define FSD_PCIE_PHY_TRSV_REG002_LN_N	0x408
> +#define FSD_PCIE_PHY_TRSV_REG005_LN_N	0x414
> +#define FSD_PCIE_PHY_TRSV_REG006_LN_N	0x418
> +#define FSD_PCIE_PHY_TRSV_REG007_LN_N	0x41c
> +#define FSD_PCIE_PHY_TRSV_REG009_LN_N	0x424
> +#define FSD_PCIE_PHY_TRSV_REG00A_LN_N	0x428
> +#define FSD_PCIE_PHY_TRSV_REG00C_LN_N	0x430
> +#define FSD_PCIE_PHY_TRSV_REG012_LN_N	0x448
> +#define FSD_PCIE_PHY_TRSV_REG013_LN_N	0x44c
> +#define FSD_PCIE_PHY_TRSV_REG014_LN_N	0x450
> +#define FSD_PCIE_PHY_TRSV_REG015_LN_N	0x454
> +#define FSD_PCIE_PHY_TRSV_REG016_LN_N	0x458
> +#define FSD_PCIE_PHY_TRSV_REG018_LN_N	0x460
> +#define FSD_PCIE_PHY_TRSV_REG020_LN_N	0x480
> +#define FSD_PCIE_PHY_TRSV_REG026_LN_N	0x498
> +#define FSD_PCIE_PHY_TRSV_REG029_LN_N	0x4a4
> +#define FSD_PCIE_PHY_TRSV_REG031_LN_N	0x4c4
> +#define FSD_PCIE_PHY_TRSV_REG036_LN_N	0x4d8
> +#define FSD_PCIE_PHY_TRSV_REG039_LN_N	0x4e4
> +#define FSD_PCIE_PHY_TRSV_REG03B_LN_N	0x4ec
> +#define FSD_PCIE_PHY_TRSV_REG03C_LN_N	0x4f0
> +#define FSD_PCIE_PHY_TRSV_REG03E_LN_N	0x4f8
> +#define FSD_PCIE_PHY_TRSV_REG03F_LN_N	0x4fc
> +#define FSD_PCIE_PHY_TRSV_REG043_LN_N	0x50c
> +#define FSD_PCIE_PHY_TRSV_REG044_LN_N	0x510
> +#define FSD_PCIE_PHY_TRSV_REG046_LN_N	0x518
> +#define FSD_PCIE_PHY_TRSV_REG048_LN_N	0x520
> +#define FSD_PCIE_PHY_TRSV_REG049_LN_N	0x524
> +#define FSD_PCIE_PHY_TRSV_REG04E_LN_N	0x538
> +#define FSD_PCIE_PHY_TRSV_REG052_LN_N	0x548
> +#define FSD_PCIE_PHY_TRSV_REG068_LN_N	0x5a0
> +#define FSD_PCIE_PHY_TRSV_REG069_LN_N	0x5a4
> +#define FSD_PCIE_PHY_TRSV_REG06A_LN_N	0x5a8
> +#define FSD_PCIE_PHY_TRSV_REG06B_LN_N	0x5ac
> +#define FSD_PCIE_PHY_TRSV_REG07B_LN_N	0x5ec
> +#define FSD_PCIE_PHY_TRSV_REG083_LN_N	0x60c
> +#define FSD_PCIE_PHY_TRSV_REG084_LN_N	0x610
> +#define FSD_PCIE_PHY_TRSV_REG086_LN_N	0x618
> +#define FSD_PCIE_PHY_TRSV_REG087_LN_N	0x61c
> +#define FSD_PCIE_PHY_TRSV_REG08B_LN_N	0x62c
> +#define FSD_PCIE_PHY_TRSV_REG09C_LN_N	0x670
> +#define FSD_PCIE_PHY_TRSV_REG09D_LN_N	0x674
> +#define FSD_PCIE_PHY_TRSV_REG09E_LN_N	0x678
> +#define FSD_PCIE_PHY_TRSV_REG09F_LN_N	0x67c
> +#define FSD_PCIE_PHY_TRSV_REG0A2_LN_N	0x688
> +#define FSD_PCIE_PHY_TRSV_REG0A4_LN_N	0x690
> +#define FSD_PCIE_PHY_TRSV_REG0CE_LN_N	0x738
> +#define FSD_PCIE_PHY_TRSV_REG0FC_LN_N	0x7f0
> +#define FSD_PCIE_PHY_TRSV_REG0FD_LN_N	0x7f4
> +#define FSD_PCIE_PHY_TRSV_REG0FE_LN_N	0x7f8
> +#define FSD_PCIE_PHY_TRSV_REG0CE_LN_1	0xb38
> +#define FSD_PCIE_PHY_TRSV_REG0CE_LN_2	0xf38
> +#define FSD_PCIE_PHY_TRSV_REG0CE_LN_3	0x1338
> +
> +/* FSD: PCIe PCS registers */
> +#define FSD_PCIE_PCS_BRF_0		0x0004
> +#define FSD_PCIE_PCS_BRF_1		0x0804
> +#define FSD_PCIE_PCS_CLK		0x0180
> +
> +/* FSD: PCIe SYSREG registers */
> +#define FSD_PCIE_SYSREG_PHY_0_CON_MASK			0x3ff
> +#define FSD_PCIE_SYSREG_PHY_0_CON			0x042C
> +#define FSD_PCIE_SYSREG_PHY_0_REF_SEL_MASK		0x3
> +#define FSD_PCIE_SYSREG_PHY_0_REF_SEL			(0x2 << 0)
> +#define FSD_PCIE_SYSREG_PHY_0_SSC_EN_MASK		0x8
> +#define FSD_PCIE_SYSREG_PHY_0_SSC_EN			BIT(3)
> +#define FSD_PCIE_SYSREG_PHY_0_AUX_EN_MASK		0x10
> +#define FSD_PCIE_SYSREG_PHY_0_AUX_EN			BIT(4)
> +#define FSD_PCIE_SYSREG_PHY_0_CMN_RSTN_MASK		0x100
> +#define FSD_PCIE_SYSREG_PHY_0_CMN_RSTN			BIT(8)
> +#define FSD_PCIE_SYSREG_PHY_0_INIT_RSTN_MASK		0x200
> +#define FSD_PCIE_SYSREG_PHY_0_INIT_RSTN			BIT(9)
> +
> +#define FSD_PCIE_SYSREG_PHY_1_CON_MASK			0x1ff
> +#define FSD_PCIE_SYSREG_PHY_1_CON			0x0500
> +#define FSD_PCIE_SYSREG_PHY_1_REF_SEL_MASK		0x30
> +#define FSD_PCIE_SYSREG_PHY_1_REF_SEL			(0x2 << 4)
> +#define FSD_PCIE_SYSREG_PHY_1_SSC_EN_MASK		0x80
> +#define FSD_PCIE_SYSREG_PHY_1_SSC_EN			BIT(7)
> +#define FSD_PCIE_SYSREG_PHY_1_AUX_EN_MASK		0x1
> +#define FSD_PCIE_SYSREG_PHY_1_AUX_EN			BIT(0)
> +#define FSD_PCIE_SYSREG_PHY_1_CMN_RSTN_MASK		0x2
> +#define FSD_PCIE_SYSREG_PHY_1_CMN_RSTN			BIT(1)
> +#define FSD_PCIE_SYSREG_PHY_1_INIT_RSTN_MASK		0x8
> +#define FSD_PCIE_SYSREG_PHY_1_INIT_RSTN			BIT(3)
> +
>  /* For Exynos pcie phy */
>  struct exynos_pcie_phy {
>  	void __iomem *base;
> +	void __iomem *pcs_base;
>  	struct regmap *pmureg;
>  	struct regmap *fsysreg;
> +	int phy_id;
> +	const struct samsung_drv_data *drv_data;
> +};
> +
> +struct samsung_drv_data {
> +	const struct phy_ops *phy_ops;
>  };
>  
>  static void exynos_pcie_phy_writel(void __iomem *base, u32 val, u32 offset)
> @@ -133,9 +243,244 @@ static const struct phy_ops exynos5433_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +struct fsd_pcie_phy_pdata {
> +	u32 phy_con_mask;
> +	u32 phy_con;
> +	u32 phy_ref_sel_mask;
> +	u32 phy_ref_sel;
> +	u32 phy_ssc_en_mask;
> +	u32 phy_ssc_en;
> +	u32 phy_aux_en_mask;
> +	u32 phy_aux_en;
> +	u32 phy_cmn_rstn_mask;
> +	u32 phy_cmn_rstn;
> +	u32 phy_init_rstn_mask;
> +	u32 phy_init_rstn;
> +	u32 num_lanes;
> +	u32 lane_offset;
> +};
> +
> +struct fsd_pcie_phy_pdata fsd_phy_con[] = {
> +	{

Why this is global and RW?

> +	.phy_con		= FSD_PCIE_SYSREG_PHY_0_CON,
> +	.phy_con_mask		= FSD_PCIE_SYSREG_PHY_0_CON_MASK,
> +	.phy_ref_sel_mask	= FSD_PCIE_SYSREG_PHY_0_REF_SEL_MASK,
> +	.phy_ref_sel		= FSD_PCIE_SYSREG_PHY_0_REF_SEL,
> +	.phy_ssc_en_mask	= FSD_PCIE_SYSREG_PHY_0_SSC_EN_MASK,
> +	.phy_ssc_en		= FSD_PCIE_SYSREG_PHY_0_SSC_EN,
> +	.phy_aux_en_mask	= FSD_PCIE_SYSREG_PHY_0_AUX_EN_MASK,
> +	.phy_aux_en		= FSD_PCIE_SYSREG_PHY_0_AUX_EN,
> +	.phy_cmn_rstn_mask	= FSD_PCIE_SYSREG_PHY_0_CMN_RSTN_MASK,
> +	.phy_cmn_rstn		= FSD_PCIE_SYSREG_PHY_0_CMN_RSTN,
> +	.phy_init_rstn_mask	= FSD_PCIE_SYSREG_PHY_0_INIT_RSTN_MASK,
> +	.phy_init_rstn		= FSD_PCIE_SYSREG_PHY_0_INIT_RSTN,
> +	.num_lanes		= 0x4,
> +	.lane_offset		= FSD_PCIE_PHY_LANE_OFFSET,
> +	},
> +	{
> +	.phy_con		= FSD_PCIE_SYSREG_PHY_1_CON,
> +	.phy_con_mask		= FSD_PCIE_SYSREG_PHY_1_CON_MASK,
> +	.phy_ref_sel_mask	= FSD_PCIE_SYSREG_PHY_1_REF_SEL_MASK,
> +	.phy_ref_sel		= FSD_PCIE_SYSREG_PHY_1_REF_SEL,
> +	.phy_ssc_en_mask	= FSD_PCIE_SYSREG_PHY_1_SSC_EN_MASK,
> +	.phy_ssc_en		= FSD_PCIE_SYSREG_PHY_1_SSC_EN,
> +	.phy_aux_en_mask	= FSD_PCIE_SYSREG_PHY_1_AUX_EN_MASK,
> +	.phy_aux_en		= FSD_PCIE_SYSREG_PHY_1_AUX_EN,
> +	.phy_cmn_rstn_mask	= FSD_PCIE_SYSREG_PHY_1_CMN_RSTN_MASK,
> +	.phy_cmn_rstn		= FSD_PCIE_SYSREG_PHY_1_CMN_RSTN,
> +	.phy_init_rstn_mask	= FSD_PCIE_SYSREG_PHY_1_INIT_RSTN_MASK,
> +	.phy_init_rstn		= FSD_PCIE_SYSREG_PHY_1_INIT_RSTN,
> +	.num_lanes		= 0x4,
> +	.lane_offset		= FSD_PCIE_PHY_LANE_OFFSET,
> +	},
> +	{ },
> +};
> +
> +struct fsd_pcie_phy_setting {
> +	u32 addr;
> +	u32 val;
> +	bool is_cmn_reg;
> +};
> +
> +struct fsd_pcie_phy_setting fsd_pcie_phy0_setting[] = {

No. This is poor coding, please do first extensive internal reviews.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1 for gcc and clang. Most of these
commands (checks or W=1 build) can build specific targets, like some
directory, to narrow the scope to only your code. The code here looks
like it needs a fix. Feel free to get in touch if the warning is not
clear.

...

> @@ -146,11 +491,18 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
>  	struct exynos_pcie_phy *exynos_phy;
>  	struct phy *generic_phy;
>  	struct phy_provider *phy_provider;
> +	const struct samsung_drv_data *drv_data;
> +
> +	drv_data = of_device_get_match_data(dev);
> +	if (!drv_data)
> +		return -ENODEV;
>  
>  	exynos_phy = devm_kzalloc(dev, sizeof(*exynos_phy), GFP_KERNEL);
>  	if (!exynos_phy)
>  		return -ENOMEM;
>  
> +	exynos_phy->drv_data = drv_data;
> +
>  	exynos_phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(exynos_phy->base))
>  		return PTR_ERR(exynos_phy->base);
> @@ -169,12 +521,15 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(exynos_phy->fsysreg);
>  	}
>  
> -	generic_phy = devm_phy_create(dev, dev->of_node, &exynos5433_phy_ops);
> +	generic_phy = devm_phy_create(dev, dev->of_node, drv_data->phy_ops);
>  	if (IS_ERR(generic_phy)) {
>  		dev_err(dev, "failed to create PHY\n");
>  		return PTR_ERR(generic_phy);
>  	}
>  
> +	exynos_phy->pcs_base = devm_platform_ioremap_resource(pdev, 1);
> +	exynos_phy->phy_id = of_alias_get_id(dev->of_node, "pciephy");

Where did you document aliases?

Anyway, all this looks because you have completely buggy way of handling
MMIO via syscon. That's a no-go. Use proper address ranges assigned to
ddevices. If you ever need to use syscon, you should pass the offset as
argument - just like other devices are doing.

Best regards,
Krzysztof


