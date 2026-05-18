Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FCCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1HplpjPfZZKHeTWIfZorZgld9o4ERT5L3P6NfLt3+g=; b=qrLwMG4IUSxvHFihY7zY1W601B
	jVabMgorqlqOODk5e4A0NZochviyk2FsmYeh6QECNKK33UsSoKhl/LAesSTVwLj1aKE5eAdmyIqws
	BgkeJzscAf4N/pI+WNCjilxNeiAE6AKyJgcCNH3rG41FUY1JZ3Lm+KDh7++ReCGVDDnhAtPzzEN1w
	ksYoI+qCEYWjnt9sUfzKzKq/qw0yBAoHtYdGb+x4Yu04h9gAxCZJGiEh58qNG4M5Lytw7MQES9TGt
	0r3rKutP9xixDeHD+OjagI5A5duVZ1O0RKHzv/wer6JJgy/W/CmLTG8OLvAYSsANi8QxpH6sVaWxi
	iGZ4q2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwGn-0000000FSWA-3851;
	Mon, 18 May 2026 11:36:25 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwGj-0000000FSUy-3p4b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:36:23 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 70DCF1F8004D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 11:36:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 85BBEB407F3; Mon, 18 May 2026 11:36:18 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B159DB407E7;
	Mon, 18 May 2026 11:36:17 +0000 (UTC)
Date: Mon, 18 May 2026 13:36:15 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie
 Technology Co., Ltd.
Message-ID: <agr5r5ikeEzv6B1l@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DPmCpSAJMKwxwRKn"
Content-Disposition: inline
In-Reply-To: <20260510201644.4143710-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_043622_109531_06372084 
X-CRM114-Status: GOOD (  16.86  )
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


--DPmCpSAJMKwxwRKn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sun 10 May 26, 22:16, Alexander Sverdlin a =C3=A9crit :
> Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
> embedded products as well as customization of embedded solutions.
>=20
> Link: https://szbaijie.com/
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..095cf654787f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -229,6 +229,8 @@ patternProperties:
>      description: Azoteq (Pty) Ltd
>    "^azw,.*":
>      description: Shenzhen AZW Technology Co., Ltd.
> +  "^baijie,.*":
> +    description: Shenzhen Baijie Technology Co., Ltd.
>    "^baikal,.*":
>      description: BAIKAL ELECTRONICS, JSC
>    "^bananapi,.*":
> --=20
> 2.54.0
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--DPmCpSAJMKwxwRKn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoK+a8ACgkQhP3B6o/u
lQw2kRAAgtcMljYZEZ7CkBCq//84iLqr97yZ/jVDrney1Lh0ZJCwI7h/0pA7Qya3
xcb5EaLnms9wUCB7qwSoX4nEoYCAn95CsRNcC2cbxBaOZbNb+S11CtwP34+NKAiS
4ZhO5aKo7AabLBCm1cuBpnCSFxloXh+vHIsOxTzYwen9FF876jn/wxR3HvQy4e5N
r+VBBY5IxCnYbFWyLVZt5A1B4WEH0Fg1xPVyqHQgT21TyOpVy7C+QAA/ZSHfq8MX
9n59oKIKOTePPCLGWxMWXamXAVXF03aVYmADw6/10yaWNmcQmMxafX7J2rXEMz6V
Wj+/GXxhldtt8WiYpA0ym62qqjgXriLwP6O8sSjfJBMHTln6fHxXLYp1n8W2tYY4
8TEOLC35gXiNSSSvOS1va5etgBNlscoEiFu/MN+NluBIIseSvRgdIdYKXOaKkKt9
+OJ9gBnWsF2jNekXk9+2Q1gGn/W/Iq3Oz7wp1Qt30JXhNuhwwswEw0R68+1U4BE6
XAsImQDjDtEqhtBJYo4uLBDrcdhjAIwvQWxMWgi8SPaOwRYda8rkxvmNBsZr94TV
N6zivylUvp/9TkEQ0V2M8w73ijUB2PV+EGV9J3/J+lcpSms2UDE3w1qn1DHS7sza
KWSByvWLnYd1VHbXiYwE8N8Y1UHIDEiAV6qifiIbMs3T1sJMbuw=
=y2JF
-----END PGP SIGNATURE-----

--DPmCpSAJMKwxwRKn--

