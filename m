Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13DCCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ki+JDUAWgRzlm8ywxCGghuyJv64+GYMOlyGVeN8Btg=; b=yHwsf9/WB+1u9AEz7cJ1Of5fge
	+FMSwl8Af/LCpt71ysHs9dcJMStpo1IeGfvy/TwTSUYTGj3/ZKTHsOixdevvC3K+/NxE+FuQhz8k+
	TyL49avdDiY82sNfsR2HdOK97510QVKqSJ30KvjgCrY7vK6tRFM98bYhdjnxEhw8EJpMYXaoe81OZ
	ygZl4+YpxNijqfLLSL1nvY91HemAZd7HiFgMrvrbYFgXxZ0kns7pP3O8/MkrPmrAwY6kD2Vt5J96K
	eu8fs5li3LlmFkeNHpv8Z/0c1kelnobO9yN76W9s3bBYmnYdcVeXJkaedSW2Qhz1jF8be/RkQm8w7
	QjQ8IHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6GB3-00000002sik-1Vro;
	Tue, 07 Oct 2025 22:29:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6GB0-00000002shU-2rWq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96458439E7;
	Tue,  7 Oct 2025 22:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885F6C4CEF1;
	Tue,  7 Oct 2025 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759876137;
	bh=q1NIQivGIY3SwfX/q3BZNviiHdj8erzIHuByXvDQcxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tcj5x2B/WgedHtt3nyUyH4Doenm+E7lYh81J/79yRQtF52tjsLI1brjh9hvm+TIOl
	 0ofyzdNfsh9AUnaS70qo1L+zvh8Sc3nbaxV3HhK3Db/mk2CAn28YmrYBFC3q8oN+Ex
	 clhRc2P16NBdgSSOPkq6LkjCpQtGtiYvdojGmd/Ttk/4q5I4agQoJIspfyjv0a7LTY
	 7wqwXcuLC/Gcghq19fSsZK6hhcI7CXyluaX829jCBemyfRJuK9Cbl98sHQW3Cbu1cx
	 Kl1NsE8ti526a87BptJsImMbdCBlJoxPT5NASfwALNCgMYsmUX31/vAutU6msKhAA8
	 Va4a5Zoac1amg==
Date: Tue, 7 Oct 2025 15:28:55 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com, 
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, 
	bhelgaas@google.com, jingoohan1@gmail.com, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com, 
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOU0w5Brp6uxjZDr@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_152858_745248_4BEBF99E 
X-CRM114-Status: GOOD (  14.68  )
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

On Tue, Oct 07, 2025 at 05:41:55PM +0200, Lorenzo Pieralisi wrote:
> On Mon, Sep 22, 2025 at 11:51:07AM +0530, Manivannan Sadhasivam wrote:
> 
> [...]
> 
> > > +                  /*
> > > +                   * non-prefetchable memory, with best case size and
> > > +                   * alignment
> > > +                   */
> > > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> > 
> > s/0x82000000/0x02000000
> > 
> > And the PCI address really starts from 0x00000000? I don't think so.
> 
> Isn't the DWC ATU programmed to make sure that the PCI memory window DT
> provides _is_ the PCI "bus" memory base address ?
> 
> It is a question, I don't know the DWC inner details fully.
> 
> I don't get what you mean by "I don't think so". Either the host controller
> AXI<->PCI translation is programmable, then the PCI base address is what
> we decide it is or it isn't.
> 

As per the binding, I/O PCI address already starts from 0x0. How can you have
two OB mappings with same PCI address?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

