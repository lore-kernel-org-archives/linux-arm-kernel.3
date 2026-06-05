Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F71CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHeuOlC/gaOtesZkFgqVr9DoEMDIdfxTclEETE4eqSU=; b=44MERNUDO5JBaGfFP0d30iPDmc
	drsLCn+obfCRv7PjWBXeMkYjwB1S2s0NbtuI39sS0C05Jg5cVNcl1Ifs5af9E3VJNMyOiL+y30rDN
	Taxgkf+Co8Pq20B0S430Vhm9WgHRvR8liESiEggchZ2DSuWsg8BXop67hs4/6t4dxNoSwIcZUJNtk
	xcZNb3LObEc0eFKEfn1ZmIj6kOiTcjAXWWuLoTtsbVxp46dUOhFyHj4pcrzI+91IOlfqb9EKfGTTo
	nc6nY3Yuq77Vz4DHSlmkcqW918TQJ9KluRe4JUoB8HUSgP7FmSt8FSlV+mn5yrNDRjqLoMpNipi2E
	c7mUfdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWam-00000000pz4-14tQ;
	Fri, 05 Jun 2026 15:36:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWai-00000000pxm-4A2a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:36:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D349C58479;
	Fri,  5 Jun 2026 15:36:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A1AB5FED1;
	Fri,  5 Jun 2026 15:36:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C996106A24F0;
	Fri,  5 Jun 2026 17:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780673767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FHeuOlC/gaOtesZkFgqVr9DoEMDIdfxTclEETE4eqSU=;
	b=LSb3DbXwWwWowFJQbUezIa1BBhdJR5igSpOLdXQsCT+BMkRWsdW44ijdI9dXSrrrcI8V3I
	ecL7Zv+Q2UVM43Odjp/o2hzqvGbJH9gcvwM6bdnjCKpscXz21KdbG5a15Kc6ylGOPoMikV
	/27OcnmIj1H+3ddtxGC9cfiTRCWoqBfbWXl8ciMGadarXoTP7kfh+SkJNF+NmdT7qNf3N7
	nOUpMyUSLjBesoK1WhJDphDI8xte4Zjy9kt1XGP1BSTgKvcUlm5wSd8QHvl7H5BQGa0SY4
	7tx4Gs7DtT2TfocD21W8eEKgMWx1a3Dd+/HcnhtEgGNrly28oFopJXpGDFJybQ==
Message-ID: <566af63b-05a9-43f8-94e9-19af737c848a@bootlin.com>
Date: Fri, 5 Jun 2026 17:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] net: pcs: pcs-xpcs-regmap: support XPCS
 memory-mapped MDIO bus via regmap
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-4-elder@riscstar.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260605010022.968612-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083613_974566_5EFEF305 
X-CRM114-Status: GOOD (  26.50  )
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

Hi Alex,

