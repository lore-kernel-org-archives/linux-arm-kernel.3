Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E918CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 02:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxmJ7WyU96yYKW5dN++YcY681T4WhD7DLjCiD9A4lMw=; b=QaKVjGeKNOTwSXWW65FBKJl7SL
	nqkBuUbTYTPLz9P+ayz/NFnqr/swOMmJzJ9Xec0SFBeD2/I0f2pRBqb6KSkeAy7xD/2+PMY0KTY1j
	4S+YoWdvc2+PLXel+MfdhW5CDXZz2/eyl5Sx9OduXuf2D8J982paQmbeR7gnDO5jSz738z6hnjBu0
	iiWB7immLHSQuE/He5rCqZK3hCwCpGGdpmaUiHWrcMc561FidpGApEnwC6337wUivhtmQkMKZWc17
	TLsOsDy7ZZGwhczeBPzPlmvHJZ8lp3gYwvakGscuIIeYwe4JBXwxXgah3/cCLfJga/utwpcDDUR8O
	nPzhXaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO4qv-00000009xpu-0pJj;
	Sat, 16 May 2026 02:34:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO4qt-00000009xpA-1hoA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 02:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 520C943E5B;
	Sat, 16 May 2026 02:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73CAC2BCB0;
	Sat, 16 May 2026 02:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778898844;
	bh=tC3tc67e1rjXFTm4a+YhTFeCUO8009I38itP0yRFXMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvIBi9PUWYnPP3LrOg9tJKZmzOvg8Ht38jk4zSpWK+cAwNU/86F6EyHglftCPSP36
	 7Lf1wuT/DMUALD8MsdgHlztc2CdIQa456GvdQuH8224rh05pDA0lHVN75JTadBFQkW
	 fJfaVKAGDWfF00B5OcUcv4L6XLBdMPsWRDfvlK7pAluxz/h/x3CQNTKjypcwTnxQsd
	 UxSwt1OcjA+fDt411NEA/FHJTuZ2rlDlN/767g+HlUqI1OeaUwdZ/WSM367fzhDQg3
	 kI9bTGnqJ8AECEFMwAkaSg+KuCCpmWDzcmwtD2f9BhK6lSh+gOoAjjEgFnZoirIuYa
	 NfAIOUB3xHOBQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EA71B1AC5A48; Sat, 16 May 2026 03:33:59 +0100 (BST)
Date: Sat, 16 May 2026 11:33:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu.pirea@microchip.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Wenyou Yang <wenyou.yang@atmel.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] spi: atmel: two fixes
Message-ID: <agfXl-FiZ-PN_cGT@sirena.co.uk>
References: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgBfB4Al75NmT1Tz"
Content-Disposition: inline
In-Reply-To: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_193407_466706_D5DBD907 
X-CRM114-Status: GOOD (  10.63  )
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


--xgBfB4Al75NmT1Tz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 16, 2026 at 01:20:33AM +0800, Felix Gu wrote:
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Felix Gu (2):
>       spi: atmel: fix resource leak on DMA buffer allocation failure
>       spi: atmel: fix DMA resource leak on probe error paths

This needs a rebase for current mainline, I didn't check but I suspect
it's conflicting witj Johan's fixes.

--xgBfB4Al75NmT1Tz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoH15cACgkQJNaLcl1U
h9DSqgf/SDvgELG0D6BD608Bqj/xKOajAIUp9OE8LrfZ5JvHQbD2bjmnozLy/ioO
dFsUzuZg1nBvofOv7dWBtU02vywfsr/e4jiHCJHkP56xMwFzbaOmZrgkWWoKi11X
tGOjT4NqNKs+cEd2TM3kNbdn9U4oL9hzkxi0RpXMLuoQ3z5y2H3WGWnTlDwTFZgp
6d8bsmlCva36OkslO9QIP8dqr7495k9TNo+32t0G156NON6tDZqxK4LZ9Ah4g6S1
lxaSQCzj8/1RMkuQYCis9/9VMlWTzG5d/2+Gi5WdRhJjRKot8YEW3CYbUIQT7OJk
Xx69cEkD8d3oQiyqzP8SBrNKaFfgpg==
=+a7L
-----END PGP SIGNATURE-----

--xgBfB4Al75NmT1Tz--

