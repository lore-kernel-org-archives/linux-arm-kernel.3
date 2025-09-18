Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CFFCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ff5vkxEE2doyuxnUEokkLyv0nT2zebJTuiLb503dsM=; b=Nqnwl7axfNDsdNx0otkZdoe0Ps
	7RqUa8sON4MaKPufcAgkG2WKkpbkiEu87on2Ln+lKyfkJm3tkrer6pnEZU6ntlDF4N9PFpxNFfHoN
	eLYbvXJ3aq205PvtphX6kMWIS5kpZ7+Lcmih6SnRUc4JVzaORFMFtIASblDzseUDj8SjzxrxY6jPZ
	T21fjKksKq7fhjZFlrvsOV4q5+JXROD4chHwK6z+gt6eGz92B8OAA50m+wGY5/ptFhNiSqqBBHDks
	uQVa4ixx7+V85yL6nv05mCVLMCaYEPztitl5wAT+DCVxCBOrJ3S9zinzr7C07m3YdkgYNH8yPrkbc
	HtEXuXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCnU-0000000HDKG-2r7r;
	Thu, 18 Sep 2025 11:27:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCnT-0000000HDJY-0hNT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8380460245;
	Thu, 18 Sep 2025 11:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F854C4CEEB;
	Thu, 18 Sep 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758194850;
	bh=5QEZw9RNRk0Ahq+77CpxSjVPDT2KfPGtnFnDNhj6xoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5zGTtsu1W9M0jWaxE9ILyjT/ckuehlLA/0hpKMWrGT7swQ5Ka93LFolWtBokBtIm
	 dc6Cj23xIowaXTikI5NCF33jw/T7AqRzRMYNy5JgyKjMNG/EKHETeVA1b+uDnGE7FO
	 rjKzZDCJ3t0h5/0cI8H2H+qV0M795NaFHzpuwOJkvuDKK7022WrdFCqPbufsDiIxQD
	 zHWvm1ySLqnZhMRcGNDovEkYiY9cTyB5qHTc/CW8/XoZCkMEY1QmL1e+EbCzswGVMf
	 JPKQVT3CYrZpS8LPwhxZiRAL156S2c9lL0mqPJ4BMM/O+CjAPInW/rGO3tMbbW8Iyv
	 UIUsa0spCwjrQ==
Date: Thu, 18 Sep 2025 16:57:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com, 
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
Message-ID: <gejrg6oyzml3dwcsoqpusazlipceejvba4zkkg6gkghxdfryki@m5k4hz4pgrk2>
References: <e236uncj7qradf34elkmd2c4wjogc6pfkobuu7muyoyb2hrrai@tta36jq5fzsr>
 <20250917212833.GA1873293@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917212833.GA1873293@bhelgaas>
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

On Wed, Sep 17, 2025 at 04:28:33PM -0500, Bjorn Helgaas wrote:
> On Wed, Sep 17, 2025 at 10:41:08PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Sep 16, 2025 at 09:23:13AM GMT, Bjorn Helgaas wrote:
> > > On Tue, Sep 16, 2025 at 10:10:31AM +0200, Vincent Guittot wrote:
> > > > On Sun, 14 Sept 2025 at 14:35, Vincent Guittot
> > > > <vincent.guittot@linaro.org> wrote:
> > > > > On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > > > > > > Describe the PCIe controller available on the S32G platforms.
> > > 
> > > > > > > +                  num-lanes = <2>;
> > > > > > > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > > > > >
> > > > > > num-lanes and phys are properties of a Root Port, not the host bridge.
> > > > > > Please put them in a separate stanza.  See this for details and
> > > > > > examples:
> > > > > >
> > > > > >   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
> > > > >
> > > > > Ok, I'm going to have a look
> > > > 
> > > > This driver relies on dw_pcie_host_init() to get common resources like
> > > > num-lane which doesn't look at childs to get num-lane.
> > > > 
> > > > I have to keep num-lane in the pcie node. Having this in mind should I
> > > > keep phys as well as they are both linked ?
> 
> > > Huh, that sounds like an issue in the DWC core.  Jingoo, Mani?
> > > 
> > > dw_pcie_host_init() includes several things that assume a single Root
> > > Port: num_lanes, of_pci_get_equalization_presets(),
> > > dw_pcie_start_link() are all per-Root Port things.
> > 
> > Yeah, it is a gap right now. We only recently started moving the DWC
> > platforms to per Root Port binding (like Qcom).
> 
> Do you need num-lanes in the devicetree?
> dw_pcie_link_get_max_link_width() will read it from PCI_EXP_LNKCAP, so
> if that works maybe you can omit it from the binding?
> 

'num-lanes' is an optional property. But we do need it to be specified in
devicetree so that the drivers can set proper MLW, Link Width and Link Control
settings if the default values are wrong.

> If you do need num-lanes in the binding, maybe you could make a Root
> Port parser similar to mvebu_pcie_parse_port() or
> qcom_pcie_parse_port() that would get num-lanes, the PHY, and
> nxp,phy-mode from a Root Port node?
> 

Yeah, we need to have a similar parser.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

