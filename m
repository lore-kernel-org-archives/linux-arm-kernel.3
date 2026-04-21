Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94369F8FA8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siAuCt6Us9I5pJzcDGndAG2tGrQGSNLseZSbi3R4KT4=; b=kh8xFO+dCo8TlbdFPVDwjjRJt8
	u2nnCVwcn6P/bkTtvm4ArTIRnVVcjBX4l9fXb2byV0W9NojlnZZd6KSOxc6EWuU83Oj2Mz6RRpIcb
	Bi2GQsWazTz6s7iW9952o9UeNFx5MmxbYaUWoryh1fPZXNip55PGsV97BekoezbCXzMYZB2VrCicw
	tDraHjZDlKbluneMZBuvU76i0WwFJvxi8uE366YaMWDgoy+Ng7nEuvgFBDvZ4gRjGUFeiZ5ppFyF3
	5TeOED1Q+AbAknuQ8K8zQBPNoFk/yzq/DbXbR3bKAI/PFLzPWVZnDu8IaTMIQHxfT9/2Xsn+O3YJJ
	iVU9rt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCRK-00000008ljA-2Pbf;
	Tue, 21 Apr 2026 14:51:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCRF-00000008lgJ-2j0k;
	Tue, 21 Apr 2026 14:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C85B440AC1;
	Tue, 21 Apr 2026 14:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6F4C2BCB0;
	Tue, 21 Apr 2026 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783056;
	bh=BMGi9M1H3wYbS7OQ26wY0topQ2jajr8jKH7yXASM19Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REONwhrEVyLesl8w0b0qOeoimehD0dZcP0Xpfs9qeznq6IEvnxVUVuLm578geZK+o
	 b6OhnXPRBNPheVrCO+nhWXNxqfBOamFtVYGLWexK1F33PJk605gAKVHJ+mbykUfbTN
	 hFx8RV2rGRDutNDgogFmAQ6irrpinpK+sC9hi9yUsvhrijOBNJzXcTFGLn8E+ddtKi
	 qcF3Tuqvm5OdvdA302x/9VA8fvYxEyu+TcPFNXKBBuS01ec8vm2USaK3zwfr2MCBY1
	 TBZbCHZOxixXWsVoqt2ECWEdk06mLsKM+l8CD5ETcbohxBTo3BThyBL9QqzUmSAdOC
	 Kl1GtW1BRFN7w==
Date: Tue, 21 Apr 2026 16:50:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aeeMp1XBDxSZ1qrl@monoceros>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
 <aeC6U7D6TfWm8JPx@apocalypse>
 <aeDmk-t5Lc1zpkg9@monoceros>
 <aeH373a_xmr6fnAy@apocalypse>
 <aeIGxfQ7AoIVR5n6@monoceros>
 <aeZUAaQkHGqBL8st@apocalypse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opxzx26y76daqdvu"
Content-Disposition: inline
In-Reply-To: <aeZUAaQkHGqBL8st@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_075057_763516_0CCCA711 
X-CRM114-Status: GOOD (  35.76  )
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


--opxzx26y76daqdvu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Mon, Apr 20, 2026 at 06:27:45PM +0200, Andrea della Porta wrote:
> On 12:50 Fri 17 Apr     , Uwe Kleine-K=F6nig wrote:
> > What happens if sync is asserted while a disabled channel didn't
> > complete the last period yet?
>=20
> The output stops immediately without waiting for the current period to fi=
nish.

This is a good info for the Limitations block.

> > Maybe it's worth to test the following procedure for updating duty and
> > period:
> >=20
> > 	disable channel
> > 	configure duty
> > 	configure period
> > 	enable
> > 	set update flag
> >=20
> > Assumint disable is delayed until the end of the currently running
> > period, the effect of this procedure might be that no glitch happens if
> > the update flag is asserted before the currently running period ends and
> > the anormality is reduced to a longer inactive state if the updates are
> > not that lucky (in contrast to more severe glitches).
>=20
> The disable isn't delayed as explained above. Setting just the new period=
/duty
> (which do not depend on the sync bit) correctly waits for the end of the =
current
> period without noticeable glitches (tested with a scope).

So if you happen to change both and one is done before the end of the
current period and the other shortly afterwards (which might happen as
those are configured in two different registers and the update trigger
isn't used), you get a mixed output for one cycle, right? If yes, please
also mention that in the Limitations paragraph.

> > > Let's say that teh user want 10 tick period, we have to use
> > > 9 instead to account for the extra tick at the end, so that the compl=
ete period
> > > contains that extra tick?
> >=20
> > I would describe that a bit differently, but in general: yes.
> >=20
> > The more straight forward description is that setting
> >=20
> > 	RP1_PWM_RANGE(pwm->hwpwm) :=3D x
> >=20
> > results in a period of x + 1 ticks.
>=20
> Exactly. So whatever the user request I have to subtract one from the val=
ue
> to be written to the RANGE register.

Unless the calculation is already rounded to 0, in that case don't
subtract 1 and let the tohw callback return 1.

> > > This also means that if we ask for 100% duty cycle, the output wavefo=
rm will
> > > have the high part of the signal lasting one tick less than expected.=
a I guess
> > > this is the accepted compromise.
> >=20
> > I assume you considered something like:
> >=20
> > 	RP1_PWM_RANGE(pwm->hwpwm) :=3D 17
> > 	RP1_PWM_DUTY(pwm->hwpwm) :=3D 18
> >=20
> > to get a 100% relative duty?
>=20
> Ah right! It's working fine and I've got 100% duty. So at hw register lev=
el
> the duty can be greater that the period.

In that case please make sure to not use the maximal value for
RP1_PWM_RANGE(pwm->hwpwm) to ensure that for each (possible) period
length a 100% relative duty cycle can be configured.

> > My (not so well articulated) point is: Please be stringent about clock
> > handling to not bank up technical dept more than necessary and such that
> > the driver can be made unbindable if and when syscons grow
> > that feature. Optionally wail at the syscon guys :-)
>=20
> Hmmm not sure I've understood your point: is it a requirement that the dr=
iver
> must be unbindable? In this case I should avoid registering the syscon. Or
> should I just provide a .remove callback in case there will be a way to
> unregister the syscon (even if this callback will not be called as of now=
)?

It's a requirement to properly manage the resources you allocate. If a
driver isn't unbindable due to restrictions of other subsystems that's
unfortunate and I don't like it, but I wouldn't block a patch because of
that.

Best regards
Uwe

--opxzx26y76daqdvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnnjssACgkQj4D7WH0S
/k6P2gf/WFdiNIbWu5z/n7i8vDSyytpmEL3VfoLW459jfMZEdsbKNezPkFGWf2HU
3GHi9Xvt48ND7zprcfUfpIMVYgllVxxoCLPk8tpIKssRaBqlWpij/+b6IX+MtiOC
m/S9JF9BfJLZlrXv3Dn1XXOCEBzBj71O0wUCZoLBIWSQKr3Yr49F1NbbXN0eo92o
G5FjXk6VVnSNO/qHh2m0RgQHfUae6iUxFa1y5jMv+c0M1e5LZnH55thCxWVjBGAh
ReYTrGU4npCzRKmgJq3TfJtX8x1vcQQhb/iQa0fRNwLFoQlFwfo7hmfnmGkPSoWf
7tUT4CPniRXmLRrA/0MxX5Un8dtfVQ==
=YncQ
-----END PGP SIGNATURE-----

--opxzx26y76daqdvu--

