Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C9DD735FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSBJ1/bWK3QTp/vHaELpNZ0W7lJSYrSIVr3oxkKdc+M=; b=z8NLtVcVsq1kBEk9sh9gnBa2AC
	8WFJJuokATl9zAAvlYrThbZ0DFeCevR6CKvhRu3x9K1jqJmWEP2Rp21GtNI9OjCbeeouvbMLwvPRe
	sG91fGe3VQcKC0vpXJgpvdAz2CnbwZN0nIWPlMIBtOQFKHGmRY0NNFh3b0AGeyzOFHC/pOmhAaISy
	kAxs3OiLy5kKiIp9Co2zjbkmq+bIuawpXhrygyQ4lJONoFqXMA7t0HrOT949Ys8lRurhxDUz1LJ/X
	0jDG/vDM2dt5tqld64Qwa2g3sDRTj8ulXvvolRInkSIRbLQwdKmfDuetAxdksCSnzgrYz9L/d2IXa
	zRtgyQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKow-00000001tjJ-0weH;
	Sat, 30 Nov 2024 10:35:26 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKnu-00000001tQr-2zSq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 10:34:25 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 904981F0004F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 10:34:13 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4C868A48CA2; Sat, 30 Nov 2024 10:34:12 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 71B76A48C9A;
	Sat, 30 Nov 2024 10:34:10 +0000 (UTC)
Date: Sat, 30 Nov 2024 11:34:08 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <Z0rqILFESdje9qUn@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
 <20241120-wild-stimulating-prawn-ffefb7@houat>
 <Zz20dquzl5_2_3TQ@collins>
 <20241129-amazing-whale-of-proficiency-ee6fd2@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnBcvG6sakiQSko5"
Content-Disposition: inline
In-Reply-To: <20241129-amazing-whale-of-proficiency-ee6fd2@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_023423_059349_CA7F7CB4 
X-CRM114-Status: GOOD (  45.24  )
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


--RnBcvG6sakiQSko5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Le Fri 29 Nov 24, 16:37, Maxime Ripard a =C3=A9crit :
> On Wed, Nov 20, 2024 at 11:05:42AM +0100, Paul Kocialkowski wrote:
> > Le Wed 20 Nov 24, 09:01, Maxime Ripard a =C3=A9crit :
> > > > > If anything, the status quo doesn't impose anything, it just roll=
s with
> > > > > the hardware default. Yours would impose one though.
> > > >=20
> > > > The result is that it puts a strong limitation and breaks many use =
cases by
> > > > default. I don't think we have to accept whatever register default =
was chosen
> > > > by hardware engineers as the most sensible default choice and prete=
nd that this
> > > > is not a policy decision.
> > >=20
> > > You're making it much worse than it is. It doesn't "break many use
> > > cases" it broke one, by default, with a supported way to unbreak it, =
in
> > > 12 years.
> >=20
> > I think this is exaggerated. Like I mentioned previously there are *man=
y*
> > situations that are not covered by the default.
>=20
> Note that this statement would be true for any default. The current, the
> one you suggest, or any other really. The fact that we have a way to
> override it is an acknowledgement that it's not a one size fits all
> situation.

Again the debate is about which option has the best advantages over
disadvantages. I'm not saying the default I suggest has no issues, but
rather that the benefits very clearly outweight the issues. Hence the many
situations that would be supported with the shortest debouncing period (both
short and frequent interrupts) versus the few broken-hardware use-cases
(related to interrupt storms) support with the largest period.

> > The fact that I'm the first person to bring it up in 12 years doesn't
> > change that.
>=20
> Sure. It does however hint that it seems like it's a sane enough
> default.

Or maybe people didn't realize this mechanism existed, failed to understand
why their device didn't work with Allwinner platforms and just moved on to
use something else. Indeed it's all very subjective interpretation.

> > Sofar the downside you brought up boils down to: badly-designed
> > hardware may have relied on this mechanism to avoid interrupt storms
> > that could prevent the system from booting.
>=20
> It's not about good or bad design. Buttons bounce, HPD signals bounce,
> it's just the world we live in.

Well I'm an electrical engineer and the first thing we were told about
buttons and connectors is to include hardware debouncing. The second thing
is that it can be done in software (which again is done in a number of driv=
ers)
by just disabling the interrupt for a while if it happens too often.

So I'm quite affirmative that taking none of these into account is constitu=
tive
of a broken hardware design. No electrical engineer is told that they shoul=
dn't
care about this because the SoC will filter interrupts for them.

Of course it's fine to use this mechanism when it exists, but it's not a
reasonable expectation to just assume it will always be there. This is why
I think it's not a legitimate reason to make it a default.

> But let me rephrase if my main objection wasn't clear enough: you want
> to introduce an ABI breaking change. With the possibility of breaking
> devices that have worked fine so far. That's not ok.

I believe it is highly questionable that this constitutes ABI breakage.
To me there was no defined behavior in the first place, since the debouncing
configuration is inherited either from the reset value or the boot stage.
There is also no formal indication of what the default is, anywhere.

Changing the default configuration of hardware is commonplace. One might
for example introduce a reset to a driver to get a clean state because it
happened that some boot software would mess it up and it went unnoticed for
a while. Would you also call that ABI breakage?

I think there's a number of situations where it's much more sensible to cha=
nge
a default state to avoid very visible and practical issues. And it does hap=
pen.

Also my understanding of the "ABI breakage" rule in the kernel is that no
userspace program should stop working when it was implemented to (correctly)
follow some kernel-related ABI. It doesn't mean that we cannot change any
default state, or that everything the kernel does should remain exactly the
same ad vitam.

Sometimes it just makes a lot more sense to have these fine adjustments.

And honestly I would be extremely surprised that this specific change resul=
ted
in any actual system breakage, as we can be hopeful that electrical enginee=
rs
did their jobs correctly.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--RnBcvG6sakiQSko5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmdK6iAACgkQhP3B6o/u
lQwY+A/+Mx6lAA29BKNESENc/7aLP1mUgozB0ZAEC61WoFp3E5lgJlLXRZ6BskT6
rMLusd9qkkVUgfpa7traa32fZDrt6QL34VEbgV19bAQIhNkr+XScVSyhTrEd0kQG
tqf1ODSXBXfZCnqXKHaKuKnuFygsdmsHynTRUyflzKqYykio+gR2ntduhbQvmWSy
8CASUfSXxO/n5VkzOM28S67qjqHV/9JunCB6r80RkX/4hzkknaitTqy9qG4Hz5Qw
B+oiWIBmxaxsAfOd8Lf6YVf+VmC7lrh2IcL6/KNP+MiV8J9htXhstEHLnPEVYRU3
pFG8aZrOhB1NCIOUCZ9yl/kpcwbbGLqF6+pctXKYswvu3GttuGACYTAZHu+a+qqE
pF+gV9hG3P1rGENDpPQ//Iah5voiOvTJ2BsPuCcJPhYXX0SpisytclKAKzDDm/Hq
fZKkgJ9wixVsLvWmmVTMXq64OSd+R6wW4q5qVmjtn2DnXOMDyEj95lkF7vciK5Zl
sy4U960Rd/tuQkKUowsVQQifBYEuw4vMi5lFEGfp0Uy82dSYGMh6p1VCPsSCGakL
Cf6zb6Qb2r/863yairjGeunDwBVwF+HtuVo1P+kqpY42p2YIM1JECgrBzIkoesVv
T5XafEnKFegBGGQ8QRaSLsanf1ALjbrrQwEpeyJOAXPghByRrXA=
=Uc2g
-----END PGP SIGNATURE-----

--RnBcvG6sakiQSko5--

