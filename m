Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA7DD48998
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0rwV5/Y0If2yPwnaZVdHGKfMasuN4iYLD46p7FkT6I0=; b=QsyOQMiWTxk0+UdpX2Pa7dW9ze
	6dUpmOEiEJ02ZmHzYtQpOtPK6Znkg4rzNkCv09BfUg7VcNUTi8qvuRmbJi6CU9+A2xsHistVhcgyC
	IESMJp6FYua0hzmUIdw2H97LZJFtjVr1WiaJmRCeoW63e/73qyt/JpN10qVUuDueEtEdcYa/s5c0E
	wcT6e0rWUTXTAaqAMc81JZeaKLGCarmlXgbtcMAWp6kAjchlHxvXALO/9JzEk4GV0wnvP2F+RQD4E
	er4Bvzxw6Sez8CllzHjV8+3nCKsRz/Nw0XmWIrYMTRPjy6z5COfpRME0MCWj74rhZ+OrYmGSaWNKl
	/NlC1Hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgifj-0000000E5lJ-1zSj;
	Fri, 16 Jan 2026 12:11:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgifh-0000000E5kf-3xxw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 192FC6016F;
	Fri, 16 Jan 2026 12:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF8CC116C6;
	Fri, 16 Jan 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768565480;
	bh=aBdjzpTtcZ0qI5CFPQSxaEtJCSirsILmgGsCZ2lTJWg=;
	h=Date:From:To:Cc:Subject:From;
	b=oLnHl6WG/A0nXEAeinmh1XWCBJCoL1jQ+9hP3DCxyQaJBaJjEqohNgOy4PrZa4r2x
	 g+1MYdXDhI5/fUOtnV3chdzvMX3w9aK1y33uvRUIxXeIE+qkP8FDFE1tbrBYYkRRgu
	 oM+oVlwf2BoAQv0OyUsPHsrVg4/lDEig6NV8FRPgmsACrEtIrI69VQPcnbNwmRzdZy
	 G1hd979ucpS0x1Scn8ZQwEPdhG4J5tkm9J1AXtrx9CCYlbQTqXZyxWK2G+BNKw5Fn+
	 fRGxhFj+L7kmeyM1PANJe1ye3rh+vt1nX4D5BAbLMl980Uai2YkcgqSF9eSoJp5qA4
	 TWtZJ1hQO9Lng==
Date: Fri, 16 Jan 2026 12:11:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the arm-soc-fixes tree
Message-ID: <a28b9f46-c0eb-44da-9555-0534f7ea6eaf@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IUSLUm3ia2TJc8nT"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.
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


--IUSLUm3ia2TJc8nT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In commit

  2150467fc61dd ("Revert "arm64: tegra: Add interconnect properties for Tegra210"")

Fixes tag

  Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra210")

has these problem(s):

  - Target SHA1 does not exist

Thanks,
Mark

--IUSLUm3ia2TJc8nT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqKuQACgkQJNaLcl1U
h9Acewf/U6NL9jU73dD9EFyIMJR2O8crW//rETggk/uIKDwSoGbHF+Te70MPu5BS
9tB0wpRmkEFLNE9/UUUD1UfQtEakRzieNuc4vm6HqIYeDPcTDXszIHeWP2W6VCqi
IPZHIirbWV+3/y4MC/a4Wu5h3d4duWDWMWyC7KnMpwJZJUKTlM6TYsd5FSZFXu29
aQWqoQwQ3D0cJnNvanPQQ7uCrYBvRu0c1kbXmbYrUpOmfRH1fGxm4Re9jVW968gm
D1Df6p7SUpDcE14Xf8KDeTBCi9aDBXWB7JC4po0YNNTg4ZW25HsmdkAy172sg/6W
5nH5ENK1iKWvb0PNAJp+TycADDa4MQ==
=xXHR
-----END PGP SIGNATURE-----

--IUSLUm3ia2TJc8nT--

