Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CFF3382D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLr5wH4Bp+U1qN0G7TU+L7ew0f5WHuIcmyXdBy2vCgg=; b=spTF1gNf6Y0m6Tbc97ax7Z+P3R
	VOitt24mtxlpoe0A2KaMpFcSx6hEOM4V/v1leiCyu+dSCAMNjfplRnH06Yd7DV6XBlEM8tAioMTd6
	hOrRXJAcD8g2pbmDlBR1801G83g3w1xDUjArGB0HBSgODB/pA+8RR//nbyD78p4xRhd64xDJKEXjt
	YvBifF9z+RnHomB574SEDCHqlknrQZ/77xghIGYXy+D4sjHZ1aojfLYGDzcCtXaFsbOaPa7eRih2s
	ltoPmz6MqsyjgI+CxIHZVY/G+lbyDARcbApyaJbaPOS2zg9Kt5PQ25ISNs2ocnIC6iDl9HzACa1Ge
	Lz5aMtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R5k-00000005vbl-0wXn;
	Tue, 17 Mar 2026 09:52:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R5h-00000005vaR-1FrI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yLr5wH4Bp+U1qN0G7TU+L7ew0f5WHuIcmyXdBy2vCgg=; b=knFrRcxAc8kYBokEZ/pzJuH+/X
	N+CRDHIzkqjDsUPCrhuzmkChJrRLnRAmO3FkbrGJ5s8R9BhEKND74fKmg78sY4gtqgi6oEiCCBOeN
	0s76Njo7w37aI0ATtW2vLauPy9OqFeDyZFt8G9bRnjaR9ItXFALqgmelx/ecCPY9y9X1GfDAkUvV/
	2EKPE290/27VCV8CmmdtCQ5MR59uz6wl3HfMxBFlfXmPT/gKVOalrQCoo2KKcciQpMyFJeav7iQ09
	wKVZIIDamRasS/W/sAkNE+92RtJoCp5pVWebpZtUn+I747Ak+WE3AmtIhFJpjP5OgIwfHmX1C2UcB
	pm7gZptA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R5d-00000008bnH-0OYN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3887F40314;
	Tue, 17 Mar 2026 09:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D22CC2BC9E;
	Tue, 17 Mar 2026 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773741109;
	bh=W4rqPAGiPdWhHdqkaOUtyPkT2EFCuB+axFUZQ7OJ0ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ha8QE+UdWSw8GUOLiNyX2cQ8Be5CWzNFqrVUYgj/Vs42nM5OOjjUYOne7ALhut8WH
	 hBbGciXNbDOsDYpPj4R20XKAqk8+Q38GXr5npNwCI8Cto+Aga64OYwXJD5Smww1v9i
	 cAZ//3XOFJdX7CV70sJAqs8W8DLlIy+3ejMZJfu3hNSuYGwrC3e79rqVBesxRyodCk
	 oTgxXLrx+ZV/WWJJ2vAPCbe7lyMJelaRM0I39m3jwtMPx1VTDSE9tG3E3r+2n6RgIt
	 Db77QMsVrbUvUZhvzhgqqGql9EPV5sMaONErtE5iB6vfb9i0KNo/OcMJnLLstW6KmI
	 gRRZ/UmNYd6eg==
Date: Tue, 17 Mar 2026 15:21:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, Frank Li <frank.li@nxp.com>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V8 02/13] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <vixlrnt3a2mohavjbchth52sweq3syxlkps6dr45yj2uhkbgb5@kznmvy5kjygo>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
 <20260313020823.1592389-3-sherry.sun@nxp.com>
 <phrbp7ypfsilv75dh723l5hekjfm7hn7wetihibjqgix7czyyf@rq3sgaqsvu2s>
 <VI0PR04MB121147739ABAB0F3D5F402ED89241A@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB121147739ABAB0F3D5F402ED89241A@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_095153_540115_226DA685 
X-CRM114-Status: GOOD (  26.48  )
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

On Tue, Mar 17, 2026 at 08:01:28AM +0000, Sherry Sun wrote:
> 
> > On Fri, Mar 13, 2026 at 10:08:12AM +0800, Sherry Sun wrote:
> > > Introduce generic helper functions to parse Root Port device tree
> > > nodes and extract common properties like reset GPIOs. This allows
> > > multiple PCI host controller drivers to share the same parsing logic.
> > >
> > > Define struct pci_host_port to hold common Root Port properties
> > > (currently only reset GPIO descriptor) and add
> > > pci_host_common_parse_ports() to parse Root Port nodes from device
> > tree.
> > >
> > > Also add the 'ports' list to struct pci_host_bridge for better
> > > maintain parsed Root Port information.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > >  drivers/pci/controller/pci-host-common.c | 78
> > > ++++++++++++++++++++++++  drivers/pci/controller/pci-host-common.h |
> > 15 +++++
> > >  drivers/pci/probe.c                      |  1 +
> > >  include/linux/pci.h                      |  1 +
> > >  4 files changed, 95 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/pci-host-common.c
> > > b/drivers/pci/controller/pci-host-common.c
> > > index d6258c1cffe5..2f012cf80463 100644
> > > --- a/drivers/pci/controller/pci-host-common.c
> > > +++ b/drivers/pci/controller/pci-host-common.c
> > > @@ -9,6 +9,7 @@
> > >
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/of_pci.h>
> > > @@ -17,6 +18,83 @@
> > >
> > >  #include "pci-host-common.h"
> > >
> > > +/**
> > > + * pci_host_common_delete_ports - Cleanup function for port list
> > > + * @data: Pointer to the port list head  */ static void
> > > +pci_host_common_delete_ports(void *data) {
> > > +	struct list_head *ports = data;
> > > +	struct pci_host_port *port, *tmp;
> > > +
> > > +	list_for_each_entry_safe(port, tmp, ports, list)
> > > +		list_del(&port->list);
> > > +}
> > > +
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
> > > +	int err;
> > > +
> > > +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> > > +		if (!of_node_is_type(of_port, "pci"))
> > > +			continue;
> > > +		ret = pci_host_common_parse_port(dev, bridge, of_port);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > 
> > I think you should just do:
> > 
> > 	if (ret)
> > 		return ret;
> > 
> > and get rid of 'err'.
> 
> Hi Mani, do you mean the following method?
> 
> int pci_host_common_parse_ports(struct device *dev, struct pci_host_bridge *bridge)
> {
>     int ret = -ENOENT;
> 
>     for_each_available_child_of_node_scoped(dev->of_node, of_port) {
>         if (!of_node_is_type(of_port, "pci"))
>             continue;
>         ret = pci_host_common_parse_port(dev, bridge, of_port);
>         if (ret)
>             return ret;
>     }
> 
>     if (ret)
>         return ret;
> 
>     ret = devm_add_action_or_reset(dev, pci_host_common_delete_ports,
>                        &bridge->ports);

Here, you can do 'return devm_add_action_or_reset()'

- Mani

-- 
மணிவண்ணன் சதாசிவம்

