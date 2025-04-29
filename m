Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E60C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK1LxpKQWLrpOtdb/yXNbzjFAGR06bSEVt8hgnhnoAE=; b=BY5JewA2OdJJRAsnEybaOOJDLm
	GiRjuWYDpeWgn/zIKybMaou/lEwx3hdJYIQCnv7JEBL3iiKGCNs2OaA94pL+pm/9Li91HW02E0yH2
	MZgBZgt4tI0FKahJsd5dCZKGnsWm2GA/437fWXSxxl63Yg7gDNFn3beLQDHjgXDAmXXrU3C1Aqu57
	GZLM/mfOrwRMSX5ATudcwbkOUXm5GPCfPcVmGuKkwGnW3X7WOkCo2BqNTZlybZ0i9t8ImHMiOsbTo
	jq06Lb6KraM66LlzseWBkOGHRQj+2W1CUUFP5hNdL+r7s+znukSilFqN0Y+0BEs/+/T0gzEA6Dfxk
	tVXDUZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9efu-00000008cBe-3eIt;
	Tue, 29 Apr 2025 06:42:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9edx-00000008bsR-39dk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OK1L
	xpKQWLrpOtdb/yXNbzjFAGR06bSEVt8hgnhnoAE=; b=KEf2JZLCj2HuGJOe7M5U
	+nd0UyMPy20wl06TeFlmDBpyRjaYg88CnXHYMr63y6rCt+wX269jJ+ktaCF73br2
	tRS3aYI6m9TuDQ19TtgXng53SJzPYY8R1Lt8gtI1ZWY/RCPPpVr7E9cjFRYNH31a
	WDiyik3WPN2afr6LH+/Jn/Edf3nbepR16yaW5kOgfpSDwm3XY69xWdjDqt50K916
	apFD+q1JF44miGVk4d7z/OiDk+gEPuXholpGzN8uI/gaaF44xRj1eV2Cs+MQh1FK
	AgCziqQ5roPzs8MpA9brPsNoeHZyg8XId+8/C4WSiwphzieLAcgkpzUdr+LKYRHF
	mQ==
Received: (qmail 144601 invoked from network); 29 Apr 2025 08:40:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Apr 2025 08:40:33 +0200
X-UD-Smtp-Session: l3s3148p1@HYXUE+Uz+KIgAwDPXxyAAIlRla1HkD11
Date: Tue, 29 Apr 2025 08:40:33 +0200
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
Message-ID: <aBB0Ydxwn2CM_uu5@shikoro>
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
 <aA-xLX_O94O_U5Mt@shikoro>
 <2436245.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fp/22maYXv0G6Ljr"
Content-Disposition: inline
In-Reply-To: <2436245.ElGaqSPkdT@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_234038_063037_1B3B03C0 
X-CRM114-Status: UNSURE (   8.40  )
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


--fp/22maYXv0G6Ljr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> renesas-soc gets triggered ;-) I'll pay attention for further patches.

No need from my side. I just wondered and can live with what
get_maintainers provides or I would fix MAINTAINERS myself.

> This is a SMARC-2 module, but there is no i3c interface in this standard.

I have a SMARC2 module where the I3C connector is placed on the SoC
board. I guess SMARC2-AFB could be used as an alternative, too? Anyhow,
I was just interested in other easily accessible I3C controllers, so
thanks for your heads up, even if no cigar here.


--fp/22maYXv0G6Ljr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgQdF0ACgkQFA3kzBSg
KbYQVBAAgqruN/Q2VapjP1qtFf8cwIZaSwJLRL0JPe6iDMa22OdQbli0Py4Fuawj
HY+W12EgDozfyGlKV0iiSfHIzKdd/mirLaYbaQdBuDe/NF39E98X62r0hXS+g8jZ
wPkCR9qefuD5VkblOKXdRRgTfDDQfz/u89fFlRr1Vo3UmPNi5LjmYh+E8WWHyXuO
JYsSRN7CiuLz0aDapOAXSrx0oqI9Z8AAY2veQVe3DW5HyOFFelk/jyddnc5n2xIX
x7wSSSbg8O7Ijj42Sf9EyqyBuzqMkWA0NeEHif10czDH/OBXT0YxVXYnXNpkHIlU
GKf3y771W1MnBP48VxTkC0zaceBKfdTzwCwygGV7YdAUGnB6IViRn6HSqEmDM1jn
EdfCYwDNQaGk4PQEM6WrfEI8H7EG38rDPweT40Kt7s8NfSM2jri4xe7k7Vvksh1G
UmRcjTO0W5i0fuxOpKnNm0ken2g9QKHziXvgWjZoqFZqrif4RlA7pgkqdFRL3sTx
gPl03UUysBRgCo6NQFp263fNX9cDyKGEs5WFCQLbPrPgYtANPnGnbdQI+j1uTCgu
YAlIGyzpKljLcljexmnRByBzH9P1Vt7tSCZysEXyS/rR3rd+sYXfGgoYkQCOmX3N
7CTz6ANde89aX624v06mT8/HUfZb8SnvVL4LQWPinntb0RZZ+O8=
=msAp
-----END PGP SIGNATURE-----

--fp/22maYXv0G6Ljr--

