Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956E6C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsp/2HkOhD1k7gQWCbEYjx8EfuOvRgrKZ0WPvzuYLDE=; b=MDy/PTi2VY9w4/hd28kCoSc4Eo
	e6oDYQw8FOEHU5fI8cUKX274jfXM4mrQDu1Sg/sab/xZi10hacwfiQOIX4s6sWzqevGEJG14VlLAd
	qTlxx8MIJfir2Y34aX3lUqCitmGwaksgx59ruym7GGC3G4mbbyTT8z6eAd+GNtLcIukyoE/NzbGir
	bo9XqwuA9XnJb4Hnm4L0387idO5bl4Q1/4Tj8gG6PaddDONVfPKjZtOc7UEcV95wBgp08BiibNa8n
	Zccvw3R3/uwFfKgDXtkS4m2cx8KhP33CW322dYk92QY6VV5zHcO63NaHL/cJebpyKF0S/7OHZinWl
	aB6ZzjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZlo-000000098Bp-06nv;
	Mon, 26 May 2025 15:29:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZix-000000097tv-3vHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26E61A4F3EF;
	Mon, 26 May 2025 15:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD3C4CEE7;
	Mon, 26 May 2025 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273206;
	bh=nsp/2HkOhD1k7gQWCbEYjx8EfuOvRgrKZ0WPvzuYLDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYfWPrzAEVq2xlMExqWyM3762HiaUr83TQBQg81yAEJLxq5Y86EUZbp988F7R3PQ0
	 5eRwJWVAjhL8B9bY1rYS9RFpcCcay3JuXD7kfPb8HPMAloMKouQBVY6RssoGTiet6d
	 pHEW/ImgJTHBiyMr5c43GSQ7go26yT+emTVkFSYoIzUuVrqw3Ug+XeSTqzTVD2WVNq
	 4/iKQqMu5uV9lJWYYJ3kdn+h9QnboMlaXsvHl+EDMHXrSHzgdjKGTBBG5Y6oTHTuNK
	 qcSK2eQGFnsHbrkQ4xxo4R8qu+dT2ZlZdxuUjRtFODQ4O3XEPYFgYkJ0yrSW/VMrhK
	 MDRZin0taL5Pw==
Date: Mon, 26 May 2025 16:26:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: alexandre.torgue@foss.st.com, amelie.delaunay@foss.st.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	Marek Vasut <marex@denx.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>, David Jander <david@protonic.nl>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt-bindings: arm: stm32: add STM32MP157F-DK2
 board compatible
Message-ID: <20250526-stir-deluxe-2fc29f181bb8@spud>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tE7S4uh9hlKJ30MO"
Content-Disposition: inline
In-Reply-To: <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_082648_039631_69701CA5 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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


--tE7S4uh9hlKJ30MO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 03:33:14PM +0530, Himanshu Bhavani wrote:
> Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
> bindings. The MP157F is functionally similar to the MP157C.
>=20
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tE7S4uh9hlKJ30MO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSIMQAKCRB4tDGHoIJi
0hJeAQCHD74bR48utkhB7BQ3xyfSTl6/ulsrIxAPzd5sJjeKIgEAk9+YdBSEx6Bb
OvoijXGcEuzW5XduZqSczl3UDYGgpgo=
=VjKO
-----END PGP SIGNATURE-----

--tE7S4uh9hlKJ30MO--

