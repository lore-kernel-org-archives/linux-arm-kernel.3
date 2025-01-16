Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC33C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dIhqK3P3j4lI3vOTrCWAyccHAikRIn0SuxwtrnG6gs=; b=y196F4Kbho679XsDIQpbILBr40
	1XSV+x20lzH1LhNw5l3VKJZEEa/eUwj2HNyZd8WCmw8kDyWsXjgc1Fj1Upk6rRNeHLAEK7SA5ShTB
	/ABLDZbiz3UmPFpKnT81m2dF9P98p3Ruyy2AbxTBKKufURez9S4xDzEqHDIEyGyvAyuFV0qu94Q9n
	Jm2JpP6dDVMa1WB8Z4qrDBkwI8f47Xnwj+t79sfsRfgGOi4VpLhVbJ2x1hoQx/2GqYz3OODIj7wUF
	zUHHK2EUod6J/wJ9YkzDac/WrrjC8VhB62q7D0m7Q3BO7ibtdythobjmz49b9AhwsQ26IrQKsMfe8
	sm89yZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPUf-0000000EwsT-2TEQ;
	Thu, 16 Jan 2025 13:01:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPTP-0000000EwhR-3Dl9;
	Thu, 16 Jan 2025 12:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BF7C5C55DB;
	Thu, 16 Jan 2025 12:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2428FC4CED6;
	Thu, 16 Jan 2025 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737032386;
	bh=MUcj+PDJNAsNizlP5f4HUNqu0DmAOApn8fq/KkfE20M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=donLZCuAuLt7qZTSJuKlXrsZX1YcRyW5wodpHKP1Obb4+IlU3FRmTWWRgQM/HB7vw
	 HEqwbkJ2Gns4i46ZW1gvHuqIXqc63qOKURGN+ezGfFrT+H2vOfg+9YH46EwBbBuTM2
	 tsl1Ui/gQWfsyq1XGs1TNdbhPF/tSWnIJhC+1zCyTxOJWzFSMXHkAgPjUIOaWlO4ad
	 9VNA2ivGJhzG24qLPx4L4RyCbdZcfP3jT8DnJzB4HKYS3t+QhbnHRHuAiZBFUFr/dz
	 AlRb5iiR62ILeLO1z6A2/gEzPXCh+JCw/6Nh37Ad6rwBCM6U7y/AubnDlZ5EK2uXNP
	 G9PF6mdc6vOcw==
Message-ID: <87001334-5a37-4fba-b08c-3679fb556f83@kernel.org>
Date: Thu, 16 Jan 2025 13:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/6] phy: rockchip: add driver for rk3328 usb3 phy
To: Peter Geis <pgwipeout@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com, kever.yang@rock-chips.com, frank.wang@rock-chips.com,
 william.wu@rock-chips.com, wulf@rock-chips.com,
 linux-rockchip@lists.infradead.org, Algea Cao <algea.cao@rock-chips.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Zhang Yubing <yubing.zhang@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <20250115012628.1035928-4-pgwipeout@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250115012628.1035928-4-pgwipeout@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_045947_900476_212D2C30 
X-CRM114-Status: GOOD (  24.71  )
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

On 15/01/2025 02:26, Peter Geis wrote:
> The rk3328 has a combined usb2 and usb3 phy block for the usb3 dwc
> interface. The implementation up until now has been bugged, with
> multiple issues ranging from disconnect detection failures to low
> performance. This driver fixes the majority of the original issues and
> allows better performance for the rk3328 usb3 port.
> 
> This driver sources data from multiple sources, including the rk3328
> trm, the rk3228h trm, emails from Rockchip, and both the 4.4 and 5.10
> downstream drivers. The current implementation allows for basic bring up
> of the phy block and fixes the detection issues. Interrupts are enabled,
> but currently only used for debugging. Features missing currently are
> power management, OTG handling, board specific tuning, regulator control,
> 
> Currently the only known bugs are a AX88179 usb3 gigabit adapter crashes
> when operating at usb3 speeds and transmitting large amounts of data and
> full disconnection detections may be slower than expected (~5-10 seconds).
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---


...

