Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5231BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKkj1KgPAuS6TgthyvJvXvNrwXhqUKHnSRuaqBRbsLY=; b=38hWf5wgGcp+sw+cCr3B/1TSuH
	DD6RKxZBKcveqi2pvQtv6fxgzmNZOwrRMX9Lmym9TILRTvlQiBoCOBMknt4UGH/4w7hwA0wulQ5S1
	AERNBlizl49WfNxE8JJL4LYrGLmFucbVzPnajeyTJq2saMw3Wx9zegRlOjzeS1WerFQCRuqTCKZsX
	zLxMR3xsV+9HeKDJKdmDh2RHiqYorDPvdIFmzYkIT5/a8XXUM0/mBj/84ILkNmt66XYZmhYJ7VFES
	1PJjygWqbhOGVk0XoVdMYDnKySMB2zHmBAz7ev7z8iz13+RmiLTnav/dyiNokf93GCpQzDN40RT5h
	nZQHRYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8JW-00000004gMJ-3dvG;
	Tue, 07 Jan 2025 12:04:02 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV89w-00000004eDf-277A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:54:13 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 727D61F0004D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jan 2025 11:54:01 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0FFAAAA1106; Tue,  7 Jan 2025 11:53:59 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6670CAA10EA;
	Tue,  7 Jan 2025 11:53:58 +0000 (UTC)
Date: Tue, 7 Jan 2025 12:53:56 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <Z30V1KzhqY2drhmm@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <CACRpkdbqufNVq4Ai6GQpgK2OY0rxLnp1wLQNmRoCv44T0xmFkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xRZh+3L9eSSC0byD"
Content-Disposition: inline
In-Reply-To: <CACRpkdbqufNVq4Ai6GQpgK2OY0rxLnp1wLQNmRoCv44T0xmFkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035408_859366_2FDA1D57 
X-CRM114-Status: GOOD (  49.04  )
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


--xRZh+3L9eSSC0byD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Le Tue 17 Dec 24, 14:39, Linus Walleij a =C3=A9crit :
> Some discussion here, and some emotions involved.
>=20
> I can't seem to follow the technical matter because of all the
> social matters :/

Thanks for looking into this. It's a bit of a heated discussion but nothing
personal, really. The context is that Maxime and I often disagree on what
constitutes ABI breakage or not. To be fair he has already proven me wrong
in the past and I'm still learning.

The debate here is about what the default behavior should be.

> On Tue, Nov 19, 2024 at 4:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> > My use-case here was hooking up a sparkfun sensor board by the way,
> > not some very advanced corner-case.
>=20
> Are you adding this as a DT overlay or by modifying an existing device
> tree?

The answer would be an overlay. There's no device that I know of that has t=
his
sensor built-in.

> Does this sensor have an established device tree binding?

It is underway. You can find it at:
https://patchwork.kernel.org/project/linux-iio/patch/20241130174212.3298371=
-1-paulk@sys-base.io/

Nothing really stands out and the short interrupt time is mentionned there.

> Are you using that sparkfun sensor by a kernel driver or from userspace
> using the GPIO character device?

With a dedicated IIO driver currently under review.

> I noticed that the sunxi GPIO driver is implementing the
> .set_config() callback calling gpiochip_generic_config,
> which makes it call down to the pin control driver to set up
> the pin config.
>=20
> which would in turn make it eligible to use
> the gpiod_set_debounce() callback to push down the debounce
> period.
>=20
> But pinctrl-sunxi.c's sunxi_pconf_set() does *NOT* implement
> support for setting up the debounce, because it is (as I understand
> it) not part of the pin config hardware, but part of the interrupt
> generator hardware, correct?

Yes I believe this is correct. Debouncing is said (according to scarce
documentation) to be tied to the interrupt part, not GPIO in general.

> In that case I think we the gpiochip .set_config() callback should
> be modified something like this (pseudo code):
>=20
> sunxi_pinctrl_gpio_set_config()
> {
>     if (irq_is_in_use && param_is_debounce) {
>         modify_irq_debounce_according_to_param()
>         return 0;
>     }
>     gpiochip_generic_config()
> }
>=20
> pctl->chip->set_config =3D sunxi_pinctrl_gpio_set_config()

