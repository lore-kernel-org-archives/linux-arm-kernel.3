Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB96DFD374E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Idt0nuRFKiuDpmZ8vRwPz+a9R60NZw3fqy6VodbURU=; b=1Egml3N9UL5ufRgjI+Uih6kRzU
	dVXQpl+WNXjK5DX733BlyOSq/unzKG1YA79lCcO1529AGoW2/cTB74EJKB54nW8hIsSZ1jI3bY7b3
	HdEmH9Jc2FjUDbYoaXJGyVv4RJvAyJmFYBYE/ea5yCqaMsJdVzIfnj1EBhCV0CA16puR5LDqn6uYx
	mxrXQV0VIR8UG2P6lsWpN3Jc1xzwIaDOpc8PdA67SFjiQxT2PZrSr59efH6Lc37o+j54JV+OC9ZuJ
	jW0hCKQNGDHbmKE6NEjaOsc1sf7xAXI3gY0lR6dx9ls+pdNS5qMVyyJafUfkVGLprpMeZGG6j4Vqt
	UmbOrC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEkS-000000043z2-0f0q;
	Wed, 25 Feb 2026 13:16:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEkL-000000043yI-0Tau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 13:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 537EC43508;
	Wed, 25 Feb 2026 13:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C9FC116D0;
	Wed, 25 Feb 2026 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772025368;
	bh=zt7+EKK8NZaEPwAANQezQqB9aUD7HAT+qkkBsW29/I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvH1Q7ZazzxuQcKF4MiMeSjjlK/KHi4bA/7u5CKwZRbIOPlWTxRNAt/+ZB41A7tiL
	 BRZJfFPkrEbtHFrhf15VMVhzjgB1oDMAvHK1xz8ATugOhXLq5LAbI+fRt09z5DANnI
	 RFm7wibzbb9unhz46OWkwdAqHCfXxZbM/NAXawluTbjupjmNONOf6Kf6j5u06olF8n
	 brqU/7kmRYBCdLCsHCcblfDfnj/7NHDRXzlX8zi28R1929oOzqNclZubOne+2sQKiT
	 NsmWQDkeKfq4bgKcg8TF/VeuCof0qljEF8gqIZdAEontHPc9GUCOkuo+pcMTg+wiCl
	 +qo6jjC3aiHoA==
Date: Wed, 25 Feb 2026 18:45:58 +0530
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
Subject: Re: [PATCH V5 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <dzykdgno7cuy5pc6gcooq7s2dbdzb5p2tktuswk6uiyrnx5fzi@nv7hbkodrxce>
References: <20260213040852.3340547-1-sherry.sun@nxp.com>
 <20260213040852.3340547-3-sherry.sun@nxp.com>
 <woglgacwnhpzy3wrevjs4am4rs754tajzmhvndli4u2fycmzuf@rvbwfzcgnsrf>
 <VI0PR04MB12114C1EF27CE2314B2E789EE9274A@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114C1EF27CE2314B2E789EE9274A@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051609_189641_5819412B 
X-CRM114-Status: GOOD (  30.96  )
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

On Tue, Feb 24, 2026 at 10:24:41AM +0000, Sherry Sun wrote:
> > Subject: Re: [PATCH V5 02/12] PCI: host-generic: Add common helpers for
> > parsing Root Port properties
> >
> > On Fri, Feb 13, 2026 at 12:08:42PM +0800, Sherry Sun wrote:
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
> > >  drivers/pci/controller/pci-host-common.c | 58
> > > ++++++++++++++++++++++++  drivers/pci/controller/pci-host-common.h |
> > 15 ++++++
> > >  drivers/pci/probe.c                      |  2 +
> > >  include/linux/pci.h                      |  1 +
> > >  4 files changed, 76 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/pci-host-common.c
> > > b/drivers/pci/controller/pci-host-common.c
> > > index d6258c1cffe5..0c35907a5076 100644
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
> > > @@ -17,6 +18,63 @@
> > >
> > >  #include "pci-host-common.h"
> > >
> > > +/**
> > > + * pci_host_common_parse_port - Parse a single Root Port node
> > > + * @bridge: PCI host bridge
> > > + * @node: Device tree node of the Root Port
> > > + *
> > > + * Returns: 0 on success, negative error code on failure  */ static
> > > +int pci_host_common_parse_port(struct pci_host_bridge *bridge,
> > > +                                 struct device_node *node)
> > > +{
> > > +   struct device *dev = &bridge->dev;
> > > +   struct pci_host_port *port;
> > > +   struct gpio_desc *reset;
> > > +
> > > +   reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
> > > +                                 "reset", GPIOD_OUT_HIGH, "PERST#");
> >
> > For usecases like link retention from bootloader to kernel, this could be
> > requested as GPIOD_ASIS:
> > https://lore.ke/
> > rnel.org%2Flinux-pci%2F20260109-link_retain-v1-3-
> > 7e6782230f4b%40oss.qualcomm.com%2F&data=05%7C02%7Csherry.sun%40
> > nxp.com%7C55c78c3dde694150dd1408de6d778ccd%7C686ea1d3bc2b4c6fa9
> > 2cd99c5c301635%7C0%7C0%7C639068557422583280%7CUnknown%7CTWFp
> > bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> > MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=zZAzwcH
> > U2y8kH4YP0OoTVN66tUlCEq6m2aAKkWCFeTM%3D&reserved=0
> >
> 
> Hi Manivannan,
> 
> I understand the concern about supporting use‑cases where the PCIe link is
> intentionally retained from bootloader to kernel. However, relying on GPIOD_ASIS
> may introduces a practical problem: it removes any guarantee about the PERST#
> level during the early power‑on window.
> 
> According to the PCIe initialization requirements, PERST# must remain asserted
> until power rails and REFCLK are valid. If we request the GPIO as GPIOD_ASIS, the
> kernel no longer controls or even knows the actual state of PERST# at probe time,
> which means the device may observe a deassert reset before power/clock stable,
> it is risky even xx_pcie_host_init() asserts/deasserts PERST# again after enable
> power rails hoping to reset the device cleanly. Once PERST# is released before
> power or clock rails are fully valid, the device may already have entered undefined
> or partially‑initialized states. Even if the driver asserts PERST# later, this does not
> guarantee that all internal domains return to a well‑defined reset state. Some
> implementations do not route PERST# to all functional blocks, or early deassert
> during unstable power/clock conditions can leave the PCIe controller or endpoint
> PHY/LTSSM in inconsistent conditions. Consequently, such a sequence can still lead
> to undefined device state, failed link training, or inconsistent enumeration behavior.
> 

I don't think this is true. Even if you request PERST# as GPIOD_ASIS, if you
explicitly assert it *before* doing the controller initialization, net result
would be the same.

Like,
	devm_fwnode_gpiod_get(GPIOD_ASIS)
	...
	assert_perst()
	(perform controller initialization and enable resources)
	deassert_perst()

So if you request PERST# as GPIOD_OUT_HIGH, the first assert_perst() becomes a
NOP, otherwise, the endpoint gets asserted right before the controller
initialization.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

