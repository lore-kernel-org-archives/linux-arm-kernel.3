Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44EFCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jszoA3XCxoEtB4stb7vyonPbCiXJ3Z9IY5HE7xxvGMU=; b=tnskT73KQmV4VscO/Bd3Krnh/m
	+zsXevKolpxi4whpKps7qP9R50OYaFA4kMQINenbNEtbB2iDMfkpilhilYZYh3pqye15mc6fp8Ne3
	2JplBRFc05+VjhUWWJycjmUDcolEfTzf4ZwiUvNGoZYbQKuSnScY2X80dtsQIkipXUzUtARvV+AcE
	LAiGoyWtYTezEoZdVhq05bMzPdvowrIq/bbxjaU4ob3A5f5Y83mcq98r8p7NjoRbRkMA+jrcEqM5O
	v+RwrLFEGopTv+C1XrPTj9WkNRsg5jtcT49Cxx0/UfFHFXcqnfW2Sqro6ojCu9rtrg3YYQzpAgDRy
	RJXT4UCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLmb-0000000A20u-2Rgx;
	Thu, 01 Oct 2026 18:45:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLma-0000000A20f-1k9g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 18:45:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3984602BA;
	Thu,  1 Oct 2026 18:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE571F000FF;
	Thu,  1 Oct 2026 18:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790880327;
	bh=jszoA3XCxoEtB4stb7vyonPbCiXJ3Z9IY5HE7xxvGMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bx5lrdCIg+vAvJPk6J/0iqL5iNVtxV++dvqOZD080bsbc6eEznwx51FWqT/zJisX0
	 a5iHZXg87SABt/v3AoiJTYpYbpayVIvwk0LsLDdkNwaKHc3nriFxEfO6sA+LpT1LyO
	 CZ30qzldXt0Cf6Dy4wqpCv0Tm9X2duT4S7F/Pp6EWeS3nBEhY0JDVH/npfyediK+54
	 N5dR4xowy0EYFL5RcvR20HqD/pH7I5uMOlpZVeRz29HRATTQHEYcz9hHsaRUXiCrRq
	 540XJjmrCPB9Qk5xb90Sdj4I7P4Hv1owfZUA4iFEO7ZFy4tvGmnmMRXzd433M8VrwV
	 WUe2+CzF9U1mA==
Date: Thu, 1 Oct 2026 19:45:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Drew Fustini <fustini@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 02/10] dt-bindings: arm: Add Cortina Systems CS7542
 and Securifi Almond+
Message-ID: <20261001-grandma-flashily-030cc6be668a@spud>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sNp4YIjOhCgaALYe"
Content-Disposition: inline
In-Reply-To: <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
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

--sNp4YIjOhCgaALYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sNp4YIjOhCgaALYe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6qQgAKCRB4tDGHoIJi
0v5eAP4yBla6FLpGOznfX9dVo72IldPw83rGqSIkNXaPkSEzZgD/dXKBTYNqJDTg
rDFGGX/sT9Dj75eyTgZov1nMilqxcA0=
=kdfg
-----END PGP SIGNATURE-----

--sNp4YIjOhCgaALYe--

