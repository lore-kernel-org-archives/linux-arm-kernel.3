Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD76C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubdROuUEIbDV82nF9cix7jyq/BTKbWSZ5HttQeKP04s=; b=BdFm/iO50zU3Vb+6x3JYeNG/em
	LAVM2PTYdZ2dfqkkUeBLVWgoyWJZcJH6Ob9I7cOtpfjVb26q6J0CJvFcS8iotL0M8Hyqn2sxg264B
	ZNMBZ4nUwMbIjXr6xBF6mNA0ALRIc4nGBvNAe0jHrKhn2bFL512MieQ2bXtNRsn33BgYENs5TGKmb
	9TDZJ4X3Oi7+Wo4ERI6aOPfM9cTyc0y5jxzkgXYB/xpOBpMOV+cdFUV5mvT3W/DsWzwIKuq3Ar00I
	kj8qYeQTLdeemFQLX8x/fl87cO399yjlY4/Jwg1Pu3kNnDK1czmeclT8FfLE6xelmpbmIeK86EADo
	5KFA4TdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhS8-00000005Zd3-2jCa;
	Tue, 15 Jul 2025 15:20:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg4o-00000005Gxb-3Pgr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:52:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ubg4V-0000Zx-U7; Tue, 15 Jul 2025 15:51:51 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ubg4S-008aWa-1W;
	Tue, 15 Jul 2025 15:51:48 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ubg4S-000MYS-1C;
	Tue, 15 Jul 2025 15:51:48 +0200
Message-ID: <e52bd959eea8a4284404f701d0519c4631a31238.camel@pengutronix.de>
Subject: Re: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
 andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, BMC-SW@aspeedtech.com
Date: Tue, 15 Jul 2025 15:51:48 +0200
In-Reply-To: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
	 <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_065210_880921_1F9041E3 
X-CRM114-Status: GOOD (  19.65  )
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

On Di, 2025-07-15 at 11:43 +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/pci/controller/Kconfig       |   13 +
>  drivers/pci/controller/Makefile      |    1 +
>  drivers/pci/controller/pcie-aspeed.c | 1137 ++++++++++++++++++++++++++
>  3 files changed, 1151 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-aspeed.c
>=20
[...]
> diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controlle=
r/pcie-aspeed.c
> new file mode 100644
> index 000000000000..a7e679d5fb42
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-aspeed.c
> @@ -0,0 +1,1137 @@
[...]
> +static int aspeed_pcie_parse_port(struct aspeed_pcie *pcie,
> +				  struct device_node *node,
> +				  int slot)
> +{
> +	struct aspeed_pcie_port *port;
> +	struct device *dev =3D pcie->dev;
> +
> +	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->pciephy =3D syscon_regmap_lookup_by_phandle(node, "aspeed,pciephy=
");
> +	if (IS_ERR(port->pciephy))
> +		return dev_err_probe(dev, PTR_ERR(port->pciephy),
> +				     "Failed to map pcie%d pciephy base\n", slot);
> +
> +	port->clk =3D devm_get_clk_from_child(dev, node, NULL);
> +	if (IS_ERR(port->clk))
> +		return dev_err_probe(dev, PTR_ERR(port->clk),
> +				     "Failed to get pcie%d clock\n", slot);
> +
> +	port->perst =3D of_reset_control_get_exclusive(node, "perst");
> +	if (IS_ERR(port->perst))
> +		return dev_err_probe(dev, PTR_ERR(port->perst),
> +				     "Failed to get pcie%d reset control\n", slot);

How about registering a reset_control_put() via
devm_add_action_or_reset()?
Otherwise these reset controls are not released on .remove.

[...]
> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct aspeed_pcie_port *port;
> +	struct device_node *node =3D dev->of_node;
> +	const struct aspeed_pcie_rc_platform *md =3D of_device_get_match_data(d=
ev);
> +	int irq, ret;
> +
> +	if (!md)
> +		return -ENODEV;
> +
> +	host =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> +	if (!host)
> +		return -ENOMEM;
> +
> +	pcie =3D pci_host_bridge_priv(host);
> +	pcie->dev =3D dev;
> +	pcie->tx_tag =3D 0;
> +	platform_set_drvdata(pdev, pcie);
> +
> +	pcie->platform =3D md;
> +	pcie->host =3D host;
> +	INIT_LIST_HEAD(&pcie->ports);
> +
> +	pcie->reg =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pcie->reg))
> +		return PTR_ERR(pcie->reg);
> +
> +	of_property_read_u32(node, "linux,pci-domain", &pcie->domain);
> +
> +	pcie->cfg =3D syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,pci=
ecfg");
> +	if (IS_ERR(pcie->cfg))
> +		return dev_err_probe(dev, PTR_ERR(pcie->cfg), "Failed to map pciecfg b=
ase\n");
> +
> +	pcie->h2xrst =3D devm_reset_control_get_exclusive(dev, "h2x");
> +	if (IS_ERR(pcie->h2xrst))
> +		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst), "Failed to get h2x re=
set\n");
> +
> +	ret =3D devm_mutex_init(dev, &pcie->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to init mutex\n");
> +
> +	ret =3D pcie->platform->setup(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to setup PCIe RC\n");
> +
> +	ret =3D aspeed_pcie_parse_dt(pcie);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D aspeed_pcie_init_ports(pcie);
> +	if (ret)
> +		goto err_remove_resets;
> +
> +	host->sysdata =3D pcie;
> +
> +	ret =3D aspeed_pcie_init_irq_domain(pcie);
> +	if (ret)
> +		goto err_irq_init;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_irq;
> +	}
> +
> +	ret =3D devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHARE=
D, dev_name(dev),
> +			       pcie);
> +	if (ret)
> +		goto err_irq;
> +
> +	ret =3D pci_host_probe(host);
> +	if (ret)
> +		goto err_irq;
> +
> +	return 0;
> +err_irq:
> +	aspeed_pcie_irq_domain_free(pcie);

If pci_host_probe() fails, aspeed_pcie_irq_domain_free() will be called
before the IRQ requested with devm_request_irq() above is released.
Also, this is never called on .remove. You can fix both with
devm_add_action_or_reset().

> +err_irq_init:
> +err_remove_resets:
> +	list_for_each_entry(port, &pcie->ports, list)
> +		reset_control_put(port->perst);

I suggest to let devres handle this (see above).

regards
Philipp


