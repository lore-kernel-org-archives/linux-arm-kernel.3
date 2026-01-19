Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F98ECCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWiUwsxWQVse/0dFHc7TFcpGZCdD9nBQalYokQPwvHY=; b=J2jD1rB89pb78aCS+GShL6OWVR
	/UvZvqlc0DEpHnvUhVUo0ZAhsPtV0i7o6SW11kt0Z6U539gaZcgsERj2eqOu94WY0ZfDiWA+9W7qE
	3oqZsacf/xTOLdoLlJjpFMMYlsXPO30a1scW4x5RIvNdWJiu9X8g8EEuSE6IJEYGcAltKsR9jPEhj
	o55Bfo/opfAC9ZioX5Hbxgeybc9BDvHaCDp08gyijCWwL6PrG0HWr6ZS3NUK0Zq2FQQUe+vhkGfq9
	EF3PBRKssIv25MfYu7WbHO4OE/CBz2vYGxkO7iG2P8Ja9XprDLFtC0ApmWLmmB8uACOw72zO0Tqrv
	CegenhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlt5-00000001fHd-3QiG;
	Mon, 19 Jan 2026 09:49:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlt0-00000001fGd-0hrg;
	Mon, 19 Jan 2026 09:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768816162;
	bh=vfGiGmp2PdH5f0tFUDU3+Qm9AzHUk5W1M/IoRoNUp9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X1wOWmk+HqZ3o+yuvnz4zoLINLy96fjhwfx20qnTnvazW3q/Df+Z0mpBFK79I/MDi
	 yCWeoYmhsN4Gcpkk7TZi4qyKp6r571c+roXjFVEYahJTKAmJM4HdOVMefL436d1lqj
	 RQyUcp3ItKvQ8KsBwRWRzxx4FJ9VS0kYOSwBMk5BL4/moqujy4fY3WYwsD6Mwr2roX
	 aofBRNG2hYn9T4LHdSfNNnI8UhrOqgIdwB1pfrWYjtz8ogt5wFVzHjZ3/JW5p29Ax+
	 DkBjGZXK09vky3kBNYKiFTuXMmooZfLSq2Eav4IGkykh++ZOHyVCQo4hc6Flnc7HUA
	 YR9jjoS/z01xA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2483017E1013;
	Mon, 19 Jan 2026 10:49:21 +0100 (CET)
Message-ID: <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
Date: Mon, 19 Jan 2026 10:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
To: Frank Li <Frank.li@nxp.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
 <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_014926_409625_A4665901 
X-CRM114-Status: GOOD (  26.20  )
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

Hi Frank,

Thanks for your review.

On 1/16/26 17:08, Frank Li wrote:
> On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
>> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
>> one input port and one output port. It receives the data with the
>> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
>> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>>
>> Add a V4L2 subdevice driver for this unit.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
> ...
>> +
>> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
>> +}
>> +
>> +static inline __maybe_unused void
> 
> why need '__maybe_unused', needn't inline. compiler can auto decide and
> report unused function if no 'inline'.

The __maybe_unused was helpful during development and is not really
required now. It doesn't hurt either, so I left it in. I can remove it
if you wish.

