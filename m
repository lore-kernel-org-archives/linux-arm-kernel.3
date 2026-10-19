Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245DACCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 01:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DONImIz/tkgXGbPeG/+xyhn67lNnTYwz6Ur02o9Rbc=; b=xUpwXwgYyZbjVTm6Ux06SlmLq7
	gunuH5fsMVaaLh1gU8w01k31Y3h6z91a+nTxF6F3QqfsFajjeSJ80Ul61vPhHkFQU1GX/b4dCdlcE
	eh6+FYz/yZsKq+KZGPwrvBuefHyqEn7v5SWQEUuixZVd2z+r/5y89aYDU8u/Qpv/qp8PltKRnjveY
	EK9CqngFtSual3YMgDtxnfgVraPDRlcDBoqSobKIjvDFVEzxNfv7RlrS/aFD6ONY7IHOrnKO267Cf
	aI4//tUFXyeXn8NIhzmC1Sm26+JLVqAAjg3SYrEN7HER8slkyVQz8ucNVuwuaa7yWOIbjATLv6Wfs
	XC69hNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcD9-00000006OGt-3TRO;
	Mon, 19 Oct 2026 01:30:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcD7-00000006OGl-2boF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 01:30:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1DDB60D9F;
	Mon, 19 Oct 2026 01:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676A01F000C5;
	Mon, 19 Oct 2026 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792373444;
	bh=6DONImIz/tkgXGbPeG/+xyhn67lNnTYwz6Ur02o9Rbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=k/5zxDYrul7wnzk83Zs7UkC45Ngg/EhOg9f+2lTDsHpF5vGfMAB5FYGmV00CUnq/r
	 epwQ+84Xk+oZA4MmWAYg+oThiO3NjxdgFJ4CXZegMW7r3rgGP7yhXMPolX2yr8U5DO
	 G7QbkrwBiXH82/E/6NJpsO/rB+UxK+LSKwIAzClfgUUqG4ko1mI2zOzr3J16Rbr1RP
	 un16+BFw8TRDlhZMTCvc496xRxHt+Pzxsl4uzWMWeWwP18QJIc+2S2mYHv655Hp25Z
	 C2ndyv+O+XvqRK9uKXvWQ7g8Fw04oAvlP/hrsPmzw8AvotcpXnFHNcKXA7MBh5UKcQ
	 FZcIhkJJn8f0Q==
Date: Mon, 19 Oct 2026 02:30:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Cc: Conor Dooley <conor@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
Message-ID: <20261019023037.24674f30@jic23-hlaptop>
In-Reply-To: <2ba9235f-182e-4906-92e2-e35cf831d289@foss.st.com>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
	<20261001145702.2628429-2-olivier.moysan@foss.st.com>
	<20261001-tribesman-gauze-862e1ef0cdd8@spud>
	<bb8af256-5a77-4215-9eeb-fbcd0cae1829@foss.st.com>
	<20261008-9e2a48675c1a4c28f2dfa73b@squawk>
	<950f2801-a613-4f5a-a5a7-cb30101cf293@foss.st.com>
	<20261009-8db882a9fa159f8759aa7327@squawk>
	<2ba9235f-182e-4906-92e2-e35cf831d289@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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


> >> Yes, we can have two clocks gated independently but sharing the same rate.
> >>
> >> Using the clock framework apis seemed to me the right way to manage cck1 and
> >> cck0 gating and divider computing. I think I would have to introduce
> >> proprietary properties and have to implement code in the driver, that would
> >> be handled natively by the framework otherwise.  
> > 
> > The CCF is still the right way to do it, especially since CCK0/1 can be
> > exported to other devices. I don't believe you need to actually have a
> > reference in DT to do this though, plenty of "real" clock controllers
> > have only one input clock and hang a whole tree with multiple layers off
> > that.
> > Down below I mentioned this under "ouroboros devices", I think this kind
> > of ability to chose which clock a channel uses is a fairly normal thing
> > to do in IIO land, I just dunno what the preferred mechanism is - I just
> > know that it is not referencing yourself (probably it's some sort of
> > property that you put in a channel node that says 'blah-clock = "cck0"',
> > but better that the IIO folks answer.
> >   
> 
> The adc.yaml binding do not expose clock properties. But maybe IIO 
> experts can answer about this.

Hmm.. For an 'conventional' ADC channel a clock is a novel thing to have
on a per channel basis. What does it mean for an analog signal?
I think these are signals between the front end (which here typically
has one channel only) and the backend. They are useful because they
end up indicating (I think) whether we want to interleave or not?

Anyhow, right now I don't have this clear enough in my head to
give a firm answer.

Jonathan

