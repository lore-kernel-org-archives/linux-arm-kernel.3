Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A15C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4Pxlp53xykSdWZXJrbG+XhCRy5aluDhWWTbJrCBLPU=; b=ZGCp5COB8+mdz9YNQuFO8mbhU+
	kyDEWnld7x3Kgb041YAzCjA79LADnaNuD2xTjQVwaoaOg78AH/3hbogxgjVi61Ci4YHPTP+wNV0Jg
	F+e8wCbg0+U7HqYuus6FHGpPtRPib0cLqSi9aXROim35CssevabJQNWWStVYw+SkQWRTWVI350UKb
	2OKKyMhcaT6giumBtWEGY0/kHTK9nmoEqsBMaAbpjA7VMwNKcRL5UjFKfh8psZu7yQ0nau/3dZTHH
	4YBFVBYzoBFXQl0593v/84YVdhTrPPZIWylA+B0yLiP1Wyzr/61ygCFNLfjP5VBVn6sVAzQIIl65T
	DlaYNzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwl0-00000003oEG-34xF;
	Fri, 16 May 2025 15:13:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwPx-00000003jRW-3C72
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1914629FE;
	Fri, 16 May 2025 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFADC4CEE4;
	Fri, 16 May 2025 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747407128;
	bh=55iUVdRf8GgLkjcVLgOYJa2jXmc6dM9rV3Kcs4cqta0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdOgFTIoB2YAg3QDa42y1s9/xyLo7YNoh8rLX5uw582mSABYqxhBr6+Zpb5THkkFi
	 VSs1IxMhG/NKoySBwekPY04K56bhuE6SCdnDH3ZBvTzHWBnXDqgINiph9AzungJIlm
	 yHgq67x+VMNcpdhiKCFmlCXGxay3ghGgdD2yY7Fp/MR41wiPy6nTgrM+bwcuWwgCB5
	 ddA8dgaI22VapYj8rVuETSHnz0OExHAbZ1z2cjaU/s33JKW28bERAw2dZEDJGo1wlI
	 XNLN2Hd0LlGPbn8wy9aHefiWRL9UlXlhZUDO5zKr1cGCo9Ik56jMOAm+UGEHWKYVU9
	 7iDg7XC+RQpHQ==
Date: Fri, 16 May 2025 15:52:00 +0100
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, cassel@kernel.org, 
	johan+linaro@kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/9] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <q4rbaadr7amsrtwaeickdjmcst77onuopir5rzpvixa7ow7udk@txwsmidjs3im>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
 <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
 <7df0c1e5-f53b-4a44-920a-c2dfe8842481@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7df0c1e5-f53b-4a44-920a-c2dfe8842481@foss.st.com>
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

