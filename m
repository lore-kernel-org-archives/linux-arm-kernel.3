Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E115CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvjzQZEY3PpqpUrnzS/PsBpbHvGcbbpyz8hz5lABja0=; b=RA8qiRcYic/QPAWzNKivE/Uo3P
	MJugincqwq7xbgbSkULRpdbT2D2snQwDCH496ig8dkhOYRLR8YBieQA+vTu4pPa6cCU1SvtY4r5g8
	PXcoaQgZJ0vQc4vwthkhnHcXe3y2sTkaHIkrXUJaQCjJmxqCuoSYWWF13qzIitoOFEGntwtQUXkjN
	u/1JDHWtr4yVQZOU82/jSM1e/cR/08VgJzLDh7X2+w8g+bO5PwCVeU/bwj6our1yi5x3qfkKWTgoh
	knlN5n4ZlzT1JuLDIec2axuYbloW1epJ7qnnu/YzfOkqffmDSOA6MamOQ6p8JYpqS0SPOei6nPtZ3
	IsoHrD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNabu-00000006IIM-1MDS;
	Thu, 14 May 2026 18:16:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNabr-00000006IHh-3jmP;
	Thu, 14 May 2026 18:16:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6BE1444AD;
	Thu, 14 May 2026 18:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77756C2BCB3;
	Thu, 14 May 2026 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782594;
	bh=fJEm25dH1y6EOkMRRYqO7y8ORNR0reygkJUR3Cbg4Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFLSa1Esfxz7x1JwzdViATqXIRSaoQSXevi1OJtbMbtHqLQpSO+ZcPMKkh1nlyS2M
	 R8lt7VLW3yJKEd+3CNLstb03LDrHISdsQhyrbbpKI3UmA6QpTU1qiB67R0W2r7Q4t2
	 jCuphqpdWqDq6hTtuKhzk0755NkrH/8ECe0xluGyh5sUZeZ1Jb4YMquxEg3NHmeva8
	 Ze2GuxElc4KboQwjoTCDYiWEGi4pw7sP4nVJ4aol82oJfFPVM5en06KmgFt/MZ5GrG
	 JVFSdyuTMbgaIdvvSSdILDiLs7PAOdr16jSpYckBeFCqy089YAb3ZhhaIn7XyCuult
	 94RlkDoAGH0Wg==
Date: Thu, 14 May 2026 19:16:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: display: rockchip: analogix-dp:
 Expose inherited properties
Message-ID: <20260514-upstate-sneer-0b6e78682798@spud>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mVkoKuQ4tnstZXFd"
Content-Disposition: inline
In-Reply-To: <20260514070133.2275069-2-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_111635_950840_8EF3FFF6 
X-CRM114-Status: GOOD (  13.71  )
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


--mVkoKuQ4tnstZXFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 03:01:31PM +0800, Damon Ding wrote:
> Expose the inherited properties from the base analogix-dp schema
> to satisfy unevaluatedProperties constraints.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Given it's unevaluatedProperties, not addtionalProperties, this patch
shouldn't be needed?

> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml    | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index bb75d898a5c5..896ded87880f 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -50,6 +50,13 @@ properties:
>    aux-bus:
>      $ref: /schemas/display/dp-aux-bus.yaml#
> =20
> +  reg: true
> +  interrupts: true
> +  phys: true
> +  phy-names: true
> +  force-hpd: true
> +  ports: true
> +
>  required:
>    - compatible
>    - clocks
> --=20
> 2.34.1
>=20
>=20

--mVkoKuQ4tnstZXFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYRewAKCRB4tDGHoIJi
0gh6AQDIt0Wy+KmYo0XcRM9NN7v66Y9rNrmbrCAaSxSTx2tAuwD/XM5Y1B12VcMT
yz1+fUbrvZi2xJUPMA4qhMFXCvAXGgA=
=+BYe
-----END PGP SIGNATURE-----

--mVkoKuQ4tnstZXFd--

