Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCFCD3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNU8K6nnaLPc7PQeXnwLP7WWlhqRvVuasd9XsblM2AE=; b=2r36HpkfMERTqUOdaL+jtiaoHn
	dGXjD4k7WlhZbVXitGfQaymE3n54RKd1JIFXz4vNVJoXqdLisA8VfpHsXrqk8xeyB5vOs7lP7MbjD
	1z3wQ//5N51E2tlChBbQVSkvLnaVJecRq2RNe/xReBnkNSliRCEtUWK/8Sjje1UjEO93uZ7AyweOM
	HB6QqwGUglM8lny3uZkwLRHtcjMRhKf5SJv8FIF8Ama8sGGSQOrs8aJaFUPkztt3sjyd+kJnDUUnQ
	nloP6hjuzgxjVBoOFtuHxOd/bNzv46gjh8eIhjOzs7Wr4+RcYuhTIxCrsaahpDOUHJ5RZNlyQZVX6
	3HnXW89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAatu-00000001AgD-3jHc;
	Mon, 11 Nov 2024 20:20:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAas6-00000001ABv-0rUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6312A4085C;
	Mon, 11 Nov 2024 20:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B07C4CECF;
	Mon, 11 Nov 2024 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731356328;
	bh=t5DsLHsfXVJLaZWit2f4WmFMkD0tUkZhk7FpjCALETo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqxqfibKGViofJ8HKYz5PSJPB7/H6OvWWhJ/kb7COtar9EoQ1MgLDvNlR1bmXyw5h
	 EfYGFIq0amhZd+Ig3cP4u4pSXVCWFo85owkKMFuAjzwS6En24XVQzwpQ38m3qpdOny
	 FecvGyxmlWvNZNaZXaNvj60n4qs8+PkYOPfxh9GiSAC+D0qFhXsgMkz42TOspX0Zlb
	 M6YZRSzEDvNA6GIY6QdVdW2a3VHf7GkDMWWkQ96jwp0jPXwyBEOC7GdQ6V5kW+orht
	 iA+5UA5Nz7BCL5j4f69dTYmc3A1GQxLXj7Wqdsc9/PLNtaADoBXVpzIWJz+51Iejqc
	 IQLLGUsjqZ8uw==
Date: Mon, 11 Nov 2024 20:18:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Sota4Ever <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy S20 FE (SM-G780F)
Message-ID: <20241111-dreadlock-anaconda-e164c85d1ae7@spud>
References: <20241109230402.831-1-wachiturroxd150@gmail.com>
 <20241109230402.831-2-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MPVSYDEanEQ+DG5z"
Content-Disposition: inline
In-Reply-To: <20241109230402.831-2-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_121850_330879_EE3CB480 
X-CRM114-Status: GOOD (  15.54  )
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


--MPVSYDEanEQ+DG5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2024 at 11:04:01PM +0000, Sota4Ever wrote:
> Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
> based on the Samsung Exynos990 SoC.
>=20
> Signed-off-by: Sota4Ever <wachiturroxd150@gmail.com>

I doubt "sota4ever" is an known alias, can you use your name here
please?

> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards=
=2Eyaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index b5ba5ffc3..168e77375 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -240,6 +240,7 @@ properties:
>          items:
>            - enum:
>                - samsung,c1s                     # Samsung Galaxy Note20 =
5G (SM-N981B)
> +              - samsung,r8s                     # Samsung Galaxy S20 FE =
(SM-G780F)
>            - const: samsung,exynos990
> =20
>        - description: Exynos Auto v9 based boards
> --=20
> 2.34.1
>=20

--MPVSYDEanEQ+DG5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJmpAAKCRB4tDGHoIJi
0rizAP42h+6ryK5OuKYwHGBlhnYmZRsNL+6V9i7RBw14mZ5NXAD/WnsmQirug9Uy
IvnvhlHbzmHxe/KvQJfQvQfNxwJr/wU=
=oo5p
-----END PGP SIGNATURE-----

--MPVSYDEanEQ+DG5z--

