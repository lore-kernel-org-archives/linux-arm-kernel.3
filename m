Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6253BCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUTFqyLsRiUw4+Nvp52DmyRLNg8nvrGqeV2q6vnRQUw=; b=ULofKsZPK75ORQrfeYL6i0i3gW
	ynD95xTLrcrS3UiphoHYl16Y7aoVElpB9b2MgQsQRtAqRVXFSFPmKM1q1um6OzdmFNbfRzfZTO3QK
	ifPkCtlbLYOuTEtTAi/GgJ81GcWg+Vwbz0wSMZflsxmJHEq07yDPRJ48nOfQlkZRbTFu/hxGGL7j/
	MHLmwvxjvGzC/UqjCxTXe2P5tdG0WCPVXuPjp0cryuPyZtv2BQtH/XcZFUYadZNJXESItXdxNxq1e
	tAl1Vx70mHcKW4PeCw5UN2SPFvrNiTCsk2kMzTrrQWf6N5M6jQWgZMOxFFJ5h/NQ/Fhq1jeX3lQf9
	t3+3029Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18FW-0000000Eb0s-24fs;
	Tue, 23 Sep 2025 19:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18FU-0000000EazE-2yXZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2B3D60278;
	Tue, 23 Sep 2025 19:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53752C4CEF5;
	Tue, 23 Sep 2025 19:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654023;
	bh=XUTFqyLsRiUw4+Nvp52DmyRLNg8nvrGqeV2q6vnRQUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEPo+aRh1jkDSXtKrDyj3L26eYMPhxNsgkT7S5Xf/1owH/w9y8Mn+e5D7+VYI5laI
	 XL8ibTOX4L9HebPN1wJr3iL79Uif/P5t65Dasdd//bVMhmo+Tv1kbPmisthASxKiyy
	 iNTOfU2//lRCwraOOgo+gaf7WHuKLmu0I8zBQxCv15c9PgIJWAghPaxKPZBym5w+A+
	 u2jfm1IpxwDhxHCTBgFGuVWXf4RLJzLdc7XjhRAr/s0oMV7yeHQj7GDGMRbkPohPEv
	 q15LzgmGwttYrHL9mTo20Vp3auNOh0mmKIhCzIOuC1Sjg0dt5EYrXARJMUvXCp19Qa
	 3STSUFJcZhl8g==
Date: Tue, 23 Sep 2025 20:00:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, xiaofeng.wei@nxp.com,
	kernel@pengutronix.de, festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, marex@denx.de,
	Markus.Niebel@tq-group.com, y.moog@phytec.de,
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Message-ID: <20250923-closable-duvet-741100cc086b@spud>
References: <20250922232523.844633-1-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nTbosrGlPtwTCxyt"
Content-Disposition: inline
In-Reply-To: <20250922232523.844633-1-rpimentel.silva@gmail.com>
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


--nTbosrGlPtwTCxyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--nTbosrGlPtwTCxyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLuQAAKCRB4tDGHoIJi
0oYdAPiLZjc1vLxHXffdihKk1uGPPqVJhdk/F29RKN5MCd9/AQCLChUxXA/UMhul
cgT7Ah/f+QkxEN3CmyC1LRiLogkTBA==
=Nt33
-----END PGP SIGNATURE-----

--nTbosrGlPtwTCxyt--

