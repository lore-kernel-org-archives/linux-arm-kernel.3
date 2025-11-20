Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3179CF8553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy5ZvfIpknGPoEkjWobCuoNkvTas8+jRbS/yUx/XYdY=; b=OaYAnmbW0XdG3XNASzIjz+SQ2W
	LdYFLojp48SIg9XqfTpueuJABXiV1Cj2DLqsPKdHIE48CUTjqTTrrKeM+dISWmRq5K4Tofytwvtr7
	5QM5kb/q16DSPSFwXtQEi/Habx3E6lH60cdE+Y7RybLlJsQVqYmlOPjAvtxiLiRXz2aJQ1sROzJj4
	zxrKpwfvvMZhcAqgUbrKX9HC6LBczhEqcs5h+ILiCb0QmrCTnQlFbEgPXxYQq1dozWwmn4eKaSTsG
	+jAX3G/+RR7PVh/Yto0WOBmk6RUChrB0ZFXR3VjxbDXxV0msC4RHaulCfQ8Hr6eYz1Zc0dz6MwCSf
	HPQ88Nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzw2-00000006LW8-2Iwx;
	Thu, 20 Nov 2025 08:22:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzw0-00000006LW0-3RNE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 08:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B23A60007;
	Thu, 20 Nov 2025 08:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA0CC4CEF1;
	Thu, 20 Nov 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626951;
	bh=mpZu0ktxpqoi6wBOTW40n/VGccPjOU5UrOYLeN+2lZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1TvHTGSbNlCNHxPk/HbqHaJ4IK3YTfA4OCGzeos1AbWg6n5pBEm9L3vO160a7RjG
	 mrOiN1FbFHg+E0DKKSMqyrYyfbV40GVjftRGI+vcPQYk6xCV11xFRRL80y3QeKJUC1
	 xUx5X4/ykXyuypjNJDiEV2DSH/LyS14FdZnFYzcys8+077zdh7qw+LILQVJlpOHErJ
	 01MBOHBB0pK9oc+NswOAegoOXnry7/Loihh1U8OI3WMHVCCNY5590K2ZjaGEmY7C/s
	 vgwp4weMA3d/ty6FmkJD1WmUOMS8oFcVbTtGEQXVoy4jlV3pO+SmtiW2l0vPUUqy6x
	 b5lIyciC9Sh+Q==
Date: Thu, 20 Nov 2025 13:52:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Subject: Re: [PATCH 3/4 v5] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <qvpx4ys2jqqugfbcdwidwvklcatdqiwdxfjumn7ncbh7z6ef5n@sepvjsatmpbd>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
 <20251118160238.26265-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118160238.26265-4-vincent.guittot@linaro.org>
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

On Tue, Nov 18, 2025 at 05:02:37PM +0100, Vincent Guittot wrote:
> Add initial support of the PCIe controller for S32G Soc family. Only
> host mode is supported.
> 
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  drivers/pci/controller/dwc/Kconfig            |  10 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
>  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++++++
>  4 files changed, 423 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
>  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 349d4657393c..e276956c3fca 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
>  	  in order to enable device-specific features PCIE_TEGRA194_EP must be
>  	  selected. This uses the DesignWare core.
>  
> +config PCIE_NXP_S32G
> +	tristate "NXP S32G PCIe controller (host mode)"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	select PCIE_DW_HOST
> +	help
> +	  Enable support for the PCIe controller in NXP S32G based boards to
> +	  work in Host mode. The controller is based on DesignWare IP and
> +	  can work either as RC or EP. In order to enable host-specific
> +	  features PCIE_NXP_S32G must be selected.
> +
>  config PCIE_DW_PLAT
>  	bool
>  
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index 7ae28f3b0fb3..3301bbbad78c 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
>  obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
>  obj-$(CONFIG_PCIE_FU740) += pcie-fu740.o
>  obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
> +obj-$(CONFIG_PCIE_NXP_S32G) += pcie-nxp-s32g.o
>  obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
>  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
>  obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
> diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> new file mode 100644
> index 000000000000..81e35b6227d1
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2015-2016 Freescale Semiconductor, Inc.
> + * Copyright 2016-2023, 2025 NXP
> + */
> +
> +#ifndef PCIE_S32G_REGS_H
> +#define PCIE_S32G_REGS_H
> +
> +/* PCIe controller Sub-System */
> +
> +/* PCIe controller 0 General Control 1 */
> +#define PCIE_S32G_PE0_GEN_CTRL_1		0x50
> +#define DEVICE_TYPE_MASK			GENMASK(3, 0)
> +#define SRIS_MODE				BIT(8)
> +
> +/* PCIe controller 0 General Control 3 */
> +#define PCIE_S32G_PE0_GEN_CTRL_3		0x58
> +#define LTSSM_EN				BIT(0)
> +

