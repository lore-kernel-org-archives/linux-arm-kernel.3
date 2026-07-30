Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtGPFV1kYoFZTFrLy90gnVl2h+XGluzuHcWVMW3IwCM=; b=BW5KM18hf+ANR9hT0SQ0sS7nMM
	IFXh5wE5I1DxIh9DMUlQ25O+ruWWbtEVgurr+eOpgkCAhVW2SxJ4ksN7S7NVxsityzjO7TkniUJLV
	7otHtsn+Y28CCFUf+ms1OTsOsnya0YX3Cey1E3Z3vmi31YnMy90DIURswL4LjDWAeGrhEoL6xKrLi
	uBzymNlfYv9V4V6B0l+Oskib1Pwc24w8xrhdOItdMLiQ7h2scNitn0AfH/Cv2O4WVtjeIrvNYwSPS
	ypCE4M+a3qqmwnASWoavj0s6t6cBck8mZbc5hj8y6c/WuddJgnJLICqX6fjNemJ8bwKfO4qGSmAkP
	QcKWLhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL0b-00000009ilv-1hyQ;
	Thu, 30 Jul 2026 07:16:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL0Z-00000009ilW-0hpv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE90E600AA;
	Thu, 30 Jul 2026 07:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D001F000E9;
	Thu, 30 Jul 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395805;
	bh=BtGPFV1kYoFZTFrLy90gnVl2h+XGluzuHcWVMW3IwCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aa0hUTrfug4tvPnKLC6dFH0seh0KgiZtNrvXKFSgZGpCkY7DZhM0vD26dekNyJAwL
	 bGY3NmCHgW5dxgMWepf0bffNF6fStuFOCsUmNAmO3bWG24u662Lx7pv0WJgS62v9XG
	 xtj4Z3UrNo6MXke36YLMISly2FeaW3lna3RYA7VMe2aI1v9gXkAHFl6OdaZ1vkGVnv
	 YW4eOpZ7JJ90yBKIuaQV6FDLb811zi3K/iG6rLDyZ+yBv8OJpFKYaqjQNuyuUZ16BA
	 2JpMv9QAu7Jre+P2D9QDnrq1NLF475N89vv7wvXHz3wCMsVN5V2vf82eA44ifsSOt9
	 X49eld/w9/DLA==
Date: Thu, 30 Jul 2026 09:16:35 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v3] PCI: imx6: Update MPLLB bandwidth to improve i.MX95
 Gen3 PCIe stability
Message-ID: <eugppi6xnusn27qgbcqfe4kwpj4euvwi5lhwniy56rnz7ep3qa@lxiumyyrgl2p>
References: <20260714024107.4113926-1-hongxing.zhu@oss.nxp.com>
 <jtpctss4hz3djqd4ukq634ujfk5jdud6c6r6apgo2syrsubqz2@jivsombtim3v>
 <GV2PR04MB120191536F2B3F4B093719D418CC92@GV2PR04MB12019.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB120191536F2B3F4B093719D418CC92@GV2PR04MB12019.eurprd04.prod.outlook.com>
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

On Thu, Jul 30, 2026 at 07:07:58AM +0000, Hongxing Zhu (OSS) wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > Sent: Wednesday, July 29, 2026 9:58 PM
> > To: Hongxing Zhu (OSS) <hongxing.zhu@oss.nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kwilczynski@kernel.org; robh@kernel.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; linux-
> > pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org; Hongxing Zhu <hongxing.zhu@nxp.com>
> > Subject: Re: [PATCH v3] PCI: imx6: Update MPLLB bandwidth to improve i.MX95
> > Gen3 PCIe stability
> > 
> > On Tue, Jul 14, 2026 at 10:41:07AM +0800, hongxing.zhu@oss.nxp.com wrote:
> > > From: Richard Zhu <hongxing.zhu@nxp.com>
> > >
> > > Bandwidth marginality was observed during i.MX95 Gen3 PCIe tests with
> > > the default MPLLB_BANDWIDTH value. This margin degradation worsens
> > > across voltage and temperature (VT) variations and different test
> > > matrices, potentially causing link stability issues.
> > >
> > > Testing with MPLLB_BANDWIDTH value of 140 (0x8c) shows significant
> > > improvement in bandwidth margins across all VT conditions and test
> > > scenarios.
> > >
> > > Implement PHY register write helper function and configure:
> > > - MPLLB_BW_OVRD_IN = 140 (0x8c) for improved bandwidth margin
> > > - MPLLB_BW_OVRD_EN to enable the override
> > >
> > > This ensures robust PCIe Gen3 performance across all operating
> > > conditions.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > > Changes in v3:
> > > Regarding Frank's comments, refine naming consistency and clarity.
> > >
> > > Changes in v2:
> > > Update the register name and bit definitions.
> > > Don't move IMX95_PCIE_PHY_CR_PARA_SEL settings.
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 53f3da6ab30d5..fadf14de10f7c 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -80,6 +80,17 @@
> > >  #define IMX95_SID_MASK				GENMASK(5, 0)
> > >  #define IMX95_MAX_LUT				32
> > >
> > > +#define IMX95_PCIE_PHY_REG_ADDR			0x3008
> > > +#define IMX95_PCIE_PHY_REG_EN			BIT(31)
> > > +#define IMX95_PCIE_PHY_REG_ADDR_MASK		GENMASK(15, 0)
> > > +#define IMX95_PCIE_PHY_REG_DATA			0x300c
> > > +#define IMX95_PCIE_PHY_MPLLB_OVRD_IN		0x2004
> > > +/* BIT(10): Override enable for mpllb_bandwidth[15:0] */
> > > +#define IMX95_PCIE_PHY_MPLLB_OVRD_BW_EN		0x400
> > 
> > Use BIT(10) please.
> Okay, will change to BIT(10).
> 
> > 
> > > +/* Register offset: Override value for mpllb_bandwidth[15:0] */
> > > +#define IMX95_PCIE_PHY_MPLLB_BW_IN		0x2005
> > > +#define IMX95_PCIE_PHY_MPLLB_BW_VAL		0x8c
> > 
> > Is it possible to define individual bits?
> > 
> This is a 16-bit bandwidth value (140 decimal = 0x8c) recommended by the IC
> designers. It appears to be a complete value rather than a bit field, but
> please let me know if you'd prefer a different representation.
> 

Fine then.

> > > +
> > >  #define IMX95_PCIE_RST_CTRL			0x3010
> > >  #define IMX95_PCIE_COLD_RST			BIT(0)
> > >
> > > @@ -269,6 +280,16 @@ static int imx95_pcie_select_ref_clk_src(struct
> > imx_pcie *imx_pcie)
> > >  	return 0;
> > >  }
> > >
> > > +static void imx95_pcie_phy_write(struct imx_pcie *imx_pcie, int addr,
> > > +u16 data) {
> > > +	udelay(200);
> > 
> > Why is this delay at the start of this function?
> A proper delay is required between the assertion of IMX95_PCIE_PHY_CR_PARA_SEL
> (in imx95_pcie_init_phy) and each subsequent PHY register write operation.
> Without this delay, the values cannot be successfully written to the PHY
> registers. Placing the delay at the start of the helper function ensures it's
> applied before every PHY write.
> 

Then the delay should be moved to imx95_pcie_init_phy() with a comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