> 
>> +dw_mipi_csi2_write(struct dw_mipi_csi2_device *csi2, unsigned int addr, u32 val)
>> +{
>> +	writel(val, csi2->base_addr + addr);
>> +}
>> +
>> +static inline __maybe_unused u32
>> +dw_mipi_csi2_read(struct dw_mipi_csi2_device *csi2, unsigned int addr)
>> +{
>> +	return readl(csi2->base_addr + addr);
>> +}
>> +
>> +static const struct dw_mipi_csi2_format *
>> +dw_mipi_csi2_find_format(struct dw_mipi_csi2_device *csi2, u32 mbus_code)
>> +{
>> +	WARN_ON(csi2->formats_num == 0);
>> +
>> +	for (unsigned int i = 0; i < csi2->formats_num; i++) {
>> +		const struct dw_mipi_csi2_format *format = &csi2->formats[i];
>> +
>> +		if (format->code == mbus_code)
>> +			return format;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int dw_mipi_csi2_start(struct dw_mipi_csi2_device *csi2)
>> +{
>> +	struct media_pad *source_pad;
>> +	union phy_configure_opts opts;
>> +	s64 link_freq;
>> +	u32 control = 0;
>> +	u32 lanes = csi2->lanes_num;
>> +	int ret;
> 
> try keep reverise christmas tree order.

Ack.

> 
>> +
>> +	if (lanes < 1 || lanes > 4)
>> +		return -EINVAL;
>> +
> ...
>> +
>> +static int dw_mipi_csi2_register_notifier(struct dw_mipi_csi2_device *csi2)
>> +{
>> +	struct v4l2_async_connection *asd;
>> +	struct v4l2_async_notifier *ntf = &csi2->notifier;
>> +	struct v4l2_fwnode_endpoint vep;
>> +	struct v4l2_subdev *sd = &csi2->sd;
>> +	struct device *dev = csi2->dev;
>> +	struct fwnode_handle *ep;
>> +	int ret;
>> +
>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> 
> use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
> handler.

Sorry, I don't see the benefit of that.

> 
>> +	if (!ep)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
>> +
> ...
>> +{
>> +	struct media_pad *pads = csi2->pads;
>> +	struct v4l2_subdev *sd = &csi2->sd;
>> +	int ret;
>> +
>> +	ret = dw_mipi_csi2_register_notifier(csi2);
>> +	if (ret)
>> +		goto err;
>> +
>> +	v4l2_subdev_init(sd, &dw_mipi_csi2_ops);
>> +	sd->dev = csi2->dev;
>> +	sd->entity.ops = &dw_mipi_csi2_media_ops;
>> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>> +	sd->internal_ops = &dw_mipi_csi2_internal_ops;
>> +	sd->owner = THIS_MODULE;
> 
> I remeber needn't set owner, v4l2_async_register_subdev() do it for you.

Indeed, nice catch.

> 
>> +	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2 %s",
>> +		 dev_name(csi2->dev));
>> +
> ...
>> +
>> +static int dw_mipi_csi2_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct dw_mipi_csi2_device *csi2;
>> +	int ret;
>> +
>> +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
>> +	if (!csi2)
>> +		return -ENOMEM;
>> +	csi2->dev = dev;
>> +	dev_set_drvdata(dev, csi2);
>> +
>> +	csi2->base_addr = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(csi2->base_addr))
>> +		return PTR_ERR(csi2->base_addr);
>> +
>> +	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
>> +	if (ret != DW_MIPI_CSI2_CLKS_MAX)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
>> +	csi2->clks_num = ret;
>> +
>> +	csi2->phy = devm_phy_get(dev, NULL);
>> +	if (IS_ERR(csi2->phy))
>> +		return dev_err_probe(dev, PTR_ERR(csi2->phy),
>> +				     "failed to get MIPI CSI-2 PHY\n");
>> +
>> +	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
>> +	if (IS_ERR(csi2->reset))
>> +		return dev_err_probe(dev, PTR_ERR(csi2->reset),
>> +				     "failed to get reset\n");
>> +
>> +	csi2->formats = formats;
>> +	csi2->formats_num = ARRAY_SIZE(formats);
>> +
>> +	pm_runtime_enable(dev);
> 
> devm_pm_runtime_enable() will simple error handle.

Ack.

> 
>> +
>> +	ret = phy_init(csi2->phy);
>> +	if (ret) {
>> +		ret = dev_err_probe(dev, ret,
>> +				    "failed to initialize MIPI CSI-2 PHY\n");
>> +		goto err_pm_runtime_disable;
>> +	}
>> +
> ...
>> +
>> +static int dw_mipi_csi2_runtime_resume(struct device *dev)
>> +{
>> +	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	reset_control_assert(csi2->reset);
>> +	udelay(5);
> 
> Now prefer use fsleep(), which auto choose difference sleep function
> according to delay number.

I'll keep that in mind, but here the first thing that fsleep does is to
check whether the parameter is <= 10 and (since this is true) call
udelay. So here I don't see the point really.

> 
>> +	reset_control_deassert(csi2->reset);
>> +
>> +	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clocks\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2_pm_ops,
>> +				 dw_mipi_csi2_runtime_suspend,
>> +				 dw_mipi_csi2_runtime_resume, NULL);
>> +
>> +static struct platform_driver dw_mipi_csi2_drv = {
>> +	.driver = {
>> +		.name = "dw-mipi-csi2",
>> +		.of_match_table = dw_mipi_csi2_of_match,
>> +		.pm = &dw_mipi_csi2_pm_ops,
> 
> pm_ptr( &dw_mipi_csi2_pm_ops)

Shouldn't make a difference here since this driver depends on CONFIG_PM.

Best regards,
Michael

> 
> Frank
>> +	},
>> +	.probe = dw_mipi_csi2_probe,
>> +	.remove = dw_mipi_csi2_remove,
>> +};
>> +module_platform_driver(dw_mipi_csi2_drv);
>> +
>> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
>> +MODULE_LICENSE("GPL");
>>
>> --
>> 2.39.5
>>


