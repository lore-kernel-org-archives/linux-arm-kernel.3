Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E2ECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EndcDYuYZFPo86frFhMu07n5NOlKZELpWsp9/YTTj4w=; b=IrUWUAyns7nFNxE1XF04iwN+g/
	xvahPSG9jNZavQba2+pufHa54PAm16iA5eUrXF7MY4UC/Mr8bC7U53dQBg5VRt/HghLZK20BBB1pH
	zrVDRuXgQ6HL5MYVjaP0a05Ij4lVczLvDG/lJc1G7iDlWNHl6jlTx+4oQoBoQerhCp73Q+SFpb4hQ
	8g/wvAoMFICMiMQ+dokD00qN5+m9mIWNrF/V/zupvEgPn/VyX5Qhrsv8OJxro3ev50MZ49TziDBVz
	dLmYzEZMrFavG9d2N5g96JJgGc0x2QpbpndUazDDz8KfeygBdw4XLZ9yMqZKqQHipSabb6WYkXGl/
	CayqQnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERzw-00000002Yfg-2M8u;
	Wed, 07 Oct 2026 13:47:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERzs-00000002YfF-0T1x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 13:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8231460233;
	Wed,  7 Oct 2026 13:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA331F0089B;
	Wed,  7 Oct 2026 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791380871;
	bh=EndcDYuYZFPo86frFhMu07n5NOlKZELpWsp9/YTTj4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O6HZBQ85bkZge2ZxJ5Fkhm/XMPYaxwbFiJsHQGs/JekNTNOHejiB5sTbxsdF8AQHA
	 aBFFYFjOeu6gsfYbmsRtgwRSlcE8lVeOn5N4xbvlIH9lVYmPwrzbAdUu3Mie+iG1Rn
	 ZD1EnlEYqSam5RIy51DCFG5p+0Qzjxg2FYB5xg0xRFIiy191eWnIkIPWKD413cqBg/
	 45SLo6ZDABFCsX2ZgW7WhMOWHBFXhsjMjd2ktEGbXWPRHIdjutEaPKs0hyYoTm2zB4
	 D4vobXc8ps3/MEgCAprmWV3iu+KrcKHLWDy44c8VdRMcwyewiEYZbEBmuy/+pI4+v4
	 z+9+d1PugI2Ng==
Date: Wed, 7 Oct 2026 08:47:50 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
Message-ID: <20261007134750.GC2792240-robh@kernel.org>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-2-olivier.moysan@foss.st.com>
 <20261001-tribesman-gauze-862e1ef0cdd8@spud>
 <bb8af256-5a77-4215-9eeb-fbcd0cae1829@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb8af256-5a77-4215-9eeb-fbcd0cae1829@foss.st.com>
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

On Wed, Oct 07, 2026 at 11:01:28AM +0200, Olivier MOYSAN wrote:
> Hi Conor,
> 
> Thanks for the review
> 
> On 10/1/26 20:32, Conor Dooley wrote:
> > On Thu, Oct 01, 2026 at 04:56:45PM +0200, Olivier Moysan wrote:
> > > Add bindings that describes STM32 MDF settings to support
> > > digital filtering for Pulse Density Modulation (PDM) microphones
> > > and analog sigma delta modulators.
> > > 
> > > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > > ---
> > >   .../bindings/iio/adc/st,stm32-mdf-adc.yaml    | 383 ++++++++++++++++++
> > >   1 file changed, 383 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> > > new file mode 100644
> > > index 000000000000..f2fbc3e150e8
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> > > @@ -0,0 +1,383 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/iio/adc/st,stm32-mdf-adc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: STMicroelectronics STM32 Multi-function Digital Filter (MDF) ADC
> > > +
> > > +maintainers:
> > > +  - Olivier Moysan <olivier.moysan@foss.st.com>
> > > +
> > > +description: |
> > > +  STM32 MDF ADC is a sigma delta analog-to-digital converter dedicated to
> > > +  interface external sigma delta modulators to STM32 micro controllers.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - st,stm32mp25-mdf
> > > +      - st,stm32mp23-mdf
> > > +
> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 2
> > 
> > This needs an items list here. The size of the regions seems like crap
> > to begin with...
> > 
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description: Internal clock used for MDF digital processing.
> > > +    items:
> > > +      - const: ker_ck
> > 
> > This is pointless when you only have one.
> > 
> 
> I agree that it could be dropped. However, it is useful for using
> devm_regmap_init_mmio_clk.

I don't know what that function is/does, but that's not justification 
for bindings. Maybe you need a helper that handles a single clock. Or 
that function could take a NULL string for single clock? 

> 
> > > +
> > > +  "#clock-cells":
> > > +    enum: [0, 1]
> > 
> > Why is this not fixed? Also why are parts of your own device consuming
> > the clocks?
> > 
> > > +
> > > +  clock-output-names:
> > > +    description: |
> > > +      CCK0 and CCK1 are optional output clocks, which share the same clock frequency,
> > > +      but can be gated independently to save power.
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    oneOf:
> > > +      - items:
> > > +          - const: cck0
> > > +      - items:
> > > +          - const: cck1
> > > +      - items:
> > > +          - const: cck0
> > > +          - const: cck1
> > > +
> > > +  clock-frequency:
> > > +    description: |
> > > +      Common clock frequency (Hz) for CCK0 and CCK1 output clocks.
> > > +      The frequency must be a multiple of the "ker_ck" clock frequency.
> > > +    maximum: 25000000
> > 
> > Should not be needed, the consumers request what they need.
> > 
> 
> The CCKx clock frequency depends on the maximum rate supported by the sigma
> delta converters (for instance a digital mic) and the expected decimation
> ratio on the bitstream. Typically this determines the frequency on the SPI
> bus.
> This rate is defined statically and shared by the CCKx clocks. So IMHO, as
> this rate is unique, it can look strange to let the consumer define it.
> Moreover, it seems to me that clock-frequency is already used to configure
> the frequency of a provider in some other bindings.
> For instance: Documentation/devicetree/bindings/clock/silabs,si570.yaml
> So, it's not clear for me, what is the restriction on clock-frequency
> property.
> > > +
> > > +  ranges: true
> > > +
> > > +  clock-ranges: true
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: mdf
> > > +
> > > +  access-controllers:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description: |
> > > +      Phandle to the rifsc device to check access right.
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  st,interleave:
> > > +    description: |
> > > +      List of phandles of interleaved filters. The indexes of interleaved filters must be
> > > +      consecutives starting from 0 (i.e in range [0..N]). The samples from interleaved filters
> > > +      are muxed in a single channel and retrieved through the device associated to the filter 0.
> > > +      The filters 1..N have to be enabled, but inherit their configuration from filter 0.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > 
> > No idea what these even are, but this is probably not the right way to
> > represent the relationship between devices. They're apparently ADCs, but
> > this is also an ADC so I'm not sure what's going on here at all.

I don't under it either, but regardless phandle-array needs constraints 
on the items. It's really a matrix with array of phandle+args arrays.

Rob

