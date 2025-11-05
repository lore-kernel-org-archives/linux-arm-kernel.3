Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A5CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADPkPAHBx4IigV9dOPGT5hZRKmeVomJFTfL/RarqPus=; b=QrFyy73zoLSwqMWvAjyUHyCB0J
	EwHY3nNHuemvt2G3wQPrMSKRFsBldlp5VInvRvOt/oFmGJqzYhD8y3V17fZ7AmGaGp8GASkCoR2Zq
	48fjov0R1uvTHtw8Nz0k3YilH/sWKDT7qmR4azMbXaO0KsUiuSH6qIvYw4HGNPsX6e2/vpblbFE9e
	An7140fFhw7FY1dnqP/4uxORMlk+vlyEl4vkWq3WSqqirWE11Nu2pBVvenX1aX9TD99HTqY+ihqFh
	oGmL4QOjLXaIZzR3vwmLFwRJYLEptdqhkNXRxXS+v53mC6St45QUWx393G58z7TSUfYQlI4BDnVyN
	pR7EhBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbFV-0000000DWGg-3zeh;
	Wed, 05 Nov 2025 11:00:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbFT-0000000DWG7-2rfA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27F3B434BA;
	Wed,  5 Nov 2025 11:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D59EC4CEF8;
	Wed,  5 Nov 2025 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762340419;
	bh=B+4pOh83F8unCV02t+zRv+dq7jLqx/Ju8WvlRa4iwIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tb1higukqPOJoexZHUEDVn6rdv63fY6hwZ3LV4uK9zfaqjIuKOMWH7LZ4d0ei9f6i
	 +Egjj7f7HKarz2VVvZFrRKdipbZCs+gjsHMTO/1Q8LUrz0zUhTV5XVBL3pohY5XmHu
	 RysFQqMm2Isu9fWxUx2TjLmXekMKFPGNnX0QFn3oEI7OyfZt3sv6P0bdlxlGaO0i9V
	 P/E4gdoX5HoPqW2RoSwNAE9CLBeXGYyQl+5WI6HlAHVwhNjGJDIdAQEsDQLbnfQzBZ
	 qTAvA4Jc11XR+uK5HGEm/v7qUH+IwW7fYLF3eo0KdMaV6ttUikGFpjQCV0FDT5y/9P
	 Sis0E2ZpiD/0A==
Date: Wed, 5 Nov 2025 12:00:11 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <aQsuO5WaYPK0KbVw@ryzen>
References: <20251022174309.1180931-4-vincent.guittot@linaro.org>
 <20251022190402.GA1262472@bhelgaas>
 <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <aQsmtKsTEmf7e7Sd@ryzen>
 <bf3b2d2a-ce3e-87af-4154-abd022c6a3b4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf3b2d2a-ce3e-87af-4154-abd022c6a3b4@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_030019_760957_56217A6D 
X-CRM114-Status: GOOD (  19.21  )
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

On Wed, Nov 05, 2025 at 12:43:09PM +0200, Ilpo Järvinen wrote:
> On Wed, 5 Nov 2025, Niklas Cassel wrote:
> 
> > On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > > > +
> > > > > +     val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> > > > > +     val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> > > > > +     dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> > > > > +
> > > > > +     /*
> > > > > +      * Set max payload supported, 256 bytes and
> > > > > +      * relaxed ordering.
> > > > > +      */
> > > > > +     val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > > > > +     val &= ~(PCI_EXP_DEVCTL_RELAX_EN |
> > > > > +              PCI_EXP_DEVCTL_PAYLOAD |
> > > > > +              PCI_EXP_DEVCTL_READRQ);
> > > > > +     val |= PCI_EXP_DEVCTL_RELAX_EN |
> > > > > +            PCI_EXP_DEVCTL_PAYLOAD_256B |
> > > > > +            PCI_EXP_DEVCTL_READRQ_256B;
> > > > > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> > > >
> > > > MPS and relaxed ordering should be configured by the PCI core.  Is
> > > > there some s32g-specific restriction about these?
> > > 
> > > I will check with the team why they did that
> > 
> > Most likely, the reason is that, the PCI core does not set the MPS to the
> > maximum supported MPS for the root port.
> 
> PCI core set/doesn't set MPS based on config. Perhaps try with 
> CONFIG_PCIE_BUS_PERFORMANCE.

Sorry, I should have been more clear.

Since a lot of PCIe controller drivers have similar code to the above,
it is obvious that a lot of controller drivers want to increase the MPS
regardless of PCIE_BUS_* bus config value.

With the current PCI code, MPS for root ports will not be touched if
PCIE_BUS_TUNE_OFF or PCIE_BUS_DEFAULT.

After the above series, MPS for root ports will be set to max supported
also for PCIE_BUS_DEFAULT.


Kind regards,
Niklas

