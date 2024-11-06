Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D98AD29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkhw6g1KK7BhlEfRbLHVB3yvp0u3/5J+dkSWx53kN2w=; b=0V5cQ1Rkl0S7qwMhKm5snTHXe8
	ebAdX/AGQrWYJnxfwaxc9BvF0XvBvJEKOu1yvxClV+nq8JRaaOCSG9+nMn+LLhETPTfaavYb3r/Az
	RriNtWtR5DC4FecOmNBR1i2lFwjeOurait0FnZinINKVTmT3wFfJC2QEcu8m1BHp2zIFIEakmMycF
	bBgI0rjZbLXNsZoJz/POqGdlrpfstPRnhHcojX7Eo6/H4T0Z4NXgnTsnhve9AxEDzVgjAUaYmV986
	CQLvR8MYC2YvbwUzRBkSir7d7JQ/tRsu+6VCus/CGmaZK2elafm/bW8hlDQxuaquBObB/XLqtOLhB
	/jCDHMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bf3-00000002LHw-1XJN;
	Wed, 06 Nov 2024 08:45:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bdK-00000002Ktg-2Bwp;
	Wed, 06 Nov 2024 08:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8A51A41FF5;
	Wed,  6 Nov 2024 08:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED581C4CECD;
	Wed,  6 Nov 2024 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730882601;
	bh=w49LxhkG70KI0gN8j5DWZTrcBdUddq9fKfZsQP4gzwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRAecVAd+Flufp11ATsduPALAzLfhE0vyh0tPWoZSNODge6Bf9LOEx341C/TvSAMy
	 t17nWcjztEyKHgN9Gy4kG+/FEMqQPHMYqml0GSPUpps0qfohsdB8yeCO0Q6dIvzQAn
	 afjWi/fP7ggEq5QpRRBBVbpG1tKd8Ge7u+nIJ5Ii30gmdyuYsvg+qJTQUVqN7vD6zc
	 MiT2prpxIH3JI91PRlgys73btYLX7KU/CVRYmyZX9y81BtCQKVbyIMSYcdotiv62lf
	 wMeKgr7MTAU72r5gUUy+07Btq52PNJoh3OvU7WTMuxEcnwrVK9/9TetIW9kgqMtXhS
	 6Kxq29TQ+6ovA==
Date: Wed, 6 Nov 2024 09:43:18 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
Message-ID: <ZyssJpR7xwbMzUsm@lore-desk>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org>
 <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wx+Mvx1qg95x0q+u"
Content-Disposition: inline
In-Reply-To: <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_004322_645742_5B1D7D93 
X-CRM114-Status: GOOD (  12.71  )
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


--Wx+Mvx1qg95x0q+u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 06, Lee Jones wrote:
> On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > Add support for Airoha EN7581 GPIO System Controller which provide a
> > register map for controlling the GPIO, pinctrl and PWM of the SoC via
> > dedicated pinctrl and pwm child nodes.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Control=
ler
>       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
>=20
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>=20

Hi Lee,

according to my understanding this patch has been already applied by Linus
here:

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/co=
mmit/?h=3Ddevel&id=3D50dedb1eb1e6755ccab55f6140916c2d192be765

Regards,
Lorenzo

--Wx+Mvx1qg95x0q+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyssJgAKCRA6cBh0uS2t
rBX2AP432eJMkZH/0I6xMefXrLL+NeoxIDMS0/hQjMIv70LhngD/VPpbBXZM0k6S
cxO57ypvUMPKaDRXdqx6g7gGZKJ6KAU=
=+WZo
-----END PGP SIGNATURE-----

--Wx+Mvx1qg95x0q+u--

