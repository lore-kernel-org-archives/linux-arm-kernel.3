Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC48E1073CBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZtmiqyRP5xJSIE9fcAjXAlYAtZjy+z7VafG1BVhr6c=; b=xtJvV30WtG1GvckcxloQgJJyyh
	jVp5cRvabG94JI85NzVmPZFnP1sWpt92fD9v0dBi5sCA0tTiGP1gdI+JJs7zWJuPHNL+ky8ywCZYV
	+BuIjW1fBTakjiii+KJLlvLNdkIkD2T/Dafv9YkwugUUL+bRwKpMzjFcpmU16N+dp9c3n/NlHIQjZ
	4C1TM6+3wPQgJNNLe3/QtMPdW2HsXdM2fXl+sRwiK0KoucGvE//XV+mV5YQyj38Mm2hNyAE6EHnVI
	ETDY6pRnWHqGz2svAJHQPwR+0GAPIwNYW9jt30Oxow7VlR11SZt53zc7fOTXpJMmAc26v3Mag4XkS
	oQakbAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATc0-00000008ych-25Mx;
	Wed, 08 Apr 2026 14:10:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATby-00000008ycV-1Hnl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 14:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 460276012B;
	Wed,  8 Apr 2026 14:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFE9C19421;
	Wed,  8 Apr 2026 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775657429;
	bh=i2Dbh2ANq28qBSTN2bv54+q1a50BxTE9oJVrrroT5ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up9YGgAc7IHMuoBdh3ONWLG9qnGSwvEiHxfi39HKRZ8mywBhKMEm94Rlzn1VuzHDT
	 33HmtrnISdZapkbYCiHQjrmR+XSrquFED4gadV3DPKdWRpj+a/hMReRETWCsZWNl/u
	 LriCmU95F2JEOGNheFI41iQL3lQ9uv0JkXa8JtM+/1wz1RyGvOL8k24ogA4dd1fe8k
	 EmnSVEpf8u+JxK3wcf8oYdNQhCF1saI99/xBesze8W5A8sKEDM2Q5iS/EogyuGBgBA
	 PeOr16P2iVdIVOPPvwAsRk5gcFTlSMaZ8STdL2vqIgXSmSlUJS604tkBltVO1F4cQ+
	 0yYXyL5qWsgew==
Date: Wed, 8 Apr 2026 19:40:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <yijf6mwclpx6n7giucgykxvrm73baicy2urhzns34sxgloli3z@ygose2qrgvuz>
References: <20260407104154.2842132-1-sherry.sun@nxp.com>
 <20260407104154.2842132-3-sherry.sun@nxp.com>
 <lnzprzrdwra7pn7d6m3sbj5pvjy64blwpjl6i3lmlnfbyho63b@czpyhpgz5vum>
 <VI0PR04MB12114A60C4A7E43ED62A32B04925BA@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114A60C4A7E43ED62A32B04925BA@VI0PR04MB12114.eurprd04.prod.outlook.com>
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

On Wed, Apr 08, 2026 at 06:34:02AM +0000, Sherry Sun wrote:

[...]

