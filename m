Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFED9F8FA8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o08zvgVs/uglGhM5GgyiOdyS8YU6TA/C31x9P8r6wxU=; b=sE9DVaMc0ha+d5p7RsKNL/Gklq
	qgD12RsHtsJXDfDyxWvt/D5EPvJjHsSYdSPi2C88F9YcYfbcUjnJMs9b/jO7JyzzKn58fiT4COXnf
	h7hgIhD1B+26ptSHTcpXLc+I9cGEAJppjCyeAR/AiY7l8bTHbQAF90RtVTAQUaL0VvfDVwiKqxdJQ
	yGCf5lErwgEDTRuRvPy/XsM670yZv0ukeWuixNAgPT1cNN4LPgngrmO52QfLq/0MQ8eQd4S9QK5W0
	35yTT/z6jjTyk615y6y1gw0mlFg2x71eeCmrn3BeynPaB2Uylimp1aSWZ2Y7Mp+9Ik/4+y8IC2wbo
	o/uVORIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCYV-00000008nZ8-2gVL;
	Tue, 21 Apr 2026 14:58:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCYT-00000008nYt-3lpX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59D5B6001A;
	Tue, 21 Apr 2026 14:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652F9C2BCB0;
	Tue, 21 Apr 2026 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783505;
	bh=o08zvgVs/uglGhM5GgyiOdyS8YU6TA/C31x9P8r6wxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kR3atssmQ+T7d/q3/arTXviH+DDAiikosMNgJN8PZ7Z0gzzceXyDYgY4P39L74WmC
	 TldUt5KoWJ8mIptTD+dwLnBisWpD+HyIw6JgQbU1Q4LOCoC7AkQkJhmCxVtJ1XFH2Y
	 83Ss6rgxmGf4R3wYMjfDrMPrdQ/4kVfs+o95tyLqXP1c61n7qWve96J8dhLpJrXlld
	 jRy8Y+hdPhwX11z09iCK6fvoEWqu9p2YIf1O+GF2heWOUz/IxMC4ZduhhoGe2sGKkA
	 aOfo5iCJ3c/ac/W/AME/reFI3d/MjwqW+0oKht7cLI4oVmCbCmAqY8BQtsxZJkT+nt
	 ytHwoRUzKquZg==
Date: Tue, 21 Apr 2026 15:58:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Add POE as a feature in the signal
 tests
Message-ID: <e9b7591d-9b8d-4e76-9c0c-814507a95fdd@sirena.org.uk>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-3-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gg5tHGD+6ZP7azO2"
Content-Disposition: inline
In-Reply-To: <20260421144252.1440365-3-kevin.brodsky@arm.com>
X-Cookie: Jenkinson's Law:
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


--Gg5tHGD+6ZP7azO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 03:42:50PM +0100, Kevin Brodsky wrote:
> Add the POE feature to the signal tests framework, to allow tests to
> require it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Gg5tHGD+6ZP7azO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnkIsACgkQJNaLcl1U
h9BQ/wf/d+d8Dj4exxJCYGsm0nHnz4H26nZTo2KflCuh6+B53Zpb5XAtt/TCll5C
NAu/LWNLwOo9pBjFv/W59vH4+KUtMGrZcat3T/TWF9tMc76ROnYvvVpVvkHS9rzF
WpL2q7M6Rz/eJTXQz3Zhc84+B/NoC4/UzDLSarO05ERYX8+uhfZjzPb0NOexpqFP
v1kEUdp++EsVSoOvWyqpqTiRNuyYQ1WDrSWElj4/IpsSePDaD2EdFIeUaD74n0uY
Ib8Fxyw4m+sj7a59r5yPVvxE0Gp9rfFfCv2S9jB9plqtyIrme30PCUnBWI0FfGBp
6NoQiF/59bK8lU2W276mTqZc+G4oqA==
=r3w3
-----END PGP SIGNATURE-----

--Gg5tHGD+6ZP7azO2--

