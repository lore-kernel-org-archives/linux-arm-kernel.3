Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F77C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=temE7mHiIMLZMXsct5vweSPGkl7qrXCRYG3zsCdtegk=; b=Tv/YM9RqgLEfp13nF7OzIy+74H
	XAGj/kLkQk4RUWPmtmdIRGZhFgIpyEg5KKN5Q3kkg8xcwl+jkjl0pReM6OUt7JTIhpYbTaQaL2FY1
	UvtUrY7zewzey+gZQ3r8YADLv+Bf7Fk+pQNLKGI8lifT49ASEkDnwt6Om+a2lvaF8guRwtyuXsVYS
	oxNQId/onxPz+SIwe8YxiwXXGDwzfgF8ZRdkNpA4V0+9oqvdn6v4gSYjdWyyNmaH3jTL3o/XkaYlg
	4XSX55c2rW8POy7PIiEgIz8b6qOUsk9TY4JOj56riCuEueYP+KKL2FhisTbA0dOfEzRj1Hn073Wzl
	g03gEoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG0M-0000000D7xv-1xQo;
	Wed, 28 May 2025 12:35:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFuG-0000000D7ID-1jq8;
	Wed, 28 May 2025 12:29:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 280A11A2D;
	Wed, 28 May 2025 05:28:57 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADD023F673;
	Wed, 28 May 2025 05:29:10 -0700 (PDT)
Date: Wed, 28 May 2025 13:29:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?=
 <privatesub2@gmail.com>, linux-kernel@vger.kernel.org, Brandon Cheo Fusi
 <fusibrandon13@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
Message-ID: <20250528132902.70f634cd@donnerap.manchester.arm.com>
In-Reply-To: <hetih6ul7hdj3kflhy2s2zkkh3r7pcupgwde3xnwmjzs6cujp3@vcw4pde76bdb>
References: <20250427142500.151925-1-privatesub2@gmail.com>
	<20250427142500.151925-3-privatesub2@gmail.com>
	<20250512233944.06bc1cb7@minigeek.lan>
	<CAF4idN=Kwp8bDYVyjM52eUwVEEZcPM9YyK9KiqUzyf8Dm=cXTQ@mail.gmail.com>
	<hetih6ul7hdj3kflhy2s2zkkh3r7pcupgwde3xnwmjzs6cujp3@vcw4pde76bdb>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_052916_547429_DC8D3804 
X-CRM114-Status: GOOD (  58.37  )
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

On Wed, 28 May 2025 13:08:40 +0200
Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> wrote:

Hi Uwe,

> On Sat, May 24, 2025 at 12:07:28PM +0300, =D0=90=D0=BB=D0=B5=D0=BA=D1=81=
=D0=B0=D0=BD=D0=B4=D1=80 =D0=A8=D1=83=D0=B1=D0=B8=D0=BD wrote:
> > =D0=B2=D1=82, 13 =D0=BC=D0=B0=D1=8F 2025=E2=80=AF=D0=B3. =D0=B2 01:39, =
Andre Przywara <andre.przywara@arm.com>: =20
> > >
> > > On Sun, 27 Apr 2025 17:24:54 +0300
> > > Aleksandr Shubin <privatesub2@gmail.com> wrote: =20
> > > > +              */
> > > > +             use_bus_clk =3D false;
> > > > +             val =3D mul_u64_u64_div_u64(state->period, hosc_rate,=
 NSEC_PER_SEC);
