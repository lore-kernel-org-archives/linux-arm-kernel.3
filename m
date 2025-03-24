Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CCEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuR4aKvxuRyKXZs6RIgK2lyca63MOhkPXIKR+BhI87U=; b=J2iQU2caEBIuJtWHmSg148xtg7
	c3ycFtDOX5JhKXb8DsKsRhwEu7zFah/ANmDRsoVLQmOUvg/L6z0eALIka9X8o6QQNXsRaA6gRgCdu
	flYTAOM10k+qdbwcY105W8PTe38BJHYH1ILCGzM+sgKof0MHIv4EnlDwRTF/oXs8WOiVZO6GsnSrT
	vu/XE2uUcxNIi4RabZ2yCes1SR5NNgYhxqbM3TSPosn6yJsYIazebYbox/b92TGTSno1RAtlZ6WNX
	nMyIgR1Efgs3SUCpO+4RUhxi32TL+i/NoK+a/HZA2rkNA2Qfh2d9af6YPItRw/qasMvpPzoo11Lo6
	33nZ6Taw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlPo-00000003lsw-19om;
	Mon, 24 Mar 2025 17:16:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlIy-00000003kzO-0kau;
	Mon, 24 Mar 2025 17:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742836178;
	bh=llRTuDYSeRoGI5yKkUqID7lKQVZnXzBT4+Yfc0wBsYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bYl2Vu0xJsHh80Ct0yPOFVt/YyQGHzZRH+PuZLFZ7KaBZ6waWR+IRkqp/AM8W/KJJ
	 kQw07HXXKdT3CIbqHHfOjJjVFb2/2yRRCMr609E69nMQXykWntjlrK3xPysxf9uur5
	 5MUvHa4xU2jHLljp4c56gZJfZrEImwCbpG95qGeqG4CSOgWyMGO5D+InfH/aApiJon
	 /XPJirvqAghAH+wO+P210g7xvMg1Hhs03HOhxwRPQcRZNSMwDk5rxfHVnaR79LshM/
	 d23Nc9YEJqcceZqmfeyWK1WQR6TfNDEPFnZTGIClALe2LouGsaEreYEwmb9YYKKbkI
	 4AU4wclZIbKgQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A08AD17E0A62;
	Mon, 24 Mar 2025 18:09:37 +0100 (CET)
Message-ID: <67337197-abec-450c-b400-ae37a0cd0692@collabora.com>
Date: Mon, 24 Mar 2025 18:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] soc: mediatek: add mmsys support for MT8196
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, singo.chang@mediatek.com,
 xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-7-paul-pl.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250321093435.94835-7-paul-pl.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_100940_533818_63AF2426 
X-CRM114-Status: GOOD (  33.00  )
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

Il 21/03/25 10:33, paul-pl.chen ha scritto:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> 1. Defining driver data and adding compatible string
> for different subsystems
> (DISPSYS0, DISPSYS1, OVLSYS0, OVLSYS1, VDISP_AO)
> 2. Adding functions to control top clocks and ddp clocks.
> 3. Updating the probe function to initialize clocks and
> enable runtime PM if its node has the power-domains property.
> 4. Adding functions to configure ddp components and
> set default configurations.
> 5. Adding the routing table for each mmsys in MT8196.

You need at least two commits for all that you're doing here... and adding MT8196
tables should be the last one.

> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8196-mmsys.h    | 451 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 203 ++++++++++-
>   drivers/soc/mediatek/mtk-mmsys.h       |  18 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  60 ++++
>   4 files changed, 731 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8196-mmsys.h b/drivers/soc/mediatek/mt8196-mmsys.h
> new file mode 100644
> index 000000000000..ff841ae9939a
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8196-mmsys.h
> @@ -0,0 +1,451 @@

..snip..

> +static const struct mtk_mmsys_default mmsys_mt8196_disp0_default_table[] = {
> +	{MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1, 0)},
> +	{MT8196_DISP0_BYPASS_MUX_SHADOW,
> +	 MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW,
> +	 MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW},
> +	{MT8196_DISP0_DLI_RELAY0, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP0_DLI_RELAY1, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP0_DLI_RELAY8, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP0_DLO_RELAY1, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP0_DLO_RELAY2, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP0_DLO_RELAY3, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +};
> +
> +static const struct mtk_mmsys_default mmsys_mt8196_disp1_default_table[] = {
> +	{MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1, 0)},
> +	{MT8196_DISP1_INT_MERGE, 0, BIT(0)},
> +	{MT8196_DISP1_BYPASS_MUX_SHADOW,
> +	 MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW,
> +	 MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW},
> +	{MT8196_DISP1_DLI_RELAY21, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP1_DLI_RELAY22, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP1_DLI_RELAY23, MT8196_DLI_RELAY_1T2P, GENMASK(31, 30)},
> +	{MT8196_DISP1_GCE_FRAME_DONE_SEL0, MT8196_FRAME_DONE_DVO, GENMASK(5, 0)},
> +	{MT8196_DISP1_GCE_FRAME_DONE_SEL1, MT8196_FRAME_DONE_DP_INTF0, GENMASK(5, 0)},
> +};
> +
> +static const struct mtk_mmsys_routes mmsys_mt8196_ovl0_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0_EXDMA2, DDP_COMPONENT_OVL0_BLENDER1,

