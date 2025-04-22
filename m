Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5DDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm8jKNoMQLTj7h4D3shZTuTnR9xrsJK49611Y0xfWkk=; b=bUZ95E0d3h2YYuCGcOcLJ7t1Cg
	nQo+Jbyx5YR42ZdA0SlGDUCkJxqIyslDHspG2FSs7FhmeCXBYIzo9rZQVPjFZZ9jra3eJO2px3BKe
	p1iIVVfvFxFHv86zhN+38LS6iKVBWt5fS1QtjlwxSXDXgaHZeCbV9YWOsZoi9CJcQ9GKuG85012dC
	GYaXpIDMwa1p+sWtAXK/+tsMRrfiR5jV4bIZHHo8v2Iuu6Q00YHrBeTmj1lTRu/rwmj/mG9Y3yOtR
	uap+gK/IPg3dLC2oZv9XXP6BIthS5wO+u7TyS4TuDxvw+OC/RwbjsTG6q0yp0Vfo+FJ0NBFDUmuH+
	LZ0HmjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9g-000000087YM-3JEm;
	Tue, 22 Apr 2025 18:15:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fr5-00000007mwb-3PK7;
	Tue, 22 Apr 2025 15:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C85DA4BA9A;
	Tue, 22 Apr 2025 15:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACCEC4CEE9;
	Tue, 22 Apr 2025 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745336894;
	bh=nqFcG+6F2hXaL5zy+yH+SQePgNZ/EcZEbOmErrH/3vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBCmOnDRYXMwdoo3rBgTGRHgMCDl35w7qmEdpl1zUZsxAeSve8j5KRVYfQyiwJIRA
	 ca2B1b8/CqrQPNKef292AjDWZEAa94YysfNqLj6xDxZdXSHHSBnTP92BnVz8oIPHDE
	 MugYkchaJaFaGq6rB+ShjZAVuitfqSMOW1syaBNE0lEOOTMG1JPyrxSzUBc17pqr5d
	 +sL5h0gOTAv/ltxa/RsfkStymPiyAn8/eo4DMicwA5oQeHywIetxGo0q/28x9r7yiQ
	 g8KfDA5B+/3+u62CLztkjoPY6Iqa4LIWXcsRez+8vjZaiJJMLCgskS2cSPqEQMOvSG
	 z0p8RB9v5NGow==
Date: Tue, 22 Apr 2025 17:48:11 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: airoha: en7581: Add gpio-ranges property
 for gpio controller
Message-ID: <aAe6O8qB3d7MjT0-@lore-desk>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
 <20250307-en7581-gpio-range-v1-2-de1262105428@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="StZJEBqIgxJBqt0I"
Content-Disposition: inline
In-Reply-To: <20250307-en7581-gpio-range-v1-2-de1262105428@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_084815_914051_500195C3 
X-CRM114-Status: GOOD (  14.39  )
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


--StZJEBqIgxJBqt0I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 07, Lorenzo Bianconi wrote:
> Introduce missing gpio-ranges property for Airoha EN7581 gpio controller
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/=
dts/airoha/en7581-evb.dts
> index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..a8f8a9f0b807a2ee4fd11f841=
8b8e810a6945d73 100644
> --- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
> +++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> @@ -65,6 +65,10 @@ reserved_bmt@7e00000 {
>  	};
>  };
> =20
> +&en7581_pinctrl {
> +	gpio-ranges =3D <&en7581_pinctrl 0 13 47>;
> +};
> +
>  &i2c0 {
>  	status =3D "okay";
>  };

Hi Angelo and Matthias,

Do you have any update about this patch? I have some queued patches depende=
nt
on this one. Thanks in advance.

Regards,
Lorenzo

>=20
> --=20
> 2.48.1
>=20

--StZJEBqIgxJBqt0I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaAe6OwAKCRA6cBh0uS2t
rK1DAP94bjHgjK6yU6Qawm+loboc0KNNR7UGKdg8qSO90HxTAwD+N8axwL0ELrpP
0ix+uolfAGojTy4Ky9LnSmhkOymJiw4=
=5EBn
-----END PGP SIGNATURE-----

--StZJEBqIgxJBqt0I--

