Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9755910A88F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onuRQkPmwCIpth/t55bBYnvpguxJISC6gk3ZFvsnTBs=; b=zs7/Lc5XqCoXYYSAuaCTsefmUT
	o4uY6gD33OMUGdX4n13mlOk7W1ItkhYTCcYGCVmbQGnyfyRYJ4cmBbCkRnmCweOYNvWCi7M/fitFe
	2ywiKTgV8M7/CFEbZUovxCbWNSTjTGswcu+soepMQ2+guwpwt6fJvdtVoTOfAq3Z9UVt78VbG4SF6
	WyZnMhFWN2EiPOcTQBoBohg6uU3c80aHhb2qq81c108w6bjeL2AyQbPGtwGdTIgwcIxPZ9irkFTRf
	wo9J3XEzN+bhIIszzCcimWvfhgGx2J8h6JjHIkpP3SD3NoY24ODobOUWzQ1ZQqzgqRoi1nihcXFCA
	aWsgf2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pCe-000000060lw-1qJ6;
	Thu, 26 Mar 2026 18:13:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pCc-000000060lM-3IBd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:13:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3E8760054;
	Thu, 26 Mar 2026 18:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B3FC116C6;
	Thu, 26 Mar 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774548785;
	bh=onuRQkPmwCIpth/t55bBYnvpguxJISC6gk3ZFvsnTBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbY1+q+fVV90ac80mhG7oRHiW7dLVnAsaxYjEkvgg3RVEFRF0TOLP78UWAGX/SuY8
	 teiNxXthB5s/sZWS3Smp+uFCrPq8ojKuCHd8NSI3Gw4YlAJ0eZJCalsGxb3CQgKyNg
	 eE1dzIZBQ7wIPacSMEtjz+W167HfW4PRVMa7j/Xog/6vfBOIIivZ4ouauNxM2QC47I
	 V8TjpiElAs+ES082b9UBM/BR1qfqsoG8tHgWvKzeHPdndlCjEvTGLOOp1DWjDkuqao
	 +5JTscv4FhUOvc08NNBR3vGZ91/Sojk/EsyBrD3koapnBIgCwBcEVvr1IwUdOJJhsG
	 YevULXYCG6UrA==
Date: Thu, 26 Mar 2026 18:12:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93
 Boards
Message-ID: <20260326-sizable-dance-78b73f70fac5@spud>
References: <cover.1774539301.git.stefano.r@variscite.com>
 <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLO7GUF6w8z+16Yd"
Content-Disposition: inline
In-Reply-To: <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>
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


--PLO7GUF6w8z+16Yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PLO7GUF6w8z+16Yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacV3KwAKCRB4tDGHoIJi
0owPAQD3E45ZJKFwFRvgLC7JzNAeyiR+9OmbwQ35jEMeSNonDQD1Gn84ysRfckCH
1VN+CjFscwhHyf6LfZt3azNzZtaVDg==
=NoRV
-----END PGP SIGNATURE-----

--PLO7GUF6w8z+16Yd--

