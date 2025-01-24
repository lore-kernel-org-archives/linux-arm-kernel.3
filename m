Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B782EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgqiXH5p7GABYnhlWLqBLhdLf0cXyOV7nMO1p3m2bIQ=; b=fECQSK1ynP7BI50IbQkgtMHtRq
	tgitj/7Bb69Ps08RaYSWWCu7Ouz12YIxXXtyZD9oqw4NhMdAnIzQN5leQ04mHCWPa1xTZg4QzV/Wv
	ocfQDLMiTVvQFpmqtZtuveZho3wUTIg+q8NAUnic4HE27pWzrySExj2U/vjWXqdfDFzHdoI0zNTsA
	9/wkc0SmwDnRLfkJ5A4Ayzml6Jcv1mdX0QhOdP4rqabG9hoVRcTRsoU0AiI7D3NrU2230UErUmkhN
	WTQpKR7U0s2QYfSMG/4Ty+Q3vzU17NM0mlzWzqmOiJxkOHI26wI/M2QzdDyLRxhVBeRYW10lim153
	lKdKMvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEed-0000000EBcN-2iim;
	Fri, 24 Jan 2025 08:03:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEdG-0000000EBPD-3ZJZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D897C5C579A;
	Fri, 24 Jan 2025 08:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DD8C4CED2;
	Fri, 24 Jan 2025 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737705697;
	bh=joUEBABW0jh1/uqANjFESSNnUumv3QKlUTXLI8vc1qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN59NOOXciYhfWmlc/4PrRP4MSd7jkI6ZwMVgyEWmmI0TI7Eyc84/kVEV8ct2QZ6V
	 qgcD+xHSXg/yuWYjAoSiQQVVeHHErHyNqLcLhEQ8Yy2E5qlU5WJ0LIAY8v0Mu8xrQP
	 1zm/nIRwIUmTcMTb9T30WvTHS8lCyltaB8B06CmH1elnhMGtF6kGQqcKyXggO7ke+8
	 2X47Z+rQ6CB2K1PjIIOzqAB59Ko75lEK24eGheptJAZyRaWIiApVGTOW1+vET7jQkp
	 uViBdS3hNs5RhtDcyKKyXKCa/XZ3LMjRpCweR+/hUrFN5uU/pOZki4Xi7rZt9ZXQkr
	 QBf7DJ/cS4UVQ==
Date: Fri, 24 Jan 2025 13:31:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20250124080126.itc6qoutn65isnej@thinkpad>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20241126075702.4099164-3-hongxing.zhu@nxp.com>
 <20250119070246.yfxogn4vv3jqfvzb@thinkpad>
 <AS8PR04MB86762EA8219F8FE76CB48F358CE72@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86762EA8219F8FE76CB48F358CE72@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_000138_983081_057CBBC7 
X-CRM114-Status: GOOD (  32.18  )
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

On Mon, Jan 20, 2025 at 02:49:09AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年1月19日 15:03
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>; s.hauer@pengutronix.de;
> > festevam@gmail.com; imx@lists.linux.dev; kernel@pengutronix.de;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v7 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
> > 
> > On Tue, Nov 26, 2024 at 03:56:54PM +0800, Richard Zhu wrote:
> > > Add "ref" clock to enable reference clock. To avoid breaking DT
> > > backwards compatibility, i.MX95 REF clock might be optional. Use
> > > devm_clk_get_optional() to fetch i.MX95 PCIe optional clocks in driver.
> > >
> > > If use external clock, ref clock should point to external reference.
> > >
> > > If use internal clock, CREF_EN in LAST_TO_REG controls reference
> > > output, which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 16 +++++++++++-----
> > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 385f6323e3ca..f7e928e0a018 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -103,6 +103,7 @@ struct imx_pcie_drvdata {
> > >  	const char *gpr;
> > >  	const char * const *clk_names;
> > >  	const u32 clks_cnt;
> > > +	const u32 clks_optional_cnt;
> > >  	const u32 ltssm_off;
> > >  	const u32 ltssm_mask;
> > >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES]; @@ -1306,9 +1307,8
> > @@
> > > static int imx_pcie_probe(struct platform_device *pdev)
> > >  	struct device_node *np;
> > >  	struct resource *dbi_base;
> > >  	struct device_node *node = dev->of_node;
> > > -	int ret;
> > > +	int i, ret, req_cnt;
> > >  	u16 val;
> > > -	int i;
> > >
> > >  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
> > >  	if (!imx_pcie)
> > > @@ -1358,9 +1358,13 @@ static int imx_pcie_probe(struct platform_device
> > *pdev)
> > >  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
> > >
> > >  	/* Fetch clocks */
> > > -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt, imx_pcie->clks);
> > > +	req_cnt = imx_pcie->drvdata->clks_cnt -
> > imx_pcie->drvdata->clks_optional_cnt;
> > > +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
> > >  	if (ret)
> > >  		return ret;
> > > +	imx_pcie->clks[req_cnt].clk = devm_clk_get_optional(dev, "ref");
> > > +	if (IS_ERR(imx_pcie->clks[req_cnt].clk))
> > > +		return PTR_ERR(imx_pcie->clks[req_cnt].clk);
> > 
> > I think you should just switch to devm_clk_bulk_get_all() instead of getting the
> > clks separately. As I told previously, the DT binding should ensure that correct
> > clocks for the platforms are defined in DT and the driver has no business in
> > validating it. Driver should trust the DT instead (unless there is a valid reason to not
> > do so).
> > 
> > >
> > >  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_PHYDRV)) {
> > >  		imx_pcie->phy = devm_phy_get(dev, "pcie-phy"); @@ -1509,6 +1513,7
> > > @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie",
> > > "pcie_aux"};  static const char * const imx8mq_clks[] = {"pcie_bus",
> > > "pcie", "pcie_phy", "pcie_aux"};  static const char * const
> > > imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
> > > static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
> > > +static const char * const imx95_clks[] = {"pcie_bus", "pcie",
> > > +"pcie_phy", "pcie_aux", "ref"};
> > 
> > And these static clock defines will go away too.
> > 
> Hi Mani:
> Thanks for your comments.
> The suggestions are very nice. How about kick off further optimization later?

Sure. This series got merged already.

>  Since the changes would impact all i.MX PCIes.
> Meanwhile, I'm a little worry about that there is no consensus yet on relying
>  entirely on the dt binding check.

Consensus between whom?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

