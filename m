Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C00EC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8g9WvwbCnopbVS0TZ7r7XGLH05jg43Y4ARU0L44a2Q=; b=Ooh+dBSeQ+btOGoKlGRg6aDklm
	GooHL9BH7w9ZNY0Pjt+KDQtB1hpGUo8i17w95y0ynhs3IB4mmWzQ0aJAtmdFqI3N1aPBNhSHcDM0g
	Qbto2FkzqK8or87iG3LwfF6HAdJw3Q2OmFOzD/M/4QxwYHHBZHCNi0UenmcvAETDfu1WhanDWSoOL
	z19nvnh6MV3GSzvkPXRbBv7hbF+ih4c95CN5GjQKcZKt1ANf0uqw1Sb95C54ndtWT0Iixw0c8gIEV
	Xvt+yROKI1AXqxPNXLi7MGVFvIR9/b5Vg2peWKzBEgqh1gYG5AjhVl39ClkRnH8rn+CX9eX/oJWZp
	vxdPyzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEUY-00000002Ma2-1TXD;
	Mon, 30 Jun 2025 13:24:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWENd-00000002LP2-0gUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 873375C5D4E;
	Mon, 30 Jun 2025 13:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA4EC4CEE3;
	Mon, 30 Jun 2025 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751289424;
	bh=k8g9WvwbCnopbVS0TZ7r7XGLH05jg43Y4ARU0L44a2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A//kAHvqiR/9lBxy6BGD5ThUBrzqCnUf3a7UdUkl9Z6ytkKYXLjFRs/2O+2xxHuAf
	 7HGserKyCUtVjFxiaUnKervlLqv5ggZ7tnjH1vFd6P0ScdLse8zN0NDHBYLv4YVepM
	 nE3cXo4ndN40ZcqTRSKb3hbm/ykfA7EeIf/c9Wx2+S0CBKp2jXUROs08GbSHr/+aJZ
	 k4DC3EQM0fJ9QGsXloa53a/xzYsHlX5fq69A0AyOaL2jtlU/lExB2e6OrhSzocicE3
	 nZVyjatVehAGEr9j7L/AgC5iMzd34fi6RfDcyLhCrEufYWntJvxkUdTSuBIyfGqAzA
	 33Vs47G3ysrtA==
Date: Mon, 30 Jun 2025 14:16:59 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] spi: stm32: fix sram pool free in probe error path
Message-ID: <1170cf86-b76a-4462-89d4-472298cc4034@sirena.org.uk>
References: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uhQ8pZKGQFQ+/8bQ"
Content-Disposition: inline
In-Reply-To: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
X-Cookie: Say no, then negotiate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_061705_239534_28DD1062 
X-CRM114-Status: GOOD (  10.44  )
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


--uhQ8pZKGQFQ+/8bQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 02:59:23PM +0200, Cl=E9ment Le Goffic wrote:

> Changes in v2:
> - Add Alain Volmat's Acked-by.
> - Link to v1: https://lore.kernel.org/r/20250630-spi-fix-v1-1-2e671c006e1=
5@foss.st.com

There's no need to resend to pick up tags - maintainers will do that as
a matter of course.

--uhQ8pZKGQFQ+/8bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhijkoACgkQJNaLcl1U
h9BMHAf9EmAOHlF+CSGEKHuxUPbjf2T1MfR26EqamIjCucvKDn2DKbNjugE9TZpt
1u/eBORZpXpMHNBtfNDaarrltt2zPOo7WTcqH7/bt7tKPHLvay42Vm3voCGUUwDS
0fSupWmcZxuXnSvFPEZs9UtFqWqCSnP7XI1nReImwlf8dB4EV/8AIEW11bjRPbZ4
lGw+kBsvhrW8WwUykgdg6xtYXBrCc4WKJAAC4EdvCVlUqKzryrGUb/Kzj0vl0DZb
6NGZ976iCyZuJZjRCxLw/0MF/hNwE01GyrrKaY0QXJcsxRIlDYcjxwr4YDtYFt/K
38sEAlJp4ATzVFTK+vvrcKCyg/5wQA==
=eYhh
-----END PGP SIGNATURE-----

--uhQ8pZKGQFQ+/8bQ--