I didn't even know the gpio API supported this, thanks!
Then it would make sense for the driver to specify this.

> Maybe the debounce can also be set even if the line is not used
> for IRQ? I'm not sure.

My guess would be that it can't.

> In either case the latter would give the GPIO driver a handle
> on the debounce, which is good because the irqchip
> generally does not.
>=20
> There is a way it is possible to use the interrupt with desired debounce
> setting by first getting the GPIO descriptor and modify the debounce
> setting and then getting the interrupt from the GPIO descriptor:

However I see the debounce time is specified in microseconds, which is long=
er
that the minimum achievable and probably too close to the limit for the sen=
sor
board, that generates the interrupt for 1 us only.

Is it specified that a value of 0 to gpiod_set_debounce would select the
lowest debouncing time?

> struct gpio_desc *g;
> int irq;
>=20
> g =3D gpiod_get(dev, "dataready", GPIOD_IN);
> gpiod_set_debounce(g, 1);
> irq =3D gpiod_to_irq(g);
> ...request irq...
>=20
> Here I assume the line out from the sensor is named "dataready"
> the actual component likely has a name like that for the line.
>=20
> This requires changes in the device tree as well, so that a GPIO
> line is assigned to the sensor instead of "just" an interrupt:
>=20
> sensor {
>   dataready-gpios =3D <&gpio 14>;
>   ...
> };
>=20
> instead of:
>=20
> sensor {
>   interrupt-parent =3D <&gpio>;
>   interrupts =3D <14 IRQ_TYPE_EDGE_RISING>;
> };
>=20
> Unfortunately this is one of the areas where DT bindings are
> a bit ambiguous. Some just assign the GPIO line as an interrupt
> as both APIs are available, sometimes a proper GPIO line is
> preferred for the above reasons.

I can see how that would be confusing indeed. And the same change would be
required for pretty much any driver that could have the same problem.
I'm not sure this is desirable.

Would there be a way to do the opposite and grab the gpio handle from the
irq line, as to leave the dt binding unchanged?

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--xRZh+3L9eSSC0byD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmd9FdQACgkQhP3B6o/u
lQwcQg/+Ndmwb8VrccY6tawNQpK5eGLmJmz1NgNtHOo4qcVATn/0LmykSL/URVDT
fuGWhuw3kUW63a4GM10bENrBK4aNGYQXr9wSAvAael9BKN8C2M0WFrA+ReJF/MsC
YQ+99dsrxro0ll+pvznyF3LnknuZvETSsf71VAd0/58Lurf5rm4bPHWfCGnOrbA2
hkhD+amOJ3oQFOePPfbPeaXYXY5HtWXWAXXIeDxiEuDTi0WROqhkNiDJBStxxvfP
libWE/sZ/kApI4UFaDMB/4o5/F6keLBSnfmWaxZjWvjNVPXhiR85RNNV7miScjed
ag8qRoJs2EZDXqzOdmkgaC6CfD8KWmNtEf8G4ApZLHlICiT9Xgto3VQxCTKQzGLG
g9lv8l5T1E3GG9+dTS6b0vLX+u9a9f+YUZJKXShbSbV02Svpka5NhUf16lhZgDVk
VRyWB6xHYU487ax1Xqvyz4gyjFcaBBylJd0HNMKiTg8ONJKG67zRkEZjSkTsY18+
E3VsqcfhaWeQZ7Q1RUqDHf/n0M5iiG3l7Pyuf42CIlHKRiKL6LA4hc/iSToJMgda
RTTr0p43M98uGlmJr5inA/1jgisGFATiKMAo9ScW59CwwS9lSE1QpLXphNzkRQvb
AwydKynKkgc16BB6YOhTsTcH/3/HWb6380JF+rXfeC0r0W1UiXM=
=/RiD
-----END PGP SIGNATURE-----

--xRZh+3L9eSSC0byD--

