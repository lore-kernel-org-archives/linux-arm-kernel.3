Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22872C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a06FfY8HQw+5JKSBgz8SJqOwtg4yWyo7SVcQeCzmtrc=; b=0qrlAeldfPjwnPSz56GAJhe5/9
	VdoaVQlM1y+edEES8PB1/DXUGQ920AKIKUCWCekNnPIDDMI6sviX1yj+RH+IMiglP2WX/oPd4JcoJ
	I6SWZcENYzZ72nVVvF/i3Ht0FrisdV7B4nbH1RtMFtkPnsKA7y426VVadVYk8Wc63gwQJF3fq38V3
	7FFU2aAP9WLWe9GQjUDSgnY1McS4nr/hQtaPUf15Yichfh4JMiUqGcrn+MlZB3pAvz/DjDApN64H/
	hT54qRHO1jPv7jpYw1XXyKo2VcmUYIcu95Dit9JWeBuX5ZiI3p2AiAD3x6BS+VXraw/3HkAuu+USs
	sMp/Yldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtfj-00000003Jd4-2KWg;
	Fri, 16 May 2025 11:56:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtdg-00000003JMy-1v6g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 11:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0278BA4E74C;
	Fri, 16 May 2025 11:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F951C4CEE4;
	Fri, 16 May 2025 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747396446;
	bh=ivb/R1S6r2RO2WRrath55ToVi2bTf8rbS9vtwi1lNXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWjwXe3M258XeEQx/NbmBcjmqJ7f1uTyDlXQ1hblDuMdCyXPQTViOIvrIFqvhEZcP
	 UryIx2mMeA7Vy2QaXRHgCclneb503DWTx6mhc20hXp238ML3v8Yj7FH6Vz8YtPL5B+
	 Ke6PP/AfYtcTYlYf/Xgt5BiUmzhplJZX5dTOia/xloJwWpm3Ro6PoccZKmCuoC1hkI
	 KzuvvBZ27H+zPBvGL2Ms2PX4Vogmc0Mt4/+iQQFdobGHABnoJKkKJBLb6+vBYjAuNd
	 vvDcUto+TIodhXnQaO5zI/GYISZ6Anhwr+BtXyPoU/t1m8NR6M70gACSaR88f2xHqP
	 G+KmMrXNLj6gw==
Date: Fri, 16 May 2025 13:54:03 +0200
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock
 driver
Message-ID: <aCcnWx_BzfuLxZ9P@finisterre.sirena.org.uk>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f8trKPt590fsB1ic"
Content-Disposition: inline
In-Reply-To: <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_045408_558456_90262C61 
X-CRM114-Status: GOOD (  15.53  )
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


--f8trKPt590fsB1ic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 10:52:51AM +0900, Mark Brown wrote:
> On Thu, Apr 24, 2025 at 08:21:41AM +0200, Dario Binacchi wrote:
> > Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
> > By doing so, we also simplify the CCM driver code. The changes are
> > backward compatible.
>=20
> This patch, which has been in -next for the past few days as
> 3cbc38cf42ca42d2, breaks boot on i.MX8MP platforms (I have the EVK and
> Verdin).  We die with:

This boot break is still present in -next, and I've not seen a fix
posted yet.  Should we just revert the relevant patches until a fix is
available?

--f8trKPt590fsB1ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnJ1oACgkQJNaLcl1U
h9BzbQf/d3ddn7KIWiWYv5nwyTgmsfExEQyp3Lp5MbF71mb/UavAxr9ZsuPeyLix
mgUMGE+wP9XO5FI7/vRH7k398r/pYLdJq7lYi1FFie9L/eWwcYFjDAApLxuCJViZ
jEm7pQIi+OR013c2mVCTLByz3Ou7w4Ri4568iVf4+opqGERs0JD9Fr72mUGEz0OI
Y3m4sfZmr47hyI1PGVU/MXvcAmiTtHkrdwzGujJkoiX6cIe9lYPZ7yKnxdZ0jqUm
1CgokulV+6S1x0PWupckRCz/Apb//jW7/ciJ4shGOpexjKAxoreVm+WiWMZPSMDv
vE9T37v1qmm+YAZVaxu2bpgCrlQboQ==
=+wUm
-----END PGP SIGNATURE-----

--f8trKPt590fsB1ic--