Since this header is not used by other drivers as of now, I'd prefer moving
these definitions inside the driver.

> +#endif  /* PCI_S32G_REGS_H */
> diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> new file mode 100644
> index 000000000000..eaa6b5363afe
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCIe host controller driver for NXP S32G SoCs
> + *
> + * Copyright 2019-2025 NXP
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/memblock.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/pci.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include "pcie-designware.h"
> +#include "pcie-nxp-s32g-regs.h"
> +
> +struct s32g_pcie_port {
> +	struct list_head list;
> +	struct phy *phy;
> +};
> +
> +struct s32g_pcie {
> +	struct dw_pcie	pci;
> +	void __iomem *ctrl_base;
> +	struct list_head ports;
> +};
> +
> +#define to_s32g_from_dw_pcie(x) \
> +	container_of(x, struct s32g_pcie, pci)
> +
> +static void s32g_pcie_writel_ctrl(struct s32g_pcie *s32g_pp, u32 reg, u32 val)
> +{
> +	writel(val, s32g_pp->ctrl_base + reg);
> +}
> +
> +static u32 s32g_pcie_readl_ctrl(struct s32g_pcie *s32g_pp, u32 reg)
> +{
> +	return readl(s32g_pp->ctrl_base + reg);
> +}
> +
> +static void s32g_pcie_enable_ltssm(struct s32g_pcie *s32g_pp)
> +{
> +	u32 reg;
> +
> +	reg = s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_3);
> +	reg |= LTSSM_EN;
> +	s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_3, reg);
> +}
> +
> +static void s32g_pcie_disable_ltssm(struct s32g_pcie *s32g_pp)
> +{
> +	u32 reg;
> +
> +	reg = s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_3);
> +	reg &= ~LTSSM_EN;
> +	s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_3, reg);
> +}
> +
> +static int s32g_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct s32g_pcie *s32g_pp = to_s32g_from_dw_pcie(pci);
> +
> +	s32g_pcie_enable_ltssm(s32g_pp);
> +
> +	return 0;
> +}
> +
> +static void s32g_pcie_stop_link(struct dw_pcie *pci)
> +{
> +	struct s32g_pcie *s32g_pp = to_s32g_from_dw_pcie(pci);
> +
> +	s32g_pcie_disable_ltssm(s32g_pp);
> +}
> +
> +static struct dw_pcie_ops s32g_pcie_ops = {
> +	.start_link = s32g_pcie_start_link,
> +	.stop_link = s32g_pcie_stop_link,
> +};
> +
> +/* Configure the AMBA AXI Coherency Extensions (ACE) interface */
> +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_base_addr)
> +{
> +	u32 ddr_base_low = lower_32_bits(ddr_base_addr);
> +	u32 ddr_base_high = upper_32_bits(ddr_base_addr);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, 0x0);
> +
> +	/*
> +	 * Ncore is a cache-coherent interconnect module that enables the
> +	 * integration of heterogeneous coherent and non-coherent agents in
> +	 * the chip. Ncore Transactions to peripheral should be non-coherent
> +	 * or it might drop them.
> +	 *
> +	 * One example where this is needed are PCIe MSIs, which use NoSnoop=0
> +	 * and might end up routed to Ncore.

I don't think this statement is correct. No Snoop attribute is only applicable
to MRd/MWr operations and not applicable to MSIs. Also, you've marked the
controller as cache coherent in the binding, but this comment doesn't relate to
it.

> +	 * Define the start of DDR as seen by Linux as the boundary between
> +	 * "memory" and "peripherals", with peripherals being below.

Please mention what this configuration does and why it is necessary. This is not
clearly mentioned in the comment.

> +	 */
> +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_1_OFF,
> +			   (ddr_base_low & CFG_MEMTYPE_BOUNDARY_LOW_ADDR_MASK));
> +	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_2_OFF, ddr_base_high);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
> +static int s32g_init_pcie_controller(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct s32g_pcie *s32g_pp = to_s32g_from_dw_pcie(pci);
> +	u32 val;
> +
> +	/* Set RP mode */
> +	val = s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_1);
> +	val &= ~DEVICE_TYPE_MASK;
> +	val |= FIELD_PREP(DEVICE_TYPE_MASK, PCI_EXP_TYPE_ROOT_PORT);
> +
> +	/* Use default CRNS */

