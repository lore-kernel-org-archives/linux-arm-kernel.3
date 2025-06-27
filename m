Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE1DC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7y5MruCTMcX1J0jmgCi7PebS1+PMwkROzLoHu89tmA=; b=Wn8JVQcpxPLv+dlRSXIiGlQkhR
	2fXXb4bimgpDV8n1fWRfx36D1omxMGutQOKJFaElDt0EQNCxEbNu3dg8b/xS0WzcQ7SQxPiMBfTBO
	4pPmRRcck2xGT11+nuCox10Rjb4XZfIj6fe1e1ggtLZspHSltnvuSdYFJvdjmc5120UplEYMAyMWJ
	jF4j2VnIn2o/IrfdQ1zpBLS9UpPtSrjvFztQDibUZwvw44HKMLp2R7vOK28r65mU0Lj2Uy7FJnaip
	3LmEGB9f4QywgCZGIHijEB4D2VydF8oX3Z7LMYfv2kuLNxqTgqbExwCYYFMAghzFTx+t9MpT+TF53
	F2QpqmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4jq-0000000DzsN-2mKV;
	Fri, 27 Jun 2025 08:47:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4hX-0000000DzQG-3ent;
	Fri, 27 Jun 2025 08:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05E686144D;
	Fri, 27 Jun 2025 08:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C807BC4CEE3;
	Fri, 27 Jun 2025 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751013890;
	bh=RTLLpwAcPZOfKhzKTWv9DijE/pyyo/yM7NlOJeC3mSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8BnQ4a2qY+T7f6Nj93ZdhYrpdcPOQOWkuZ8+ABcMmaaalqNwlzCVewwvEgKG6BXN
	 ELWtADd0yAz+SoTC/LZgdsX4Ushlh5KbRxIGqcRmn+9J+0ZO4TLxmwbgDWK9x6bN+H
	 10Vsq5P6ufR4FKHGBpEc4FJLcUKby3zlkCiJ+N/vb7jd98zAZkmsowWvFUxuZBy/US
	 nalHm8bz7WEsfTHX4KPH/CS3zgKjx1DcskmR5Vq0fHOvdrK4oLUi0ln10/uPriktBK
	 uYQ4uVZUxK8GfgwwpJsTo8mRVpqk+ML+kUwBmHPrMhNHUqt5KImfrhwoJ7SlperKMh
	 BRGsPXnnQmfTg==
Date: Fri, 27 Jun 2025 10:44:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com, 
	guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v2 09/29] dt-bindings: clock: mediatek: Describe MT8196
 peripheral clock controllers
Message-ID: <20250627-camouflaged-utopian-hedgehog-11ea2c@krzk-bin>
References: <20250624143220.244549-1-laura.nao@collabora.com>
 <20250624143220.244549-10-laura.nao@collabora.com>
 <7dfba01a-6ede-44c2-87e3-3ecb439b48e3@kernel.org>
 <284a4ee5-806b-45f9-8d57-d02ec291e389@collabora.com>
 <0870a2ba-936b-4eb2-a570-f2c9dea471b8@kernel.org>
 <9fc32523-5009-4f48-8d82-6c3fd285801d@collabora.com>
 <86654ad1-a2ab-4add-b9de-4d56c67f377b@kernel.org>
 <ae478fd7-c627-433c-a614-b76dcd4164d2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae478fd7-c627-433c-a614-b76dcd4164d2@collabora.com>
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

