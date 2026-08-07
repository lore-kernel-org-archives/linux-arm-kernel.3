Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A05C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUHFsx+PJg3aBK5v0PAYLEFmVL5S7vEOMhoPgycQYzY=; b=HFItZHAsNsYrHaKr/EySQ2WCmi
	kpFgeWEbX2Ibfdv/jM+cUQsr1zYOwXB0IkmHW1tauSZcGj+lN2G//cyPGNnSLTj6h9f44Ns/EVZmL
	3nl0ljOGkah0k7caw9OTfJs4kkb93ON9ciCcvaunybkhr7k43s61wvZMGO01lhvTRa0ffnYCOnofP
	zkWw1pEqzHLy5IwI+XnCDZZ2GMK+5mEVyhb6bXR8SDI42Xm/SZxUEaTpVFsBW0rabvwkuvMkW+TMJ
	z/yWNiIz/5bApK17g0fgmN0rNpiPumJVlxt3W9ZV6IRPHMZyH+t8EFp/tf9X/nQy70n0rGj+qcpjT
	zg1BxI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHdb-00000007eJg-2ecN;
	Fri, 07 Aug 2026 10:17:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHda-00000007eJE-2xAJ;
	Fri, 07 Aug 2026 10:17:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47800438DB;
	Fri,  7 Aug 2026 10:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775DC1F000E9;
	Fri,  7 Aug 2026 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786097834;
	bh=hUHFsx+PJg3aBK5v0PAYLEFmVL5S7vEOMhoPgycQYzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XFEb04/biKeSZU6PfRRDBCFDpF0swdthtXbgW/4JftxL/H65iwqY52zLgqhChQwt0
	 2iagQY49RkbjCL12smw17Z/2TOYSu3UkKZYzFtQbqgJhlmWrFf61PWOM9aGXk4qG/j
	 R5l+b/0Oc5LAJYjicsd9aadPkegn2ZBq2u88YH7OvrwXloK3r0EJukgg06wxHcWyVq
	 E4WTi5nBZg5SVcmg74F5FZbvAdK2p3iJ4rZW9zvVvbLAjFFn/fqkdHpcJyrOexa+qC
	 gXnVW2Tiis/K/h8i6d3T5W5UHk6fsYixXuAP6cPDMzZn848eUaY891mMU4DPIv7418
	 lRP6kR16xv+KA==
Date: Fri, 7 Aug 2026 12:17:03 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v3 2/2] phy: mediatek: Add support for PCI-Express Gen4
 S-PHY
Message-ID: <l3rdxgnhhalstuxsytsofd45nxa6uiulficlvhfltqazcclonu@3l3idggohsd4>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720152654.92216-3-angelogioacchino.delregno@collabora.com>
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

On Mon, Jul 20, 2026 at 05:26:54PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the PCI-Express Gen4 S-PHY found in the latest
> MediaTek SoCs, including MT8196, MT8894 and similar.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/Kconfig             |   9 +
>  drivers/phy/mediatek/Makefile            |   1 +
>  drivers/phy/mediatek/phy-mtk-pcie-sphy.c | 556 +++++++++++++++++++++++
>  3 files changed, 566 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c
> 
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index ba6461350951..77236f3084c8 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -13,6 +13,15 @@ config PHY_MTK_PCIE
>  	  callback for PCIe GEN3 port, it supports software efuse
>  	  initialization.
>  
> +config PHY_MTK_PCIE_SPHY
> +	tristate "MediaTek PCIe S-PHY Driver"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Say 'Y' here to add support for MediaTek PCIe S-PHY driver for

I think this part got cargo culted from existing help texts, but this should not
mention 'Y' as this driver is a tristate.

> +	  PCI-Express Gen4 controllers as found in MT6991, MT8196 and others.

MT6991 is not mentioned in the patch description. So wondering if this is a
mistake or not.

