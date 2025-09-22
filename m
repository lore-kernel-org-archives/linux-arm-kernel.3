Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073EBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR4N1wOnD9WLDkhsK0FjmQIDmMcNU19g/8FP73AZVSE=; b=4gAsiQKiOQ1s8ZTqA1RD6FB/Ap
	qmUTc+Yr9yuE2ZqAkZdpI8p0GqnPnYkylRWUUYExYFnq42diB5p8tU2osYXfoCOvClJlNxsHfcIKY
	qtrfCRiLe1Q4B9iTqR0GJgdv9lRfFpUDFZa9T26ChgjWZ1Gq8qia68w1sOHSdN44lIR4I1Dfye++f
	NmYsHb2jrDgUXCR39YjXkWl4Pl4MgdAET+LAMQyteuTjRGaXZHucttRzsNRom56k/i0glgmprwqGt
	MiGoWk246RL2gI9rtPTiG6MN9/GEMTMMt9UEpEDtcntfAOCAKRplE+M8L5edHjIDtAmW4G65wc/qH
	ai0socbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eYL-0000000ABFD-2mUs;
	Mon, 22 Sep 2025 11:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eYI-0000000ABEo-1iqs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 11:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC9DC43C7F;
	Mon, 22 Sep 2025 11:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E89C4CEF7;
	Mon, 22 Sep 2025 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758539869;
	bh=P/WkZtU1feRYKGYIu/69vRBdYK8dAJ5LkCF7pU4LxlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKJGz7DAwj69nbNV0Rne3G36MBMl3WicbxYo6d7/PZP9HsdCs9jzrSchd9/jHIKqh
	 eC2bZZEHCsGN4N4ZjON/bMrnCwOhqa0Os1N7KJWuMjSw+XaigO4bNnPP29mIoyGd3+
	 7F3hGlAzdzUOX0U1gYbhMMaEGa0tDc/aQuhAs7hz7pJe2DJhVHfiseVb88nyqnfL3J
	 oAjYyS3B2+9/8BOmeNggh52hqwFR1obtXc3pkg/gGB4Zc0JcV2tc1rgT96yL5RiGN3
	 Tekq60Op8YyvRVW4fusY5YxcIylwCl8inJOMdsraDdJTZflRMrJi11D9bDCTifMqOI
	 hPpMTm27c61NA==
Date: Mon, 22 Sep 2025 16:47:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	quic_wenbyao@quicinc.com, inochiama@gmail.com, mayank.rana@oss.qualcomm.com, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, cassel@kernel.org, kishon@kernel.org, 
	sergio.paracuellos@gmail.com, 18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v3 0/4] PCI: Keystone: Enable loadable module support
Message-ID: <qdz2d57q3hyosmvh7xzxy2qdhpjyxkl2mh6dr4or4nj4qakpoh@gg6ihzpaynst>
References: <20250922071222.2814937-1-s-vadapalli@ti.com>
 <175852954905.18749.5091036983349477093.b4-ty@kernel.org>
 <3sjuplupmdoxqhyz2i2p4he5vw7krqokixoy6ddoiox6p536n6@xzfcyhwjx3hv>
 <590d183c-8971-4728-9aa3-4e02bd3d0845@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <590d183c-8971-4728-9aa3-4e02bd3d0845@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_041750_491278_04A6B406 
X-CRM114-Status: GOOD (  32.01  )
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

On Mon, Sep 22, 2025 at 02:55:05PM +0530, Siddharth Vadapalli wrote:
> On Mon, Sep 22, 2025 at 02:02:43PM +0530, Manivannan Sadhasivam wrote:
> 
> Hello Mani,
> 
> > On Mon, Sep 22, 2025 at 01:56:08PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > On Mon, 22 Sep 2025 12:42:12 +0530, Siddharth Vadapalli wrote:
> > > > This series enables support for the 'pci-keystone.c' driver to be built
> > > > as a loadable module. The motivation for the series is that PCIe is not
> > > > a necessity for booting Linux due to which the 'pci-keystone.c' driver
> > > > does not need to be built-in.
> > > > 
> > > > Series is based on commit
> > > > dc72930fe22e Merge branch 'pci/misc'
> > > > of pci/next.
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > > 
> > > [1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
> > >       commit: c514ba0fa8938ae09370beecb77257868c1568a7
> > > [2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
> > >       commit: db9ff606a5535aee94bf41682f03aba500ff3ad6
> > > [3/4] PCI: keystone: Exit ks_pcie_probe() for invalid mode
> > >       commit: 76d23c87a3e06af003ae3a08053279d06141c716
> > > [4/4] PCI: keystone: Add support to build as a loadable module
> > >       commit: e82d56b5f3844189f2b2240b1c3eaeeafc8f1fd2
> > > 
> > 
> > I just noticed the build dependency mentioned in the cover letter after applying
> > the series. This is problematic since there is no guarantee that the dependent
> > commit will reach mainline first. So if this series gets applied by Linus first,
> > then building this driver as module will break the build. We should not have the
> > build error at any cost.
> 
> As feedback for the future, is there a better way that I could have
> highlighted the build dependency? I agree that a build failure is
> unacceptable which is why I tried to highlight the dependency, but, it
> probably wasn't the best approach to point it out by mentioning it in
> the cover letter. Please let me know if I could make it easier for you
> and other Maintainers to notice such stated dependencies.
> 

Mentioning the build dependency in the cover letter is the right thing to do.
But somehow I failed to spot it as it was not highlighted enough (just for my
eyes).

Maybe you could mention the dependencies under a sub-section. Like,

Dependency
==========

Some people also mark the patches as DNM (Do Not Merge), but that's for patches
not intended to be merged as is. Not for this series though.

Anyhow, I take the blame of not going through the cover letter properly, but you
did the right thing.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

