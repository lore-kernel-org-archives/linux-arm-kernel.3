Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB89D1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDdQS5UtFU7AtBRuLdWdFBNZl4OV+dOhnpohLwxJ2Ow=; b=V0BdxiPa6pEiWFdgL5j82egbyI
	tqdVmctv8n9NA/EftkdPjbeaT3ESDsI6UHMKgR12QMMs8zh1U2yeWqFRyVt9mWExV4MWSWwzrojFn
	KM1WtO9n7rFkZ7XqiK5WocFljKTbB5bRtdJbs3kAYHPwx2h78zwUQSXQKWWARTlfQ9MX5UMrP+IW3
	fyJ7yT3tzNHhI8/TU2v34IfVDhNPTtd4x5N78/Ja78vbfZ3B5gs+PN11qMfVCTOhi34+qSIikTTuj
	FLor/VJlGcbLUSa3oTBN5SYn0ybI4KHS1Flv6j2isQc8Lfa0vM7sgZ5I17m//2fAazZVrNGcfzTQi
	caDz9Xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsPr-00000006ynV-2ePl;
	Wed, 03 Dec 2025 19:21:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsPq-00000006ynP-1v4f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 19:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F86B60125;
	Wed,  3 Dec 2025 19:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2348C4CEF5;
	Wed,  3 Dec 2025 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764789689;
	bh=V63zii9WAHiLseuO6ZjsrzUYXvgY/8V805sW2LY+4BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCknPf8kDTeiQpZhfNkOAFDK3isFPN5CL7tAwvlj1M/4btYWuS1uvjmx53O6/nYP0
	 eZZ2BSGPQN9XdXmWe+8Nr+697uixuR5f2ktMFVCaLOiXV1ssNnDD+KVJLJZ2TmWGKP
	 twai0DFalMA3+VGGZ/nQ4yUjUqIkjTe8qpaceM5yNm4+4jL8bmQ1IOciSE+mwWVhkZ
	 LXDwEBl+Xd83xlX7vjXFkAti2XBF5ZU4NeQLg8WpSiy/DyI+pVCURJQSL3cy2emuWA
	 kIiFMo9X0TJoHx3iAkLKLF5QY7XEP09ND/Gg8HSas8al4Ne983RrNKePR0SlzAs92o
	 0GdAFyiTm50jQ==
Date: Wed, 3 Dec 2025 19:21:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
Message-ID: <20251203-splendor-cubbyhole-eda2d6982b46@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ET9xrF7s1A7RN+E"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-4-robert.marko@sartura.hr>
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


--0ET9xrF7s1A7RN+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC, including the EV23X71A
> EVB board.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  arch/arm64/boot/dts/microchip/Makefile        |   2 +
>  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++

>  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++

The majority of devices in this file are missing soc-specific
compatibles.

--0ET9xrF7s1A7RN+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTCNswAKCRB4tDGHoIJi
0rA0AP4or35grwt+rLpraGPWhvfXrPsVtnxoUd0lVRk+9k6VRQEAz4etwr/EV9dg
u76bUeDR+ziZjCqiYosXS2s4u4UzDQ0=
=QLRu
-----END PGP SIGNATURE-----

--0ET9xrF7s1A7RN+E--