> +
>  config PHY_MTK_XFI_TPHY
>  	tristate "MediaTek 10GE SerDes XFI T-PHY driver"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index ed0da708759b..7e984c7cfea3 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -5,6 +5,7 @@
>  
>  obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
>  obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
> +obj-$(CONFIG_PHY_MTK_PCIE_SPHY)		+= phy-mtk-pcie-sphy.o
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
>  obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> diff --git a/drivers/phy/mediatek/phy-mtk-pcie-sphy.c b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
> new file mode 100644
> index 000000000000..853aafa18259
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

nit: Odd indent and missing 'Author:'

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "phy-mtk-io.h"
> +
> +/* PHY System Interface (SIF) registers */
> +#define PEXTP_DIG_GLB_TOP				0x20
> +#  define RG_XTP_BYPASS_PIPE_RST_RC			BIT(17)
> +#define PEXTP_DIG_GLB_CKBG0				0x30
> +#  define RG_XTP_CKBG_XTAL_STABLE_TIME_SEL		GENMASK(25, 16)
> +#define PEXTP_DIG_GLB_TPLL_CTL0				0x38
> +#  define RG_XTP_TPLL_SET_STABLE_TIME_SEL		GENMASK(7, 2)
> +#  define RG_XTP_TPLL_PWE_ON_STABLE_TIME_SEL		GENMASK(9, 8)
> +#define PEXTP_DIG_GLB_CLKREQ_CTL			0x50
> +#  define RG_XTP_CKM_EN_L1S0				BIT(13)
> +#  define RG_XTP_CKM_EN_L1S1				BIT(14)
> +#define PEXTP_DIG_GLB_TPLL_CTL2				0xf4
> +#  define RG_XTP_TPLL_ISO_EN_STABLE_TIME_SEL		GENMASK(13, 12)
> +
> +/* PHY System Interface Digital registers */
> +#define PEXTP_DIG_LN_TRX_PIPE_IF_17			0x30e8
> +#  define RG_XTP_LN_RX_LF_CTLE_CSEL_GEN4		GENMASK(14, 12)
> +#define PEXTP_DIG_LN_RX_F0				0x50f0
> +#  define RG_XTP_LN_RX_GEN1_CTLE1_CSEL			GENMASK(3, 0)
> +#  define RG_XTP_LN_RX_GEN2_CTLE1_CSEL			GENMASK(7, 4)
> +#  define RG_XTP_LN_RX_GEN3_CTLE1_CSEL			GENMASK(11, 8)
> +#  define RG_XTP_LN_RX_GEN4_CTLE1_CSEL			GENMASK(15, 12)
> +#define PEXTP_DIG_LN_RX2_AEQ_EDGE_0			0x6004
> +#  define RG_XTP_LN_RX_AEQ_EGEQ_RATIO_GEN3		GENMASK(21, 16)
> +#  define RG_XTP_LN_RX_AEQ_EGEQ_RATIO_GEN4		GENMASK(29, 24)
> +
> +/* PHY System Interface Analog registers */
> +#define PEXTP_ANA_GLB_TPLL1_RSVD			0x902c
> +#  define RG_XTP_GLB_TPLL1_P_PATH_GAIN			GENMASK(2, 0)
> +#define PEXTP_ANA_GLB_BIAS_0				0x9060
> +#  define RG_XTP_GLB_BIAS_INTR_CTRL			GENMASK(5, 0)
> +#define PEXTP_ANA_GLB_BIAS_1				0x90c0
> +#  define RG_XTP_GLB_BIAS_V2V_VTRIM			GENMASK(9, 6)
> +#define PEXTP_ANA_LN_TRX_0C				0xa00c
> +#  define RG_XTP_LN_TX_RSWN_IMPSEL			GENMASK(20, 16)
> +#define PEXTP_ANA_LN_TRX_34				0xa034
> +#  define RG_XTP_LN_RX_FE				BIT(15)
> +#define PEXTP_ANA_LN_TRX_6C				0xa06c
> +#  define RG_XTP_LN_RX_AEQ_CTLE_ERR_TYPE		GENMASK(14, 13)
> +#   define AEQ_CTLE_SEARCH_ERR_TYPE_H1P5		0
> +#   define AEQ_CTLE_SEARCH_ERR_TYPE_H1P5_H2P5		1
> +#   define AEQ_CTLE_SEARCH_ERR_TYPE_P1P5_H2P5_H3P5	2
> +#define PEXTP_ANA_LN_TRX_A0				0xa0a0
> +#  define RG_XTP_LN_TX_IMPSEL_PMOS			GENMASK(4, 0)
> +#  define RG_XTP_LN_TX_IMPSEL_NMOS			GENMASK(11, 7)
> +#  define RG_XTP_LN_RX_IMPSEL				GENMASK(15, 12)
> +#define PEXTP_ANA_LN_TRX_A8				0xa0a8
> +#  define RG_XTP_LN_RX_LEQ_RL_CTLE_CAL			GENMASK(6, 2)
> +#  define RG_XTP_LN_RX_LEQ_RL_VGA_CAL			GENMASK(11, 7)
> +#  define RG_XTP_LN_RX_LEQ_RL_DFE_CAL			GENMASK(23, 19)
> +#define PEXTP_DIG_LN_TX_LC_TABLE_RSWN_4			0xb004
> +#define PEXTP_DIG_LN_TX_LC_TABLE_RSWN_8			0xb008
> +#define PEXTP_DIG_LN_TX_LC_TABLE_RSWN_C			0xb00c
> +#define PEXTP_DIG_LN_TX_LC_TABLE_RSWN_10		0xb010
> +#define PEXTP_DIG_LN_TX_LC_TABLE_RSWN_14		0xb014
> +#define PEXTP_DIG_LN_TX_LC_TABLE_RSWN_18		0xb018
> +#  define RG_XTP_LN_TX_LC_PRESET_MGx_Px_CM1		GENMASK(5, 0)
> +#  define RG_XTP_LN_TX_LC_PRESET_MGx_Px_C0		GENMASK(13, 8)
> +#  define RG_XTP_LN_TX_LC_PRESET_MGx_Px_CP1		GENMASK(21, 16)
> +#define PEXTP_REG_LANE(x)				((x) * 0x100)
> +
> +/* PHY Clock Management (CKM) registers */
> +#define XTP_CKM_FORCE_6					0x38
> +#  define RG_CKM_BIAS_WAIT_PRD_US			GENMASK(21, 16)
> +#define XTP_CKM_REG_SPLL_FBKDIV_5			0xd4
> +#  define RG_CKM_CKTX_IMPSEL_PMOS			GENMASK(19, 16)
> +#  define RG_CKM_CKTX_IMPSEL_NMOS			GENMASK(23, 20)
> +#  define RG_CKM_CKTX_IMPSEL_SW				GENMASK(27, 24)
> +
> +/* Calibration data from eFuses */
> +#define MTK_PCIE_SPHY_CALIBRATION_MAX_DATA_LANES	2
> +#define MTK_PCIE_SPHY_CALIBRATION_LAST_QUIRK_VER	4
> +
> +/**
> + * struct mtk_pcie_sphy_imp_sel - Impedance Selection parameters
> + * @pmos: Impedance selection for P-Channel MOSFET
> + * @nmos: Impedance selection for N-Channel MOSFET
> + */
> +struct mtk_pcie_sphy_imp_sel {
> +	u8 pmos;
> +	u8 nmos;
> +};
> +
> +/**
> + * struct mtk_pcie_sphy_efuse - eFuse calibration data for S-PHY
> + * @int_r_ctrl:     Internal resistor selection of TX Bias Current
> + * @xtp_vtrim:      XTP Bias V2V voltage calibration
> + * @cktx_impsel:    SPLL CKTX Impedance Selection (P and N MOSFET)
> + * @cktx_r_mid:     SPLL CKTX Intermediate Transition Impedance (Rmid)
> + * @rx_leq_rl_ctle: RX Front-End Return Loss Continuous Time Linear Equalization value
> + * @rx_leq_rl_vga:  RX Front-End Return Loss Variable Gain Amplifier value
> + * @rx_leq_rl_dfe:  RX Front-End Return Loss Decision Feedback Equalization value
> + * @rx_impsel:      RX Impedance Selection
> + * @tx_impsel:      TX Impedance Selection (P and N MOSFET)
> + * @tx_rswn_impsel: TX RSWn (Switch Resistance) impedance selection
> + * @supported:      eFuse calibration data is supported
> + */
> +struct mtk_pcie_sphy_efuse {
> +	u8 int_r_ctrl;
> +	u8 xtp_vtrim;
> +	struct mtk_pcie_sphy_imp_sel cktx_impsel;
> +	u8 cktx_r_mid;
> +	u8 rx_leq_rl_ctle;
> +	u8 rx_leq_rl_vga;
> +	u8 rx_leq_rl_dfe;
> +	u8 rx_impsel;
> +	struct mtk_pcie_sphy_imp_sel tx_impsel;
> +	u8 tx_rswn_impsel[MTK_PCIE_SPHY_CALIBRATION_MAX_DATA_LANES];

Nit: Unless really required, move the u8 members after all structs to avoid
holes.

> +	bool supported;
> +};
> +

