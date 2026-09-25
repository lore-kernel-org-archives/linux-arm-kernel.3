Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D6FC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA1H+OxXP6KX0LKvAMZqOqInzKF4jduC38BdbsnlM5g=; b=Nsc/O/QDa7PAAOTSxJLO2hEO1N
	sgxRH4pW1S8MMJ209JDUaem367jZ89N/j+qzc8v5VZGPRitEvsFeaDJv3TpA37RfJCTQOI3usE4Ov
	e2IagwWYxTaNRADFqglCy7KRpaibqcWIVP7v7VhbvybTrVj8rO+rID4Lh/0x1azhJIEH1PrLiFayK
	bDJeBkRlaZKGrNR+zIi9T+mU26/UcBfqXzrZHSswECrXB9QACafRNDT4i2RBZtmKie11S25dJZjnx
	IRJvXAh0TpRFq71sl9r/ouGgDojr0F63isrCtKEe3sozy3ftP/5ucLhm4ZI3yKZMbbcmfyc/stAZF
	f8E2+dvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA96l-0000000E0BM-1Hxq;
	Fri, 25 Sep 2026 16:49:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA96k-0000000E0B2-26Wg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:49:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC34660230;
	Fri, 25 Sep 2026 16:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B0E1F000FF;
	Fri, 25 Sep 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354949;
	bh=GA1H+OxXP6KX0LKvAMZqOqInzKF4jduC38BdbsnlM5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuAEb+VeI1z6pWxU4HjqZZQok62LH0qyTrgBi47q35kShO6PMrPe6n4SPcaoC3A+n
	 kCIhJP+hqwybi+AfGXPi1VmjgPSitXfGETMJ/zQCXX5MdDDfn/uOMlwSvhtjtyGLY2
	 GMdxadOyEKuhAICt29844HAMMJVs23QqTVSTfYY19cfMVpea0xjHlESRIX+dRFxhE2
	 bAUpzTdu0fd0ZEvJR5tVJzdQnE2Vp3NXCv4IeyHVmz3T8NrcpF0Q60vXLpe8Xe7EAE
	 1GUkREEef3efjqGmZQLtHXe7qV4BEijS9atHbXDDJhhZ9+xmFqaAo53tRokYH0nHC1
	 w5tv5hICCZ3LQ==
Date: Fri, 25 Sep 2026 17:49:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Message-ID: <20260925-entrap-demotion-e1506f8f426d@spud>
References: <20260924164922.117236-1-ag@ffroot.co.za>
 <20260924164922.117236-2-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlYi1erejnPlZT3w"
Content-Disposition: inline
In-Reply-To: <20260924164922.117236-2-ag@ffroot.co.za>
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

--UlYi1erejnPlZT3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 06:49:17PM +0200, Andrew Gaylard wrote:
> Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacture=
r.
>=20
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Link: https://tibbo.com/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 4a5cf436eb14..8a984fea11c3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1728,6 +1728,8 @@ patternProperties:
>      description: Texas Instruments
>    "^tianma,.*":
>      description: Tianma Micro-electronics Co., Ltd.
> +  "^tibbo,.*":
> +    description: Tibbo Technology Inc.
>    "^tlm,.*":
>      description: Trusted Logic Mobility
>    "^tmt,.*":
> --=20
> 2.53.0
>=20

--UlYi1erejnPlZT3w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaramAQAKCRB4tDGHoIJi
0lTTAQDGqGWo0Z147vFrs87W9XtSqSk4XY9MvDf5TcVrVGnp+QD+M2bvhTxKm+NA
uilgroWUMyUYURQoxL3phRkltvzK/g8=
=uLMg
-----END PGP SIGNATURE-----

--UlYi1erejnPlZT3w--

