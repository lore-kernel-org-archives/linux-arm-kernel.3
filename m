Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F21CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7nsBxVhM4rWa0Z0+1sKMa3EeiQcWomlA63Ko4Qo9Uo=; b=HH6HnY+XQTN4UZDtNmwXbpWXor
	q3X2nKYfTP+7QMhVDBFWVPJ0gPOsi0hlmjz66LrfawVAI0byeVliEwXHwbwg+st5tvKTv8QbyAi+E
	rY+Kv9FTiV38XA3yNqcoooAJX4tModDuhQT1Y8XkG5a51tML79ntcv2seN+RFM7NE6t8nrw7BSf7B
	Knldy5xEJdgHkcecGurxiMF3x4m0V/asDn9XEnGkOx1QmkhX2oIGNoJr8IF+0IuAcSnPdTO46YnvF
	kMzMSTRQl83u5WhPC0vWqS2VsFyfCbKUrHK09i95jNzSFlknR1Hr8CJoi6B1ZW5QhOWPBJ77/cun2
	iVdyBgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotRR-0000000FKbX-1cww;
	Thu, 21 Aug 2025 00:46:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoonO-0000000EmNn-2C3M;
	Wed, 20 Aug 2025 19:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFAD0A40934;
	Wed, 20 Aug 2025 19:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1396CC4CEE7;
	Wed, 20 Aug 2025 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755719309;
	bh=ZAdsCPJer5cp70aNhszFdULfEcYeJDeg4An1kUlxQno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVa9a26WlpOd2lExJFNhW8+6lwgSbRgExkhkldbI0j4xzDmMulzGbeeGY6QqW1fkc
	 5I+GOYGIT80lsYnM86pUsgDPyrDe8Wxqbm65JRjPrDfaIncSDwgtY/Y6TC1DROvb2F
	 hmIyFjb6NKBu+6fJBmPjZSQVj9R1J5LCEogNn1DGtGIAAt+SIKqG1oqlnddN5O6EJ4
	 //ea56WkFOEwm2khUhByKpGg2AVMm7Q5zTuymgE4qk+O9GZV5QpTICjhzLU6cwD299
	 nvQaVGRCkzZrMwnHZDEOTyBjTFkVd4ACMTQs4P+rbb4dtD+KsqB1r0PUXfJcslaDcP
	 P3ADJFHe9jCDQ==
Date: Wed, 20 Aug 2025 20:48:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
Message-ID: <20250820-await-chomp-9812902c0f74@spud>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q0FCgrQS2OQS+FoE"
Content-Disposition: inline
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_124830_692752_029B5AD7 
X-CRM114-Status: GOOD (  15.65  )
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


--Q0FCgrQS2OQS+FoE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 07:40:49PM +0200, Sebastian Reichel wrote:
> Instead of having an optional rockchip,grf property, forbid using it on
> platforms without registers in a GRF being needed for thermal monitoring
> and make it mandatory on the platforms actually needing it.

I am assuming that "needing it" means that it was actually mandatory but
the binding was just missing the required required entry. If so
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/thermal/rockchip-thermal.yaml     | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.y=
aml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> index 573f447cc26ed7100638277598b0e745d436fd01..9fa5c4c49d76e3a689f317978=
75124e7fb30d3df 100644
> --- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> @@ -119,6 +119,21 @@ required:
>    - resets
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-tsadc
> +              - rockchip,rk3366-tsadc
> +              - rockchip,rk3399-tsadc
> +              - rockchip,rk3568-tsadc
> +    then:
> +      required:
> +        - rockchip,grf
> +    else:
> +      properties:
> +        rockchip,grf: false
>    - if:
>        not:
>          properties:
>=20
> --=20
> 2.50.1
>=20

--Q0FCgrQS2OQS+FoE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYmhwAKCRB4tDGHoIJi
0lk7AP9pdXnawAo7vHzgRoCDQLvEYOnbJv5NOJbb8mHXjbf0lAEAsFcbnQidHn69
nDsAJTevUWIbM9hHfimNJ3pk9is+lg8=
=v71N
-----END PGP SIGNATURE-----

--Q0FCgrQS2OQS+FoE--