SRNS?

> +	val &= ~SRIS_MODE;
> +
> +	s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_1, val);
> +
> +	/*
> +	 * Make sure we use the coherency defaults (just in case the settings
> +	 * have been changed from their reset values)
> +	 */
> +	s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> +	val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> +	dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> +
> +	val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> +	val |= GEN3_RELATED_OFF_EQ_PHASE_2_3;
> +	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops s32g_pcie_host_ops = {
> +	.init = s32g_init_pcie_controller,
> +};
> +
> +static int s32g_init_pcie_phy(struct s32g_pcie *s32g_pp)
> +{
> +	struct dw_pcie *pci = &s32g_pp->pci;
> +	struct device *dev = pci->dev;
> +	struct s32g_pcie_port *port, *tmp;
> +	int ret;
> +
> +	list_for_each_entry(port, &s32g_pp->ports, list) {
> +		ret = phy_init(port->phy);
> +		if (ret) {
> +			dev_err(dev, "Failed to init serdes PHY\n");
> +			goto err_phy_revert;
> +		}
> +
> +		ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, 0);
> +		if (ret) {
> +			dev_err(dev, "Failed to set mode on serdes PHY\n");
> +			goto err_phy_exit;
> +		}
> +
> +		ret = phy_power_on(port->phy);
> +		if (ret) {
> +			dev_err(dev, "Failed to power on serdes PHY\n");
> +			goto err_phy_exit;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_phy_exit:
> +	phy_exit(port->phy);
> +
> +err_phy_revert:
> +	list_for_each_entry_continue_reverse(port, &s32g_pp->ports, list) {
> +		phy_power_off(port->phy);
> +		phy_exit(port->phy);
> +	}
> +
> +	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> +		list_del(&port->list);

Can't you use list_for_each_entry_safe_reverse() to combine both operations?

> +
> +	return ret;
> +}
> +
> +static void s32g_deinit_pcie_phy(struct s32g_pcie *s32g_pp)
> +{
> +	struct s32g_pcie_port *port, *tmp;
> +
> +	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list) {
> +		phy_power_off(port->phy);
> +		phy_exit(port->phy);
> +		list_del(&port->list);
> +	}
> +}
> +
> +static int s32g_pcie_init(struct device *dev, struct s32g_pcie *s32g_pp)
> +{
> +	int ret;
> +
> +	s32g_pcie_disable_ltssm(s32g_pp);
> +
> +	ret = s32g_init_pcie_phy(s32g_pp);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void s32g_pcie_deinit(struct s32g_pcie *s32g_pp)
> +{
> +	s32g_pcie_disable_ltssm(s32g_pp);
> +
> +	s32g_deinit_pcie_phy(s32g_pp);
> +}
> +
> +static int s32g_pcie_parse_port(struct s32g_pcie *s32g_pp, struct device_node *node)
> +{
> +	struct device *dev = s32g_pp->pci.dev;
> +	struct s32g_pcie_port *port;
> +	int num_lanes;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->phy = devm_of_phy_get(dev, node, NULL);
> +	if (IS_ERR(port->phy))
> +		return dev_err_probe(dev, PTR_ERR(port->phy),
> +				"Failed to get serdes PHY\n");
> +
> +	INIT_LIST_HEAD(&port->list);
> +	list_add_tail(&port->list, &s32g_pp->ports);
> +
> +	/*
> +	 * The DWC core initialization code cannot parse yet the num-lanes
> +	 * attribute in the Root Port node. The S32G only supports one Root
> +	 * Port for now so its driver can parse the node and set the num_lanes
> +	 * field of struct dwc_pcie before calling dw_pcie_host_init().

Please add TODO prefix so that it catches the eyes looking for improvements.

> +	 */
> +	if (!of_property_read_u32(node, "num-lanes", &num_lanes))
> +		s32g_pp->pci.num_lanes = num_lanes;
> +
> +	return 0;
> +}
> +
> +static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> +{
> +	struct s32g_pcie_port *port, *tmp;
> +	int ret = -ENOENT;
> +
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		if (!of_node_is_type(of_port, "pci"))
> +			continue;
> +
> +		ret = s32g_pcie_parse_port(s32g_pp, of_port);
> +		if (ret)
> +			goto err_port;
> +	}
> +
> +err_port:
> +	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> +		list_del(&port->list);
> +
> +	return ret;
> +}
> +
> +static int s32g_pcie_get_resources(struct platform_device *pdev,
> +				   struct s32g_pcie *s32g_pp)
> +{
> +	struct dw_pcie *pci = &s32g_pp->pci;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	pci->dev = dev;
> +	pci->ops = &s32g_pcie_ops;
> +
> +	s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +	if (IS_ERR(s32g_pp->ctrl_base))
> +		return PTR_ERR(s32g_pp->ctrl_base);
> +
> +	INIT_LIST_HEAD(&s32g_pp->ports);
> +
> +	ret = s32g_pcie_parse_ports(dev, s32g_pp);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"Failed to parse Root Port: %d\n", ret);
> +
> +	platform_set_drvdata(pdev, s32g_pp);

