Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF46D44C67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt5/Jla47xnRpCTeglQDnku1TanwOQ9fk9T2xPq3hAg=; b=CANYJnDGwoDws0PpJKdVQCyQWz
	5UPhJ9nJkDAR6ZV60BTPqutpR6xVn0Otq1lDYmyMJU7EWHUm+Nl7hdOEbb2+FKEbqoDoeicFM4p+D
	E7neqz9W78x04tpnxZj5JCIgfTQf5aAHGUVc9tDWn6pHPWmqr+X7rOw7jTW0BIS8X7FR6tlVXJglp
	rE1MS1/WThs1sfa3R1CCMudCziPux7FgjJ/AN6UedDyyrG2KWBwTBzWgiLEN8hWyh82L3tKrwNBRl
	UB2j146tG0rk8ThayYuoA3kuwDPGrZWctfydcChLZCA6+bu/XPbO7a403CplIfi3/su0qOFx1wNgr
	p/4VJtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPOF-0000000CbsQ-1Ftg;
	Thu, 15 Jan 2026 15:36:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPOC-0000000Cbrx-3shc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 15:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC9F840DF5;
	Thu, 15 Jan 2026 15:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE23EC116D0;
	Thu, 15 Jan 2026 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491359;
	bh=ba4TWvFWpSIOZy47Mwu+Mtaoe2Sy+4tdPfiDGXoPsgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYM4CjX9tlHYehK4JYmPMTSTc+H2yn9ztnTSQD1VHNDXoY8xVduFYQ+yXBwvKJcmw
	 mODvHP41pzinHYaNSg/h03Azc4gfzgBFQ8QWv8VNtAuPdLWQLT+p/dV0OmuQUWJU+J
	 qyc6+R42hoIVDNVBZCC5Rk4HPe6WRggwvj72CHc0vrPszPj7PBHQLEQKBHHo+cbv+9
	 4JUSrqpmoW3eDI38d1Hit39os9PtI7mTBtWE1WeKmZsjnKQquygmSbvgmEOjDMK5eM
	 6jgomLdWialEZcebnX3avfpLPtzf82gBm0z+2kqJTMmqzQRJr/eUW4cSokEH+nNv7Q
	 Av4+8r8sZ6fEQ==
Date: Thu, 15 Jan 2026 21:05:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v8 2/2] PCI: dwc: Don't return error when wait for link
 up in dw_pcie_resume_noirq()
Message-ID: <egnjo4t6odkhnbcusy2daosqm37a36bu6xc25pdgr4bbli2v5j@r7cwxkwfafbj>
References: <20260107024553.3307205-1-hongxing.zhu@nxp.com>
 <20260107024553.3307205-3-hongxing.zhu@nxp.com>
 <7akwvdfve5jcj2tm7jiwowkvcctsmqeslia4pulvtdgcgicp4p@h5ztwyp4h7ft>
 <AS8PR04MB8833FD0095481ADD280363628C8FA@AS8PR04MB8833.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8833FD0095481ADD280363628C8FA@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_073601_001687_94299FE7 
X-CRM114-Status: GOOD (  27.37  )
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

On Wed, Jan 14, 2026 at 06:46:23AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > Sent: 2026年1月13日 23:30
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; jingoohan1@gmail.com;
> > l.stach@pengutronix.de; lpieralisi@kernel.org; kwilczynski@kernel.org;
> > robh@kernel.org; bhelgaas@google.com; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> > Subject: Re: [PATCH v8 2/2] PCI: dwc: Don't return error when wait for link up
> > in dw_pcie_resume_noirq()
> >
> > On Wed, Jan 07, 2026 at 10:45:53AM +0800, Richard Zhu wrote:
> > > When waiting for the PCIe link to come up, both link up and link down
> > > are valid results depending on the device state.
> > >
> > > Since the link may come up later and to get rid of the following
> > > mis-reported PM errors. Do not return an -ETIMEDOUT error, as the
> > > outcome has already been reported in dw_pcie_wait_for_link().
> > >
> > > PM error logs introduced by the -ETIMEDOUT error return.
> > > imx6q-pcie 33800000.pcie: Phy link never came up imx6q-pcie
> > > 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
> > > imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume
> > > functionality")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index 06cbfd9e1f1e..025e11ebd571 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -1245,10 +1245,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
> > >     if (ret)
> > >             return ret;
> > >
> > > -   ret = dw_pcie_wait_for_link(pci);
> > > -   if (ret)
> > > -           return ret;
> > > +   /* Ignore errors, the link may come up later */
> > > +   dw_pcie_wait_for_link(pci);
> >
> > It is not safe to ignore failures during resume. Because, if a device gets
> > removed during suspend, the link up error will be unnoticed. I've proposed a
> > different logic in this series, which should address your issue:
> > https://lore.kern/
> > el.org%2Flinux-pci%2F20260107-pci-dwc-suspend-rework-v4-0-9b5f3c72df0a%
> > 40oss.qualcomm.com%2F&data=05%7C02%7Chongxing.zhu%40nxp.com%7Cf8
> > 79871f9d0445aa0a3c08de52b8a2c0%7C686ea1d3bc2b4c6fa92cd99c5c301635
> > %7C0%7C0%7C639039150121991830%7CUnknown%7CTWFpbGZsb3d8eyJFbXB
> > 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbC
> > IsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=PNdsT530dbRQkgYsrr99gB1cUE
> > BLOkynvciC9tiB0Ic%3D&reserved=0
> >
> > Please test it out.
> Hi Mani:
> You're right.
> Tested on i.MX platforms, no error return anymore. Only "Device not found" is
>  dumped out when no endpoint device is connected. Thanks.
> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> 

Please share the tag by replying to that series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

