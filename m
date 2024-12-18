Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C0E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhE2GQqCThYSVCtHjEfaLmq53fHJIzPDCO0BWsoFlyo=; b=iwyWeW9RlbcUXDgdtsejQ1dcab
	Q3aT+IbNg6uj5k5NlfQdvEg7aIefqonlHdeoNxDQBXpM34UNgaD01qewSsP0GaePuAkamaKnVO/0t
	oEUg2gCYr8LvF2vCTzFtwosrr1rNnizOHQ5u0wVw113UEbaELIHwVlD4PoAgYTYJPo1BBMitKtO75
	itplGNmm2rP396w1pXO0WBFirOxmDvW5vqssAH+xaazqIStTxa/cWGkNNv3R6qw9WkDxncf9y4cg6
	03vwK3v02x/4bNUXK2gFSvQyAkJDxkyYJTLR03ECNQBWjLiDbF/TorM2Ql7J6uoOQQGUL2jZ37yHp
	MI+0SZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwel-0000000H8yS-20aa;
	Wed, 18 Dec 2024 16:12:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwdb-0000000H8tJ-17qu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89C145C5C1B;
	Wed, 18 Dec 2024 16:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8487AC4CECD;
	Wed, 18 Dec 2024 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734538262;
	bh=1Gk0KV03HG2uxujhvGDXC3rHVzPAgouln8SZSXFcWeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyDdt3LdLlL6HwReTDDCbzvkwB59dO36Xmf0oyvxWZoPl+4LqKhzt4OKatwZ8cJVB
	 JEP7YFqo5LZmeGTo/q67ZG3U4IAQJVSA339J3CR+nePcsgdspHpfSjsfoX8qKnzaWj
	 JhOt1VF6RKvuHJCl4X4fMMwa/G5Y2knNgxfBU/GKvrm7lyem8MaNEedXpIWM/rTqqj
	 wlUEp6fdXoO33bxj2kB1BnemJHFMzERLeWthRRrwijNoL86nfbT6olhpGkC8pGajaX
	 H8nTStu/hFBWqwLPYFfHrROUlPS6r9jsF2r8tcPhKYZ7Qx0Q/JcUq/Nab3cqREmW4J
	 +CY5eBp4+qz2Q==
Date: Wed, 18 Dec 2024 16:10:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Poojaa Rangaiah <poojaamonica94@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dtoverlays: Added DT overlay file for MAX98090 and the
 detailed steps for its usage is included in
 https://github.com/Poojaa-Rangaiah/DeviceTreeOverlay-for-MAX98090 .
Message-ID: <20241218-widen-ladies-8539476e3b80@spud>
References: <20241218065848.12254-1-poojaamonica94@gmail.com>
 <20241218-arrange-pointer-cdd39770b48b@spud>
 <CAOnmTr91ufdFAci2OR0ZnQbtrw94DzN+uEnkgoB6kiXFK+b4bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kF7nJA3fJHxMxL+t"
Content-Disposition: inline
In-Reply-To: <CAOnmTr91ufdFAci2OR0ZnQbtrw94DzN+uEnkgoB6kiXFK+b4bA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_081103_397760_D31CCFEC 
X-CRM114-Status: GOOD (  30.54  )
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


--kF7nJA3fJHxMxL+t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 09:25:13PM +0530, Poojaa Rangaiah wrote:
>=20
> On Wed, Dec 18, 2024, 7:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>=20
> > On Wed, Dec 18, 2024 at 12:28:48PM +0530, Poojaa R wrote:
> > > Only the driver files were existing for max98090 audio codec (playback
> > and capture) but now the max98090.dts file is also included in
> > linux/arch/arm/boot/dts/overlays/.
> > > new file:   arch/arm/boot/dts/overlays/max98090.dts
> > >
> > > Signed-off-by: Poojaa R <poojaamonica94@gmail.com>
> >
> > Why have you send this patch for your random github tree to lkml?

> Sorry for that, I wanted it to be just mentioned in commits so people who
> don't have an idea can refer to it. But I didn't expect that to be
> mentioned in the subject.

Right, so it is not a random patch but one you want included in
mainline? Given this is something only usable on the RPi, you should
move this file to the broadcom directory and CC the relevant
maintainers.

Additionally, the correct filetype for overlays is .dtso nor should
there be dtso files in the kernel tree that are never built.

Cheers,
Conor.

