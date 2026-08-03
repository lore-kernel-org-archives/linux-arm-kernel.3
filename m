Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBCBC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plnJ8BbmlRPMSZORSJnXKsHzbaveK/NmnGipN6gocjg=; b=qY8ga5xIoKPjyGhFssMo+d9nzD
	V0HsoYwHuxktNgoZ/tpHfdkCvRfK4BvB4JF8y5g3Fs+QkkR0K21uqbEkbJSNZG9dx74IHPEH1d2ZQ
	kdC3rvBxBUN46SRIkFN+e3GuiaNOEalCQXK7KXlTZrUnYS1lSyMUmq2pUCGUCPR8e5fPuQhm4/npH
	JcVWHhrxjcJ4RrHprQBmJjqCxbtuziPOTC8L4sx7tgmk+5ol3v9I4uX4log4QTa2hfUkV5EbzTQy+
	xk5VbSsu4BKdUxwXy+xMzjiZy/ww679PJXeqsr9wI1cC3JEaeVgAl9710ZhengTwjYypsk51g3OSy
	ELBa0nKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrop-0000000H1v0-109L;
	Mon, 03 Aug 2026 12:30:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqron-0000000H1uq-303Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:30:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D89A560A78;
	Mon,  3 Aug 2026 12:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E831F000E9;
	Mon,  3 Aug 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785760256;
	bh=plnJ8BbmlRPMSZORSJnXKsHzbaveK/NmnGipN6gocjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j07AiIBRwfplAF4+BPjD9ptcTBXIzqzezrLohUlp67oAQaBkOaIRjlKIRCS/zxpWT
	 BpXxXj5JEF5phQz7IQ2YBHgB+L9YN7j829JdWj3k7n9HkLbuws59SKndPDsMcF1WMB
	 xj76aDasV70Bf7ShniB9S5lri5p+Ly9SaluPd3lQ8PR3DD3PicHI4NmEAYiLs4H7yf
	 ThNHXVFm0YIgrfKs4eDOOOmwoZ5hAMOgl6e6USjCcp9wbn+tRbiPzn34MH7Obe7oNf
	 ALX8vCQ21nsaRxKqtlUUmi+vVhYH/rX5JE7yp962X7UZTiPUuqoAlqVCWP4nwkIp+W
	 9DtnRBzVgntiQ==
Date: Mon, 3 Aug 2026 13:30:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH v3 0/2] spi: ma35d1-qspi: Enable GPIO chip-select support
Message-ID: <edabced4-b7b1-4b2c-a358-d47e4b7e8e9c@sirena.org.uk>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AWRhvsoPupBsFgwE"
Content-Disposition: inline
In-Reply-To: <20260803074913.1656675-1-cwweng.linux@gmail.com>
X-Cookie: Prunes give you a run for your money.
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


--AWRhvsoPupBsFgwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2026 at 03:49:11PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
>=20
> The generic SPI controller binding allows GPIO-based chip selects, but
> the MA35D1 QSPI driver currently supports only the controller's two
> native chip selects.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--AWRhvsoPupBsFgwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwifsACgkQJNaLcl1U
h9Dn9Qf/bSsUzn62duJGPpvb13LHWgFo49vaM5o/K2aqsWO18YnTykBSgks0ISbL
lgn7sVTDvY63/hLe01Yl//Gj4Rjwqmy4hIBBMubhvvKO9XFDg5jMWMnsetEYISAu
FPwaVGwL75kXjIN80AZ/wJdDjbL7M30wT5/+PDSfsaC1aejh0zeQcob2R4Udjte9
AGl1Bq+z0F90LlY2rwGX6I6vNRx7vmIxvdIedaRImF1U157TbD0YBlu4dQ3lIRTz
WDoDFCYFseMGZuYz5g423OtVJyoFAX1RtesMEYt3CMxOyh8+mP4YR9OJXM5EV5WU
pawRqimuEHXWBo8OmLkDVrwjvnzupg==
=SfVA
-----END PGP SIGNATURE-----

--AWRhvsoPupBsFgwE--