There's a new MMSYS_ROUTE macro that was introduced because tables contained
wrong values in multiple instances and in multiple SoCs: please use it here and
for all routing tables.

> +		MT8196_OVL_RSZ_IN_CB2_MOUT_EN, MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3,
> +		MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3

..snip..

> +};
> +#endif /* __SOC_MEDIATEK_MT8196_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index bb4639ca0b8c..1d3ca4f9f237 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -4,12 +4,14 @@
>    * Author: James Liao <jamesjj.liao@mediatek.com>
>    */
>   
> +#include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/reset-controller.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   
> @@ -21,6 +23,7 @@
>   #include "mt8188-mmsys.h"
>   #include "mt8192-mmsys.h"
>   #include "mt8195-mmsys.h"
> +#include "mt8196-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
>   #define MMSYS_SW_RESET_PER_REG 32
> @@ -144,6 +147,54 @@ static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
>   	.is_vppsys = true,
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8196_dispsys0_driver_data = {
> +	.clk_driver = "clk-mt8196-disp0",
> +	.routes = mmsys_mt8196_disp0_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8196_disp0_routing_table),
> +	.async_info = mmsys_mt8196_disp0_async_comp_table,
> +	.num_async_info = ARRAY_SIZE(mmsys_mt8196_disp0_async_comp_table),
> +	.def_config = mmsys_mt8196_disp0_default_table,
> +	.num_def_config = ARRAY_SIZE(mmsys_mt8196_disp0_default_table),
> +	.num_top_clk = 1,
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8196_dispsys1_driver_data = {
> +	.clk_driver = "clk-mt8196-disp1",
> +	.routes = mmsys_mt8196_disp1_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8196_disp1_routing_table),
> +	.async_info = mmsys_mt8196_disp1_async_comp_table,
> +	.num_async_info = ARRAY_SIZE(mmsys_mt8196_disp1_async_comp_table),
> +	.def_config = mmsys_mt8196_disp1_default_table,
> +	.num_def_config = ARRAY_SIZE(mmsys_mt8196_disp1_default_table),
> +	.num_top_clk = 1,
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8196_ovlsys0_driver_data = {
> +	.clk_driver = "clk-mt8196-ovl0",
> +	.routes = mmsys_mt8196_ovl0_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8196_ovl0_routing_table),
> +	.async_info = mmsys_mt8196_ovl0_async_comp_table,
> +	.num_async_info = ARRAY_SIZE(mmsys_mt8196_ovl0_async_comp_table),
> +	.def_config = mmsys_mt8196_ovl0_default_table,
> +	.num_def_config = ARRAY_SIZE(mmsys_mt8196_ovl0_default_table),
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8196_ovlsys1_driver_data = {
> +	.clk_driver = "clk-mt8196-ovl1",
> +	.routes = mmsys_mt8196_ovl1_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8196_ovl1_routing_table),
> +	.async_info = mmsys_mt8196_ovl1_async_comp_table,
> +	.num_async_info = ARRAY_SIZE(mmsys_mt8196_ovl1_async_comp_table),
> +	.def_config = mmsys_mt8196_ovl0_default_table,
> +	.num_def_config = ARRAY_SIZE(mmsys_mt8196_ovl0_default_table),
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8196_vdisp_ao_driver_data = {
> +	.clk_driver = "clk-mt8196-vdisp_ao",
> +	.def_config = mmsys_mt8196_vdisp_ao_default_table,
> +	.num_def_config = ARRAY_SIZE(mmsys_mt8196_vdisp_ao_default_table),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
> @@ -158,6 +209,9 @@ struct mtk_mmsys {
>   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>   	struct reset_controller_dev rcdev;
>   	struct cmdq_client_reg cmdq_base;
> +	struct clk **async_clk;
> +	int num_async_clk;
> +	struct clk **top_clk;
>   };
>   
>   static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
> @@ -180,6 +234,99 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
>   	writel_relaxed(tmp, mmsys->regs + offset);
>   }
>   
> +int mtk_mmsys_top_clk_enable(struct device *dev)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	int ret, i;
> +
> +	if (!mmsys->data->num_top_clk)
> +		return 0;
> +
> +	for (i = 0; i < mmsys->data->num_top_clk; i++)
> +		ret = clk_prepare_enable(mmsys->top_clk[i]);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_enable);
> +
> +void mtk_mmsys_top_clk_disable(struct device *dev)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < mmsys->data->num_top_clk; i++)
> +		clk_disable_unprepare(mmsys->top_clk[i]);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_disable);
> +
> +int mtk_mmsys_ddp_clk_enable(struct device *dev, enum mtk_ddp_comp_id comp_id)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
> +
> +	int i;
> +
> +	if (!mmsys->data->num_async_info)
> +		return 0;
> +
> +	for (i = 0; i < mmsys->data->num_async_info; i++)
> +		if (comp_id == async[i].comp_id)
> +			return clk_prepare_enable(mmsys->async_clk[async[i].index]);

