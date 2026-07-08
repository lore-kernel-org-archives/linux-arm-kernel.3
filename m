Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CEDC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PrrRsYnh8HgeKwD8LeMPX+IopNgbVL9Xpwx9+ev7nQ=; b=dBk9AWJSeJ6fFtMxtB4eMwPNKG
	YIlSzVTQEKXVantLaA4SmO5etuprR3/VQqKIPmwfr9azhYPAZCVVIp53gEx42GVCD0Km11YuiHQD8
	flgIzaAPCB3wJO2yKvzQTR4phr6PUvRn1ae/fXIguwWnoXMUoN8roicQYUpz+WqfKyk7+9Jh4MvI0
	Av/zN3YoI0cipcyVmpwfM2CM3/Qkc5aJj2haB3nDVxorkhgH3qza68lvPnEoNxk6KCEY61X2Ah7p1
	XRc9aol7teqSP6MXXxooGDAK9F6IFGhPmPg2yvI6NtKP5ShuRuv5PyUgPNAQUWYfdKI2WisVtnqiC
	hWKMdfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVzs-000000005pw-1NN2;
	Wed, 08 Jul 2026 17:23:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVzq-000000005pK-3pk5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D4946001A;
	Wed,  8 Jul 2026 17:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DD91F000E9;
	Wed,  8 Jul 2026 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783531422;
	bh=+PrrRsYnh8HgeKwD8LeMPX+IopNgbVL9Xpwx9+ev7nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SEjhNR9J5TDpWhC9LGqqEpcORxWeRVOS4nrtq9fubYSZCb9ypg2k8jTxtzqewRCqF
	 UrB9umMF7wyvOmMzHcHI9+5Nzo4OCh5KmUXnlBldBCqueU5iECf/6+IWyMnOPu3v3x
	 v6O2ORiuClSCH/0YjLpSXg2ZeCIv09cCqUMXu0ciFYgyJV/fjsoNDQEyGor1N22HiZ
	 44WZYsoI3EoyrAUCckCCyVS0kLixLaW2+tDV1lHYwyhQeHHxjs8kRBsYLfwZ1S91Y8
	 ThkwKG2pO82UGSGtZXamLMmXxxG/LpTG4kFgdXfAn87yllUmfZErKn0DlpfrirqTUD
	 uvXSKhtZD8qlA==
Date: Wed, 8 Jul 2026 18:23:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: conor@kernel.org, nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	robh@kernel.org, krzk+dt@kernel.org, alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 1/4] spi: atmel-quadspi: add controller init callback
Message-ID: <550f7779-8188-45db-8de3-c25eda948cbb@sirena.org.uk>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TE0aoWDj9Btiv3j"
Content-Disposition: inline
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
X-Cookie: The other line moves faster.
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


--6TE0aoWDj9Btiv3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2026 at 06:51:08PM +0200, Robert Marko wrote:
> Allow controller variants to provide a custom initialization callback
> through their capability data.

This doesn't apply against current code (specifically the DT patch).

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

--6TE0aoWDj9Btiv3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOh5gACgkQJNaLcl1U
h9Dk8gf/ZWiafVMit4ybyk/QcKkGlLhMiMcvBEq9FzlhkcJu5qqJpsM70pjK6CX/
SlOTKs+luGUtZWRU8T0r2vjmQAghwTKWWo4iyvgSdGPYru8m+agD6/7CEi5BXLez
QZ3VBNcvSSBEJZuLtN9HLLDn95JR05wXBatohjN1cJIgodkeV4IRq8dtoqb6FUe8
OC3mPNq1Yohsip/UUixj1LeRWgBxoxi/F1gJgi0ss5C3w9bwbYvWNqob9YRumcK9
CCjEbYDYc5MSNnETmKtB5E5Vpe1K+1cYUGuvvE7k9BETM/kX5lkykPBqjGP6IBc4
Ly+sgd7CsD/vZXZvsuNkNsyE4hphog==
=EpTC
-----END PGP SIGNATURE-----

--6TE0aoWDj9Btiv3j--

