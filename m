Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A8FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7Ey1Zc2hOglWiO6Hv14dQmF0CUES1FrGWbZ/4UQJ0w=; b=aMYm8d6kwj1vcXVB6S3QDPxXu7
	kcjfmTnu21hZDFXH7XhWYPIlaSkPnKFEX4JQ6vT4Jv1Y+5K7pwuDoHAmJlRUQwoqp3Ra+PQn5ICRo
	f9HBowPt/Sdqhq5orIgXA+FHJWFq/5jUkyX5+qlQvezHHwT2qHI9oDCtlJtcAZWaXhpFa/fC2QPlx
	8hqDjFCh0f3rLOzsFwLGHVC5pnvHiQWucKUfwx1XQ6DaNaKTY3IbY64d/Dxg5ZMlsz7yWZleo5FLr
	Vhh9pBuJUtD7UWukpDcAoRoZO9fYA/4LEQSEkOd3VCN/KrCdRs7vU613NknTwnE6AXxwz6uXNRjWM
	tfadcZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZsa-0000000EkEB-3JDm;
	Fri, 07 Mar 2025 15:44:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZjW-0000000EhOs-3NOf;
	Fri, 07 Mar 2025 15:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 509335C5AA9;
	Fri,  7 Mar 2025 15:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B39C4CED1;
	Fri,  7 Mar 2025 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361729;
	bh=+NBaiXMA7TB4yM9FUBKC0Vpf3PO8/vw0zeJ97JH5BWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfsqKkHUjw9IIklBMftnuGiGHxcFvD4TS/2lzMv1w+m/F+mfT2YacH0ItyIeOhy1j
	 ttKrUIYShf6jDDT0/2Gn6TZAxKgDS3b8rDJM5HQJ5Qjdv1vpwAewV11QbmQNtQ3Ziq
	 m/wvq5J+qcXpWKyQumRts24nj7rvj90H9be4HdZoP3GgXWOvvJKRW60zsUqG3vewk4
	 rtfGxEFN++FcbXk3EU8Ib3Ks8nKFgncADKPYJUJYsZxa2Ky1+TLCtAeYzYPucfCWZo
	 AFYS3+2qgLOk5tBqBEH5tzvVfNQyhGvb8+w9a815//7j8oXcOcmpWA+PDIkq42gPRQ
	 NFY/riNN7NoJQ==
Date: Fri, 7 Mar 2025 15:35:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
Message-ID: <20250307-paddle-zoology-89858b29061d@spud>
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
 <20250307120004.959980-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Afd+EhsTE5IatMg"
Content-Disposition: inline
In-Reply-To: <20250307120004.959980-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_073530_896885_37D8BCC5 
X-CRM114-Status: GOOD (  13.12  )
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


--/Afd+EhsTE5IatMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 08:00:03PM +0800, Chukun Pan wrote:
> Document pwm compatible for rk3528 which is fallback compatible
> of rk3328-pwm group.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Do=
cumentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> index e4e1976c542d..c8cdfb723336 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> @@ -30,6 +30,7 @@ properties:
>            - enum:
>                - rockchip,px30-pwm
>                - rockchip,rk3308-pwm
> +              - rockchip,rk3528-pwm
>                - rockchip,rk3562-pwm
>                - rockchip,rk3568-pwm
>                - rockchip,rk3588-pwm
> --=20
> 2.25.1
>=20

--/Afd+EhsTE5IatMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sSPAAKCRB4tDGHoIJi
0m/eAP9rX1JDmngdihmkL/YjmxTR+sVxZMPjO2SZ0tmi4POUjQEAq56oMRBUG7s1
0HAle8NRwAy5t4/NvjvcQoi/XxOk7Ak=
=gUgZ
-----END PGP SIGNATURE-----

--/Afd+EhsTE5IatMg--

