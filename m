Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE158FB519F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7PIIyyzcCdlZgyWxNTwW+TkVriJC0HXwch4ZJXybyU=; b=Xg39rc0bEmjyQYIRj5iWZBHElP
	2TPTh5Km1t87vyWGlj/cDM6I8VPxVDdrDch+guznpHjCl+OYoEO23DyjR23u8UXd7NHhhFNSqTeBC
	RL5/KJ7z9mOGRMyDEh0/wGV4pjYDqpoGl8ar+A4LLQ5Uc2i91/0GTCx+eSOWjOMzs9oLsLBPyhcV0
	KmipmnPNGSJqZQoO3m7nZCjvrDZHMJI9/WWK96Wvo5ZN2KqPoyHsZWI4l5N5eCTV77ibmyhJSc+FX
	KkpXoBriqRP1+ySTCvLjF8h5IEIhYr8+y0uIUiTwJC7N8NFYR9aRxRSZl8S+bn1SQj+bFaB5et7Oj
	7HES6wPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0Cc-000000061KJ-3B0m;
	Tue, 07 Apr 2026 06:46:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0CZ-000000061Je-3f5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D5FE404B5;
	Tue,  7 Apr 2026 06:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7120C19424;
	Tue,  7 Apr 2026 06:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544379;
	bh=JWzVl+hFxS1v2h/vOubMYt37T/3geUVKLbWBzFaKKd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6TI3dHvRHD5myC8xWWtTsD8aMB3BhC3WUUiwFcLlU5gA1tCFBkQl149chLl+uRmb
	 0I/hsU9Y+eMIS52ruHvPgjIn37oe8gDvL3qYSzdKEg/ayyLdrDO1wdWv8JbkbTFMB5
	 lvcEw/AZsElchIcomecu3lIsFMLPPYPcev8IWYYQzc1dGardoLfMBjB0D9H5Urr2Eb
	 FZNJK3JtbUbfWx+apki9PYeLilTY0AYd0ajlSIIXNvzG57Rxpcm/Clvgs1KqRfae72
	 Gokux7xq+l90mEjr6BAAEtBxSP0VnN5Nvf2hv1omv5N7JuTm5+ksyvRrrIjXrmzG5m
	 efSnf2IaBw8nQ==
Date: Tue, 7 Apr 2026 12:16:09 +0530
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
Subject: Re: [PATCH V10 04/13] PCI: imx6: Assert PERST# before enabling
 regulators
Message-ID: <shkbpacha7bwqw5i3inkpy34fouyy5f2qhusl6gdag4677oipg@ej26npc5zgeh>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
 <20260402095107.205439-5-sherry.sun@nxp.com>
 <jwazawvhuoafkhfwpjfgccc3hz6kej7i6iwkh5be2qena2b4di@yzv6e75zezfu>
 <VI0PR04MB12114917D17B5B8FB67E68DB9925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114917D17B5B8FB67E68DB9925AA@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234619_968207_47327506 
X-CRM114-Status: GOOD (  27.31  )
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

On Tue, Apr 07, 2026 at 06:38:50AM +0000, Sherry Sun wrote:
> 
> > On Thu, Apr 02, 2026 at 05:50:58PM +0800, Sherry Sun wrote:
> > > According to the PCIe initialization requirements, PERST# signal
> > > should be asserted before applying power to the PCIe device, and
> > > deasserted after power and reference clock are stable.
> > >
> > 
> > Spec wording is not quite like this. Spec mandates asserting PERST# *before*
> > stopping refclk and powering down the device and deasserting it *after*
> > applying power and refclk stable.
> > 
> > I believe you want to assert PERST# before enabling regulator to prevent the
> > endpoint from functioning? If so, is it due to refclk not available yet or some
> > other reason?
> 
> You are right. My commit message wording was not that precise.
> The PCIe endpoint may start responding or driving signals as
> soon as its supply is enabled, even before the reference clock is stable.
> Asserting PERST# before enabling the regulator ensures that the endpoint
> remains in reset throughout the entire power-up sequence, until both
> power and refclk are known to be stable and link initialization can safely
> begin. This is mainly to avoid undefined behavior during early power-up.
> 
> I will update the commit message to better reflect this.
> 
> > 
> > > Currently, the driver enables the vpcie3v3aux regulator in
> > > imx_pcie_probe() before PERST# is asserted in imx_pcie_host_init(),
> > > which violates the PCIe power sequencing requirements. However, there
> > > is no issue so far because PERST# is requested as GPIOD_OUT_HIGH in
> > > imx_pcie_probe(), which guarantees that PERST# is asserted before
> > > enabling the vpcie3v3aux regulator.
> > >
> > > This is prepare for the upcoming changes that will parse the reset
> > > property using the new Root Port binding, which will use GPIOD_ASIS
> > > when requesting the reset GPIO. With GPIOD_ASIS, the GPIO state is not
> > > guaranteed, so explicit sequencing is required.
> > >
> > > Fix the power sequencing by:
> > > 1. Moving vpcie3v3aux regulator enable from probe to
> > >    imx_pcie_host_init(), where it can be properly sequenced with PERST#.
> > > 2. Moving imx_pcie_assert_perst() before regulator and clock enable to
> > >    ensure correct ordering.
> > >
> > > The vpcie3v3aux regulator is kept enabled for the entire PCIe
> > > controller lifecycle and automatically disabled on device removal via devm
> > cleanup.
> > >
> > 
> > vpcie3v3aux handling should be in a separate patch.
> 
> Actually the handling of vpcie3v3aux itself remains unchanged, I just adjust the
> sequence of regulator/clock enable and perst#.
> Previously, the imx driver enabled the vpcie3v3aux regulator in imx_pcie_probe()
> before PERST# is asserted in imx_pcie_host_init(), which violates the PCIe power
> sequencing requirements.
> This patch moves vpcie3v3aux regulator enable from probe to  imx_pcie_host_init(),
> where it can be properly sequenced with PERST#.
> Perhaps I should just remove this description to avoid confusion.
> 

Yeah.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

