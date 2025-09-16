Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C6CCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+cWwhIs/PTVxK7kwrBxMyl1p1MDCiajJpkOM73Jwcqo=; b=rKDACPN9Dm0ZZ7
	2Fusk5LpzaGEIltT44D7+4jP2SHRj4f3EFJ7E6GWevZZE1of8w/fVfarwyuXO6GyX1a+e3MhqdGiw
	fSsCd7fo/3Mz7u5NlNh6UwT+FI0V2dXT3+fu1TXy1RErr/GxJPSJKj44bb60v8K4ZrSJ+3xs5QrUP
	j7jkBdRZQH5RlKEM/gCSKP462cBSGn/Jv6HOua5+N6wGNyNn/VRUJ4rSz0M4/QjOzaStjKmW4U0jD
	MeMhAeBJZyNvVCzT1zZNHD+BuoC9sVXzWqUIJ33XTrSRMNg7ujK/gCm2YG59p1zZoCRYVu0wDfae7
	qL6V2YqSjDPa2Jsl9vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWaT-00000008631-46D5;
	Tue, 16 Sep 2025 14:23:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWaR-0000000862P-2CKG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5D9743D4B;
	Tue, 16 Sep 2025 14:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BA7C4CEEB;
	Tue, 16 Sep 2025 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758032594;
	bh=XEetWU2DNn7YAZx5ChfEf0v6aUr32SLIPyIUZ8Zz3MQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dlzvzNC0id/9Fjio4OifV+Ag3lBlJaaRDquAue0R8OmXvrAukjZKbuTSxuuRYhmAk
	 RXGZp3DOO5NlOBBNvRKEHHwZULqo0LrQLOLieLA0/t83qvaM5ca3N4M/qo6nHNXHGs
	 UB7UjP9x4blU7OQJEmGnFDgST/9C7r/EZPeD+A9x5q/Wssi6m4HuMJf/0jbrRO6DHe
	 kht7STqv+PVoDKW7UdkuVnkqboi9RUt4NnJHKsnfXUAVqLUd04WpFjdnOzPzgvo64I
	 1BPryxHuYLxMF95WXT+0uERSEdBWB0kmL3P6bNiqJmOPdqQ49COdZVdfFkQC0wGNHG
	 3Sc6o3r190EJA==
Date: Tue, 16 Sep 2025 09:23:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
Message-ID: <20250916142313.GA1795171@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDog36hBZ0XvhC-NyfL0SwB5ve53nLFpofToKt1ebhuGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_072315_580932_6FC09445 
X-CRM114-Status: GOOD (  17.59  )
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

On Tue, Sep 16, 2025 at 10:10:31AM +0200, Vincent Guittot wrote:
> On Sun, 14 Sept 2025 at 14:35, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> > On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > > > Describe the PCIe controller available on the S32G platforms.

> > > > +                  num-lanes = <2>;
> > > > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > >
> > > num-lanes and phys are properties of a Root Port, not the host bridge.
> > > Please put them in a separate stanza.  See this for details and
> > > examples:
> > >
> > >   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
> >
> > Ok, I'm going to have a look
> 
> This driver relies on dw_pcie_host_init() to get common resources like
> num-lane which doesn't look at childs to get num-lane.
> 
> I have to keep num-lane in the pcie node. Having this in mind should I
> keep phys as well as they are both linked ?

Huh, that sounds like an issue in the DWC core.  Jingoo, Mani?

dw_pcie_host_init() includes several things that assume a single Root
Port: num_lanes, of_pci_get_equalization_presets(),
dw_pcie_start_link() are all per-Root Port things.

Bjorn

