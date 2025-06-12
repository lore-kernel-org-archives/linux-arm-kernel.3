Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710D4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYf2tEJU/PRXvYrTfsnIXBC/AXU1S2ToYqxlAp9jywc=; b=SIBzo+TEq4sKDqeTXOmKvIDZUN
	0YObiow1VDKny6oeYVmmzDoTSiBWl5YV4AK3yjLDyaNVbEIVFUhMWDO+iSaTGhTTdbTsRgEZYNL4o
	+1Q1cYM3YW+dvaSnZ+BaeUhg4Hl/kIW8WJ0HrOGZS43FMQFodU9S9yEXlELnvRUuyoV0gGjqbDG7z
	qcbt564ztStvKkuC/byVAziDje1b5ogphErAIncV0OvfO5eRW+NKh3vVoMSdU0SF7LlMkmYVBN4Ht
	pQJ2pwIMX5iPlf13UvrkhdQOFQn9OG3KtfTQi+fvZcte3zB5mm/rJ3ukIYWUu63DhY6dnbY3697tk
	C88yWJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq6x-0000000EjBD-3wRe;
	Thu, 12 Jun 2025 22:09:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjd8-0000000DkMY-3Cwq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A2DB5C03B5;
	Thu, 12 Jun 2025 15:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C339C4CEEA;
	Thu, 12 Jun 2025 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741253;
	bh=q+Ksmp3kFe/2n+9tRqHIhnbRaQ8WfHecqvPh7RinC24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WK+7L1pncwJJLleN3YHC3MadeMv6BTEtYg+KiR9psiC+5ABhujrVMeTy2+sX8TpE9
	 ntJvIzgSlBL5EJaVcubeB0Fo6Oa589UFc5azQcbNANljfqLMJg6EVkbAKkLxoT1f5l
	 SKfGqx0c1yfRZxiACgM2HNdwEvzMg9KSPfDuVdJPQg22WG7CMGV9LleUkoG7yhsFN0
	 sJwreKZkUoYVKRcxAORzWOga/PMGb/Vzu7s/SHZgCqXLzwIEfG6VNv3GkvLagawKCq
	 +Ravog2sje2ujlGvsf1tdwanoMbDJWKPHMPrMXIqJq/5a2JhnjFP9A+S3jZHjDbv8R
	 HZ9zMWzs8w2dA==
Message-ID: <3db9ff0d-6bdf-4faa-b534-af7b7c5a235f@kernel.org>
Date: Thu, 12 Jun 2025 17:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
 <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081414_895605_8E64FE18 
X-CRM114-Status: GOOD (  14.49  )
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

On 28/05/2025 12:52, Umer Uddin wrote:
> The CMU_HSI1 block is used for providing clocks for the DesignWare
> MMC Controller, PCIE Subsystem and UFS subsystem, and has six
> dependency clocks from CMU_TOP.
> 
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  drivers/clk/samsung/clk-exynos990.c | 221 ++++++++++++++++++++++++++++
>  1 file changed, 221 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index 8d3f193d2..91ecbafcf 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -20,6 +20,7 @@
>  #define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
>  #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
>  #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
> +#define CLKS_NR_HSI1 (CLK_MOUT_HSI1_UFS_EMBD_USER + 1)
>  
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>  
> @@ -1483,6 +1484,222 @@ static void __init exynos990_cmu_peris_init(struct device_node *np)
>  CLK_OF_DECLARE(exynos990_cmu_peris, "samsung,exynos990-cmu-peris",
>  	       exynos990_cmu_peris_init);
>  
> +/* ---- CMU_HSI1 ------------------------------------------------------------ */
> +
> +/* Register Offset definitions for CMU_HSI1 (0x13000000) */
> +#define PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER												0x0600


This is way past coding style limit: 80.

This is way past hard cut-off: checkpatch.

