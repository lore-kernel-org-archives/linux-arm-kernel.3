Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1B9CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i87Vh+dTLbpXFKETkPxqqgMDVzPbOtus/f00ro6pLrk=; b=03Lq/4uWKiC3kRQz8jvt11q7EK
	scxptXqD28mx26zre0vBnB5tzaYJLMe39ddoQFVoqRcCyb4w8QTdYb0T0Ip1Wm8Hr/X5GC4LKyd1O
	I3hELG0am7CB8tX9Unpqun37b4H+ZmBLklSWc/1Yb0QC5nm0JvmgGtneNfQTzDxObDWDonuKd1Ykd
	+fNSK7XM40QKAJnqi65oKz+o2OMfPkAnvAJXzmYkfkdvYIKNNmoFsPKjb+bm58s6E8ZRcsPpKhcQP
	pnjV8QSBxnQ53rFmT/ZGA4LgGrvO6AVZAGguqfEQ2fgMKVMg4tWR4NbuBsY3I/4jQFw/KmKjXmOyM
	Z2zYwabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BCM-00000002C63-0LZ0;
	Mon, 29 Sep 2025 10:33:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BCE-00000002C09-0Za2;
	Mon, 29 Sep 2025 10:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759142008;
	bh=VnSH6QTa5NpwE1TNlzdQCXuXVLs4Gn0vTe5U6PFFyig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PMayS3MeXGIR3X4kukcqHEuV7MXltaopARkXd3WrmcEx/bMqdlh7Vw2I5czb3ZWQ0
	 7dmnejiiyauAFmNf39VDrwELTBTB4Aadtulxe/AMyuNFD1k2FBFFNilXcYmhdnERrd
	 d8BDoZNIgfj5fA+KGVsU9bSRVt8d4Zd8Z3kwQbfwxc+gHMrQimIC/Emol81/qv5Zlq
	 LpFgbyomMCmNSrhsHfeuYgukjxcAiKBJGsoAzgECpRPbbZNPWiE8NEDJ6JQF52+Jnx
	 J7OjN0OhQCypMxq/er9JTYfaBm8AWyfRS4Dg3T1Ohk3GUx+rrFSsy1CniTn8hAqrDM
	 Zmmp3W7/4uSfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A23F017E108C;
	Mon, 29 Sep 2025 12:33:27 +0200 (CEST)
Message-ID: <b62611ef-7ead-4bbe-8c96-d39e3c5c8dd8@collabora.com>
Date: Mon, 29 Sep 2025 12:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jjian Zhou <jjian.zhou@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250926090505.26267-1-jjian.zhou@mediatek.com>
 <20250926090505.26267-3-jjian.zhou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250926090505.26267-3-jjian.zhou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_033330_375409_EA055737 
X-CRM114-Status: GOOD (  35.06  )
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

Il 26/09/25 11:05, Jjian Zhou ha scritto:
> Add mtk-vcp-mailbox driver to support the communication with
> VCP remote microprocessor.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>   drivers/mailbox/Kconfig                 |   9 ++
>   drivers/mailbox/Makefile                |   2 +
>   drivers/mailbox/mtk-vcp-mailbox.c       | 168 ++++++++++++++++++++++++
>   include/linux/mailbox/mtk-vcp-mailbox.h |  32 +++++
>   4 files changed, 211 insertions(+)
>   create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
>   create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 02432d4a5ccd..c28bdb855663 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -294,6 +294,15 @@ config MTK_CMDQ_MBOX
>   	  critical time limitation, such as updating display configuration
>   	  during the vblank.
>   
> +config MTK_VCP_MBOX
> +	tristate "MediaTek VCP Mailbox Support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  Say yes here to add support for the MediaTek VCP mailbox driver.
> +	  The mailbox implementation provides access from the application
> +	  processor to Video Companion Processor Unit.
> +	  If unsure say N.
> +
>   config ZYNQMP_IPI_MBOX
>   	tristate "Xilinx ZynqMP IPI Mailbox"
>   	depends on ARCH_ZYNQMP && OF
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 98a68f838486..07278871d254 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -63,6 +63,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
>   
>   obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
>   
> +obj-$(CONFIG_MTK_VCP_MBOX)	+= mtk-vcp-mailbox.o
> +
>   obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
>   
>   obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
> diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-mailbox.c
> new file mode 100644
> index 000000000000..a2a80d124e50
> --- /dev/null
> +++ b/drivers/mailbox/mtk-vcp-mailbox.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
> + * Author: Jjian Zhou <jjian.zhou.@mediatek.com>
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-vcp-mailbox.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct mtk_vcp_mbox {
> +	struct mbox_controller mbox;
> +	void __iomem *base;
> +	struct device *dev;
> +	const struct mtk_vcp_mbox_cfg *cfg;
> +	struct mtk_ipi_info ipi_recv;
> +	struct mbox_chan chans;
> +};
> +
> +struct mtk_vcp_mbox_cfg {
> +	u32 set_in;
> +	u32 clr_out;

u16 is enough for both register offsets, at least for now - and I suspect it's
going to be enough forever.

> +};
> +
> +static irqreturn_t mtk_vcp_mbox_irq_thread(int irq, void *data)
> +{
> +	struct mtk_vcp_mbox *priv = data;
> +
> +	/* get irq status */
> +	priv->ipi_recv.irq_status = readl(priv->base + priv->cfg->clr_out);
> +
> +	__ioread32_copy(priv->ipi_recv.msg, priv->base, MBOX_SLOT_MAX_SIZE / 4);
> +
> +	mbox_chan_received_data(&priv->chans, &priv->ipi_recv);
> +
> +	/* clear irq status */
> +	writel(priv->ipi_recv.irq_status, priv->base + priv->cfg->clr_out);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox,
> +					    const struct of_phandle_args *sp)
> +{
> +	if (sp->args_count)
> +		return NULL;
> +
> +	return &mbox->chans[0];
> +}
> +
> +static int mtk_vcp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct mtk_vcp_mbox *priv = chan->con_priv;
> +	struct mtk_ipi_info *ipi_info = data;
> +	u32 status;
> +
> +	if (!ipi_info->msg) {
> +		dev_err(priv->dev, "msg buffer is NULL.\n");
> +		return -EINVAL;
> +	}
> +
> +	status = readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->index);

