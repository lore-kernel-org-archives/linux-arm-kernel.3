Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B7BCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/bDCeIzaZZtKwcJz6u779UQNRAaT5dwV9KbKU3IAyw=; b=ccE6uEqabrWl9iZDh4yixbcJeX
	FY/2zqFgZdoaEPJh0cB1qV3BTS1SL9BVKzZl8F5qUSDH6kD3aDu6/mFXfi4b/vaP2DMRBgPvoLYGy
	XNezhkjE6fFBGrV/UBh4cPJyF3nfAETtFIaO63U0aD8Vgi5A3XmLrFPA6VY/DjjaCYqQpm/+0V9Dn
	+DRsEvDT3+uj3JUbKsTjHOLh8mMwQev72aOiCXYV1x+xKFFONEceEYrI4CM8jnClwwBlEvQs6niEJ
	KzRKZ1W2e4ntvLEo8avdVD61hoTUU1yaKsWvb+WdkZ3oZm3wBTODH3j0/i7P1CrehMwZzLBhconS3
	QiYgkOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gnx-00000002ysm-0Itg;
	Mon, 29 Sep 2025 16:32:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gnu-00000002ysN-3RWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4654E407B8;
	Mon, 29 Sep 2025 16:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFFC4CEF4;
	Mon, 29 Sep 2025 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759163566;
	bh=00sU9i2+IMQ2HaKjeSE/V2mVCUpqM5rcBpzmZjk3ga8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAdycMFqGnevhFuZjQV+y/lH0d8Khsf+9oRa+hz+ueJLA6nf0nm04lTsdktX8Tjr0
	 kdKVtdRrPjPsHwV4CgknI6aHLPsifuoRBSBPtEyMRlBe2/2enF9t47MFWPIpxK8A8f
	 empkHAWjQqVjjsyfv2EXwUjEAZ0bwSMWFg0xvzYjrWle7g0ZDVTBkjPvgQrE0eGAXv
	 x6/QGri5YE9/CIFv+HAa6oQ59SvTueYS5KQ2wWtxprHHdSaAlzNKRkr9zWMJc0IEs5
	 ysFRmWvJolOUvz7bjnMw3DZOztGtg90aKXAr4DwR7UybuAdJyDN3jYDS14B66oPJTb
	 78hTI6C7GhUeA==
Date: Mon, 29 Sep 2025 22:02:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <xmjgs5ssolugcq2ogjc5j3ccwalcc4q3whl64fcra2aiebhtci@qwobbjtb2wcl>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-3-vincent.guittot@linaro.org>
 <4ee5tqdjv5ogcdtysiebtoxmrvrzhkar4bjcsqi47dxtgwac4c@rezn4waubroh>
 <CAKfTPtAEkegCV-9_x-dXSWQFOoG6kO5JbJq_LToY9YuuRusoVA@mail.gmail.com>
 <lmczw5agheqbcl6xcomlhf7yfbdvfx45pozmaxjmbkkqudsxlu@c7u6s5h4xm6j>
 <CAKfTPtCacFhJztYvWycSdoWMUStaf1WAcGJKHwk3y4n-uEELSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtCacFhJztYvWycSdoWMUStaf1WAcGJKHwk3y4n-uEELSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093246_900027_F89EEC4A 
X-CRM114-Status: GOOD (  21.43  )
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

On Mon, Sep 29, 2025 at 06:23:05PM +0200, Vincent Guittot wrote:

[...]

> > > > > +static int s32g_pcie_resume(struct device *dev)
> > > > > +{
> > > > > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > > > > +     struct dw_pcie *pci = &s32g_pp->pci;
> > > > > +     struct dw_pcie_rp *pp = &pci->pp;
> > > > > +     int ret = 0;
> > > > > +
> > > > > +     ret = s32g_pcie_init(dev, s32g_pp);
> > > > > +     if (ret < 0)
> > > > > +             return ret;
> > > > > +
> > > > > +     ret = dw_pcie_setup_rc(pp);
> > > > > +     if (ret) {
> > > > > +             dev_err(dev, "Failed to resume DW RC: %d\n", ret);
> > > > > +             goto fail_host_init;
> > > > > +     }
> > > > > +
> > > > > +     ret = dw_pcie_start_link(pci);
> > > > > +     if (ret) {
> > > > > +             /*
> > > > > +              * We do not exit with error if link up was unsuccessful
> > > > > +              * Endpoint may not be connected.
> > > > > +              */
> > > > > +             if (dw_pcie_wait_for_link(pci))
> > > > > +                     dev_warn(pci->dev,
> > > > > +                              "Link Up failed, Endpoint may not be connected\n");
> > > > > +
> > > > > +             if (!phy_validate(s32g_pp->phy, PHY_MODE_PCIE, 0, NULL)) {
> > > > > +                     dev_err(dev, "Failed to get link up with EP connected\n");
> > > > > +                     goto fail_host_init;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     ret = pci_host_probe(pp->bridge);
> > > >
> > > > Oh no... Do not call pci_host_probe() directly from glue drivers. Use
> > > > dw_pcie_host_init() to do so. This should simplify suspend and resume functions.
> > >
> > > dw_pcie_host_init() is doing much more than just init the controller
> > > as it gets resources which we haven't released during suspend.
> > >
> >
> > Any specific reason to keep resources enabled, even though you were removing the
> > Root bus? This doesn't make sense to me.
> 
> By ressources I mean everything before  dw_pcie_setup_rc()  in
> dw_pcie_host_init() which are still there after dw_pcie_host_deinit()
> in addition to being a waste of time. Also we don't need to remove
> edma and free msi
> 

Let me take a step back and ask, why do you need to remove Root bus during
suspend() and not just disable LTSSM with dw_pcie_stop_link()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

