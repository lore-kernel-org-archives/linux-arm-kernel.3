Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF55CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmhddThTMK58L3PXC/18IOejJNGs2Tcz3Fy4kbWUIuc=; b=p35x0LwnZgquXqFXaOmzSvpOLu
	v82xqK0bXwBQkXhmmRudEzAs9S2jJCropBgZmEZIlWQxIzXynMy6xtdjP0c+Njp/Gk/vQ0o9vDYhZ
	tosLpFrvg9+JfuCFIcCmM7qbBZDn6kpTxMsf+U+1rLDdKDQlQEAIApyL4NUaqstqssUvoalTERi3c
	2eK/ojHe+ssMbqwQkR3/Dk3IqOkqdaI+K8daP1iIYOFJbaF4z+ifmIPCIXEYW3KALy1XW2rc+ijhK
	yr/2W0JjhGP0FA+ws9eVr/Y5E55IndDP3EdzIVn4O2ZUubTShKuf4SPNzGG+bw97+RDbXYbkTkfs8
	6iZHoHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwFs-0000000FSFx-1yQ0;
	Mon, 18 May 2026 11:35:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwFq-0000000FSF0-0Xw4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UmhddThTMK58L3PXC/18IOejJNGs2Tcz3Fy4kbWUIuc=; b=hX4nWv1vM713LDoWQmfRuviKLq
	y5Ygxhyisaja5VAqZN9VfmeigVn2GuQEaj5c2Enc62x3Gu+guHE3hWdMcnlAkjhnYBRgrboZy/03q
	BOr4vlZwcagfEN5WWKCn6MK/hwrkw/SwgUNX2A2hPbn43aZyDARHiC4/9H2Rrh3EGptEq1eiuk/xM
	R7bsKW6OR7Gzq6DxreJJ5upPMGjtet3QU7rA45scK3tD9k/x9IV49wV0Mgjcfng6Jj7OJznq5OlKe
	DwKVnm8fWGlatLpfNgkqSeL4bbNbvOJIYQewpGb/Q+nqnH9d3STw4/+QiIqS9ytIRMG4YFAnU/Qn6
	LLgX2u0w==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwFl-0000000AxWd-2DNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:35:24 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 63F7B1F8004D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 11:35:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id F2A50B407F2; Mon, 18 May 2026 11:35:17 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 9E03FB407ED;
	Mon, 18 May 2026 11:35:16 +0000 (UTC)
Date: Mon, 18 May 2026 13:35:14 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
Message-ID: <agr5cmgZ_fdv52Ni@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SGiZE73NjioLjzVe"
Content-Disposition: inline
In-Reply-To: <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123522_720967_B99A139F 
X-CRM114-Status: GOOD (  19.07  )
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


--SGiZE73NjioLjzVe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Le Sun 10 May 26, 22:16, Alexander Sverdlin a =C3=A9crit :
> Baijie HelperBoard A133 is a development board around their A133 Core
> board. Introduce a compatible for both the Core and the development
> boards.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>=20
> Changelog:
> v2:
> - introduced baijie,helper-a133-core compatible for the Core (SoM) board
>=20
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index e6443c266fa1..d7b9dec81165 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -96,6 +96,17 @@ properties:
>            - const: allwinner,ba10-tvbox
>            - const: allwinner,sun4i-a10
> =20
> +      - description: Baijie Helper A133

Please use the correct naming from the vendor, which is: "Baijie
A133 HelperBoard"

> +        items:
> +          - const: baijie,helper-a133

Please make this: "baijie,helperboard-a133"

> +          - const: baijie,helper-a133-core

Please make this: "baijie,helperboard-a133-core"

Thanks!

> +          - const: allwinner,sun50i-a100
> +
> +      - description: HelperBoardA133 Core
> +        items:
> +          - const: baijie,helper-a133-core
> +          - const: allwinner,sun50i-a100
> +
>        - description: BananaPi
>          items:
>            - const: lemaker,bananapi
> --=20
> 2.54.0
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--SGiZE73NjioLjzVe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoK+XIACgkQhP3B6o/u
lQw2BA/+IHc8I9Er6XihIareQXTGKDeAAatpQfTX63S6GliuDvrCF4et5lAtdz9E
EXw3F7ATLVdz+uJsHGMbk0TYQ43gUMmGp8A+pycB0owdwpDGoP3WqLU36AMsciPG
AxFgqFg3uKB09ejkze0Jm8f8rdbb4tTxOcGO4NvqtAUneGWSRha+B+0YslU0Eyvi
j+/XcUVKzYPwHsE+PkpHdxP5Aj1G1eQ1ccr7a2weSTBmokEEZM8udMc++lw+7H2P
Go7dbJ3pMWHxlL8GSZOgPyofTsfc1pT7JR/j/ZOc1tkK3B1y81ZxxkrL57u8oxQK
gekBvmVxHQCPK1jljy4oQKlbmieUrDdopY+qDCVlxkX/CnuagrE3Ntscg6i9ok9Q
wSS/BsZt1sYls1EDl19DWIfwkELpbReZ3b0pr+dyopcR4Pgz9UBjcDXdAPxCcqhz
a9CZUdoiw6ik1KY4c1mHYpFxMUe77/AsVNApUF3F/fy3sozZ0waW3TvDtIhdwpM7
Mt+kc0mDywba/aSn269mf4/xzcqA2UeLr7Qy9ZFozqnJDyFhTl/SHHnAv9/boMB1
Hv0S9UkVASAvE8d6ykrdb8kLEWDsqK2p/C6lkFfRECrc6lq0JN4cnywf2topi/JK
fu+wzkv/K17deUo6JsbPCS54zn6t9arEzedTiJ19Qe1Y3f2ew1c=
=KXWX
-----END PGP SIGNATURE-----

--SGiZE73NjioLjzVe--

