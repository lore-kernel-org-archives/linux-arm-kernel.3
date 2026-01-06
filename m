Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4044CDC19C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5WqJw4AQBIS4eFg6BiDdOXfZJV5yEOYXWQBUvQEjh4=; b=W8YI651/5qVNYHL8UIW3ZaIw4K
	CElSfpDCxV/tGwyU70Ltkx8iaf5yGQ+o6hdDmoirXBSUBrF+GWvUTxT7/iC9jfwoPfT0XpFchP3Gv
	mG2RgXd3A1BmqxPVdBIe3a5Abar9mYCpZRRgwPKYudO8i2fA/jL+O+zhK+ujrrhb76Y+VjY3/mN9g
	1i1uQTiCGyEiECMRkHI0r4l0v7KOWZBA3RhlVWepnWBG3BQrti+tRBEb5rkB+SHVRwH/IPTrUF7Za
	D45xxl3sOh8xRuBaSMVjxA4buj7uN/hwYmd9fAppGoN5LVvRF8Ad2DwU5xiVAgrdbPBRLyPvoeJWt
	U5V8AZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6qQ-0000000D4AZ-126X;
	Tue, 06 Jan 2026 13:11:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6qN-0000000D498-0xU6;
	Tue, 06 Jan 2026 13:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E7C144019;
	Tue,  6 Jan 2026 13:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B83DC116C6;
	Tue,  6 Jan 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767705084;
	bh=up2iff1BZxa94kRdGC8JpHKlWbcnvKvXoZYjbXT7JJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9VSxyA6dLZYidFmR3YKrnuiZmFCzcB/BXSKq32qKyENyNq4aYaGeJAl6It6ZWDae
	 fNHETbHe0yBHeHjen+HujqOr71J0UL8kKlDhPZPwBXLp5KOJzvtamRwgbC1dTWtzoU
	 dU8zDzs8a3uCTCqPdqAaHawnWUWhg0/LDiK9aM5Vnv5eyd/YlNschdxUR68oCwFSuq
	 lsb+Yem3dGUbajGYyEcIG1jGg3tb4MFgBauIq1kXi/bjkYNnEjRcZYahTuLaT6sg8S
	 43n3wc587dSole11rjV87w4Lq2gF90tg+wVYlie+AZg/u/3/SL0a3CFyoH3K0toWyp
	 KnseknnkVQXOg==
Date: Tue, 6 Jan 2026 18:41:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <5gne3bureusi45sy4zqr2zrfvt4ba4uxgnsfdnjeh2eno5zspe@ldvhq2nilsan>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
 <aVvkmkd5mWPmxeiS@ryzen>
 <m5ukeugo2lazipljqpubyvm7j3xk2j5o7i2xgdbkkhii57xmyk@lh32qdzjhe4n>
 <aVzqMqTUWIuKhgmC@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVzqMqTUWIuKhgmC@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_051127_341934_DAABC5DF 
X-CRM114-Status: GOOD (  43.63  )
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

On Tue, Jan 06, 2026 at 11:55:46AM +0100, Niklas Cassel wrote:
> On Tue, Jan 06, 2026 at 10:49:19AM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jan 05, 2026 at 05:19:38PM +0100, Niklas Cassel wrote:
> > > On Mon, Jan 05, 2026 at 05:57:55PM +0530, Sumit Kumar wrote:
> > > > The current DesignWare PCIe RC implementation supports only the controller
> > > > (Host Bridge) node for specifying the Root Port properties in an assumption
> > > > that the underlying platform only supports a single root Port per
> > > > controller instance. This limits support for multi-port controllers where
> > > > different ports may have different lane configurations and speed limits.
> > > > 
> > > > Introduce a separate dw_pcie_port structure to enable multi-port support.
> > > > Each Root Port can have independent lane count, speed limit through pcie@N
> > > > child nodes in device tree. Add dw_pcie_parse_root_ports()
> > > > API to parse these child nodes.
> > > > 
> > > > Equalization presets and link width detection currently use common DBI
> > > > space for all the root ports. Per-port DBI space assignment for these
> > > > features will be added in future.
> > > > 
> > > > Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> > > 
> > > Hello Sumit,
> > > 
> > > Is there a reason why you represent this as a list of ports rather than a
> > > simple array?
> > > 
> > > The number of ports is known by parsing the device tree, so it should be
> > > static, no?
> > > 
> > > At least to me, this seem similar to e.g. how a gpio_device has multiple
> > > gpio_descriptors "struct gpio_desc *descs":
> > > https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib.h#L68C1-L68C26
> > > 
> > > A list is usually used for something that is dynamic.
> > > I don't think that the number of ports to a PCIe controller will be dynamic.
> > > 
> > > I can see that struct qcom_pcie in pcie-qcom.c has struct list_head ports,
> > > but that does not necessarily mean that we need to have a list of ports in
> > > pcie-designware-host.c. (pcie-qcom could also be modified to have an array
> > > of ports if there is a desire for similar design pattern.)
> > > 
> > 
> > Only reason why I went with lists in pcie-qcom is flexibility. There are useful
> > helpers available for traversing the lists and they seem much more elegant to
> > use rather than manually traversing the array in C.
> > 
> > But to be frank, I don't really care which one is used as there is going to be
> > only a handful of ports at max anyway and there is not much overhead.
> 
> Personally, when I see lists, I automatically think of something that is
> dynamic, so using lists for something static just looks a little bit out of
> place IMHO.
> 
> Technically, the difference is speed. If we want a specific element, we
> will need to traverse the list. With an array, we can access the element
> directly. However, looking at the current patch, it seems like it never
> looks for a specific port, it always does an operation for all ports.
> So from a speed perspective, it doesn't matter, at least not for now.
> 

Yes. I don't envision the driver doing element based lookup even in the future.

> 
> One advantage I can see, instead of doing:
> 
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						struct dw_pcie_port, list);
> +	return dw_pcie_wait_for_link(pci, port);
> 
> for drivers with only one port (most drivers), we could just instead do:
> 
> +	return dw_pcie_wait_for_link(pci, pci->pp.port);
> 
> To simply get the first element in the array. No need to sprinkle
> list_first_entry() everywhere in all the drivers if they just have one port.
> 
> 
> For iterating, to avoid manually traversing the array, we could do like
> libata and create a simple macro, e.g. ata_qc_for_each():
> https://github.com/torvalds/linux/blob/v6.19-rc4/drivers/ata/libata-eh.c#L851-L854
> https://github.com/torvalds/linux/blob/v6.19-rc4/include/linux/libata.h#L1657-L1659
> 

I specifically do not want to introduce custom helpers. That's one of my primary
motivation for using lists :)

> And at least personally, I think my brain will parse dw_pcie_port_for_each() { }
> faster than it parses list_for_each_entry(port, &pcie->ports, list) { },
> since it is more unique, but perhaps I am the weird one here :)
> 

Arrays for sure will allow us to do O(1) lookups, but considering that we will
only be traversing the ports from the start, I still prefer using lists.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

