Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E95FEEF29
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgpBOoOwh6cAlJXbNXVeJlWI2nVgwUU+EC/NGpZAHzc=; b=g+wpMVHD4WGFpnQCtauX8g2yYr
	syZYuSxomauWMzXQ1HVS+0dgkno9sQJCn26WKhG0+uI5chrhwwGQDztCcu+gD8NbDxIh9zvbEszk2
	f2HOIGFS3A9rGA/kMBTpC4dLfPwgQjpvLWy1b+f0v7mBItQjagbnwgfLu+WwhcDZJQmpzrwTU6oZa
	vjy5gwUyjzotTA/J5OlAycZLjZQElv7i5PfZ4GDYx+s9sEbxn9gXmax114TqPi2FoTf7H2Csy8dUp
	EQ0PNSw12si1BgbSF30YtQjzYNAshp6rJkz5MyIBy9NeknfMWQocKyesO50+Kxg3rQnIbSEEEBo5P
	4en/pz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5Ra-00000006R17-2x3Z;
	Tue, 07 Apr 2026 12:22:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5RX-00000006R0H-0Zdu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78B5C42A6E;
	Tue,  7 Apr 2026 12:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0FEC2BCAF;
	Tue,  7 Apr 2026 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775564526;
	bh=1TUefvz+H4xd3k5G8cPa8kcWF0qvRfqQhOoDSIGLRRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBRLLt3J4nen368FHwrZJK8G4/4b8C2Fa7uQuPmXLQx3zj71M1fllC2QTJRMcZz6i
	 C5cLGq5hrRE1fRmJuBd0jTbZM/pS3Xyl5l38HQq4B93AHI1uTVledqn2rZ0R8Gvn5k
	 tFGIZSsw8V9VCqRsmj94HfM/VYOxwGQW9Pj7+xx9r4UaVdbFrLob3vs/p70YtBSk+S
	 /dx2v9Q5hw2sWMba+f1TtQBocMt8jpZj8IHKgwz0BHtxpasectx+pNDfp2CdGa2XzH
	 hKDgW3McD3gTo6guNmsNE0bRxG5zxFxvBDQBQcfCB2BwrXvm91vmwo+g44wqNNHpmU
	 0Ov7lsG+YNyZA==
Date: Tue, 7 Apr 2026 17:51:56 +0530
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
Message-ID: <raoddpjy27hf7xoivte7nq2qd56ty2aq42av64lsgzxvzpz7pf@zq27d5nv7wwj>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
 <20260402095107.205439-4-sherry.sun@nxp.com>
 <xlsfwtcy3wl6nasmx2w2oys6u4bbnvh24qiwr4pf3v5uz523gz@qvhzqfcs5q2c>
 <VI0PR04MB121147E4D3F9FDC95391C1153925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <gxqcmujdzlzcoawn4rkttasftuyusqtvycu7oagogxaw4yggeo@ww6rjdwbyj2w>
 <VI0PR04MB12114DFBAB7D1537A9A0A7CEB925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114DFBAB7D1537A9A0A7CEB925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_052207_218288_26585308 
X-CRM114-Status: GOOD (  31.91  )
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

On Tue, Apr 07, 2026 at 09:18:58AM +0000, Sherry Sun wrote:
> > On Tue, Apr 07, 2026 at 03:21:30AM +0000, Sherry Sun wrote:
> > > > On Thu, Apr 02, 2026 at 05:50:57PM +0800, Sherry Sun wrote:
> > > > > Add support for parsing Root Port child nodes in
> > > > > dw_pcie_host_init() using pci_host_common_parse_ports(). This
> > > > > allows DWC-based drivers to specify Root Port properties (like
> > > > > reset GPIOs) in individual Root Port nodes rather than in the host bridge
> > node.
> > > > >
> > > > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > > > ---
> > > > >  drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > index da152c31bb2e..f6fca984fb34 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > > @@ -20,6 +20,7 @@
> > > > >  #include <linux/platform_device.h>
> > > > >
> > > > >  #include "../../pci.h"
> > > > > +#include "../pci-host-common.h"
> > > > >  #include "pcie-designware.h"
> > > > >
> > > > >  static struct pci_ops dw_pcie_ops; @@ -581,6 +582,13 @@ int
> > > > > dw_pcie_host_init(struct dw_pcie_rp *pp)
> > > > >
> > > > >         pp->bridge = bridge;
> > > > >
> > > > > +       /* Parse Root Port nodes if present */
> > > > > +       ret = pci_host_common_parse_ports(dev, bridge);
> > > > > +       if (ret && ret != -ENOENT) {
> > > > > +               dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
> > > > > +               return ret;
> > > >
> > > > Won't this change break drivers that parse Root Ports on their own?
> > > > Either you need to modify them also in this change or call this API
> > > > from imx6 driver and let other drivers switch to it in a phased manner.
> > > >
> > > > I perfer the latter.
> > >
> > > Hi Mani, sorry I didn't fully get your point here, there are no
> > > changes to this part V10, for drivers that parse Root Ports on their
> > > own, here pci_host_common_parse_ports() will return -ENOENT, so
> > > nothing break as we discussed this in V8
> > https://lore.ke/
> > rnel.org%2Fall%2Fdcl3bdljrdzgeaybrg3dc5uaxkebkjns7pajix6mxxftao5g4m%40
> > vm3ywyyp4ujh%2F&data=05%7C02%7Csherry.sun%40nxp.com%7Cd9faef64b
> > 8154bdbc6ee08de94724b22%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> > 7C0%7C639111415791802118%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> > hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl
> > dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=POsurqr9RqBCnaQyeXDK2HQTN
> > a4Nc0tfl7thSiM9qHA%3D&reserved=0.
> > >
> >
> > So if this API gets called first, it will acquire PERST# from the Root Port node
> > and if the controller drivers try to do the same in their own parsing code,
> > PERST# request will return -EBUSY and the probe will fail.
> >
> > On the other hand, if the controller drivers parse PERST# first, this API will
> > return -EBUSY and will result in probe failure.
> >
> > Only way to fix this issue would be to call this API from imx6 driver for now
> > and start migrating other drivers later.
> >
> 
> Ok, get your point here. Your assumption is based on the premise that the controller
> driver parse the reset-gpios in the Root Port node, not that most controller drivers
> now use reset under the host bridge node. For reset-gpios in the Root Port node,
> they should eventually switch to this common API.
> 

Not many, but still some and it is paramount to not regress them. That's my
point.

> Anyway, I will call this API in imx6 driver at this stage to avoid impact other platforms.
> 

Sounds good!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

