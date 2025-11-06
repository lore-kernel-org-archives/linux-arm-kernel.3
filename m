Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C92BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 06:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcLZ7dYUGJ4Tr4r793apvg2uH+96yLQ3ru7C6V36Zn8=; b=cp4ldOJxGE2dNkOpHK6FxtJSH1
	ewMwjD26qtn8JxWRV0/fol3m4en8yNQ4SRWSkpHmBQwd8uG8oE778DR4j3H5oPM2X1gG1vGNpbXjt
	S9cezOXpYSFf/VAynURIewJVFjppScEJNVgkdpgeNrHq/W022590AafHBpMpis2d3fZk2EsukIjEd
	BzvkKdO2AEeQpmn92uclgvJqTbCdK0Nt5lEzrWOoMT3cgyRmTRJCUblgmkGNwVmGMDoa1livdnFAI
	8HtdZ6355bR/ArNXGX/PjYYdsoM9wTJdw1gT1nsxSTnbWn+sSLIU2myEFYXgvrnpiL66RJ2wzyQHu
	Jyy8H3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtQJ-0000000EwPN-3buS;
	Thu, 06 Nov 2025 06:24:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtQI-0000000EwPH-1S0S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 06:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 794FB60216;
	Thu,  6 Nov 2025 06:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A4C4CEF7;
	Thu,  6 Nov 2025 06:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762410281;
	bh=27Pe8FUEHZhfluKmwcfeGnyxW6smtWLMLoJyzAni44c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRJJ1H4J3GeszBfV1hToQ3FtuV2IZEsEKV/wI2DSAElwJWUkObr/RtpW4V6AYAP7j
	 kzclCPXk+of9CsLTi2sSUCxjJBEAp546g7hVvQ5QLnmvK1fDLHtlC6tjVFdArJ7gGS
	 2h6x1fEGQtiQXr6udYxVlomrcH9shBfv2Q2TR65zqezowcDzPVs1L4B+f2/0aZ7poF
	 3lnYtSrjmzPzmz9HEpOO6+Jsma6kar+0PT7QVz2y1MTlYYiwQXrrDRWqjYv8evl2Fz
	 z118nreIhF0LaUS2a8xKhbsBrpnuKsHH1kXUf+LcthYry1Qt7DOczlxwYgaHUWUzy2
	 /5Snmb3l/In7g==
Date: Thu, 6 Nov 2025 11:54:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com, 
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, 
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106000531.GA1930429@bhelgaas>
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

On Wed, Nov 05, 2025 at 06:05:31PM -0600, Bjorn Helgaas wrote:
> [+cc imx6, layerscape, stm32 maintainers for possible suspend bug]
> 
> On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > > Add initial support of the PCIe controller for S32G Soc family. Only
> > > > host mode is supported.
> 
> > > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > ...
> > > > +     /*
> > > > +      * Make sure we use the coherency defaults (just in case the settings
> > > > +      * have been changed from their reset values)
> > > > +      */
> > > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> > >
> > > This seems sketchy and no other driver uses memblock_start_of_DRAM().
> > > Shouldn't a physical memory address like this come from devicetree
> > > somehow?
> > 
> > I was using DT but has been asked to not use it and was proposed to
> > use memblock_start_of_DRAM() instead
> 
> Can you point me to that conversation?
> 
> > > > +     s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > > +             return PTR_ERR(s32g_pp->ctrl_base);
> > >
> > > This looks like the first DWC driver that uses a "ctrl" resource.  Is
> > > this something unique to s32g, or do other drivers have something
> > > similar but use a different name?
> > 
> > AFAICT this seems to be s32g specific in the RM
> 
> It does look like there's very little consistency in reg-names across
> drivers, so I guess it's fine.
> 
> > > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > > > +     struct dw_pcie *pci = &s32g_pp->pci;
> > > > +
> > > > +     if (!dw_pcie_link_up(pci))
> > > > +             return 0;
> > >
> > > Does something bad happen if you omit the link up check and the link
> > > is not up when we get here?  The check is racy (the link could go down
> > > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > > completely reliable.
> > >
> > > If you have to check, please add a comment about why this driver needs
> > > it when no other driver does.
> > 
> > dw_pcie_suspend_noirq returns an error and the suspend fails
> 
> The implication is that *every* user of dw_pcie_suspend_noirq() would
> have to check for the link being up.  There are only three existing
> callers:
> 
>   imx_pcie_suspend_noirq()
>   ls_pcie_suspend_noirq()
>   stm32_pcie_suspend_noirq()
> 
> but none of them checks for the link being up.
> 

If no devices are attached to the bus, then there is no need to broadcast
PME_Turn_Off and wait for L2/L3. I've just sent out a series that fixes it [1].
Hopefully, this will allow Vincent to use dw_pcie_{suspend/resume}_noirq() APIs.

- Mani

[1] https://lore.kernel.org/linux-pci/20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்

