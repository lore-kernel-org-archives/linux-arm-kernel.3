Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E87E9D832
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAztmg0IaEIkei8ETA9N0837QRPmJM/vXIMB31S3srE=; b=M52q/QbLkc2PgJRY4NQwrIBClp
	ixXut2c302dN2sySAb6xaR/EvLC+XlRIjzUKLHtmIo2LEEJv/fYxXnUPu8RI5EbfOUOlI/KfIaKhF
	gjoqOf4ygiD48ujXEja8NsH1oO7w0hxrEonw4KE32qIG1KnITk4V40rfP4uRLeeAUM2RmcW83UdCI
	FA9/umpIOD1+fESITynLfz4duYqQzIkvF0EIQSNXOZFEowIb0BxyiJbyNl3h/HFxzzwbfYfvhhc6b
	rRz2cD3k1qUJxbCPRxxMm0rLldC3Xfe7VLOeoM64AMTeVfxUiI4tRblY38d9XX2ivqJac5My46ZOI
	bjX9BoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0Ix-0000000622z-1gwJ;
	Tue, 07 Apr 2026 06:52:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0Iu-0000000622b-3ttm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7953244213;
	Tue,  7 Apr 2026 06:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC4FC19424;
	Tue,  7 Apr 2026 06:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544772;
	bh=WGsLWUaefXttIWa4xg//3ucHTQKXOeomFOP2gCuLPaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMiZJyBS4mIHsbyctppDhmAKIiEAFEcyZzWgxNdB/JZgKoP9I6U0Z0gMuyODk/+0w
	 PJkA8c2thFkCppygUqBiD3WNPgwFWMWK+hSpvwCeR2/VSIZIrTfWurnRMHwap7A/9L
	 uPnBZHFMEbz6ZdDp18rxenqpokrVLSS1txIbHpwjFBzLLTeleOsTn1pfvib8/MO9o3
	 prj50U83P8JLIE+csPT/sFsyhuw2M7qOYO0dup5/FLdVOJJA8Q9Gx6P9uLukSI/rCt
	 eRq5/GdmHiadCfIenQawy4MHHPOHHUib1ZfCgf/J+2uv/51LwA1Gqg8QW5dUgBdhVU
	 wt9wjPX0hjMSw==
Date: Tue, 7 Apr 2026 12:22:42 +0530
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
Subject: Re: [PATCH V10 03/13] PCI: dwc: Parse Root Port nodes in
 dw_pcie_host_init()
Message-ID: <gxqcmujdzlzcoawn4rkttasftuyusqtvycu7oagogxaw4yggeo@ww6rjdwbyj2w>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
 <20260402095107.205439-4-sherry.sun@nxp.com>
 <xlsfwtcy3wl6nasmx2w2oys6u4bbnvh24qiwr4pf3v5uz523gz@qvhzqfcs5q2c>
 <VI0PR04MB121147E4D3F9FDC95391C1153925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB121147E4D3F9FDC95391C1153925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_235253_006384_BBE29A0F 
X-CRM114-Status: GOOD (  24.38  )
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

On Tue, Apr 07, 2026 at 03:21:30AM +0000, Sherry Sun wrote:
> > On Thu, Apr 02, 2026 at 05:50:57PM +0800, Sherry Sun wrote:
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
> > > index da152c31bb2e..f6fca984fb34 100644
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
> > > +		dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
> > > +		return ret;
> > 
> > Won't this change break drivers that parse Root Ports on their own? Either
> > you need to modify them also in this change or call this API from imx6 driver
> > and let other drivers switch to it in a phased manner.
> > 
> > I perfer the latter.
> 
> Hi Mani, sorry I didn't fully get your point here, there are no changes to this part
> V10, for drivers that parse Root Ports on their own, here pci_host_common_parse_ports()
> will return -ENOENT, so nothing break as we discussed this in V8
> https://lore.kernel.org/all/dcl3bdljrdzgeaybrg3dc5uaxkebkjns7pajix6mxxftao5g4m@vm3ywyyp4ujh/.
> 

So if this API gets called first, it will acquire PERST# from the Root Port node
and if the controller drivers try to do the same in their own parsing code,
PERST# request will return -EBUSY and the probe will fail.

On the other hand, if the controller drivers parse PERST# first, this API will
return -EBUSY and will result in probe failure.

Only way to fix this issue would be to call this API from imx6 driver for now
and start migrating other drivers later.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

