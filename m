Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20DECD996
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1aRmnTZ9JGNwcFLWJE4ysYVCAhOodfQWsWXS0KtzQs=; b=qklfx1QDh96mb4RoGK6Ksk8ApJ
	4tu9I9DpVnwsneQ/ZF1TRM64rgAylB1JFrROq+QNa8k3HRhNTR+4mo2aQLZ7k6sqmdpaluuNT9MTx
	Np1AFxxvz+GlIrei+dnK4c5T9m+TZTbT40pfe61fZekXLZuVJuOG09YT1rzN0g0FPb3Fhbfyhgqrz
	1vjRkZcnsSHAK7bz0ZKevxRCQrB0ZUFoOuxxvnwJ91Bq6JRPN0D+88WWx9pfIC+5v3SYoth7CBDW4
	E11LItPKFyUQYpjOMBEcfNp8tXUJS6/fw/XPiVnwxIYWqjzvReR/b/AqopTnBjdlsOEQ1Y1p1sPhe
	8NvHaLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4IF-0000000ANQb-1Z11;
	Thu, 05 Feb 2026 18:41:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4ID-0000000ANPj-0V93
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 18:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D4A743E1B;
	Thu,  5 Feb 2026 18:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3131C4CEF7;
	Thu,  5 Feb 2026 18:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770316887;
	bh=z1aRmnTZ9JGNwcFLWJE4ysYVCAhOodfQWsWXS0KtzQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXHWbn2sCaHnxqNSOeZu0v/Oj7bvNvrT+0v8cHk1KGjf0RH5dbwpvEbNWElgXJ1h6
	 ADOByRiZSHEzkOJ2h/2ZoUvnT3u6BPbgdKzPuRdb8BoCAUWj10pW0B5ul8YabwmC+1
	 fj3aDCGfYv+tnWSM5sVnRNUpV3CRj5eYL11OGPY1gMVD9rT4jOJBKmq9WOXBoVK0r1
	 UQVSmA8Eo+ipkR9QgvVjn5kHCVgJ5IQROrmT5IVjR4JyMy4UqAcRrqdbPzZMIpETck
	 0J0Myn563aiQoQeouXaIyS5/yDCEUyBm960r5nEYsL47HS8pw7bamrDO0Ur2T0QhX1
	 NYNO60rY4bKhw==
Date: Thu, 5 Feb 2026 18:41:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add Gateworks GW7906 board
Message-ID: <20260205-dispense-spooky-20a5406726ae@spud>
References: <20260204225020.2039367-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aFdS0tb7fAq53oNb"
Content-Disposition: inline
In-Reply-To: <20260204225020.2039367-1-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_104129_182362_4C95A2F4 
X-CRM114-Status: UNSURE (   6.98  )
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


--aFdS0tb7fAq53oNb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--aFdS0tb7fAq53oNb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTkUgAKCRB4tDGHoIJi
0qusAQCXy++/D4Wc2H82NMANA2D5GRfbNN8XIX25Bn+vT9g2tgEAwAKvJICMB+ju
go+uID6wpiZujEeLfsBt+n7pwgIi5Aw=
=NteE
-----END PGP SIGNATURE-----

--aFdS0tb7fAq53oNb--

