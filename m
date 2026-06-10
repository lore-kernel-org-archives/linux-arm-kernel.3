Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2807CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoDQj9C+O53bida9VWp4KyKOTlqF1LiwyZOTItdETEU=; b=5EqITpdvFhEKrnnoBemOp1arOv
	hH9VNrD/iogMMdwM2IiHd90aDWAL9kd42FDjltCkmLpYNkmHtJceJcRxcn4scxd9CXHa4pQcsi7OM
	bv+d0lijRI/8qMiVb21vJ22QC52pcwBY/VxwAZKiwQAnrrKqxdijJ00WaWRvWZ6e7tX96rtjTfvzu
	O7Mc/wgIYqGhIJs8aWz29EL9kBqfX3zpevn7USLb+yYLxy/ZoQznKAIBhs/h/egaI3JI4x+oW7ulk
	PonDxxriYAR1ScmeMLwJf/lB2zoG3XevkSaoOnhc6iRLd7pHFQZH+30zfpQaHwXJYjJ5g0ZYwIrjy
	YZ8nCCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKns-000000081Me-2pZs;
	Wed, 10 Jun 2026 15:25:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKnr-000000081MX-1uaS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 15:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 080D843F3F;
	Wed, 10 Jun 2026 15:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8781F00893;
	Wed, 10 Jun 2026 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105114;
	bh=UoDQj9C+O53bida9VWp4KyKOTlqF1LiwyZOTItdETEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IasknAdEKSV6icPTxZPXcVV6n70++HIMKNm2VKKl7nFsd4sZELlTYtCEg40os5Vqi
	 mdVkS5qrAQqk6hp7aN3WsyGHZqyj6nv9MVAGsMH7XZ1TgLxJgM97/XpPtGH/PGMrbW
	 romLs2MWDPBzkMoynXxjUemRYB2Whxk08dcdMh6dNVBmoB0HlXixpG4LyTQSfpMmAF
	 0ZP8vZvaCiRKTgeMnSBGC8WmEXXPyKkepuaSWdTqLI1RoREm2xfi2f7FTSCkUpO52+
	 GV8G+qhihGtJzGBP2mP+hfVBnAb1OzAlHmp/Wspm/FDCXKadAUUoK9woGEUOjwgPy7
	 TdKQH9yO3X8/w==
Date: Wed, 10 Jun 2026 17:25:04 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>, 
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and update
 device trees
Message-ID: <r5xhffvpvk7zeedt4lgqj3k4l7gwbctrpljbtjethqyuxbhtyn@nqrvatynn3cu>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
 <GV2PR04MB120194C8BDA9B49C79DCE72168C0E2@GV2PR04MB12019.eurprd04.prod.outlook.com>
 <VI0PR04MB12114B321EB4DFD68B7030F76920E2@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114B321EB4DFD68B7030F76920E2@VI0PR04MB12114.eurprd04.prod.outlook.com>
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

On Thu, May 21, 2026 at 04:40:35AM +0000, Sherry Sun wrote:
> 
> > > -----Original Message-----
> > > From: Sherry Sun (OSS) <sherry.sun@oss.nxp.com>
> > > Sent: Wednesday, May 20, 2026 4:49 PM
> > > To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; Frank Li
> > > <frank.li@nxp.com>; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > festevam@gmail.com; lpieralisi@kernel.org; kwilczynski@kernel.org;
> > > mani@kernel.org; bhelgaas@google.com; Hongxing Zhu
> > > <hongxing.zhu@nxp.com>; l.stach@pengutronix.de
> > > Cc: imx@lists.linux.dev; linux-pci@vger.kernel.org; linux-arm-
> > > kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; Sherry Sun <sherry.sun@nxp.com>
> > > Subject: [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and update
> > > device trees
> > >
> > > From: Sherry Sun <sherry.sun@nxp.com>
> > >
> > > This series integrates the PCI pwrctrl framework into the pci-imx6
> > > driver and updates i.MX EVK board device trees to support it.
> > >
> > > Patches 2-8 update device trees for i.MX EVK boards which maintained
> > > by NXP to move power supply properties from the PCIe controller node
> > > to the Root Port child node, which is required for pwrctrl framework.
> > > Affected boards:
> > > - i.MX6Q/DL SABRESD
> > > - i.MX6SX SDB
> > > - i.MX8MM EVK
> > > - i.MX8MP EVK
> > > - i.MX8MQ EVK
> > > - i.MX8DXL/QM/QXP EVK
> > > - i.MX95 15x15/19x19 EVK
> > >
> > > The driver maintains legacy regulator handling for device trees that
> > > haven't been updated yet. Both old and new device tree structures are
> > supported.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > Hi Sherry:
> > Since the vpcie3v3aux is used to power up the WAKE#, it is always on in this
> > pwrctrl framework whatever the system is in suspend or not, right?
> > 
> 
> Hi Richard,
> Currently the new pwrctrl framework doesn't support vpcie3v3aux, it handles all
> regulators with of_regulator_bulk_get_all() and regulator_bulk_enable/disable().
> The vpcie3v3aux now only works with pci-imx6 driver.
> 

PWRCTRL_GENERIC driver can handle both vpcie3v3 and vpcie3v3aux, but not
POWER_SEQUENCING_PCIE_M2 driver, as there is no 3.3Vaux defined in M.2 spec.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