> >
> > Thanks,
> > Conor.
> >
> > > ---
> > >  arch/arm/boot/dts/overlays/max98090.dts | 96 +++++++++++++++++++++++=
++
> > >  1 file changed, 96 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/overlays/max98090.dts
> > >
> > > diff --git a/arch/arm/boot/dts/overlays/max98090.dts
> > b/arch/arm/boot/dts/overlays/max98090.dts
> > > new file mode 100644
> > > index 000000000000..eaf197384edb
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/overlays/max98090.dts
> > > @@ -0,0 +1,96 @@
> > > +/*
> > > + * Device Tree Overlay for MAX98090, MAX98091 Audio Codec.
> > > + * https://github.com/Poojaa-Rangaiah/DeviceTreeOverlay-for-MAX98090
> > =3D> for more details.
> > > + * MAX98090 audio codec as master and Raspberry Pi as slave.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +/ {
> > > +    compatible =3D "brcm,bcm2835", "brcm,bcm2711";
> > > +
> > > +    fragment@0 {
> > > +        target =3D <&i2s_clk_consumer>;
> > > +        __overlay__ {
> > > +            status =3D "okay";
> > > +        };
> > > +    };
> > > +
> > > +    fragment@1 {
> > > +        target =3D <&i2c1>;
> > > +        __overlay__ {
> > > +            #address-cells =3D <1>;
> > > +            #size-cells =3D <0>;
> > > +            status =3D "okay";
> > > +            max98090_codec: max98090@10 {
> > > +                #sound-dai-cells =3D <0>;
> > > +                compatible =3D "maxim,max98090","maxim,max98091";
> > > +                reg =3D <0x10>;
> > > +                interrupt-parent =3D <&gpio>;
> > > +                interrupts =3D <27 2>; /* GPIO 27 as Edge_Falling_IR=
Q (2)
> > */
> > > +                maxim,micbias =3D <3>;
> > > +                status =3D "okay";
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +    fragment@2 {
> > > +        target-path =3D "/";
> > > +        __overlay__ {
> > > +            clk_oscillator: oscillator {
> > > +                compatible =3D "fixed-clock";
> > > +                #clock-cells =3D <0>;
> > > +                clock-frequency =3D <12288000>;  /* Frequency of the
> > external oscillator (mclk =3D 12.288 MHz) but can also be 11.2896 MHz/12
> > MHz/13 MHz/26 MHz/19.2 MHz. */
> > > +                clock-output-names =3D "mclk";
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +    fragment@3 {
> > > +        target =3D <&sound>;
> > > +        sound_overlay: __overlay__ {
> > > +            compatible =3D "simple-audio-card";
> > > +            simple-audio-card,format =3D "i2s";
> > > +            simple-audio-card,name =3D "MAX98090-Codec";
> > > +            simple-audio-card,bitclock-master =3D <&dailink0_master>;
> > > +            simple-audio-card,frame-master =3D <&dailink0_master>;
> > > +
> > > +            simple-audio-card,widgets =3D
> > > +                "Microphone", "Mic Jack",
> > > +                "Speaker", "Speaker",
> > > +                "Line", "Line In",
> > > +                "Line", "Line Out",
> > > +                "Headphone", "Headphone Jack";
> > > +
> > > +            simple-audio-card,routing =3D
> > > +                "Headphone Jack", "HPL",
> > > +                "Headphone Jack", "HPR",
> > > +                "Line Out", "RCVL",
> > > +                "Line Out", "RCVR",
> > > +                /* Uncomment any of these below lines if the Line
> > Input(s) is(are) used else leave it as such. */
> > > +                //"IN5", "Line In",  /* IN1/IN2/IN3/IN4/IN6 (For sin=
gle
> > ended input) */
> > > +                //"IN56", "Line In", /* IN34 (For differential input=
s)
> > */
> > > +                "MIC1", "Mic Jack",
> > > +                "MIC2", "Mic Jack",
> > > +                "Speaker", "SPKL",
> > > +                "Speaker", "SPKR";
> > > +
> > > +            status =3D "okay";
> > > +
> > > +            simple-audio-card,cpu {
> > > +                sound-dai =3D <&i2s_clk_consumer>;
> > > +            };
> > > +
> > > +            dailink0_master: simple-audio-card,codec {
> > > +                sound-dai =3D <&max98090_codec>;
> > > +                clocks =3D <&clk_oscillator>;
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +    __overrides__ {
> > > +        card-name =3D <&sound_overlay>, "simple-audio-card,name";
> > > +    };
> > > +};
> > > +
> > > --
> > > 2.34.1
> > >
> > >
> >

--kF7nJA3fJHxMxL+t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L0EwAKCRB4tDGHoIJi
0kzbAP9NQ7Zxwm3/TRZ9eJC8KQh9P4w5QbW4D1siOYZGtoB+ZgEA0WOJLXLQbxef
eMN8fHJnGZK2wJLjsoDxIa738iunbAc=
=W6ua
-----END PGP SIGNATURE-----

--kF7nJA3fJHxMxL+t--

