Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A420C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vvmi+6NqUwT6UVM+IiKBQH4cBijiUNMG4llFcTbvbEc=; b=LsxKuCpRzVAWI6aFiGh7BfKTpG
	aJQD8hPPdMH3QPAFcwe0nmwteOYRJPqoGWB9EG3PXTQDo/0JieI7rCFW0n5gO+v4friPhqZc3QMhR
	L6dMbSQC8XbnYr8PB32An/kHn15pBAdL0vmjIucbFTQLOSYhJcOBFf9tep+6iPBG2x7cBOHRtazHl
	G682P/CHd9r5cWJ/ziykPDlg6aAS99uSd8qyKsvgkpKH3/mJwvygEvahvLi/yh2UACMlbujUDe22b
	S4YuNY/+FL+jfj90W2tlPyAZeul8jYNmM1io8OsUbt+nzS3tgJZLDP3CqLXh7KzJkq0Y/dmXOldqI
	18bdAWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rg1-00000006yx3-3Uew;
	Mon, 28 Apr 2025 16:49:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Re2-00000006ykZ-25Rd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Vvmi
	+6NqUwT6UVM+IiKBQH4cBijiUNMG4llFcTbvbEc=; b=kpGURY3uzif6VuK+kyRm
	89QaCGaS6K8yCm3Tqrvx/ts53OGgWWMpg5iwVgbnMFFq6XRjCK2FLDj+TF15UpjB
	26tfd0+lnqCH2PljnH54tFEzHl1ZbOymetrPJTAg4nn4e3XrhBo8eimTnQwx2JKD
	jrOwDoAGhIdY12BUik87X4r/0OEzYNBBGIqF81oLwDh9bl6iLwf69q+tunTkJNF9
	ThRuD8p09MFf8hIN94ODLEEWkHVZ48l3WddJaEcsslCUsTPHz/UR+N+Jx3MyV9DM
	XrBVA0Xv1R+nj6FDAn5W1ArwAOF34ht+g5wTRYAFgsbb5JuuNS3ucNtBFVKZb2O0
	XQ==
Received: (qmail 655409 invoked from network); 28 Apr 2025 18:47:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Apr 2025 18:47:42 +0200
X-UD-Smtp-Session: l3s3148p1@lN5GcdkzvKMujnsd
Date: Mon, 28 Apr 2025 18:47:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dt: imx95: Add TQMa95xxSA
Message-ID: <aA-xLX_O94O_U5Mt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
 <20250428135915.520432-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZeKDCrC752Annmk"
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_094751_388317_D46823AE 
X-CRM114-Status: UNSURE (   8.70  )
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


--GZeKDCrC752Annmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Add initial support for TQMa95xxSA module compatible to SMARC-2.
> There is a common device tree for all variants with e.g. reduced CPU count.
> It supports LPUART7 for console, CAN, PCIe I2C, SPI, USB3.0, USB2.0, Audio,
> SDHC1/2 and QSPI as storage.

Dunno why renesas-soc was CCed but since you are here... ;) do these
boards support I3C, too? I know that imx95 has I3C cores. Just out of
interest, not relevant for this series, of course.


--GZeKDCrC752Annmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgPsS0ACgkQFA3kzBSg
KbYByQ/9E21JI/F6xpffslO17ZJxZuqDRJvwSI1lSeogANMjya+V231kLEgsll19
hASbEbCsBckqC14BKUOlrCXjD0L9JUPLBOGTfIzmF4u1fUgimZ4i1vvEU7Q6WKLN
Q6GCiHsu0ES+1W/2fTR2dlrIvGwBjhtvxqN8m1l/OlishK0gh2s/SQWE29CQnPUd
vaTO5XSgzaQzZBXUXRYq32iog1HJsAzS8aS7e+aPCTiE3iHCMNIDY/596SwEVWW8
TP2FcuLfR9XwZLvwywOE0vIC9dRiKWSWlNmeBGvKbFXEdd1N/qnyKAvZPWn8PDC2
sSlwUVm4BBtgCuRcQ5pNs5ijQIx9wE+f867O4CzGKeaJHP5Y4oI3pB+UqcZNAgT7
DTPkD1NUV4t9FgLBD++mrM1M/5DKbofxDq1nz8gxBHQyN4nfo3AmpH0miFul5wuu
Dn5+rv9VlcAm79Y9agZmIZwh2TNyQw003dnQKnH4SqGMnZlP/3Cp1Glz1zZwrvie
6uRWvR3ipVKbYxFtU13SORJuPD3WVVGIlW6DXpBAq20zXJVfGfT/QGhitVX5foza
U0ApCs2qrCUPaggr9ffNy/CcP9h5l02YjBoMF8B6SdQQEceQ5KTy4fKkvjkbb2ND
27BFUL1oeadruvaPA8+RuB/wScC++9kEjrV3IPitJ/8irQDgnGA=
=lP6D
-----END PGP SIGNATURE-----

--GZeKDCrC752Annmk--

