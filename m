Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E01D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRUWZLrSVGTYm6zjEdvuLIdP29U0EaWa49E1YmPdZUE=; b=E8rIbyUY9WfmpfW/yle9G4KXMc
	A3g1fBJeCkHa73R/pIv2fE+nT1sEw74rzFBJe1adme46BWsl7kGSmiX0RBGULkKdY1p9sOcN8oxpZ
	wECVsZu9MItQrB9NzKOtikocjZerKpdbPmCt47bQna7j05+nnEXvEFIbyLxKVSyf9ufVvgwu/64NZ
	NgZn5+P3obMJEmqNmI29hLKoVR8wj7DUDZdh0aNmbEp5UNQmhyc3AxUEdauZRvuAWPdv0iBeNqtNq
	PLWyz4+d6cs+Or4A9HiBdOqtIxBsD1fIp3U32SpR9KdWzSFJ4i80nUn5WmYcsfKugVreumRpBz84D
	eEccinWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSrG-000000051zN-3oSi;
	Wed, 21 Jan 2026 07:42:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSrD-000000051xs-30h8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E36B44156;
	Wed, 21 Jan 2026 07:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F050C116D0;
	Wed, 21 Jan 2026 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768981346;
	bh=bte/XQ4DIY+20st0PFZ4A741YBlWScrZ0zOdXWQH50k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIeP31Ij9uGOS5j+Mc24fKtxEPHM9BKYkUtJA3mDe9250G0Mggh8qOGv9UNGLhbXR
	 DX2XtYCw6ieRnjBon31V4xrq8AbjCcU0BUMcvpcltj2GcNEt/ThHJzwLfqb50iA/bE
	 ARXyylEX3on9ijQFThfDwjaXPBFD8pW2rcKTOPqnkK+kGMEm5p91ZrHf2slT3YPwgN
	 Gy+HFFBJaIxQtIW97cD6S5o6AdkyBmz+txMIgaWElD2p6vLRBHIej5bUA5uMiNDE2h
	 EQoeHS2gHI2ULewogq9xdLMfjQyowOi3oR1u5j6h3y4CA3I468HJbkFMgs6SAllEPT
	 LCTHAofRoIkQw==
Date: Wed, 21 Jan 2026 13:12:16 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/11] PCI: dwc: Invoke post_init in
 dw_pcie_resume_noirq()
Message-ID: <dbnnvvpki6oaqaribiuycpshk7qmisl42x3iti24aqzzrw2rfr@afoer4ku4do4>
References: <20260109152750.GA544801@bhelgaas>
 <20260120220441.GA1170239@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120220441.GA1170239@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_234227_782638_BA867EDF 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Jan 20, 2026 at 04:04:41PM -0600, Bjorn Helgaas wrote:
> On Fri, Jan 09, 2026 at 09:27:50AM -0600, Bjorn Helgaas wrote:
> > ...
> 
> > The current commit log for this patch is this:
> > 
> >   Some SoCs like i.MX95 require enabling REFCLK after resuming from suspend
> >   in their post_init callback. So invoke the callback at the end of
> >   dw_pcie_resume_noirq() if available.
> > 
> > When .post_init() is called, the link is already up and PCIe devices
> > have already been enumerated.  I think REFCLK is required for the link
> > to come up, so it doesn't sound right to me that .post_init() would be
> > *enabling* REFCLK.
> 
> This never got resolved.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-imx6&id=199c18221622
> says imx_pcie_host_post_init() enables REFCLK by applying the
> IMX_PCIE_FLAG_8GT_ECN_ERR051586 workaround.
> 
> I don't think that commit log is correct.  Can you please supply some
> correct text for that commit?
> 

Sorry, I messed it up. This callback is not supposed to enable REFCLK, but just
clear CLKREQ# override to allow the endpoint to drive it low when required.

I've just updated the commit text in the controller/dwc-imx6 branch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