status = readl(priv->base + priv->cfg->set_in);
if (status & BIT(ipi_info->index) {
  ....
}

> +	if (status) {
> +		dev_warn(priv->dev, "mailbox IPI %d is busy.\n", ipi_info->id);
> +		return -EBUSY;
> +	}
> +
> +	if (ipi_info->slot_ofs + ipi_info->len > MBOX_SLOT_MAX_SIZE)
> +		return -EINVAL;
> +	__iowrite32_copy(priv->base + ipi_info->slot_ofs, ipi_info->msg,
> +			 ipi_info->len);
> +
> +	writel(BIT(ipi_info->index), priv->base + priv->cfg->set_in);
> +
> +	return 0;
> +}
> +
> +static bool mtk_vcp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct mtk_ipi_info *ipi_info = chan->active_req;
> +	struct mtk_vcp_mbox *priv = chan->con_priv;
> +
> +	return !(readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->index));
> +}
> +
> +static const struct mbox_chan_ops mtk_vcp_mbox_chan_ops = {
> +	.send_data	= mtk_vcp_mbox_send_data,
> +	.last_tx_done	= mtk_vcp_mbox_last_tx_done,
> +};
> +
> +static int mtk_vcp_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_vcp_mbox *priv;
> +	struct mbox_controller *mbox;
> +	int ret, irq;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->chans.con_priv = priv;
> +	mbox = &priv->mbox;
> +	mbox->dev = dev;
> +	mbox->ops = &mtk_vcp_mbox_chan_ops;
> +	mbox->txdone_irq = false;
> +	mbox->txdone_poll = true;
> +	mbox->of_xlate = mtk_vcp_mbox_xlate;
> +	mbox->num_chans = 1;
> +	mbox->chans = &priv->chans;
> +
> +	priv->ipi_recv.msg = devm_kzalloc(dev, MBOX_SLOT_MAX_SIZE, GFP_KERNEL);
> +	if (!priv->ipi_recv.msg)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->cfg = of_device_get_match_data(dev);
> +	if (!priv->cfg)
> +		return -EINVAL;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +

Please set the driver data before requesting the interrupt: what happens if the
ISR is run before having driver data available otherwise?! :-)

> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					mtk_vcp_mbox_irq_thread, IRQF_ONESHOT,
> +					dev_name(dev), priv);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return devm_mbox_controller_register(dev, &priv->mbox);
> +}
> +
> +static const struct mtk_vcp_mbox_cfg mt8196_cfg = {
> +	.set_in		= 0x100,
> +	.clr_out	= 0x10c,
> +};
> +
> +static const struct of_device_id mtk_vcp_mbox_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-vcp-mbox", .data = &mt8196_cfg },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_vcp_mbox_of_match);
> +
> +static struct platform_driver mtk_vcp_mbox_driver = {
> +	.probe		= mtk_vcp_mbox_probe,
> +	.driver = {
> +		.name	= "mtk_vcp_mbox",
> +		.of_match_table = mtk_vcp_mbox_of_match,
> +	},
> +};
> +module_platform_driver(mtk_vcp_mbox_driver);
> +
> +MODULE_AUTHOR("Jjian Zhou <jjian.zhou@mediatek.com>");
> +MODULE_DESCRIPTION("MTK VCP Mailbox Controller");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mailbox/mtk-vcp-mailbox.h b/include/linux/mailbox/mtk-vcp-mailbox.h
> new file mode 100644
> index 000000000000..143fb0d06e30
> --- /dev/null
> +++ b/include/linux/mailbox/mtk-vcp-mailbox.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_VCP_MAILBOX_H__
> +#define __MTK_VCP_MAILBOX_H__
> +
> +#define MBOX_SLOT_MAX_SIZE	0x100 /* mbox max slot size */

Please, change this definition to MTK_VCP_MBOX_SLOT_MAX_SIZE

Cheers,
Angelo

> +
> +/**
> + * struct mtk_ipi_info - mailbox message info for mtk-vcp-mailbox
> + * @msg: The share buffer between IPC and mailbox driver
> + * @len: Message length
> + * @id: This is for identification purposes and not actually used
> + *	by the mailbox hardware.
> + * @index: The signal number of the mailbox message.
> + * @slot_ofs: Data slot offset.
> + * @irq_status: Captures incoming signals for the RX path.
> + *
> + * It is used between IPC with mailbox driver.
> + */
> +struct mtk_ipi_info {
> +	void *msg;
> +	u32 len;
> +	u32 id;
> +	u32 index;
> +	u32 slot_ofs;
> +	u32 irq_status;
> +};
> +
> +#endif


