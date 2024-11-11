Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29CDD3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=152E4AMyrFyVth6NJr4o1obdZxNFdCxTvLupPgHqcR4=; b=M/xFrFSgGlzZQ/Zr4OFZdFqZxS
	iS4TFMo5EZ8kSQMe/naYo6+Sx3h4jsVHsaaoLqdedYQBPqfF3v2ZLCpeSyRiCwbJbDAepPnPwCK15
	E1GwiJKEQrwEaA3zC1u8jzegCredOXxb78acV/CA8FZqVvzFtn/S5RKcHiMQz5FR0gmc9B2CuuwaV
	oZfWGyX5qVLp7Gei8/4i+XOgkAlqQM+WGc2ZyxTL9YXTLyevaJYduYTZID1AS5CdhAfCcIX2C9eTe
	DBjh+Yg1hXU8EAthdYfwOWp+xPiN6Zi9DIc138MoEixC6qcshUhB6FWBJnj2MQD36Ef4faA+G6d0x
	lzHJ2RRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbOx-00000001FWF-1iK1;
	Mon, 11 Nov 2024 20:52:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbBL-00000001Ddq-3g8E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B5B85C5A20;
	Mon, 11 Nov 2024 20:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128AFC4CECF;
	Mon, 11 Nov 2024 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357522;
	bh=152E4AMyrFyVth6NJr4o1obdZxNFdCxTvLupPgHqcR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqzaXjvB+eygq7637ZG7G/eJ5DM9U1D/pEckw3OihBILO29k9uU9UKAExc6gUejDR
	 NJRBYI445rRLUb6+SifOvLM3JKo4XiK6GcF6W7ueCowXgkGbvn0CPV/ekjADy238BN
	 W6tuP1tdsLspbn5ebmUEBoAOvg253VHyT8CbzcUZnte5wvuKjc/im1hHhCBJL7yTC9
	 goRxy6NBkKIOikKE5/j4uO3wN6Gu7wqW2jp2TdOejvH9Vn6MXrshK9g9LsEX7+sTgX
	 DFmWoRu5n9xsopGs+4zkGjKmOesHtKiCFl7aWZJeG3BMq3wg9/PIJXDvyToaxTHHbN
	 l06hr/n1QyR2Q==
Date: Mon, 11 Nov 2024 20:38:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 08/14] dt-bindings: usb: sunxi-musb: add Allwinner A523
 compatible string
Message-ID: <20241111-harvest-excusably-5e53d1fd362d@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIS1unl9HesvjYym"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-9-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123843_996838_80A4D805 
X-CRM114-Status: GOOD (  10.41  )
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


--pIS1unl9HesvjYym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:27AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have a MUSB controller fully compatible to
> the D1 (and ultimately the A33), with five endpoints.
>=20
> Add the new name to the list of compatible strings.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pIS1unl9HesvjYym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJrTQAKCRB4tDGHoIJi
0sMOAP950SFaA8lr6xbPJAxQ1ITCDG/C0OzjBW9aD/2hFBhNHQEAnY4Gt9XMpOdC
iHYyvhfePxdmMQPg4fhAUFLOEusEBQk=
=KMGT
-----END PGP SIGNATURE-----

--pIS1unl9HesvjYym--