> +}
> +
> +static int rockchip_usb3phy_parse_dt(struct rockchip_usb3phy *usb3phy, struct device *dev)
> +{
> +	int ret;
> +
> +	usb3phy->clk_pipe = devm_clk_get(dev, "usb3phy-pipe");
> +	if (IS_ERR(usb3phy->clk_pipe)) {
> +		dev_err(dev, "could not get usb3phy pipe clock\n");

Syntax is always:
return dev_err_probe

> +		return PTR_ERR(usb3phy->clk_pipe);
> +	}
> +
> +	usb3phy->clk_otg = devm_clk_get(dev, "usb3phy-otg");
> +	if (IS_ERR(usb3phy->clk_otg)) {
> +		dev_err(dev, "could not get usb3phy otg clock\n");
> +		return PTR_ERR(usb3phy->clk_otg);
> +	}
> +
> +	usb3phy->clk_ref = devm_clk_get(dev, "refclk-usb3otg");
> +	if (IS_ERR(usb3phy->clk_ref)) {
> +		dev_err(dev, "could not get usb3phy ref clock\n");
> +		return PTR_ERR(usb3phy->clk_ref);
> +	}
> +
> +	usb3phy->u2por_rst = devm_reset_control_get(dev, "usb3phy-u2-por");
> +	if (IS_ERR(usb3phy->u2por_rst)) {
> +		dev_err(dev, "no usb3phy-u2-por reset control found\n");
> +		return PTR_ERR(usb3phy->u2por_rst);
> +	}
> +
> +	usb3phy->u3por_rst = devm_reset_control_get(dev, "usb3phy-u3-por");
> +	if (IS_ERR(usb3phy->u3por_rst)) {
> +		dev_err(dev, "no usb3phy-u3-por reset control found\n");
> +		return PTR_ERR(usb3phy->u3por_rst);
> +	}
> +
> +	usb3phy->pipe_rst = devm_reset_control_get(dev, "usb3phy-pipe-mac");
> +	if (IS_ERR(usb3phy->pipe_rst)) {
> +		dev_err(dev, "no usb3phy_pipe_mac reset control found\n");
> +		return PTR_ERR(usb3phy->pipe_rst);
> +	}
> +
> +	usb3phy->utmi_rst = devm_reset_control_get(dev, "usb3phy-utmi-mac");
> +	if (IS_ERR(usb3phy->utmi_rst)) {
> +		dev_err(dev, "no usb3phy-utmi-mac reset control found\n");
> +		return PTR_ERR(usb3phy->utmi_rst);
> +	}
> +
> +	usb3phy->pipe_apb_rst = devm_reset_control_get(dev, "usb3phy-pipe-apb");
> +	if (IS_ERR(usb3phy->pipe_apb_rst)) {
> +		dev_err(dev, "no usb3phy-pipe-apb reset control found\n");
> +		return PTR_ERR(usb3phy->pipe_apb_rst);
> +	}
> +
> +	usb3phy->utmi_apb_rst = devm_reset_control_get(dev, "usb3phy-utmi-apb");
> +	if (IS_ERR(usb3phy->utmi_apb_rst)) {
> +		dev_err(dev, "no usb3phy-utmi-apb reset control found\n");
> +		return PTR_ERR(usb3phy->utmi_apb_rst);
> +	}
> +
> +	usb3phy->ls_irq = of_irq_get_byname(dev->of_node, "linestate");
> +	if (usb3phy->ls_irq < 0) {
> +		dev_err(dev, "no linestate irq provided\n");
> +		return usb3phy->ls_irq;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, usb3phy->ls_irq, NULL, rockchip_usb3phy_linestate_irq,
> +					IRQF_ONESHOT, "rockchip_usb3phy_ls", usb3phy);
> +	if (ret) {
> +		dev_err(dev, "failed to request linestate irq handle\n");
> +		return ret;
> +	}
> +
> +	usb3phy->bvalid_irq = of_irq_get_byname(dev->of_node, "bvalid");
> +	if (usb3phy->bvalid_irq < 0) {
> +		dev_err(dev, "no bvalid irq provided\n");
> +		return usb3phy->bvalid_irq;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, usb3phy->bvalid_irq, NULL, rockchip_usb3phy_bvalid_irq,
> +					IRQF_ONESHOT, "rockchip_usb3phy_bvalid", usb3phy);
> +	if (ret) {
> +		dev_err(dev, "failed to request bvalid irq handle\n");
> +		return ret;
> +	}
> +
> +	usb3phy->id_irq = of_irq_get_byname(dev->of_node, "id");
> +	if (usb3phy->id_irq < 0) {
> +		dev_err(dev, "no id irq provided\n");
> +		return usb3phy->id_irq;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, usb3phy->id_irq, NULL, rockchip_usb3phy_id_irq,
> +					IRQF_ONESHOT, "rockchip_usb3phy-id", usb3phy);
> +	if (ret) {
> +		dev_err(dev, "failed to request id irq handle\n");
> +		return ret;
> +	}
> +
> +		usb3phy->rxdet_irq = of_irq_get_byname(dev->of_node, "rxdet");
> +	if (usb3phy->rxdet_irq < 0) {
> +		dev_err(dev, "no rxdet irq provided\n");
> +		return usb3phy->rxdet_irq;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, usb3phy->rxdet_irq, NULL, rockchip_usb3phy_rxdet_irq,
> +					IRQF_ONESHOT, "rockchip_usb3phy-rxdet", usb3phy);
> +	if (ret) {
> +		dev_err(dev, "failed to request rxdet irq handle\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rockchip_usb3phy_exit(struct phy *phy)
> +{
> +	struct rockchip_usb3phy_port *port = phy_get_drvdata(phy);
> +	struct rockchip_usb3phy *usb3phy = dev_get_drvdata(phy->dev.parent);
> +
> +	dev_dbg(usb3phy->dev, "usb3phy_shutdown\n");
> +	rockchip_usb3phy_reset(usb3phy, true, port->type);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops rockchip_usb3phy_ops = {
> +	.init		= rockchip_usb3phy_init,
> +	.exit		= rockchip_usb3phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct regmap_config rockchip_usb3phy_utmi_port_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x400,
> +	.cache_type = REGCACHE_NONE,
> +	.fast_io = true,
> +	.name = "utmi-port",
> +};
> +
> +static const struct regmap_config rockchip_usb3phy_pipe_port_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x400,
> +	.cache_type = REGCACHE_NONE,
> +	.fast_io = true,
> +	.name = "pipe-port",
> +};
> +
> +static const struct regmap_config rockchip_usb3phy_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x400,
> +	.write_flag_mask = REG_WRITE_MASK,
> +	.cache_type = REGCACHE_NONE,
> +	.fast_io = true,
> +};
> +
> +static int rockchip_usb3phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *child_np;
> +	struct phy_provider *provider;
> +	struct rockchip_usb3phy *usb3phy;
> +	const struct regmap_config regmap_config = rockchip_usb3phy_regmap_config;
> +	void __iomem *base;
> +	int i, ret;
> +
> +	dev_dbg(dev, "Probe usb3phy main block\n");
> +	usb3phy = devm_kzalloc(dev, sizeof(*usb3phy), GFP_KERNEL);
> +	if (!usb3phy)
> +		return -ENOMEM;
> +
> +	ret = rockchip_usb3phy_parse_dt(usb3phy, dev);
> +	if (ret) {
> +		dev_err(dev, "parse dt failed %i\n", ret);

return dev_err_probe()

And do not print errors twice.

> +		return ret;




> +
> +	/* take apb interface out of reset */
> +	reset_control_deassert(usb3phy->utmi_apb_rst);
> +	reset_control_deassert(usb3phy->pipe_apb_rst);
> +
> +	/* enable usb3phy rx detection to fix disconnection issues */
> +	regmap_write(usb3phy->regmap, USB3PHY_WAKEUP_CON_REG,
> +		     (USB3_RXDET_EN | (USB3_RXDET_EN << REG_WRITE_SHIFT)));
> +
> +	dev_dbg(dev, "Completed usb3phy core probe\n");

Drop.

> +
> +	/* probe the actual ports */
> +	i = 0;
> +	for_each_available_child_of_node(np, child_np) {
> +		const struct regmap_config *regmap_port_config;
> +		struct rockchip_usb3phy_port *port = &usb3phy->ports[i];
> +		struct phy *phy;
> +
> +		if (of_node_name_eq(child_np, "utmi-port")) {

Why are you comparing node names, if you decided to put there compatibles?

Decide on one method, but wait for full DT review.

> +			port->type = USB3PHY_TYPE_USB2;
> +			regmap_port_config = &rockchip_usb3phy_utmi_port_regmap_config;
> +		} else if (of_node_name_eq(child_np, "pipe-port")) {
> +			port->type	= USB3PHY_TYPE_USB3;
> +			regmap_port_config = &rockchip_usb3phy_pipe_port_regmap_config;
> +		} else {
> +			dev_err(dev, "unknown child node port type %s\n", child_np->name);
> +			goto err_port;
> +		}
> +
> +		base = devm_of_iomap(dev, child_np, 0, NULL);
> +		if (IS_ERR(base)) {
> +			dev_err(dev, "failed port ioremap\n");
> +			ret = PTR_ERR(base);
> +			goto err_port;
> +		}
> +
> +		port->regmap = devm_regmap_init_mmio(dev, base, regmap_port_config);
> +		if (IS_ERR(port->regmap)) {
> +			dev_err(dev, "regmap init failed\n");
> +			ret = PTR_ERR(port->regmap);
> +			goto err_port;
> +		}
> +
> +		phy = devm_phy_create(dev, child_np, &rockchip_usb3phy_ops);
> +		if (IS_ERR(phy)) {
> +			dev_err_probe(dev, PTR_ERR(phy), "failed to create phy\n");
> +			ret = PTR_ERR(phy);

Just read how dev_err_probe() works. The syntax is:
ret = dev_err_probe.

> +			goto err_port;
> +		}
> +
> +		port->phy = phy;
> +		phy_set_drvdata(port->phy, port);
> +
> +		/* to prevent out of boundary */
> +		if (++i >= USB3PHY_TYPE_MAX) {
> +			of_node_put(child_np);
> +			break;
> +		}
> +
> +		dev_info(dev, "Completed usb3phy %s port init\n", child_np->name);
Drop, not really helping.

Best regards,
Krzysztof

