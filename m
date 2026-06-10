Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71CFCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkWD23EcUZQ2Cyeh05Hbt+rL2iVJ4hm0EeKjVQhjWWw=; b=ojCcGSexGzEYqG2yvVVCBv7LMh
	Dblb0k4k37hp6G38+uVlnm/xrang7Y3Cve5WYW9Q1PQB8418SKMKulp7s32JS+1Qa2QFmHHNlNQe5
	baHPb0u29SgImFxL/NbqBP6mZA6yD15Gp0vRTy6SRhsjFPBXchADYCiMUpDqHEsri6ikBHW1FYuDF
	pl55mJ2Lo92KcndSrLwRv9n+DTuGjadF0XwR37dV8fWAcfFmOXpmCLzTppGfFlhXunhUn/68fNLbo
	NF1gH+PpJjNQH9XHMUe7HxTqdk1+WcnMPplNkd2h08UxdB+HzfdH8WlXNVV100scXvVY0rXZTJCFP
	tvCoylQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDX9-00000006y0n-1vA5;
	Wed, 10 Jun 2026 07:39:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDX7-00000006y0h-3d61
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:39:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 605354193F;
	Wed, 10 Jun 2026 07:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906191F00893;
	Wed, 10 Jun 2026 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077169;
	bh=FkWD23EcUZQ2Cyeh05Hbt+rL2iVJ4hm0EeKjVQhjWWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wn74MLRboT3MeAzGFBKlg+dPoTuRE5phWzuvQGqsBy8/z+BUc+xZHAlPvvLP1kjHz
	 7FDGuti1YRaOj651V4ia+GSH5vxGaUM6tIvY112szJnC2LnbcHyZQ3CUVDowYtLsLl
	 /Ng8Kt1w8m1G3RG7kS3oI1ryWUfsz9QSD78mgqaon07DFDqNT1fWq1yBGkQxTXKrc1
	 krpMFRZnFvPZ5XhSvQWCKLvos1XOp6YB65IKHkgLgtqECaHYLLqT9R8alcOIorMLl4
	 wFUj/2VsBeUQGvXxNy3Jpr6T1f4IAguYFNHJ7NYW4vrfuoYBwyaNVC4jPrxhoU4zj/
	 o8YrQX0ySMKfw==
Date: Wed, 10 Jun 2026 09:39:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Frank Li <Frank.li@oss.nxp.com>, 
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260610-accomplished-antique-mink-cf0ead@quoll>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
 <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
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

On Tue, Jun 09, 2026 at 11:33:03AM -0600, Mathieu Poirier wrote:
> On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > >
> > > > The names of the carveout regions are derived using the names of the
> > > > reserved memory devicetree nodes, which are referenced using the
> > > > "memory-region" property. This adds a restriction on the names of said
> > > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > > specification's recommendation, which states that the devicetree node
> > > > names should be generic.
> > >
> > > I don't see what is so restrictive in using the node name of the reserved-memory
> > > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > > will you gain with this new "memory-region-names" that can't be done with the
> > > current solution?
> >
> > DT Binding check can't find such wrong if node name is not what expected.
> > Binding can't restrict memory's node name because there ware not specific
> > compatible string for it.
> >
> 
> But what "wrong" could that be, and what kind of restriction are you
> hoping to enforce?  What specific problem are you hoping to solve?
> 
> I'll wait to see what the DT people think about this - I personally
> don't see the value in it.

I see no point in this commit, but maybe because the commit msg is just
misleading. It mixes node names with names for phandles which are two
separate things.

Plus this change actually makes nothing - no names are restricted to any
meaningful values!

Best regards,
Krzysztof


