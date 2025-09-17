Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3AECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cp9ykgyUzAwMEnn8Pi+6Q+6rqWqd1jpnjw2l/9CaSIw=; b=xsjjxJeK1wP7SdgDobNAc6KUDC
	n8ZRW0yndI4qZoEKQjKyoe9PnhanwCCKpt3F9Rpg7TvZM2BDAoQnG8MdBlkuipITmnXHF5vza97pn
	9Elqwuy6CWxps9qPY8AZR4g9OVERyW61pZVb92fiON9Sssvi4wbCwA0qrEOq4fE6PzT5cEctC/VVy
	U3RZB3LghaUqiBV2ptBhVCvYijoMGkPaUdVPx7ANbZfIWewMwoA6MW8+qA5wTqC2SATb4t+eWFvJH
	nJWxj/J6Tq0sD3vvBgO4vxWGfbqxqNp6Od52hG+68CVkIfxsIjO8hDj3Ts3ZbrLZbV+xvmjnecloO
	/yAyFkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvgj-0000000DRsx-1M4m;
	Wed, 17 Sep 2025 17:11:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvgg-0000000DRrF-3ccl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DDB4354E;
	Wed, 17 Sep 2025 17:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048A9C4CEE7;
	Wed, 17 Sep 2025 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129081;
	bh=5a8Lvl/fyCGhy9i59oV3pta8qeog5MpOntlyY8Wl3ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bY7xIKsJMt1zjwyfXRsbFHQsyNw7p8CDSsIGnEh7Wtlbv2+nn5P68Jd6658PzQzqW
	 qMilKropUB9RjntzIENhx+JIt57CM9arwx4B+XNcdY1QRjGTsGhC2R/dHREZ/Yx6E2
	 jvUbVHOs11mOxIi7ZXnyjhSIvBlxxgIeZ+45SpP0ae+J0UxhO1OG3nbd4TELHrAL0p
	 QhUtNz355q6QSb0pPcIq5yQVVEdE7QOjRLpgMs3NfWtfIzcLBkTrRNjDuvwJpWtML9
	 upUdm4eyV4cS9ML8NZ8M9mNrXiR8KXDrB+07YHQ58kaZMQZ6ye9LBcAaPZ2gok/mln
	 ZMf8zYulN9Wwg==
Date: Wed, 17 Sep 2025 22:41:08 +0530
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
Message-ID: <e236uncj7qradf34elkmd2c4wjogc6pfkobuu7muyoyb2hrrai@tta36jq5fzsr>
References: <CAKfTPtDog36hBZ0XvhC-NyfL0SwB5ve53nLFpofToKt1ebhuGQ@mail.gmail.com>
 <20250916142313.GA1795171@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916142313.GA1795171@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_101122_922556_C6AC2CC6 
X-CRM114-Status: GOOD (  20.92  )
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

On Tue, Sep 16, 2025 at 09:23:13AM GMT, Bjorn Helgaas wrote:
> On Tue, Sep 16, 2025 at 10:10:31AM +0200, Vincent Guittot wrote:
> > On Sun, 14 Sept 2025 at 14:35, Vincent Guittot
> > <vincent.guittot@linaro.org> wrote:
> > > On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > > > > Describe the PCIe controller available on the S32G platforms.
> 
> > > > > +                  num-lanes = <2>;
> > > > > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > > >
> > > > num-lanes and phys are properties of a Root Port, not the host bridge.
> > > > Please put them in a separate stanza.  See this for details and
> > > > examples:
> > > >
> > > >   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
> > >
> > > Ok, I'm going to have a look
> > 
> > This driver relies on dw_pcie_host_init() to get common resources like
> > num-lane which doesn't look at childs to get num-lane.
> > 
> > I have to keep num-lane in the pcie node. Having this in mind should I
> > keep phys as well as they are both linked ?
> 
> Huh, that sounds like an issue in the DWC core.  Jingoo, Mani?
> 
> dw_pcie_host_init() includes several things that assume a single Root
> Port: num_lanes, of_pci_get_equalization_presets(),
> dw_pcie_start_link() are all per-Root Port things.
> 

Yeah, it is a gap right now. We only recently started moving the DWC platforms
to per Root Port binding (like Qcom).

Unfortunately, I don't have cycles for it atleast this week.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

