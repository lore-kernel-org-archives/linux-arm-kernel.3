Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098E3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDqV3FE/QURKj47Ug9qhhO3Rw6xeNdaWbeaJ1FuMeXg=; b=BrNakjYGIUins2c+VTTFY1XMgl
	JI5QIdIVxSF91LaS/fvk4+mT9tu09p7K6ulWXini+nphcD0SpYnb940TyP3eCU0GP6QVY0NwLL+Uh
	+veLTOp5bo+55t8KWy7tY0byei1cq33/N2QD0e2VvPlDxU/FSZ7XsZHpwMtoUpD2GSt1JSOaU1WoG
	S8AIDG64V73qVYywFtiS93uM9krdo+6rGrb3/sCVlOyUoXldFvis95lmNxO6hOZAZU9+47CQa7YrJ
	g0fJNzKap74jHIse+A7pKDQWRYLmnMbyi9y7ek8ahzyWCbBVyfD2WhApsSyWhhIF7BL9AHxzRxS/z
	/6ONDgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgbm-00000007Y0g-3zfu;
	Fri, 03 Jul 2026 16:19:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgbi-00000007XzR-0OQG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:19:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51C52600B0;
	Fri,  3 Jul 2026 16:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6131F000E9;
	Fri,  3 Jul 2026 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783095553;
	bh=MDqV3FE/QURKj47Ug9qhhO3Rw6xeNdaWbeaJ1FuMeXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/j4ZWUrtxifnX8y919J8kuQuU5DEj1oB14B6kihoAoypJZRemNaeQiPADNdNsyYm
	 BKOCus/eZWIPGtPhqVi4YPlgvopBcbw1dilQiwOzO/FYzr0DfSHgaj6yNVGY3XW+U0
	 u2IKQRCJPgCVFB7HMRVp8Bms73PRBDjuC+Jna+HUsDOJXbhlxA74ZekbcfutiNkFO1
	 QMGAOrkyEpsVLwoDKqWVEIEFA7qYSS+i8Ns2MdC5hJfWNfyRAZwHLzOYxKigfjn3NN
	 M1Gp70mq4T9ehJKkvaOroeS6O8RhG5l456YtAHQcErARJxNPRQZCjY5+Ne1fQyXTuk
	 C4ZZaF2jOLRag==
Date: Fri, 3 Jul 2026 17:19:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: apple: Add Apple PMGR misc
 controls
Message-ID: <20260703-acre-buffalo-815de034999e@spud>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-1-4b26ba10c5a4@chaosmail.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ew3fU/QzK+CdPJ5y"
Content-Disposition: inline
In-Reply-To: <20260703-pmgr-misc-v2-1-4b26ba10c5a4@chaosmail.tech>
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

--Ew3fU/QzK+CdPJ5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ew3fU/QzK+CdPJ5y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakfg/AAKCRB4tDGHoIJi
0jYaAP0aSmWIipYQoz1Y9zbqOWoAnynQ5pXZqcKDuusK7Hf54gD/SC1++acH8F08
FMU2DVs0tWppBFT9gNOmErqDtSCT+QA=
=K5Z3
-----END PGP SIGNATURE-----

--Ew3fU/QzK+CdPJ5y--

