Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84072CE8D69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nvc4byo9DNLikK0zQf+kXOjn0oABVfwRa9/DHrFpJM4=; b=uYNeC+ZOIbK0Iam5uVIeM43KCM
	HGA2lmUT3wBY+R0yMyOf+8Z8i1F5B39SB7WNvUlVmFfg6cNddRzeKwGv6NI1dqyw0TcoPNIRQ0lqA
	q5EchKM5dEoyBsMxh3E33L36NjiMkehaDo7x39bafzdCdu4SJYhKnw3feCoWvw30FGCUrllyO7iH3
	kmDXFfpvZhCmyJEte2UcuQyUkihbfBLlHeDH0KVcA75lBvCPz8c/v3KYtabeRZNB130fWFegIrRg7
	s5fy5EQpAeBXbap9qcwlrpyvzF9tj8mPt+v2o5UpSTPidV9eehmzPJ+0a9WiPStPIGl3rU60x4l0Y
	3ULDK1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy0a-0000000CuOc-0rIf;
	Fri, 14 Nov 2025 17:54:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy0W-0000000CuNX-3ka7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 565936019F;
	Fri, 14 Nov 2025 17:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C3CC4CEF1;
	Fri, 14 Nov 2025 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142888;
	bh=Wdd4m8H94V0HEUG8X+Wlhilt+04J47Ja1Rp/HOiJ9C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqwR0FCN0QKUErLUhb3He7F2rZpXq7+jPj/RTnXwu4HzkZ6VFeAnZyfLpNvp/AiON
	 qFNWmuFX8AaCMQtTgIMwadNSMnCI5gqVuGVXYydMczkoRCkpSaWzHbo1qOIqVoBovM
	 bW1HYPtvLzzMU9WMeEohb87QaBbhymqUJ+0sUAnv8VDiHIlN6KL9j5yBtNrwsjLwL/
	 3jYi00/jfCwVm7MqgcbfTW1KFEW2TGKbjR1ou79oKdU2q4BHxBxdqAZWOJTGyOrDOm
	 FxnKXZZEtMj5Rc8JJXS/yYiu5f5L+i/FrEPvmceKlK5nMICb4cnfMcbJ88IBYR6ngE
	 ZztUsiTj3YUIQ==
Date: Fri, 14 Nov 2025 17:54:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: tmpv770x: Add VIIF clocks
Message-ID: <20251114-sugar-landline-4807f7aea78a@spud>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
 <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rif5lqzeUnw9k0G"
Content-Disposition: inline
In-Reply-To: <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
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


--9rif5lqzeUnw9k0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 04:05:11PM +0900, Yuji Ishikawa wrote:
> Add clock and reset identifiers for the Video Input Interface.
> These identifiers support two instances: VIIF0 and VIIF1.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v2:
> - Do not modify existing identifiers to avoid breaking ABI.
>   Keep existing identfiers for VIIF0.
>   Introduce new idenfifiers for VIIF1, following the same naming conventi=
ons.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9rif5lqzeUnw9k0G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRds4wAKCRB4tDGHoIJi
0i3mAP9BZ58ecSObGvNAeb+JOYPmq90PTYrAPcd7dTnM5cjFMAD+MjZ8JbcqgUAM
+iTdGaIZBLWumfgiZZnUNc5aoli9Ugw=
=yIFm
-----END PGP SIGNATURE-----

--9rif5lqzeUnw9k0G--

