Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1EAD72A14
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIkmnIZXkVXCBZyrGPXdquUqDY3shegjt7PeZnasvmc=; b=VDhrcBNGGKbJckfnL4waDJE8Ia
	W+kqkqVOyKt9KlI1r1uJWwKQEkOxzaTO2qmkCFnl8RaOuq3mPg7W8sm8NNVz95p0k5xNoJ4yEyHdQ
	a3tj43MjQUAwKWxwG42ZuvEa9RN8Df7wQcpT+KEy3xd7HyirndvW+Ue/MfC1Y/Rv3ZqSwYW98YxVb
	TcBDbPjfuCKbHKzo5HuS36Au/YFklzlzrR/wWBzIMetuRa88WWjSe7rPNmhRIM2ZBU/92EViK0zit
	fglmLiM9mvuMOzKJXacT9LHKieXZj1iU8IpXn7VGSj2PX1QqOnNu8VcvJvUycsdkKtoGiCIFrDjfo
	rm41rn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH8PQ-00000000yPt-0IrG;
	Fri, 29 Nov 2024 21:20:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH8OQ-00000000yJc-3k7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 21:19:16 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tH8Nv-00058G-Qc; Fri, 29 Nov 2024 22:18:43 +0100
Message-ID: <9ca967aea19d6c28327f3a9bb77e23f6245603e9.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
From: Lucas Stach <l.stach@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>, Christian Bruel
	 <christian.bruel@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, 
 robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 conor+dt@kernel.org,  mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,  cassel@kernel.org,
 quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 29 Nov 2024 22:18:40 +0100
In-Reply-To: <20241129205822.GA2772018@bhelgaas>
References: <20241129205822.GA2772018@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_131914_921509_A46B5554 
X-CRM114-Status: GOOD (  21.97  )
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

Am Freitag, dem 29.11.2024 um 14:58 -0600 schrieb Bjorn Helgaas:
> [+to Rob, DMA mask question]
>=20
> On Tue, Nov 26, 2024 at 04:51:16PM +0100, Christian Bruel wrote:
> > Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
> > DesignWare PCIe core.
>=20
> Can you include the numeric rate, not just "gen2", so we don't have to
> search for it?
>=20
> > +static int stm32_pcie_resume_noirq(struct device *dev)
> > +{
> > +	struct stm32_pcie *stm32_pcie =3D dev_get_drvdata(dev);
> > +	struct dw_pcie *pci =3D stm32_pcie->pci;
> > +	struct dw_pcie_rp *pp =3D &pci->pp;
> > +	int ret;
> > +
> > +	/* init_state must be called first to force clk_req# gpio when no
> > +	 * device is plugged.
> > +	 */
>=20
> Use drivers/pci/ conventional comment style:
>=20
>   /*
>    * text ...
>    */
>=20
> > +static bool is_stm32_pcie_driver(struct device *dev)
> > +{
> > +	/* PCI bridge */
> > +	dev =3D get_device(dev);
> > +
> > +	/* Platform driver */
> > +	dev =3D get_device(dev->parent);
> > +
> > +	return (dev->driver =3D=3D &stm32_pcie_driver.driver);
> > +}
> > +
> > +/*
> > + * DMA masters can only access the first 4GB of memory space,
> > + * so we setup the bus DMA limit accordingly.
> > + */
> > +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
> > +{
> > +	dev_dbg(&pdev->dev, "disabling DMA DAC for device");
> > +
> > +	pdev->dev.bus_dma_limit =3D DMA_BIT_MASK(32);
>=20
> I don't think this is the right way to do this.  Surely there's a way
> to describe the DMA capability of the bridge once instead of iterating
> over all the downstream devices?  This quirk can't work for hot-added
> devices anyway.
>=20
This should simply be a dma-ranges property in the PCIe host controller
DT node, which should describe the DMA address range limits for
transactions passing through the host.

Regards,
Lucas

> > +	return 0;
> > +}
> > +
> > +static void quirk_stm32_dma_mask(struct pci_dev *pci)
> > +{
> > +	struct pci_dev *root_port;
> > +
> > +	root_port =3D pcie_find_root_port(pci);
> > +
> > +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
> > +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
> > +}
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dm=
a_mask);
>=20