nit: move this to probe()

> +
> +	return 0;
> +}
> +
> +static int s32g_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct s32g_pcie *s32g_pp;
> +	struct dw_pcie_rp *pp;
> +	int ret;
> +
> +	s32g_pp = devm_kzalloc(dev, sizeof(*s32g_pp), GFP_KERNEL);
> +	if (!s32g_pp)
> +		return -ENOMEM;
> +
> +	ret = s32g_pcie_get_resources(pdev, s32g_pp);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_no_callbacks(dev);
> +	devm_pm_runtime_enable(dev);
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		goto err_pm_runtime_put;
> +
> +	ret = s32g_pcie_init(dev, s32g_pp);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	pp = &s32g_pp->pci.pp;
> +	pp->ops = &s32g_pcie_host_ops;
> +	pp->use_atu_msg = true;
> +
> +	ret = dw_pcie_host_init(pp);
> +	if (ret)
> +		goto err_pcie_deinit;
> +
> +	return 0;
> +
> +err_pcie_deinit:
> +	s32g_pcie_deinit(s32g_pp);
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +
> +static int s32g_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = &s32g_pp->pci;
> +
> +	return dw_pcie_suspend_noirq(pci);
> +}
> +
> +static int s32g_pcie_resume_noirq(struct device *dev)
> +{
> +	struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = &s32g_pp->pci;
> +
> +	return dw_pcie_resume_noirq(pci);
> +}
> +
> +static const struct dev_pm_ops s32g_pcie_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(s32g_pcie_suspend_noirq,
> +				  s32g_pcie_resume_noirq)
> +};
> +
> +static const struct of_device_id s32g_pcie_of_match[] = {
> +	{ .compatible = "nxp,s32g2-pcie" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, s32g_pcie_of_match);
> +
> +static struct platform_driver s32g_pcie_driver = {
> +	.driver = {
> +		.name	= "s32g-pcie",
> +		.of_match_table = s32g_pcie_of_match,
> +		.suppress_bind_attrs = true,
> +		.pm = pm_sleep_ptr(&s32g_pcie_pm_ops),
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe = s32g_pcie_probe,
> +};
> +
> +module_platform_driver(s32g_pcie_driver);

builtin_platform_driver() since this controller implements MSI controller.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

