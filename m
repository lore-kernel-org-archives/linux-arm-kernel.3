Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65D9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oRZ5aQ5DodvAzXjFA5ki97FOVUhhZpKpXU5ywaAli4=; b=r0v5Jf8WIgwAzPihCUhbtC2USK
	18tw5slFCbELXbslbFfYVPXxUGscFFOjTG3w+mhbkx8zZOvunZ2iire7761cRLVSAoFWdjtCkBAk5
	SninYvC0P+q2TjGdTf06FvaeO+DUt4CR2hD0vs7JNYYTZVq2/MFE5jg62cmg6SBx7o3VuAilqh8eD
	jDCOoNjs34uKlx9UKVOXAFi1HKXeS9p69QgXDl9kyTeFh5sg9gfNIrtP6xYt2vZGvtRoEpH2RWsEH
	jAEi5Z58bbPzlEvv9gCt9bdZMOITXWor1RIc4Jcmv9W/SXlmQ1DLEOI4EgS0tVzENEhoubntRjyjl
	WpARbfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEEV-0000000F7he-2jpj;
	Mon, 29 Jun 2026 15:49:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEET-0000000F7gr-3mXz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:49:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 044C6600C8;
	Mon, 29 Jun 2026 15:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5851F000E9;
	Mon, 29 Jun 2026 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748152;
	bh=3oRZ5aQ5DodvAzXjFA5ki97FOVUhhZpKpXU5ywaAli4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gfd9RbvbPXsLSqP0lUEsOp3xB2xlqWLZjP7NWREY79ckJqrMOope4VRt3d6Ix8J94
	 OdJ+JASzEoNcySOm+QD+V1ZVT5fLuuDmehE+mDfnTdNX5G1H2pr4nf5eIYvop2I9p+
	 tKVADe4UloR6Y3ice8H54orWM72mkyELoQMe49FvP3rD+joXCGOcF5hqosPJsE7Xic
	 qk3qkj0HQnPbKk9p0XFQKrD8rzZJthZ81ElpDeBglmpqj4RRcBfs7vrpcBdfE0XqUF
	 ZUh1l5LkFsLS/ZVqqhJWxfevuJVkKWdox7zERSnrHG6vOddshoXaa+CPsHfy533gXY
	 xZJD+YOBqS4MQ==
Date: Mon, 29 Jun 2026 16:49:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Message-ID: <20260629-unwelcome-raking-3df3d8ff0422@spud>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5wSEKtGIjQONlWl"
Content-Disposition: inline
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
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

--O5wSEKtGIjQONlWl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 10:58:55PM +0300, Stefan D=F6singer wrote:
> Hi,
>=20
> I am sending version 5 of my zx297520v3 clock patch. The major change is=
=20
> using regmaps rather than raw mmio to access the clocks and moving reset=
=20
> handling into its own mfd/aux bus driver.
>=20
> I think the list of clocks in my driver is fairly complete; It is=20
> certainly a lot better than what the downstream ZTE drivers have. I=20
> deduced a lot of it by trial and error. I am sure there are some clocks=
=20
> missing that will need to be added to the binding later. Afaiu adding=20
> clocks is not an issue, but removing or reordering them is an ABI break.

Correct, you can add whatever you want as long as the existing defines
do not change.

> Signed-off-by: Stefan D=F6singer <stefandoesinger@gmail.com>
> ---
> Changes in v5:
> *) Use MFD instead of aux bus for top and matrix clocks
> *) Move top and matrix bindings to soc/zte
> *) Give USB PHY its own resets
> *) Other localized changes are noted in the individual patches
> - Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9=
d@gmail.com

Bindings seem fine to me, I'll be happy to give you some r-b tags when
you go non-RFC. To be frank, I think you should drop them as you've got
no significant questions here I think and you'll be taken a bt more
seriously.

--O5wSEKtGIjQONlWl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKT9AAKCRB4tDGHoIJi
0j1nAQC8UKToEPcgGe2lQI+bacVo1EY2NlTAV7wfcqqKDpoI9gD/XHc3WrLY3p5V
8g0f/QWBENwoSU7VMsipqaDQhqljhAQ=
=Nih3
-----END PGP SIGNATURE-----

--O5wSEKtGIjQONlWl--

