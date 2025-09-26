Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05288CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=P9Xygd9CJNdEBhRvpkPjEH1icmV4WtSc1xnb78UHXN4=; b=N+QuRxINarBHhv
	iiiQkXERd4Ou8aiiuUZqdE7jC3EafJbIEpD6W/xYghXrm/udgCADkUxecPfL6ViofNfQ6gq6Iez2m
	027PxJvgztUXkghHb7J+fMyBCJ/aoX6sgXOwb9ayCDcyXsLn6ORwHenVt7kCyWjXlVXM8yXTipK/t
	2zTpdP+1JP5OK6KXJ73t9PRFFZ+7bY7a58SXye1w17VZXRHLvr8rS0+OhTLiD6cLknmAsPLjgSgPN
	QD6st/RYtb/qzs3PBP1tlrz2u7CvloZ73ZaBcMLjz3RS7jTijR3fCLSL9TKbNc8uD04edyVHR4adG
	gtq2LxU58vWKRBGzvruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2F0R-00000004HUQ-09PW;
	Fri, 26 Sep 2025 20:25:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2F0O-00000004HSQ-1HE8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 20:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 269A443313;
	Fri, 26 Sep 2025 20:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3850C4CEF7;
	Fri, 26 Sep 2025 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758918323;
	bh=QtssM2JLS2bcwQ9EUpp9ZJifiBkLbCEIm03Xx4xumZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tp/CxQ5gjwcR342fUAjKaT8ALiUmpYRJfJAcdPoLHdJYV1GLl8fSuaUbGpu61WYOu
	 3h9xNS1xaKSS+Erz5jQiXcpVAjr+qmx4ecf57WcVHgxLTY6uV0DkmN0c0G16diwqM5
	 2ZoBgH3sro0maUU3PZ3riXz7b5kkCPr3ar/tRrlnME/xJWlVn2k72sbjwKggA91yiR
	 H/WXyL11Cbz9Y37qBe5EhWHTpiFCozCwm6sI8qdYuY9IC9nHKVm8riBvo8QkgRRENZ
	 +aR/C871KI/mc9f/d5GhS87lPZT0aQpAV5ZJ4R1Mf4f1Exb3/veHOKgMmk0mz+ZruX
	 On7+mzH0lzm0w==
Date: Fri, 26 Sep 2025 15:25:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] PCI: imx6: Add a method to handle CLKREQ#
 override active low
Message-ID: <20250926202521.GA2235281@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8833BEF8C043CB239DA074E38C1EA@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_132524_379857_4C7376BD 
X-CRM114-Status: GOOD (  27.71  )
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

On Fri, Sep 26, 2025 at 03:08:30AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>

> > On Fri, Sep 26, 2025 at 02:19:37AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org> On Tue, Sep 23, 2025 at
> > > > 03:39:13PM +0800, Richard Zhu wrote:
> > > > > The CLKREQ# is an open drain, active low signal that is
> > > > > driven low by the card to request reference clock. It's an
> > > > > optional signal added in PCIe CEM r4.0, sec 2. Thus, this
> > > > > signal wouldn't be driven low if it's reserved.
> > > > >
> > > > > Since the reference clock controlled by CLKREQ# may be
> > > > > required by i.MX PCIe host too. To make sure this clock is
> > > > > ready even when the CLKREQ# isn't driven low by the card(e.x
> > > > > the scenario described above), force CLKREQ# override active
> > > > > low for i.MX PCIe host during initialization.
> > > > >
> > > > > The CLKREQ# override can be cleared safely when
> > > > > supports-clkreq is present and PCIe link is up later.
> > > > > Because the CLKREQ# would be driven low by the card at this
> > > > > time.
> > > >
> > > > What happens if we clear the CLKREQ# override (so the host
> > > > doesn't assert it), and the link is up but the card never
> > > > asserts CLKREQ# (since it's an optional signal)?
> > > >
> > > > Does the i.MX host still work?
> > >
> > > The CLKREQ# override active low only be cleared when link is up
> > > and supports-clkreq is present. In the other words, there is a
> > > remote endpoint  device, and the CLKREQ# would be driven active
> > > low by this endpoint device.
> > 
> > Assume an endpoint designed to CEM r2.0.  CLKREQ# doesn't exist in
> > CEM r2.0, so even if the endpoint is present and the link is up,
> > the endpoint will not assert CLKREQ#.
> > 
> > Will the i.MX host still work?

> Yes, i.MX host still work. 
> If the endpoint designed to CEM r2.0, and CLKREQ# is reserved. The
> property suppots-clkreq wouldn't present in this scenario. Thus, the
> CLKREQ# override active low set by host driver wouldn't be cleared
> later, although the link is up and an endpoint is present.

Do you mean 'supports-clkreq' describes the *endpoint*, and you need
to change the devicetree depending on which endpoint is connected?

The schema says 'supports-clkreq' tells us whether CLKREQ# signal
routing exists, not whether the downstream device actually supports
CLKREQ#:

  https://github.com/devicetree-org/dt-schema/blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/pci/pci-bus-common.yaml#L155

I don't see 'supports-clkreq' in any devicetree related to imx6, so
I'm not sure this patch is needed yet.  Does it fix an existing
problem?

If it enables some future functionality, maybe we should defer it
until we're actually ready to enable that functionality?

Bjorn

