Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0175FF33832
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4/hZ11vQ2Opv0IhXfgJR48KdwXlSseZv1LSAvBEEKw=; b=JBETQgdsmcSr4gZpAKFiKfBQ+r
	l1YTs72jVPtveab5NKvUtkzF0sV0KkK46cNgrLFkZShRy3YZWBDvI3a70KK7T4ZMZicjIxq3K2thq
	Y5XGAm5BUYTfi+miqJgbVaz3UNLdzQDA4JqqmkM+xtXffifBeiPpGGzO/D0GUg8CZR+Jhns6k/aFa
	p/BrCHxCg4QPQ+lBiMZcGu8+mthzAvxxfTC1IRTeAEACzV/W9jEzSiVUz0fGSRFh6rrZ9dIjANYri
	jmMmW2SYaH5qf+sFTeh4pYXzXYtWdeLrR+ulYEz3Op7TQGF7Z06T7T5+fcG8j3+4zeOc0I8r6IRdp
	wUCirjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RC2-00000005wEA-1GQw;
	Tue, 17 Mar 2026 09:58:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RC0-00000005wDz-3tao
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2630460008;
	Tue, 17 Mar 2026 09:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA2CC4CEF7;
	Tue, 17 Mar 2026 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773741507;
	bh=rchBqbaOIKv5oV3MU7BS8XXeDEb35evaTjYmNTF+LAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGrHGe6vr+idGi9l2EdsRoQIuTJraMun6x4OV1mBRtJvS7IRHJruIFnlbvYi1W9Eq
	 ShdbAcxJFz5NHFUVm24V3XhElGwxX7FHWFpZGkzSpnZjApCqpB6sMyFEYziS6LhWX0
	 zPIcnEOtsUpSteOlR42LG2yUzfpr1vlW64ejsFBWUP62w37NmhJQMlCkOdBWmCaFM7
	 QFlKgGbfnSN88kzLQvm4zOzTRDktnLzsIw3HKphdHhhkJDOpvECboVDbqT9Pm3fxq/
	 i9QTgd8ldobadY/7S1GKB7VHqPFG/yRW/N6DA9z2xOBB8pFzPhxXYO/0y4IV8Bu+4w
	 I+TUEORAaE/wQ==
Date: Tue, 17 Mar 2026 15:28:18 +0530
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
Subject: Re: [PATCH V8 03/13] PCI: dwc: Parse Root Port nodes in
 dw_pcie_host_init()
Message-ID: <dcl3bdljrdzgeaybrg3dc5uaxkebkjns7pajix6mxxftao5g4m@vm3ywyyp4ujh>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
 <20260313020823.1592389-4-sherry.sun@nxp.com>
 <ay67y5hr7sn5zzugb4swkujao3bvz3puaee4bc6qqr67eyk74t@equoecxosaen>
 <VI0PR04MB12114EC2939CCC6D0696685B49241A@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114EC2939CCC6D0696685B49241A@VI0PR04MB12114.eurprd04.prod.outlook.com>
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

On Tue, Mar 17, 2026 at 09:04:51AM +0000, Sherry Sun wrote:
> > Subject: Re: [PATCH V8 03/13] PCI: dwc: Parse Root Port nodes in
> > dw_pcie_host_init()
> > 
> > On Fri, Mar 13, 2026 at 10:08:13AM +0800, Sherry Sun wrote:
> > > Add support for parsing Root Port child nodes in dw_pcie_host_init()
> > > using pci_host_common_parse_ports(). This allows DWC-based drivers to
> > > specify Root Port properties (like reset GPIOs) in individual Root
> > > Port nodes rather than in the host bridge node.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index a74339982c24..9608f9fcd1b3 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/platform_device.h>
> > >
> > >  #include "../../pci.h"
> > > +#include "../pci-host-common.h"
> > >  #include "pcie-designware.h"
> > >
> > >  static struct pci_ops dw_pcie_ops;
> > > @@ -581,6 +582,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >
> > >  	pp->bridge = bridge;
> > >
> > > +	/* Parse Root Port nodes if present */
> > > +	ret = pci_host_common_parse_ports(dev, bridge);
> > > +	if (ret && ret != -ENOENT) {
> > 
> > Is there an incentive in the -ENOENT error code? Should the API just return 0
> > if no ports are found?
> > 
> 
> Hi Mani,
> 
> Since devm_fwnode_gpiod_get() is called within pci_host_common_parse_ports(),
> devm_fwnode_gpiod_get() will return -ENOENT if no GPIO found. That means we
> need to check and handle the -ENOENT error anyway, we can either handle it internally
> in pci_host_common_parse_ports() or in the upper caller. 
> 
> If we hide -ENOENT inside pci_host_common_parse_ports() and always return 0, we
> lose this distinction, the caller can no longer tell the difference between "not found" and
> "found and parsed successfully". This might be useful that different callers might want to
> handle differently.
> 
> The current pattern is also consistent with some other optional resource APIs in the
> kernel (e.g., devm_regulator_get_optional()), where -ENOENT is returned and the caller
> decides how to handle it.
> 

Sure. But since the current callers are not making use of it, I thought of just
returning 0. It fine with me to leave it as is.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

