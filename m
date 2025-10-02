Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A6CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5kiSAcbhb2eHuuUHogicf0hIb8cWyg9KNsm4j+akvM=; b=euk1Hm93iAdOC2OVDUoMZsdZfg
	HRTA5K/eo6V1r46fBfdixU9T3RxYAhjI2dDM2RzEA5BjficKQZ+nFDbgvFZlSWTVVybFgXdiRjWOQ
	BdjX68DXIxGYY81gnDdBcWrxSLGyznJqSes9z7tJOrXPfNxSoDaMvNR2gtai4BWOnHr6SZA8SyJUn
	Aoo1eSBcu+yTkk3FZnlh+i6zEHcO+8wj2k4jRclO5JsczMevzGDJQr7hzlSFyW1jbFgA6OTQdyEM+
	r5fiQJbhAi3F0l8lHJip/aXUXKapWukZxXxF5RXJUMqvjIsPjXvxs7HWNbjTjkaKast1yKNc+rx5L
	hhR9QsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OAg-0000000B2oq-23MO;
	Thu, 02 Oct 2025 18:36:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OAe-0000000B2ob-1yFO;
	Thu, 02 Oct 2025 18:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9A05611BD;
	Thu,  2 Oct 2025 18:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D2BC4CEF4;
	Thu,  2 Oct 2025 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430211;
	bh=n5kiSAcbhb2eHuuUHogicf0hIb8cWyg9KNsm4j+akvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JC+92sJbWT3GFAshOqJqRxpkZoiXcm1Y3cat6v8hDF0pQmsTxEGSmf03mdaAGzGws
	 wUfesAvRp5saaFMpOQB3At9M+aJ9rHXFpaDqOmr39xLrtP1G5BGvnK1yPXq+7fNcL3
	 NaXiaaVDJ8C0w8eu2Ob31hlJi5llkUjrW7PQ9SxmXMkjs6iIb33RSO7+mf0kY//FhD
	 /ZKYO8+G9LDS12SmSgkzA7LDiUM44VZkGYzZw0sHdB5dssGsUDkqlwBtapFKW/nbCK
	 osPppBAgzVUZdZDEy9F2nZk/zNSiSjmB3sRpDO3XQV8MnlxMyAZXg1IsLN4ZZgRjYC
	 KRkfwgOWGvwXw==
Date: Thu, 2 Oct 2025 19:36:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and
 'power-domains'
Message-ID: <20251002-lethargic-veggie-f6d4b5e3d2cb@spud>
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x40NfRc09puMoOvJ"
Content-Disposition: inline
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
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


--x40NfRc09puMoOvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x40NfRc09puMoOvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7GPgAKCRB4tDGHoIJi
0ktLAP42zDrr5TqKRUdJdYKMIoirw/SwiG2ofx0WSyImzyfVoAEA26Qdkusn1iOP
+MBcHgThSn6vsUsQ9DiGydsV9RAjiQQ=
=b6Pp
-----END PGP SIGNATURE-----

--x40NfRc09puMoOvJ--