On Fri, May 16, 2025 at 10:37:16AM +0200, Christian Bruel wrote:
> 
> 
> On 5/15/25 13:29, Manivannan Sadhasivam wrote:
> > On Mon, May 12, 2025 at 05:08:13PM +0200, Christian Bruel wrote:
> > > Hi Manivannan,
> > > 
> > > On 4/30/25 09:30, Manivannan Sadhasivam wrote:
> > > > On Wed, Apr 23, 2025 at 11:01:12AM +0200, Christian Bruel wrote:
> > > > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > > > controller based on the DesignWare PCIe core.
> > > > > 
> > > > > Supports MSI via GICv2m, Single Virtual Channel, Single Function
> > > > > 
> > > > > Supports WAKE# GPIO.
> > > > > 
> > > > 
> > > > Mostly looks good. Just a couple of comments below.
> > > > 
> > > > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/Kconfig      |  12 +
> > > > >    drivers/pci/controller/dwc/Makefile     |   1 +
> > > > >    drivers/pci/controller/dwc/pcie-stm32.c | 368 ++++++++++++++++++++++++
> > > > >    drivers/pci/controller/dwc/pcie-stm32.h |  15 +
> > > > >    4 files changed, 396 insertions(+)
> > > > >    create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
> > > > >    create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
> > > > > 
> > > > 
> > > > [...]
> > > > 
> > > > > +static int stm32_pcie_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct stm32_pcie *stm32_pcie;
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	int ret;
> > > > > +
> > > > > +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
> > > > > +	if (!stm32_pcie)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	stm32_pcie->pci.dev = dev;
> > > > > +	stm32_pcie->pci.ops = &dw_pcie_ops;
> > > > > +	stm32_pcie->pci.pp.ops = &stm32_pcie_host_ops;
> > > > > +
> > > > > +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
> > > > > +	if (IS_ERR(stm32_pcie->regmap))
> > > > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
> > > > > +				     "No syscfg specified\n");
> > > > > +
> > > > > +	stm32_pcie->clk = devm_clk_get(dev, NULL);
> > > > > +	if (IS_ERR(stm32_pcie->clk))
> > > > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
> > > > > +				     "Failed to get PCIe clock source\n");
> > > > > +
> > > > > +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
> > > > > +	if (IS_ERR(stm32_pcie->rst))
> > > > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
> > > > > +				     "Failed to get PCIe reset\n");
> > > > > +
> > > > > +	ret = stm32_pcie_parse_port(stm32_pcie);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	platform_set_drvdata(pdev, stm32_pcie);
> > > > > +
> > > > > +	ret = pm_runtime_set_active(dev);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Failed to activate runtime PM %d\n", ret);
> > > > 
> > > > Please use dev_err_probe() here and below.
> > > 
> > > OK, will report this in the EP driver also.
> > > 
> > > > 
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = devm_pm_runtime_enable(dev);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	pm_runtime_get_noresume(dev);
> > > > > +
> > > > 
> > > > I know that a lot of the controller drivers do this for no obvious reason. But
> > > > in this case, I believe you want to enable power domain or genpd before
> > > > registering the host bridge. Is that right?
> > > 
> > > We call pm_runtime_enable() before stm32_add_pcie_port() and
> > > dw_pcie_host_init(). This ensures that PCIe is active during the PERST#
> > > sequence and before accessing the DWC registers.
> > > 
> > 
> > What do you mean by 'PCIe is active'? Who is activating it other than this
> > driver?
> 
> "PCIe is active" in the sense of pm_runtime_active() and PM runtime_enabled.
> 
> A better call point would be just before dw_host_init(), after the PCIe
> controller is reset :
> 
> stm32_add_pcie_port()
> clk_prepare_enable()

also...

pm_runtime_set_active()
pm_runtime_no_callbacks()

> devm_pm_runtime_enable()
> dw_pcie_host_init()
> 
> with this sequence, the stm32_pcie_suspend_noirq() is well balanced. does
> that sound better ?
> 

Yeah.

> > 
> > > > And the fact that you are not
> > > > decrementing the runtime usage count means, you want to keep it ON all the time?
> > > > Beware that your system suspend/resume calls would never get executed.
> > > 
> > > We do not support PM runtime autosuspend, so we must notify PM runtime that
> > > PCIe is always active. Without invoking pm_runtime_get_noresume(), PCIe
> > > would mistakenly be marked as suspended.
> > 
> > This cannot happen unless the child devices are also suspended? Or if there are
> > no child devices connected.
> 
> If no device is connected or if one is active, without
> pm_runtime_get_noresume(), pm_genpd_summary says "PCIe suspended" despite
> being clocked and having accessible configuration space
> 

This mostly means the hierarchy is not properly modelled. So the PM core doesn't
know that the child devices are active. You need to check the genpd summary for
PCI bridge and endpoint devices.

If there are no devices, then it is OK to be marked as suspended. But I would
assume that even if an user hotplugs an endpoint, it would just work since there
are no runtime PM callbacks populated. Only thing to worry is that, the genpd
core may turn off the power domain if all the devices in the hierarchy are
suspended. But we do have some workarounds for that, if power domains need to be
kept on. So let me know.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