On 6/5/26 03:00, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> In some DesignWare XPCS implementatons the memory-mapped MDIO bus is
> allocated to a register window that does not align to a page boundary.
> This makes iomapping the registers problematic.
> 
> For example the Toshiba TC9564 (a PCIe Ethernet-AVB/TSN bridge) provides
> an "eMAC" subsystem with the XPCS base address cuddled up to XGMAC
> registers.
> 
> Let's introduce helpers to allow the driver that owns the eMAC to register
> an XPCS using is regmap for the memory-mapped MDIO bus.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                         |   2 +
>  drivers/net/pcs/Makefile            |   4 +-
>  drivers/net/pcs/pcs-xpcs-regmap.c   | 219 ++++++++++++++++++++++++++++
>  include/linux/pcs/pcs-xpcs-regmap.h |  20 +++
>  4 files changed, 243 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>  create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb8cdcc76324f..2aa6ea012c848 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25931,8 +25931,10 @@ F:	drivers/net/ethernet/synopsys/
>  SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
>  L:	netdev@vger.kernel.org
>  S:	Orphan
> +F:	drivers/net/pcs/pcs-xpcs-regmap.c
>  F:	drivers/net/pcs/pcs-xpcs.c
>  F:	drivers/net/pcs/pcs-xpcs.h
> +F	include/linux/pcs/pcs-xpcs-regmap.h
>  F:	include/linux/pcs/pcs-xpcs.h
>  
>  SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b900..565f1b63fce0b 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux PCS drivers
>  
> -pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> +pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-regmap.o \
> +				   pcs-xpcs-plat.o pcs-xpcs-wx.o
>  
>  obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
>  obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
> diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
> new file mode 100644
> index 0000000000000..55cd05d09c7db
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-regmap.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synopsys DesignWare XPCS regmap helpers
> + *
> + * Copyright (C) 2026 RISCstar Solutions.
> + * Copyright (C) 2024 Serge Semin
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mdio.h>
> +#include <linux/pcs/pcs-xpcs.h>
> +#include <linux/pcs/pcs-xpcs-regmap.h>
> +#include <linux/regmap.h>
> +
> +#include "pcs-xpcs.h"
> +
> +/* Page select register for the indirect MMIO CSRs access */
> +#define DW_VR_CSR_VIEWPORT		0xff
> +
> +struct dw_xpcs_regmap {
> +	struct device *dev;
> +	struct mii_bus *bus;
> +	struct regmap *regmap;
> +	bool reg_indir;
> +};
> +
> +static ptrdiff_t xpcs_regmap_addr_format(int dev, int reg)
> +{
> +	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
> +}
> +
> +static u16 xpcs_regmap_addr_page(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0x1fff00, csr);
> +}
> +
> +static ptrdiff_t xpcs_regmap_addr_offset(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0xff, csr);
> +}
> +
> +static int xpcs_regmap_read_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
> +					 int reg)
> +{
> +	ptrdiff_t csr, ofs;
> +	unsigned int val;
> +	u16 page;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	page = xpcs_regmap_addr_page(csr);
> +	ofs = xpcs_regmap_addr_offset(csr);
> +
> +	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
> +	if (res < 0)
> +		return res;
> +
> +	res = regmap_read(pxpcs->regmap, ofs, &val);
> +	if (res < 0)
> +		return res;
> +
> +	return val & 0xffff;
> +}
> +
> +static int xpcs_regmap_write_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
> +					  int reg, u16 val)
> +{
> +	ptrdiff_t csr, ofs;
> +	u16 page;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	page = xpcs_regmap_addr_page(csr);
> +	ofs = xpcs_regmap_addr_offset(csr);
> +
> +	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
> +	if (res < 0)
> +		return res;
> +
> +	return regmap_write(pxpcs->regmap, ofs, val);
> +}
> +
> +static int xpcs_regmap_read_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
> +				       int reg)
> +{
> +	unsigned int val;
> +	ptrdiff_t csr;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	res = regmap_read(pxpcs->regmap, csr, &val);
> +	if (res < 0)
> +		return res;
> +
> +	return val & 0xffff;
> +}
> +
> +static int xpcs_regmap_write_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
> +					int reg, u16 val)
> +{
> +	ptrdiff_t csr = xpcs_regmap_addr_format(dev, reg);
> +
> +	return regmap_write(pxpcs->regmap, csr, val);
> +}
> +
> +static int xpcs_regmap_read_c22(struct mii_bus *bus, int addr, int reg)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
> +	else
> +		return xpcs_regmap_read_reg_direct(pxpcs, MDIO_MMD_VEND2, reg);
> +}
> +
> +static int xpcs_regmap_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
> +	else
> +		return xpcs_regmap_write_reg_direct(pxpcs, MDIO_MMD_VEND2, reg, val);
> +}
> +
> +static int xpcs_regmap_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_read_reg_indirect(pxpcs, dev, reg);
> +	else
> +		return xpcs_regmap_read_reg_direct(pxpcs, dev, reg);
> +}
> +
> +static int xpcs_regmap_write_c45(struct mii_bus *bus, int addr, int dev,
> +				 int reg, u16 val)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_write_reg_indirect(pxpcs, dev, reg, val);
> +	else
> +		return xpcs_regmap_write_reg_direct(pxpcs, dev, reg, val);
> +}
> +
> +static void devm_xpcs_regmap_destroy(void *data)
> +{
> +	struct dw_xpcs *xpcs = data;
> +
> +	xpcs_destroy(xpcs);
> +}
> +
> +struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
> +					  const struct xpcs_regmap_config *config)
> +{
> +	static atomic_t id = ATOMIC_INIT(-1);
> +	struct dw_xpcs_regmap *pxpcs;
> +	struct dw_xpcs *xpcs;
> +	int ret;
> +
> +	pxpcs = devm_kzalloc(dev, sizeof(*pxpcs), GFP_KERNEL);
> +	if (!pxpcs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pxpcs->dev = dev;
> +	pxpcs->regmap = config->regmap;
> +	pxpcs->reg_indir = config->reg_indir;

Looking at the overall series, is there any reason for this flag ?

Looks like the reg_indir=false path isn't used at all in this series.

Maybe just drop it and let anyone add it back should the need arise ?

Maxime