On Wed, Jun 25, 2025 at 02:48:39PM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/06/25 13:06, Krzysztof Kozlowski ha scritto:
> > On 25/06/2025 11:45, AngeloGioacchino Del Regno wrote:
> > > Il 25/06/25 10:57, Krzysztof Kozlowski ha scritto:
> > > > On 25/06/2025 10:20, AngeloGioacchino Del Regno wrote:
> > > > > Il 24/06/25 18:02, Krzysztof Kozlowski ha scritto:
> > > > > > On 24/06/2025 16:32, Laura Nao wrote:
> > > > > > > +  '#reset-cells':
> > > > > > > +    const: 1
> > > > > > > +    description:
> > > > > > > +      Reset lines for PEXTP0/1 and UFS blocks.
> > > > > > > +
> > > > > > > +  mediatek,hardware-voter:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > > +    description:
> > > > > > > +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
> > > > > > > +      MCU manages clock and power domain control across the AP and other
> > > > > > > +      remote processors. By aggregating their votes, it ensures clocks are
> > > > > > > +      safely enabled/disabled and power domains are active before register
> > > > > > > +      access.
> > > > > > 
> > > > > > Resource voting is not via any phandle, but either interconnects or
> > > > > > required opps for power domain.
> > > > > 
> > > > > Sorry, I'm not sure who is actually misunderstanding what, here... let me try to
> > > > > explain the situation:
> > > > > 
> > > > > This is effectively used as a syscon - as in, the clock controllers need to perform
> > > > > MMIO R/W on both the clock controller itself *and* has to place a vote to the clock
> > > > > controller specific HWV register.
> > > > 
> > > > syscon is not the interface to place a vote for clocks. "clocks"
> > > > property is.
> > > > 
> > > > > 
> > > > > This is done for MUX-GATE and GATE clocks, other than for power domains.
> > > > > 
> > > > > Note that the HWV system is inside of the power domains controller, and it's split
> > > > > on a per hardware macro-block basis (as per usual MediaTek hardware layout...).
> > > > > 
> > > > > The HWV, therefore, does *not* vote for clock *rates* (so, modeling OPPs would be
> > > > > a software quirk, I think?), does *not* manage bandwidth (and interconnect is for
> > > > > voting BW only?), and is just a "switch to flip".
> > > > 
> > > > That's still clocks. Gate is a clock.
> > > > 
> > > > > 
> > > > > Is this happening because the description has to be improved and creating some
> > > > > misunderstanding, or is it because we are underestimating and/or ignoring something
> > > > > here?
> > > > > 
> > > > 
> > > > Other vendors, at least qcom, represent it properly - clocks. Sometimes
> > > > they mix up and represent it as power domains, but that's because
> > > > downstream is a mess and because we actually (at upstream) don't really
> > > > know what is inside there - is it a clock or power domain.
> > > > 
> > > 
> > > ....but the hardware voter cannot be represented as a clock, because you use it
> > > for clocks *or* power domains (but at the same time, and of course in different
> > > drivers, and in different *intertwined* registers).
> > 
> > BTW:
> > 
> > git grep mediatek,hardware-voter
> > 0 results
> > 
> > so I do not accept explanation that you use it in different drivers. Now
> > is the first time this is being upstream, so now is the time when this
> > is shaped.
> 
> I was simply trying to explain how I'm using it in the current design and nothing
> else; and I am happy to understand what other solution could there be for this and
> if there's anything cleaner.
> 
> You see what I do, and I'm *sure* that you definitely know that my goal is *not* to
> just tick yet another box, but to make things right, - and with the best possible
> shape and, especially, community agreement.

Ack, I understand. Your case here is really not different from all
others. Interface is different, hardware is different, but the concept -
you place votes via some intermediary - is completely the same which
qcom is doing since years and maybe other vendors as well.

And I expect more and more of this in case of Mediatek, so in the future
you will be plcing votes not only for on/off but also for values.
Everyone goes there, mobile, automotive... maybe IoT lags behind because
performance there is not that important, but all others need top
performance with top energy saving which they cannot do in Linux and
they move it to firmware (SCMI, hw voter, dedicated blocks, whatever).

You need to start designing this proper with that future in mind and
syscon is a strong no-go. Whether this is clocks, power domains or
interconnects - dunno yet, maybe both.

Best regards,
Krzysztof


