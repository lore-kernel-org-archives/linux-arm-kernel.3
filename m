Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9AACFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdiTuAPMsdSklIdlRlLQFxKoYVhC4YIkUoorfpWkpSo=; b=4SWbEmgA2+FGVMrJ5uX1W5n+VL
	rIVWwaw+akwr2sDfRYcp6P5kVVTaijZyIl3CESLSyJp/BqVOpZP18UXGd/MIZ1SbLvj9bUnfBflrU
	n04hEwZ961mnJc0uCk9w2+8sXT4azJPwaXZgTO4vYZ1VcyjyNGXjashKeK+8Z524CFapuj6sErPc6
	3RaEwfL4GptjlXq36H5f4d+Nxlk417WLsrWNSC/ZCLcBQ8ILvw0/7aqCr+UZktzSjhZjsMEU4oYtS
	uv2VZLReCWEqW4lv/EAC7hjYcbxVhcDJ3QXcb0/TmjHmj3LwCtNn1qWUmk3LTVQDH8KdchsBF3tHq
	elnNdGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa8W-0000000C5U9-016V;
	Mon, 24 Nov 2025 17:14:00 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa8U-0000000C5TU-0UKN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:13:59 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 06C0D1C00AB; Mon, 24 Nov 2025 18:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764004434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LdiTuAPMsdSklIdlRlLQFxKoYVhC4YIkUoorfpWkpSo=;
	b=QlDRCX7OPONlUDTkKv1GHVunDHwbB4oIxye2FqDf9keAfama0I9Rxo6S/fLMbmvmRcA+ih
	rzdQtu27R/MYcLvHla1y0G2l71UK/8N4sYMwRJjgODoBfeYxMJESlr8qJZsIBgbo6bRb/g
	rYG7zFWj44Y0OBaUyaqWmqDdQM+2K9g=
Date: Mon, 24 Nov 2025 18:13:53 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alexandre Messier <alex@me.ssier.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
Message-ID: <aSSSUahMBR8Wujni@duo.ucw.cz>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
 <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
 <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xMMfKyXYP5va5Mht"
Content-Disposition: inline
In-Reply-To: <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_091358_449925_53FE3E37 
X-CRM114-Status: GOOD (  26.76  )
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


--xMMfKyXYP5va5Mht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> Do they form a single notification led, or are they supposed
> >>> to act separately?
> >>
> >> Good point, I had to check the phone user manual to confirm. Indeed, i=
t is
> >> referred to as a one logical notification LED. It also mentions the co=
lor can
> >> be either green or orange, it does not mention using the combined colo=
r of
> >> the two LEDs.
> >>
> >> So I would say they are supposed to act separately.
> >>
> >> Hope this answers your question, and let me know if more details are n=
eeded.
> >>
> >> BTW: I will be sending a V2 to update the color name, since the user
> >> manual says the color is orange, not amber.
> >=20
> > Let's describe it as a single LED then:
> >=20
> > multi-led {
> >         color =3D <LED_COLOR_ID_MULTI>; // notice it's not RGB
> >         function =3D LED_FUNCTION_STATUS;
> >=20
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >=20
> >         led@6 {
> >                 reg =3D <6>;
> >                 color =3D <LED_COLOR_ID_GREEN>;
> >         };
> >=20
> >         led@7 {
> >                 reg =3D <7>;
> >                 color =3D <LED_COLOR_ID_ORANGE>;
> >         };
> > };
>=20
> Using multi-led is fine for me.
>=20
> But currently, the "qcom-lpg" driver doesn't support LED_COLOR_ID_MULTI, =
only
> LED_COLOR_ID_RGB. Adding support for LED_COLOR_ID_MULTI is trivial, I tes=
ted it
> and it works.
>=20
> Or I can also use the "leds-group-multicolor" driver, using the two indiv=
idual
> LEDs. I also tested this method and it works.
>=20
> >=20
> > + Pavel the LED maintainer, please take a look if you think it makes se=
nse
>=20
> If Pavel agrees using multi-led makes sense, I think the first option is =
the
> best. I will separate the LED patch into a new series, along with the cha=
nge to
> the qcom-lpg driver to support LED_COLOR_ID_MULTI.

I see nothing horribly wrong here (and am late to the party). ID_MULTI
leds are pretty uncommon for phones, but if that's what you have...

Anyway:

LED SUBSYSTEM
M:      Lee Jones <lee@kernel.org>
M:      Pavel Machek <pavel@kernel.org>
L:      linux-leds@vger.kernel.org

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--xMMfKyXYP5va5Mht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSSSUQAKCRAw5/Bqldv6
8jXhAJ9zJDH/Tv6cujn6IBoZoYOIrHdbWgCgvp78nRFqKpGFXPhA0d+xLRexqqw=
=iMor
-----END PGP SIGNATURE-----

--xMMfKyXYP5va5Mht--

