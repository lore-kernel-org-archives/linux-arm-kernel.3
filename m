Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B93FD64085
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cAXSvzFPqVii+g9QZN/R76uPwim9MrzK6kYcvIDkJY=; b=JxFL4rk4iKt/f0BhePqOD8W9sB
	Vx5yejDHT+GgoRaMsvwrmonbOFhsueAE2TN9hH0SNk2u255aS4z15umlZ3W+xE9NFCLHpr7GXjbYB
	XJNWgVafD+mSNC+ku4xbBkCO+MVug1oKWDcJqi4NGJND1Q8kdnTHYcEysvIEPVRC+xmTjRl3daVPh
	QRXO94D6p39EvR5gWJMIE3BE9M3eqwSqiaN8szm2F7SXgbFs7+3UrzOOsJhXjWDT9tCrIyxVQ0iIc
	d+sOrnl0olpO7FC40kdXHA2qItr9PgCvVnn1RfJwc4uyjI1u/a8aCzMWeBCV3V9aCPYttOSOna3zU
	3qaAkXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmBH-00000006IT7-1ViR;
	Wed, 17 Dec 2025 07:42:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmBF-00000006ISz-2Wfe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 07:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64A416018D;
	Wed, 17 Dec 2025 07:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA83C4CEF5;
	Wed, 17 Dec 2025 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765957360;
	bh=t3sMS2rvoK+Hy6JMy1gsympBsNJDbFI9shsFoh+CkuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HsMpmN3moHHzUX1tScH74pLt+lHIdvdjHvtz+OywNBeAtDHjBnZYBRgMUYlttOcve
	 YtC4KSaeazM4bCGsMWunKPL3khFF/8O0O05W49WeD3Tyer+QdBkfXI9LDtra0Vph28
	 EYN6pehx5n33FyAtNiBUhyvNOE0iXnMZpL9ENJ64Fp25cGOtJF7akVwWu4UjL4z7CN
	 6ATE7zi5NSnmC6HQlDq4at17CJ2q/i9951nCEOAYFkiMRSydKOgXZ5zQBe0/xn5T1/
	 5kN4852lZKdQxxTHZy83hWw25Sy72JicMfHzEn9WRcyFwC6zVb5CeSwk50hje07Tn6
	 /jQ8vWV4EhdvQ==
Message-ID: <360ecc21-b748-474c-9ada-ca72b7ae3a4a@kernel.org>
Date: Wed, 17 Dec 2025 08:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
References: <20251217-csi_formatter-v2-0-62168af80210@nxp.com>
 <20251217-csi_formatter-v2-2-62168af80210@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251217-csi_formatter-v2-2-62168af80210@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 17/12/2025 07:11, Guoniu Zhou wrote:
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> +	.bound = csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +	struct device *dev = formatter->dev;
> +	struct v4l2_async_connection *asc;
> +	struct fwnode_handle *ep __free(fwnode_handle) = NULL;

This is an undesired syntax explicitly documented as one to avoid. You
need here proper assignment, not NULL. Please don't use cleanup.h if you
do not intend to follow it because it does not make the code simpler.

> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc))
> +		return PTR_ERR(asc);
> +
> +	formatter->notifier.ops = &formatter_notify_ops;
> +
> +	ret = v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_async_register_subdev(&formatter->sd);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_system_suspend(struct device *dev)
> +{
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int csi_formatter_system_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	clk_disable_unprepare(formatter->clk);
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	return clk_prepare_enable(formatter->clk);
> +}
> +
> +static const struct dev_pm_ops csi_formatter_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(csi_formatter_system_suspend,
> +			    csi_formatter_system_resume)
> +	RUNTIME_PM_OPS(csi_formatter_runtime_suspend,
> +		       csi_formatter_runtime_resume, NULL)
> +};
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_formatter *formatter;
> +	u32 val;
> +	int ret;
> +
> +	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +	if (!formatter)
> +		return -ENOMEM;
> +
> +	formatter->dev = dev;
> +
> +	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(formatter->regs))
> +		return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +				     "Failed to get csi formatter regmap\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "reg", &val);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
> +
> +	formatter->reg_offset = val;
> +
> +	formatter->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(formatter->clk))
> +		return dev_err_probe(dev, PTR_ERR(formatter->clk),
> +				     "Failed to get pixel clock\n");
> +
> +	ret = csi_formatter_subdev_init(formatter);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "formatter subdev init fail\n");
> +
> +	/* Initialize formatter pixel format */
> +	formatter->fmt = find_csi_format(formatter_default_fmt.code);
> +
> +	ret = csi_formatter_async_register(formatter);
> +	if (ret < 0) {
> +		v4l2_subdev_cleanup(&formatter->sd);
> +		return dev_err_probe(dev, ret, "Async register failed\n");
> +	}
> +
> +	platform_set_drvdata(pdev, &formatter->sd);
> +
> +	/* Enable runtime PM. */
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	v4l2_async_unregister_subdev(&formatter->sd);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	media_entity_cleanup(&formatter->sd.entity);
> +	pm_runtime_set_suspended(&pdev->dev);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] = {
> +	{ .compatible = "fsl,imx9-csi-formatter" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver = {
> +	.driver = {
> +		.owner          = THIS_MODULE,

Why are you sending us 12 year old code without cleaning it up first?

> +		.name           = CSI_FORMATTER_DRV_NAME,
> +		.of_match_table = csi_formatter_of_match,
> +		.pm             = pm_ptr(&csi_formatter_pm_ops),
> +	},
> +	.probe  = csi_formatter_probe,
> +	.remove = csi_formatter_remove,
> +};
> +
Best regards,
Krzysztof

