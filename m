Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB71C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Eg3HHUMxHoC8I4dGpxpLD95IOv+OEU1PWc03JVuTtA=; b=SDg1yDF1XSYfZORkCYtnLCMCgt
	c6sDrVAlOllJ3KAjKNEtBuhTYNwDANF93P8k6AV+6keG2RI6cFWa3ra9a5xRGjSy04X2bGPknkRGJ
	/m5gEdNf9Q47sdsW4HYekQ/btdIBLqRZ6CGKYf+9OYAjsk+fUy91+stUcNtRIduozka9NiOMQL0+G
	AZL5S5SK6oASM/Z8fDzCJDk1+uIUVy5Qd2MWoOVizvysCGIUVzjxCvfXDExABCLPcIZz4K0y0OOqx
	Q4F6A4DxHjx6fBQ602oMg4HRIRHEWZhICQL1PPGHv0WRt77GArSeeQXJPeqnEdmzuku1B1BNdREf4
	5OUthJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHTk-00000007pqV-239d;
	Wed, 12 Mar 2025 08:30:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHS5-00000007pfA-0oKO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 08:28:34 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tsHRb-0003yH-Gu; Wed, 12 Mar 2025 09:28:03 +0100
Message-ID: <fcb5f09f8e4311c7a6ef60aaf3cb4e3f05a8f05e.camel@pengutronix.de>
Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the
 hardcodes
From: Lucas Stach <l.stach@pengutronix.de>
To: Hongxing Zhu <hongxing.zhu@nxp.com>, Bjorn Helgaas <helgaas@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "lpieralisi@kernel.org"
 <lpieralisi@kernel.org>,  "kw@linux.com" <kw@linux.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,  "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,  "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Wed, 12 Mar 2025 09:28:02 +0100
In-Reply-To: <DU2PR04MB8677AC699DF11D847AB768708CD02@DU2PR04MB8677.eurprd04.prod.outlook.com>
References: <AS8PR04MB8676E66BD40C37B2A7E390178CD12@AS8PR04MB8676.eurprd04.prod.outlook.com>
	 <20250311155452.GA629749@bhelgaas>
	 <DU2PR04MB8677AC699DF11D847AB768708CD02@DU2PR04MB8677.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_012833_230869_809AB71C 
X-CRM114-Status: GOOD (  39.61  )
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

Am Mittwoch, dem 12.03.2025 um 04:05 +0000 schrieb Hongxing Zhu:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2025=E5=B9=B43=E6=9C=8811=E6=97=A5 23:55
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kw@linux.com; manivannan.sadhasivam@linaro.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; festevam@gmail.com; devicetree@vger.kernel.org;
> > linux-pci@vger.kernel.org; imx@lists.linux.dev; kernel@pengutronix.de;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the
> > hardcodes
> >=20
> > On Tue, Mar 11, 2025 at 01:11:04AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > Sent: 2025=E5=B9=B43=E6=9C=8810=E6=97=A5 23:11
> > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > > shawnguo@kernel.org; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > > > kw@linux.com; manivannan.sadhasivam@linaro.org;
> > bhelgaas@google.com;
> > > > s.hauer@pengutronix.de; festevam@gmail.com;
> > > > devicetree@vger.kernel.org; linux-pci@vger.kernel.org;
> > > > imx@lists.linux.dev; kernel@pengutronix.de;
> > > > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace th=
e
> > > > hardcodes
> > > >=20
> > > > On Wed, Feb 26, 2025 at 10:42:56AM +0800, Richard Zhu wrote:
> > > > > Use the domain number replace the hardcodes to uniquely identify
> > > > > different controller on i.MX8MQ platforms. No function changes.
> > > > >=20
> > > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > > ---
> > > > > =C2=A0drivers/pci/controller/dwc/pci-imx6.c | 14 ++++++--------
> > > > > =C2=A01 file changed, 6 insertions(+), 8 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > index 90ace941090f..ab9ebb783593 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > @@ -41,7 +41,6 @@
> > > > > =C2=A0#define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
> > > > > =C2=A0#define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
> > > > > =C2=A0#define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11,
> > 8)
> > > > > -#define IMX8MQ_PCIE2_BASE_ADDR			0x33c00000
> > > > >=20
> > > > > =C2=A0#define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > > > > =C2=A0#define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > > > > @@ -1474,7 +1473,6 @@ static int imx_pcie_probe(struct
> > > > > platform_device
> > > > *pdev)
> > > > > =C2=A0	struct dw_pcie *pci;
> > > > > =C2=A0	struct imx_pcie *imx_pcie;
> > > > > =C2=A0	struct device_node *np;
> > > > > -	struct resource *dbi_base;
> > > > > =C2=A0	struct device_node *node =3D dev->of_node;
> > > > > =C2=A0	int i, ret, req_cnt;
> > > > > =C2=A0	u16 val;
> > > > > @@ -1515,10 +1513,6 @@ static int imx_pcie_probe(struct
> > > > platform_device *pdev)
> > > > > =C2=A0			return PTR_ERR(imx_pcie->phy_base);
> > > > > =C2=A0	}
> > > > >=20
> > > > > -	pci->dbi_base =3D devm_platform_get_and_ioremap_resource(pdev,
> > 0,
> > > > &dbi_base);
> > > > > -	if (IS_ERR(pci->dbi_base))
> > > > > -		return PTR_ERR(pci->dbi_base);
> > > >=20
> > > > This makes me wonder.
> > > >=20
> > > > IIUC this means that previously we set controller_id to 1 if the
> > > > first item in devicetree "reg" was 0x33c00000, and now we will set
> > > > controller_id to 1 if the devicetree "linux,pci-domain" property is=
 1.
> > > > This is good, but I think this new dependency on the correct
> > > > "linux,pci-domain" in devicetree should be mentioned in the commit =
log.
> > > >=20
> > > > My bigger worry is that we no longer set pci->dbi_base at all.  I
> > > > see that the only use of pci->dbi_base in pci-imx6.c was to
> > > > determine the controller_id, but this is a DWC-based driver, and th=
e
> > > > DWC core certainly uses
> > > > pci->dbi_base.  Are we sure that none of those DWC core paths are
> > > > important to pci-imx6.c?
> > > Hi Bjorn:
> > > Thanks for your concerns.
> > > Don't worry about the assignment of pci->dbi_base.
> > > If pci-imx6.c driver doesn't set it. DWC core driver would set it whe=
n
> > > =C2=A0dw_pcie_get_resources() is invoked.
> >=20
> > Great, thanks!  Maybe we can amend the commit log to mention that and
> > the new "linux,pci-domain" dependency.
> How about the following updates of the commit log?
>=20
> Use the domain number replace the hardcodes to uniquely identify
> different controller on i.MX8MQ platforms. No function changes.
> Please make sure the " linux,pci-domain" is set for i.MX8MQ correctly, si=
nce
> =C2=A0the controller id is relied on it totally.
>=20
This breaks running a new kernel on an old DT without the
linux,pci-domain property, which I'm absolutely no fan of. We tried
really hard to keep this way around working in the i.MX world.

I'm fine with using the property if present and even mandating it for
new platforms, but getting rid of the existing code for the i.MX8MQ
platform is only a marginal cleanup of the driver code with the obvious
downside of the above breakage.

Regards,
Lucas

