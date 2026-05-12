Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B45CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Euouo/K/RbEumsaT1GH2JUlCYd6qzEvxZUoNiId5TT4=; b=ze6+32NLYSErJ5hzUUwZ0LuiiF
	/1doBVU/HXlBi2DcqxWxf7RefobaFvscW/f+QRE1oz3rcHokanZ7pTd/rmBSqgaVY1O95JfayR8To
	+Fh3zQngfgISJ1+FR10/ej2/UuqaCrp4GnYk3gfExWV7xJzgosIvK0GoRDlUtOD7nDLULWCbbcX5+
	g0DFlFjnkZqoK5+j6fhPdvBEDXtx2lyxJOpGYMTrnWl2dKa0xGElQJOHuSyrz89wlxMhR97jpgvev
	N9N3vCo0ialoIBwmBk3uAPBCizoRlSnldXRM4UaTNUfaDP0sr02gArE4OJdSWiW3lAo2rUmUPKA1O
	v01GtP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeFq-0000000FQ87-43a3;
	Tue, 12 May 2026 03:57:58 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeFm-0000000FQ66-1AqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 03:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Euouo/K/RbEumsaT1GH2JUlCYd6qzEvxZUoNiId5TT4=; b=pVbVIxXByLhlXqnNT+0d+CbEve
	TjY0bwKs+/AYKrfSWu8mPOnImLsJNhc0Lmg7JggF9Q0CQHzdtFogBgpRGiAHApaocHOFShgOykLpk
	eysv5YIBb4pLQGwd3tNAl0P0hkNNONnv6tunaHzK9+7s5xdYNkjistxxT9WqqgrZxsT6Zu2ALrdM3
	AsQU/uqgI02OxtyW9MujjNgIY8puI4mfJkKjBzRGF9Y1ClyabokNj/hczmAjrYBl98cuCOxACZ8tj
	U3qI9h+MUaJIXtZ6vaWGLQrxGcoorF8i1AF3Nt7sZl4X3kfR8kBKrhAk9fZ43pXn01ciUFFQJx9ee
	0gcTliDA==;
Received: from user-188-33-36-12.play-internet.pl ([188.33.36.12] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wMeFj-00000007kOo-3hb9;
	Tue, 12 May 2026 05:57:52 +0200
Date: Tue, 12 May 2026 05:56:54 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
Message-ID: <3aabrtlih2z3b4v5ec5jdb76cb4aesqm2grjudzxhlkk3iwzcn@bawiakcija6d>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
 <e7269822-afc4-4a80-8408-297f9dbd6791@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7269822-afc4-4a80-8408-297f9dbd6791@arm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_205754_831217_CF1AE72A 
X-CRM114-Status: GOOD (  32.86  )
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

On Mon, May 11, 2026 at 06:02:16PM +0200, Andre Przywara wrote:
> Hi Michal,
> 
> thanks for adding this!
> 
> On 5/10/26 14:57, Michal Piekos wrote:
> > Add support for the GPADC for the Allwinner A523. It differs from the
> > D1/T113s/R329/T507 by having two clocks.
> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> >   .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 +++++++++++++++++++++-
> >   1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> > index da605a051b94..89da96cd705f 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> > @@ -17,6 +17,7 @@ properties:
> >         - items:
> >             - enum:
> >                 - allwinner,sun50i-h616-gpadc
> > +              - allwinner,sun55i-a523-gpadc
> >             - const: allwinner,sun20i-d1-gpadc
> 
> As Jernej already mentioned, the A523 GPADC is not fully compatible, since
> it adds another clock. The question to ask is: Can a driver only knowing
> about the fallback device handle this new device? For which the answer here
> is: No, it misses a clock.
> So add just a single entry for the A523 (plus adding it to the driver).
> 
> So looking at this I wonder if we should add some property to describe the
> number of supported channels, since they are slightly different between the
> SoCs:
> - The D1 manual mentions 2 channels.
> - The T113s manual (same die as the D1?) describes 1 channel only.
> - The T507 manual (same die as the H616) reports 4 channels.
> - The A733 has 6 channels.
> - The A133 has 1 channel, but it's channel 1, not 0.
> 
> So all of this is somewhat covered as channels are described as child nodes,
> and have a reg property. Ideally non-existing channels just wouldn't be
> listed, but I don't know if we want to rely on that.
> 
> So I am wondering if we should introduce a limit, or rather a mask (to cover
> the A133 oddity)?
> Either a DT property (channel-mask, as a single sell representing the bit
> mask), or derived in the driver from the compatible string.
> The former would avoid introducing different compatible strings just because
> of that, though I think this type of property is somewhat discouraged?
> 
> Any thoughts?

Thanks. I have missed that sparse channels are also possible. I think in
current implementation it will cause issue with lookup through
<&gpadc 1> as sun20i_gpadc_alloc_channels would effectively create
channels[0].channel = 1 in such scenario. I will try to verify if my
logic is correct and provide separate fix if needed.

Regarding DT property masking channels there is already precedence:
atmel,adc-channels-used is a bitmask of muxed and enabled channels.
Not sure if preferable though...

Michal
> 
> >     "#io-channel-cells":
> > @@ -29,7 +30,12 @@ properties:
> >       const: 0
> >     clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> >     interrupts:
> >       maxItems: 1
> > @@ -40,6 +46,35 @@ properties:
> >     resets:
> >       maxItems: 1
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          items:
> > +            - const: allwinner,sun55i-a523-gpadc
> > +            - const: allwinner,sun20i-d1-gpadc
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            - description: Bus clock
> > +            - description: Module clock
> 
> I am not a YAML expert, but I think you can drop the min and max properties,
> if you just enumerate the cases. Same for the names.
> 
> Cheers,
> Andre

I will correct that in v2.
Michal.
> 
> > +        clock-names:
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            - const: bus
> > +            - const: mod
> > +      required:
> > +        - clock-names
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> > +        clock-names: false
> > +
> >   patternProperties:
> >     "^channel@[0-9a-f]+$":
> >       $ref: adc.yaml
> > 
> 