Why can't you add the clocks in the mediatek-drm nodes and handle enablement in the
drm driver?!

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_enable);
> +
> +void mtk_mmsys_ddp_clk_disable(struct device *dev, enum mtk_ddp_comp_id comp_id)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
> +	int i;
> +
> +	if (!mmsys->data->num_async_info)
> +		return;
> +
> +	for (i = 0; i < mmsys->data->num_async_info; i++)
> +		if (comp_id == async[i].comp_id)
> +			clk_disable_unprepare(mmsys->async_clk[async[i].index]);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_disable);
> +
> +void mtk_mmsys_ddp_config(struct device *dev, enum mtk_ddp_comp_id comp_id,
> +			  int width, int height, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
> +	int i;
> +
> +	if (!mmsys->data->num_async_info)
> +		return;
> +
> +	for (i = 0; i < mmsys->data->num_async_info; i++)
> +		if (comp_id == async[i].comp_id)
> +			break;
> +
> +	if (i == mmsys->data->num_async_info)
> +		return;
> +
> +	mtk_mmsys_update_bits(mmsys, async[i].offset, async[i].mask,
> +			      height << 16 | width, cmdq_pkt);

linux/bitfield.h provides macros that you should use for those register fields.

> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> +
> +void mtk_mmsys_default_config(struct device *dev)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_default *def_config = mmsys->data->def_config;
> +	int i;
> +
> +	if (!mmsys->data->num_def_config)
> +		return;
> +
> +	for (i = 0; i < mmsys->data->num_def_config; i++)
> +		mtk_mmsys_update_bits(mmsys, def_config[i].offset, def_config[i].mask,
> +				      def_config[i].val, NULL);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_default_config);
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
> @@ -390,7 +537,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	struct platform_device *clks;
>   	struct platform_device *drm;
>   	struct mtk_mmsys *mmsys;
> -	int ret;
> +	int ret, i;
>   
>   	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
>   	if (!mmsys)
> @@ -432,6 +579,49 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return PTR_ERR(clks);
>   	mmsys->clks_pdev = clks;
>   
> +	if (mmsys->data->num_top_clk) {
> +		struct device_node *node;
> +
> +		node = of_get_child_by_name(dev->of_node, "top");

No, you can't do that if there's no binding to support that.

> +		if (!node) {
> +			dev_err(&pdev->dev, "Couldn't find top node\n");
> +			return -EINVAL;
> +		}
> +
> +		mmsys->top_clk = devm_kmalloc_array(dev, mmsys->data->num_top_clk,
> +						    sizeof(*mmsys->top_clk), GFP_KERNEL);
> +		if (!mmsys->top_clk)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < mmsys->data->num_top_clk; i++) {
> +			mmsys->top_clk[i] = of_clk_get(node, i);
> +			if (IS_ERR(mmsys->top_clk[i]))
> +				return PTR_ERR(mmsys->top_clk[i]);
> +		}
> +	}
> +
> +	if (mmsys->data->num_async_info) {
> +		struct device_node *node;
> +
> +		node = of_get_child_by_name(dev->of_node, "async");
> +		if (!node) {
> +			dev_err(&pdev->dev, "Couldn't find async node\n");
> +			return -EINVAL;
> +		}
> +

Also this looks like you have children providing only clocks?!
I really need to look at the bindings to decide, but this looks wrong.

Regards,
Angelo