> +#define PLL_CON1_MUX_CLKCMU_HSI1_BUS_USER												0x0604
> +#define PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER												0x0610
> +#define PLL_CON1_MUX_CLKCMU_HSI1_MMC_CARD_USER												0x0614
> +#define PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER												0x0620
> +#define PLL_CON1_MUX_CLKCMU_HSI1_PCIE_USER												0x0624
> +#define PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER												0x0630
> +#define PLL_CON1_MUX_CLKCMU_HSI1_UFS_CARD_USER												0x0634
> +#define PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER												0x0640
> +#define PLL_CON1_MUX_CLKCMU_HSI1_UFS_EMBD_USER												0x0644
> +#define HSI1_CMU_HSI1_CONTROLLER_OPTION													0x0800
> +#define CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PHY_REFCLK_IN									0x2000
> +#define CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_SUB_CTRL_INST_0_PHY_REFCLK_IN					0x2004
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_D_TZPC_HSI1_IPCLKPORT_PCLK									0x2008
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_GPIO_HSI1_IPCLKPORT_PCLK										0x200c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_HSI1_CMU_HSI1_IPCLKPORT_PCLK									0x2010
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHM_AXI_P_HSI1_IPCLKPORT_I_CLK									0x2014
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHS_ACEL_D_HSI1_IPCLKPORT_I_CLK									0x2018
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_I_ACLK										0x201c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_SDCLKIN									0x2020
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_DBI_ACLK									0x2024
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_IEEE1500_WRAPPER_FOR_PCIEG2_PHY_X1_INST_0_I_SCL_APB_PCLK			0x2028
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_MSTR_ACLK									0x202c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PCIE_SUB_CTRL_INST_0_I_DRIVER_APB_CLK						0x2030
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PIPE2_DIGITAL_X1_WRAP_INST_0_I_APB_PCLK_SCL					0x2034
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_SLV_ACLK									0x2038
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_PCIE_CTL_INST_0_DBI_ACLK_UG				0x203c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_PCIE_CTL_INST_0_MSTR_ACLK_UG				0x2040
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_PCIE_CTL_INST_0_SLV_ACLK_UG				0x2044
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_SUB_CTRL_INST_0_I_DRIVER_APB_CLK				0x2048
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0_PIPE_PAL_PCIE_INST_0_I_APB_PCLK				0x204c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0_SF_PCIEPHY000X2_LN07LPP_QCH_TM_WRAPPER_INST_0_I_APB_PCLK	0x2050

These names are not really useful. Please shorten them to 50-55 characters.

> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN2_IPCLKPORT_I_CLK									0x2054
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN4_0_IPCLKPORT_I_CLK									0x2058
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_ACLK										0x205c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_PCLK										0x2060
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_BUS_IPCLKPORT_CLK								0x2064
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_OSCCLK_IPCLKPORT_CLK								0x2068
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSMMU_HSI1_IPCLKPORT_CLK_S2									0x206c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSREG_HSI1_IPCLKPORT_PCLK									0x2070
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_ACLK										0x2074
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_CLK_UNIPRO									0x2078
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_FMP_CLK									0x207c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_ACLK										0x2080
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO									0x2084
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK									0x2088
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_VGEN_LITE_HSI1_IPCLKPORT_CLK									0x208c
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_D_HSI1_IPCLKPORT_ACLK										0x2090
> +#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_P_HSI1_IPCLKPORT_ACLK										0x2094
> +#define DMYQCH_CON_PCIE_GEN2_QCH_REF													0x3000
> +#define DMYQCH_CON_PCIE_GEN4_0_QCH_REF													0x3004
> +#define QCH_CON_D_TZPC_HSI1_QCH														0x3024
> +#define QCH_CON_GPIO_HSI1_QCH														0x3028
> +#define QCH_CON_HSI1_CMU_HSI1_QCH													0x302c
> +#define QCH_CON_LHM_AXI_P_HSI1_QCH													0x3030
> +#define QCH_CON_LHS_ACEL_D_HSI1_QCH													0x3034
> +#define QCH_CON_MMC_CARD_QCH														0x3038
> +#define QCH_CON_PCIE_GEN2_QCH_APB													0x303c
> +#define QCH_CON_PCIE_GEN2_QCH_DBI													0x3040
> +#define QCH_CON_PCIE_GEN2_QCH_MSTR	


Best regards,
Krzysztof

