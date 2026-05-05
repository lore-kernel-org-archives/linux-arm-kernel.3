Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86801FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oD8fUaGUQaaoTnl9SGK1SedT62rZ4awODCyiH7yycXo=; b=vflltsRgE+TwvNu37eb/uz6kcM
	G5n5uOOB21IvhJvRuwGhwo2CRRuNCN8Kr0LqKgPS4yjw5H/OftKsJcTpncjWMivZIefQiGFjEX211
	LaB34lODuTFG2de3ZXdJ6kw8g1jKuuv56Dws4db0wsp0l03l4WGF1knZvmEhenS213GyiAppMQWAb
	pFmEXROODWUxx+tfCquKg+on4yO28jk1MDb4omnRT81/Mz81v3xv63jkqIIVALsZYVvOhx3sbwpfd
	sTlQvd6frO9VZyj1jmqsybfZgdHwZnfWE5LnuzOc28K4tpbko9Qc09UsbeAs6RUIykSENO3c2HubB
	iBT7BGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKInk-0000000GvDu-1rDS;
	Tue, 05 May 2026 16:39:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIni-0000000GvDM-4BRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 223D6601EE;
	Tue,  5 May 2026 16:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81343C2BCF4;
	Tue,  5 May 2026 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999153;
	bh=GlW6twzrgk2C2vJM7HkgJQXNI/ske8p+d+IqMH5m4+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUhl2V9VU9H6JVFwEpNejbhMTvHiTMzqc05KAzD3/5/OW0SLCv0YqIPiVzImfYtZG
	 IYvDThYqZ8Q3JuLX11jLmBAbev3nOZErW7qfy3w+n+UlP0GeWmdlLYsxq3q6CE3CUO
	 SkHLaqqjIuQ9/T5G9aH3quDsGTZ8Op0s1YtEVktArfgDgcnhm1I6a5exq734m/cZJx
	 fUo7omhGtPEjE0to8aRHsf1eYw7z9F0ui1ALT8mqwm+Eh9oLQS1kEuAKP5Iufi0Kzx
	 4NCyjz/0BALewTknVUsPQNeZZKVt8St+JyfAVX42htYL3d++hFkJtZBEM6SPfdDfph
	 0sgUAq6db9jiw==
Date: Tue, 5 May 2026 17:39:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133
 compatible
Message-ID: <20260505-collision-evict-acc27ae41c3a@spud>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
 <20260503191842.2736130-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9YtZjw3JAawFKZTY"
Content-Disposition: inline
In-Reply-To: <20260503191842.2736130-3-alexander.sverdlin@gmail.com>
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


--9YtZjw3JAawFKZTY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2026 at 09:18:37PM +0200, Alexander Sverdlin wrote:
> Baijie HelperBoard A133 is a development board around their A133 Core
> board.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index e6443c266fa1..52b42779a283 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -96,6 +96,11 @@ properties:
>            - const: allwinner,ba10-tvbox
>            - const: allwinner,sun4i-a10
> =20
> +      - description: Baijie Helper A133
> +        items:
> +          - const: baijie,helper-a133
> +          - const: allwinner,sun50i-a100

Should there additionally be a compatible for the som here?
Looks like there is a product called the "helperboarda133 core board"
that is soldered on here but has a separate product page.

The dts/dtsi probably should reflect this too?

> +
>        - description: BananaPi
>          items:
>            - const: lemaker,bananapi
> --=20
> 2.53.0
>=20

--9YtZjw3JAawFKZTY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafodLQAKCRB4tDGHoIJi
0nm8AP9T9njgp+XuPNdE5OffE+KIOUpXPHqK/hvdf8dS/nUIAAD/foDnvjHSEvyy
gFzU16lw3BpBGwaxO3LSF1LKVHSqkQg=
=exp5
-----END PGP SIGNATURE-----

--9YtZjw3JAawFKZTY--