> > > +/**
> > > + * pci_host_common_parse_port - Parse a single Root Port node
> > > + * @dev: Device pointer
> > > + * @bridge: PCI host bridge
> > > + * @node: Device tree node of the Root Port
> > > + *
> > > + * Returns: 0 on success, negative error code on failure  */ static
> > > +int pci_host_common_parse_port(struct device *dev,
> > > +				      struct pci_host_bridge *bridge,
> > > +				      struct device_node *node)
> > > +{
> > > +	struct pci_host_port *port;
> > > +	struct gpio_desc *reset;
> > > +
> > > +	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
> > > +				      "reset", GPIOD_ASIS, "PERST#");
> > 
> > Sorry, I missed this earlier.
> > 
> > Since PERST# is optional, you cannot reliably detect whether the Root Port
> > binding intentionally skipped the PERST# GPIO or legacy binding is used, just
> > by checking for PERST# in Root Port node.
> > 
> > So this helper should do 3 things:
> > 
> > 1. If PERST# is found in Root Port node, use it.
> > 2. If not, check the RC node and if present, return -ENOENT to fallback to the
> > legacy binding.
> > 3. If not found in both nodes, assume that the PERST# is not present in the
> > design, and proceed with parsing Root Port binding further.
> 
> Hi Mani, understand, does the following code looks ok for above three cases?
> 
>     /* Check if PERST# is present in Root Port node */
>     reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
>                       "reset", GPIOD_ASIS, "PERST#");
>     if (IS_ERR(reset)) {
>         /* If error is not -ENOENT, it's a real error */
>         if (PTR_ERR(reset) != -ENOENT)
>             return PTR_ERR(reset);
> 
>         /* PERST# not found in Root Port node, check RC node */
>         rc_has_reset = of_property_read_bool(dev->of_node, "reset-gpios") ||
>                    of_property_read_bool(dev->of_node, "reset-gpio");

Just:
		if (of_property_read_bool(dev->of_node, "reset-gpios") ||
		    of_property_read_bool(dev->of_node, "reset-gpio")) {
			return -ENOENT;
		} 

>         if (rc_has_reset)
>             return -ENOENT;
> 
>         /* No PERST# in either node, assume not present in design */
>         reset = NULL;
>     }
> 
>     port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>     if (!port)
>         return -ENOMEM;
> ...
> 
> > 
> > But there is one more important limitation here. Right now, this API only
> > handles PERST#. But if another vendor tries to use it and if they need other
> > properties such as PHY, clocks etc... those resources should be fetched
> > optionally only by this helper. But if the controller has a hard dependency on
> > those resources, the driver will fail to operate.
> > 
> > I don't think we can fix this limitation though and those platforms should
> > ensure that the resource dependency is correctly modeled in DT binding and
> > the DTS is validated properly. It'd be good to mention this in the kernel doc of
> > this API.
> 
> Ok, I will add a NOTE for this in this API description.
> 
> > 
> > > +	if (IS_ERR(reset))
> > > +		return PTR_ERR(reset);
> > > +
> > > +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > > +	if (!port)
> > > +		return -ENOMEM;
> > > +
> > > +	port->reset = reset;
> > > +	INIT_LIST_HEAD(&port->list);
> > > +	list_add_tail(&port->list, &bridge->ports);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * pci_host_common_parse_ports - Parse Root Port nodes from device
> > > +tree
> > > + * @dev: Device pointer
> > > + * @bridge: PCI host bridge
> > > + *
> > > + * This function iterates through child nodes of the host bridge and
> > > +parses
> > > + * Root Port properties (currently only reset GPIO).
> > > + *
> > > + * Returns: 0 on success, -ENOENT if no ports found, other negative
> > > +error codes
> > > + * on failure
> > > + */
> > > +int pci_host_common_parse_ports(struct device *dev, struct
> > > +pci_host_bridge *bridge) {
> > > +	int ret = -ENOENT;
> > > +
> > > +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> > > +		if (!of_node_is_type(of_port, "pci"))
> > > +			continue;
> > > +		ret = pci_host_common_parse_port(dev, bridge, of_port);
> > > +		if (ret)
> > > +			return ret;
> > 
> > As Sashiko flagged, you need to make sure that devm_add_action_or_reset()
> > is added even during the error path:
> 
> Yes, it needs to be fixed. We can handle it with the following two methods, I am not sure which method is better or more preferable?
> 
> #1: register cleanup action after first successful port parse and use cleanup_registered flag to avoid duplicate register.
>     int ret = -ENOENT;    
>     bool cleanup_registered = false;
> 
>     for_each_available_child_of_node_scoped(dev->of_node, of_port) {
>         if (!of_node_is_type(of_port, "pci"))
>             continue;
>         ret = pci_host_common_parse_port(dev, bridge, of_port);
>         if (ret)
>             return ret;
> 
>         /* Register cleanup action after first successful port parse */
>         if (!cleanup_registered) {
>             ret = devm_add_action_or_reset(dev,
>                                pci_host_common_delete_ports,
>                                &bridge->ports);

Even if you register devm_add_action_or_reset(), it won't be called when
pci_host_common_parse_port() fails since the legacy fallback will be used.

So you need to manually call pci_host_common_delete_ports() in the error path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

