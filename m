Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32C2D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYHJp3lV0KtpKPkeolpZ0pHqVkP/s8uSZ/khZ42PQ5g=; b=EO+gtd3ajl+MQw9aSI2I2C8s2g
	i2gIMMpOspmIBM0nI2VkX9ONCkr2dDKYetqLaLtFoC6IFPugsahYMrmPvKeTTMAhHWQSqi23+pTez
	BfFMMrmWuVe40pTDHWCpXXeFsEvlWoUYfQT0RhvNA/kwvI56uwHwRARBjGzaImWtj0eFzmQwajQjb
	jA7awA8l4voW65ak6xtbOR0q7ZDuj7DAenzi6Y4FhiJ8Rtrq5VEzNemI50GSaZdZnJSWiY+F0cBzH
	RQVgCvuBnxyoNneHUS0b57SJbhzqY4cuk7OKhvG+p0Q7CAZ5oX1OOEQZ8n1gdL93V7VJf5QU5O+0Y
	YpvmI7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eqF-000000037El-3NlH;
	Wed, 06 Nov 2024 12:08:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dv2-00000002sb2-0ijv;
	Wed, 06 Nov 2024 11:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 295FAA435E6;
	Wed,  6 Nov 2024 11:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AC2C4CECD;
	Wed,  6 Nov 2024 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730891386;
	bh=IzLPv/DEFXlj5cNSZvHDLkVkwT3mFl5/VFrMn/bL8oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPS9dy71VX/WNblUBBvKE0IJ2I7Hi6mKUf8ltHGt7NLvUkMo+X7xMhPmgrMPAp1sE
	 oI5QQRZMBqWELl6ukQMN3/fjhEldNzdesRANfr+l2OCD7TWAnRj813CKLlluVcmq/O
	 czhI+p1xspLM9rCarM4UvPq6C78z1r9dAh6hEcKsa0aCoP1O0afIx4A6zF00YGFZb9
	 zTd5NEQh8bQTDC7fQ5BR0QBIFDgdVla/zEDC/mhqaCr1OUCna+eUKHaFQOcL//OsWG
	 5CxeZQNKDaXvPwC5aF+AlZDp+kQqp43IK5Zsh9UEQGmCR4agO+5T6UxDSzOhuCfAHo
	 dW8Xg4uKc95Qg==
Date: Wed, 6 Nov 2024 12:09:44 +0100
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
Message-ID: <ZytOeOkeF9xW2DOV@lore-desk>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org>
 <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk>
 <20241106110046.GR1807686@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9VjFJ6tz3D5wTAI6"
Content-Disposition: inline
In-Reply-To: <20241106110046.GR1807686@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_030948_297017_D65E2DC8 
X-CRM114-Status: GOOD (  15.62  )
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


--9VjFJ6tz3D5wTAI6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 06, Lee Jones wrote:
> On Wed, 06 Nov 2024, Lorenzo Bianconi wrote:
>=20
> > On Nov 06, Lee Jones wrote:
> > > On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > > > Add support for Airoha EN7581 GPIO System Controller which provide a
> > > > register map for controlling the GPIO, pinctrl and PWM of the SoC v=
ia
> > > > dedicated pinctrl and pwm child nodes.
> > > >=20
> > > >=20
> > >=20
> > > Applied, thanks!
> > >=20
> > > [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Con=
troller
> > >       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
> > >=20
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > >=20
> >=20
> > Hi Lee,
> >=20
> > according to my understanding this patch has been already applied by Li=
nus
> > here:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/commit/?h=3Ddevel&id=3D50dedb1eb1e6755ccab55f6140916c2d192be765
>=20
> An interesting choice.  Linus?

I guess Linus applied all binding patches to his tree since there is a
dependency between airoha,en7581-pwm.yaml/airoha,en7581-pinctrl.yaml
and airoha,en7581-gpio-sysctl.yaml.

Regards,
Lorenzo

>=20
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--9VjFJ6tz3D5wTAI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZytOeAAKCRA6cBh0uS2t
rAJKAQCziZ9I7pDgrsy7c4G4zSAJV33x5GtUnxzl90JJfuiDVwD+N3L3x58QswNA
Q6MdWbHpRsM5P2NQLRkMsNnq30wJNwE=
=IWqp
-----END PGP SIGNATURE-----

--9VjFJ6tz3D5wTAI6--