[...]

> +static int mtk_pcie_sphy_get_calibration_data(struct mtk_pcie_sphy *pcie_sphy)
> +{
> +	struct mtk_pcie_sphy_efuse *cal = &pcie_sphy->calibration;
> +	struct device *dev = pcie_sphy->dev;
> +	u8 version;
> +	int ret;
> +
> +	if (pcie_sphy->num_lanes > MTK_PCIE_SPHY_CALIBRATION_MAX_DATA_LANES) {
> +		dev_info(dev, "Skipping PHY calibration for more than %u lanes.\n",
> +			 MTK_PCIE_SPHY_CALIBRATION_MAX_DATA_LANES);
> +		ret = -EOPNOTSUPP;
> +		goto end;
> +	}
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "int-r",
> +					     FIELD_MAX(RG_XTP_GLB_BIAS_INTR_CTRL));
> +	if (ret < 0)
> +		goto end;
> +	cal->int_r_ctrl = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "xtp-vtrim",
> +					     FIELD_MAX(RG_XTP_GLB_BIAS_V2V_VTRIM));
> +	if (ret < 0)
> +		goto end;
> +	cal->xtp_vtrim = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "cktx-pmos",
> +					     FIELD_MAX(RG_CKM_CKTX_IMPSEL_PMOS));
> +	if (ret < 0)
> +		goto end;
> +	cal->cktx_impsel.pmos = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "cktx-nmos",
> +					     FIELD_MAX(RG_CKM_CKTX_IMPSEL_NMOS));
> +	if (ret < 0)
> +		goto end;
> +	cal->cktx_impsel.nmos = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "cktx-r-mid",
> +					     FIELD_MAX(RG_CKM_CKTX_IMPSEL_SW));
> +	if (ret < 0)
> +		goto end;
> +	cal->cktx_r_mid = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "rxfe-lanes-rl-ctle",
> +					     FIELD_MAX(RG_XTP_LN_RX_LEQ_RL_CTLE_CAL));
> +	if (ret < 0)
> +		goto end;
> +	cal->rx_leq_rl_ctle = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "rxfe-lanes-rl-vga",
> +					     FIELD_MAX(RG_XTP_LN_RX_LEQ_RL_VGA_CAL));
> +	if (ret < 0)
> +		goto end;
> +	cal->rx_leq_rl_vga = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "rxfe-lanes-rl-dfe",
> +					     FIELD_MAX(RG_XTP_LN_RX_LEQ_RL_DFE_CAL));
> +	if (ret < 0)
> +		goto end;
> +	cal->rx_leq_rl_dfe = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "rx-lanes-imp",
> +					     FIELD_MAX(RG_XTP_LN_RX_IMPSEL));
> +	if (ret < 0)
> +		goto end;
> +	cal->rx_impsel = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-lanes-pmos",
> +					     FIELD_MAX(RG_XTP_LN_TX_IMPSEL_PMOS));
> +	if (ret < 0)
> +		goto end;
> +	cal->tx_impsel.pmos = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-lanes-nmos",
> +					     FIELD_MAX(RG_XTP_LN_TX_IMPSEL_NMOS));
> +	if (ret < 0)
> +		goto end;
> +	cal->tx_impsel.nmos = ret;
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-ln0-rswn",
> +					     FIELD_MAX(RG_XTP_LN_TX_RSWN_IMPSEL));
> +	if (ret < 0)
> +		goto end;
> +	cal->tx_rswn_impsel[0] = ret;
> +
> +	if (pcie_sphy->num_lanes == 2) {
> +		ret = mtk_pcie_sphy_get_one_cal_para(dev, "tx-ln1-rswn",
> +						     FIELD_MAX(RG_XTP_LN_TX_RSWN_IMPSEL));
> +		if (ret < 0)
> +			goto end;
> +		cal->tx_rswn_impsel[1] = ret;
> +	}
> +
> +	ret = mtk_pcie_sphy_get_one_cal_para(dev, "cal-version", 15);
> +	if (ret < 0)
> +		goto end;
> +	version = ret;
> +
> +	/* Quirk for eFuse calibration table versions 0 to 4 */
> +	if ((version <= MTK_PCIE_SPHY_CALIBRATION_LAST_QUIRK_VER) &&
> +	    cal->rx_leq_rl_ctle == 10) {
> +		cal->rx_leq_rl_vga = cal->rx_leq_rl_ctle;
> +		cal->rx_leq_rl_dfe = cal->rx_leq_rl_ctle;
> +	}
> +
> +end:
> +	if (ret < 0) {
> +		/*
> +		 * If any of the calibration values is missing, or if there is
> +		 * no calibration at all in the eFuses, this is not a problem,
> +		 * as the PHY doesn't require one to actually work.
> +		 */
> +		if (ret == -ENOENT || ret == -EOPNOTSUPP) {
> +			cal->supported = false;
> +			return 0;

If any of the above calibration values are missing, you are returning success
here instead of trying next calibration. Is it because if one is missing, all
others will also be missing? I don't think this assumption is correct.

> +		}
> +		return ret;
> +	};
> +	cal->supported = true;
> +
> +	return 0;
> +}
> +
> +static int mtk_pcie_sphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +	struct mtk_pcie_sphy *pcie_sphy;
> +	u32 num_lanes;
> +	int ret;
> +
> +	pcie_sphy = devm_kzalloc(dev, sizeof(*pcie_sphy), GFP_KERNEL);
> +	if (!pcie_sphy)
> +		return -ENOMEM;
> +
> +	pcie_sphy->sif_base = devm_platform_ioremap_resource_byname(pdev, "sif");
> +	if (IS_ERR(pcie_sphy->sif_base))
> +		return dev_err_probe(dev, PTR_ERR(pcie_sphy->sif_base),
> +				     "Failed to map phy-sif base\n");
> +
> +	pcie_sphy->ckm_base = devm_platform_ioremap_resource_byname(pdev, "ckm");
> +	if (IS_ERR(pcie_sphy->ckm_base))
> +		return dev_err_probe(dev, PTR_ERR(pcie_sphy->ckm_base),
> +				     "Failed to map phy-ckm base\n");
> +
> +	pcie_sphy->phy = devm_phy_create(dev, dev->of_node, &mtk_pcie_sphy_ops);
> +	if (IS_ERR(pcie_sphy->phy))
> +		return dev_err_probe(dev, PTR_ERR(pcie_sphy->phy),
> +				     "Failed to create PCIe phy\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
> +	if (ret)
> +		num_lanes = 1;
> +	else if (num_lanes > 4)
> +		return dev_err_probe(dev, -EINVAL, "Invalid number of lanes.\n");
> +
> +	pcie_sphy->num_lanes = num_lanes;
> +	pcie_sphy->dev = dev;
> +
> +	ret = mtk_pcie_sphy_get_calibration_data(pcie_sphy);
> +	if (ret)
> +		return ret;
> +
> +	phy_set_drvdata(pcie_sphy->phy, pcie_sphy);
> +

Add pm_runtime_no_callbacks()

> +	ret = devm_pm_runtime_enable(dev);

Is the PHY already ON at this point? I don't see power_on() callback in this
driver, so it should be ON? If so, you should do
devm_pm_runtime_set_active_enabled() instead.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

