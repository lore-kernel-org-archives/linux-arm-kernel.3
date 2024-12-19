Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83457E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znyT96NwkypUkxFvAf4my1nVUYw5GJdxoe8C90powIE=; b=OMA1DD90J2NntmWGIziMO3JHPB
	Qqc5fukdw8Ok7OPd0mLJGgUPiyMmsN0snugbsDg9DQ1yAvzph+/TOzmbi3OxtsoiQsxKRJo+uDbIP
	L6zTjpNZjeSGYkD6QoPEi84M15+cviAA16BJH7L8Y21EqgUtwVsPf5RhCw3r8AH3gPTiEFtWX//s+
	VKhgq2XZrhXUqJyHWt2iiSFul+eR20megOyhZbzMnkNfTMlgHxaf5adQ7Q3USX6MZ31Bxb9nxVGKK
	afMd3JgkUW0hD1x03DQRIS3mqB3qb/Gs5gTVVy90q9uQfu6KM7yrCirIlNRwP3mIEe9gDu38rcvyo
	Z9K9vwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMpE-00000002yXz-1WIh;
	Thu, 19 Dec 2024 20:08:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMht-00000002wuk-1P7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0ED7FA4016C;
	Thu, 19 Dec 2024 19:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277F4C4CECE;
	Thu, 19 Dec 2024 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734638472;
	bh=znyT96NwkypUkxFvAf4my1nVUYw5GJdxoe8C90powIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6TdLR+MMfrK5eiw/0oDYsFqM08PhAmklPBS5ZTgqsgrD8cYIJMIdo9r6/5grJEf5
	 nwn8yZ1cFVs0iMeW5s0U1jhBePxjcsHlcotJQ13AEWxUmGelhoTXcWiCf0yc9UhMbg
	 OsnWonVxfbG59nB4ZzoAGcvaDWhPZ7cw53mrFBZXJS0MN/MMLfnla1OLODlybRVzo3
	 QqDiu8HQWuK5UzmB7167u2GWTwSvyUFkXywcclVU+nnnHOsqAdKBZYwqECm1kIFtFU
	 9iS4vf0ABPfozRuHON+OSsPJ+Gr/1SNRRpG+1gRu3faRiMZYwOoLjeSc0wbsr7DWuS
	 f9btMCj2xstdg==
Date: Thu, 19 Dec 2024 20:01:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH] dt-bindings: mfd: atmel: Convert to json schema
Message-ID: <20241219-catcher-genre-5ea63d8e6587@spud>
References: <20241219-gpbr-v1-1-e19a562ebf81@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zy1sd7hEFBhjy0R2"
Content-Disposition: inline
In-Reply-To: <20241219-gpbr-v1-1-e19a562ebf81@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120113_435894_6B3324E9 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--Zy1sd7hEFBhjy0R2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 11:12:50AM +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> The text binding is misleading, add a fallback `atmel,at91sam9260-gpbr`
> for both `microchip,sam9x60-gpbr` and `microchip,sam9x7-gpbr` which is
> missing in old binding and `microchip,sam9x60-gpbr` is not a fallback
> for `microchip,sam9x7-gpbr`.
>=20
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--Zy1sd7hEFBhjy0R2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2R7gwAKCRB4tDGHoIJi
0gYkAPsFKMHeABypDLDH+ewRLZ1ax1Do381DqhEZ19Ri/IU3lAD+K2LsJ8ZwNMTJ
PJZkW9XVehehUmAdj8TMOYp9FDJHRgA=
=R7Tq
-----END PGP SIGNATURE-----

--Zy1sd7hEFBhjy0R2--