> > > > +             /*
> > > > +              * If the calculated value is =E2=89=A4 1, the period=
 is too short
> > > > +              * for proper PWM operation
> > > > +              */
> > > > +             if (val <=3D 1) { =20
> > >
> > > So if I get the code correctly, it prefers HOSC over APB? Is that
> > > really the best way? Shouldn't it be the other way around: we use the
> > > faster clock, since this will not limit the sibling channel?
> > >
> > > And another thing to consider are rounding errors due to integer
> > > division: certain period rates might be better achievable with one or
> > > the other source clock: 3 MHz works best as 24MHz/8, 3.125MHz as
> > > 100MHz/32.
> > > So shall we calculate the values and compare the errors instead?
> > > Oh, and also we need to consider bypassing, I feel like this should be
> > > checked first.
> > >
> > > In any case I think there should be a comment describing the strategy
> > > and give some rationale, I think. =20
> >=20
> > I like the idea of comparing the quantization error for each clock sour=
ce
> > (i.e. computing the actual period for both APB and HOSC and choosing
> > whichever is closer to the requested period).
> > I can try to implement that error-minimization approach in the next
> > series of patches and add a comment explaining the strategy. =20
>=20
> Consumers have different needs. Some might prefer a better match for
> period, but in my experience most would go for a fine-grained selection
> of duty_cycle, so prefering the faster clock sounds sane.
>=20
> I don't say minimizing the error is wrong, but if it's unclear that
> this matches what a consumer wants I object to make the procedure to
> select the hardware settings considerably more complicated and run-time
> intensive.

Yes, I agree. There seems to be another use case here, which is to provide
clocks on output pins. The PWM IP has a bypass switch (per channel, after
the divider), and this feature is already required to supply the
"internal" (co-packaged) Ethernet PHY on the Allwinner H616 with its clock.
With the two possible input clocks and those pre-dividers there is actually
quite a number of possible frequencies to deliver on output pins.

Since we need some algorithm to decide when we need to use the bypass
mode, should we check for that if the duty cycle is 50%, to see if we can
reach the frequency with just the pre-dividers?
Chances are we need this anyway, since for instance the 24MHz required for
the PHY cannot be achieved otherwise.

> > > > +static int sun20i_pwm_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct pwm_chip *chip;
> > > > +     struct sun20i_pwm_chip *sun20i_chip;
> > > > +     struct clk *clk_bus;
> > > > +     struct reset_control *rst;
> > > > +     u32 npwm;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D of_property_read_u32(pdev->dev.of_node, "allwinner,np=
wms", &npwm);
> > > > +     if (ret < 0)
> > > > +             npwm =3D 8; /* Default value */
> > > > +
> > > > +     if (npwm > 16) {
> > > > +             dev_info(&pdev->dev, "Limiting number of PWM lines fr=
om %u to 16", npwm); =20
> > >
> > > I don't think we should proceed if the firmware information is clearly
> > > wrong. Just bail out with -EINVAL or so here, so that gets fixed in t=
he
> > > DT. =20
>=20
> To me it's not obvious that the "firmware information is clearly wrong".
> Maybe the next Allwinner SoC will have 24 outputs and the problem is
> only that this driver isn't prepared to cope for that number of outputs?

But then it would be an error, regardless?
The MMIO register frame of this IP here has a hard limit on 16 channels,
both by the bit assignments in each register (2 bits per channel in a
32-bit register), but also by the layout of the registers (max 8
registers, each for a pair of 2 PWM channels). So anything with more than
16 channels cannot be compatible with what this driver supports.
So as this driver here stands right now, more than 16 channels is an
error, simple as that. If we extend the driver later on, to cover more
advanced IP, we would naturally amend this check, of course.

> If that really happens it's arguable if it's better to refuse completely
> or just cope for the 16 outputs that the driver is able to. IMHO it's
> better to continue because a partially workable pwmchip is better than
> no chip at all. But I'd upgrade the message to dev_warn().

I don't understand why we should continue. If the firmware information
(DT) is wrong, we should make this clear, to force people to fix
that, instead of somehow papering over it.

But it's really an academic discussion, I don't expect anyone to put more
than 16 channels in the DT. It's in the per-SoC .dtsi anyway, so nothing
that board DT authors would touch.

> > > > +             npwm =3D 16;
> > > > +     }
> > > > +
> > > > +     chip =3D devm_pwmchip_alloc(&pdev->dev, npwm, sizeof(*sun20i_=
chip));
> > > > +     if (IS_ERR(chip))
> > > > +             return PTR_ERR(chip);
> > > > +     sun20i_chip =3D to_sun20i_pwm_chip(chip);
> > > > +
> > > > +     sun20i_chip->base =3D devm_platform_ioremap_resource(pdev, 0);
> > > > +     if (IS_ERR(sun20i_chip->base))
> > > > +             return PTR_ERR(sun20i_chip->base);
> > > > +
> > > > +     clk_bus =3D devm_clk_get_enabled(&pdev->dev, "bus");
> > > > +     if (IS_ERR(clk_bus))
> > > > +             return dev_err_probe(&pdev->dev, PTR_ERR(clk_bus),
> > > > +                                  "Failed to get bus clock\n");
> > > > +
> > > > +     sun20i_chip->clk_hosc =3D devm_clk_get_enabled(&pdev->dev, "h=
osc");
> > > > +     if (IS_ERR(sun20i_chip->clk_hosc))
> > > > +             return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip-=
>clk_hosc),
> > > > +                                  "Failed to get hosc clock\n");
> > > > +
> > > > +     ret =3D devm_clk_rate_exclusive_get(&pdev->dev, sun20i_chip->=
clk_hosc); =20
> > >
> > > Just ignoring for a bit that the 24 MHz oscillator is a fixed clock
> > > anyway, but why would we want exclusivity already at probe time? Isn't
> > > that too limiting, as no one might ever use any PWM channels, but it
> > > would still "belong to us"? =20
>=20
> That's a soft concept of "belong to us". Other consumers can still use
> it and even also call clk_rate_exclusive_get(). IMHO it's a good idea to
> call clk_rate_exclusive_get() for each clock that a driver relies on not
> to change. You could make the driver more flexible and only call that
> when the rate is actually relied on, but that's again a compromise with
> complexity of the driver. And if the clock rate is fixed anyhow, it
> doesn't hurt to do it here, right?

Sure, just wanted to point that out. Indeed we don't need to boil the
ocean here.

> > > > +     if (ret)
> > > > +             return dev_err_probe(&pdev->dev, ret,
> > > > +                                  "Failed to get hosc exclusive ra=
te\n");
> > > > +
> > > > +     sun20i_chip->clk_apb =3D devm_clk_get_enabled(&pdev->dev, "ap=
b");
> > > > +     if (IS_ERR(sun20i_chip->clk_apb))
> > > > +             return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip-=
>clk_apb),
> > > > +                                  "Failed to get apb clock\n");
> > > > +
> > > > +     ret =3D devm_clk_rate_exclusive_get(&pdev->dev, sun20i_chip->=
clk_apb); =20
> > >
> > > Just for the records: APB is practically also a fixed clock, set up
> > > once in firmware and never changed, since it drives a lot of other
> > > peripherals.
> > > But same question as above, why do we lock its rate already here? =20
> >=20
> > That step was actually recommended by Uwe Kleine-K=C3=B6nig,
> > so the decision on whether to keep or drop exclusive reservation
> > is really a question for him=E2=80=94please coordinate with Uwe
> > to agree on how best to proceed here. =20
>=20
> Same as above. Iff the driver relies on the rate of this clock to keep
> constant, calling clk_rate_exclusive_get() is right.

It technically doesn't until a channel is actually programmed, but fair
enough, it doesn't matter anyway.

Cheers,
Andre

> > > > +     if (ret)
> > > > +             return dev_err_probe(&pdev->dev, ret,
> > > > +                                  "Failed to get apb exclusive rat=
e\n");
> > > > +
> > > > +     if (clk_get_rate(sun20i_chip->clk_apb) <=3D clk_get_rate(sun2=
0i_chip->clk_hosc))
> > > > +             dev_info(&pdev->dev, "APB clock must be greater than =
hosc clock"); =20
> > >
> > > Why this check? Does the code make any assumptions about this relatio=
n?
> > > If yes, we must surely deny this and bail out.
> > > If not (and I feel we should handle it this way), we can just ignore
> > > this and not print anything. =20
>=20
> ack.
>=20
> Best regards
> Uwe


