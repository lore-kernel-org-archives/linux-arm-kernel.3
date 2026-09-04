Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B186C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPHCUu5a2yf5C1W6Uxw41KWNe1W+GCT2LpAs64i2nNA=; b=KtiXzcWqbYx5d5wIp4P+o3spZ0
	Wp9zxfTkGtfS4vGDTyG/5utIvnZh1fpNw2zymTgt0BNYWHGIYGq7kW4w+p92kRv1XervG7sBNDgQT
	I5+Hf2GslkTjqfaG2M3DQp072SuzHvp6geUG6KpmISvp5ClyTCWHW1iu19WyyhEgrLIZ72xlRdVlJ
	a0O56OLw4ull0FsdLicPtwchduCrXawmeeBBpi5fVMyynv74GOdX6+AGpIhiJs1U4dQiUapdW1PBs
	V2DLfyuaZzWUWZxmXMGMB52RHySvXSZl7vWzobUg7GbgHKME1du70CulRdbacJf79Wl/Nr4ya9DVW
	JpX7vjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Va0-00000002U3i-08eW;
	Fri, 04 Sep 2026 15:11:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VZz-00000002U3R-1HrP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:11:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15135416ED;
	Fri,  4 Sep 2026 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ABF1F00A3D;
	Fri,  4 Sep 2026 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534707;
	bh=qPHCUu5a2yf5C1W6Uxw41KWNe1W+GCT2LpAs64i2nNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irx8WTn+Ue7miHSWHIbCAeyaw/+qn2fhNRrrjCGrDAnYRpp+prJQlQtEeDx2xVKgu
	 FzoHUnjezBp4YuNO4dDa/ESNYDPF/NyWsp9Dfqz4Y9EbgokqDMLGJ04oclD4vSUDYf
	 N6SryFQKbVhjWp3Oht9QF5+c+LuxZaBzVvUO1XSQl+qMl2wghpgGh5zYs7hE2udAJx
	 TVurgm1agAdsX0aFFFW9aD20qWreYybyXguvyLDxqPKoEICN6GOUVBpCrNlAKmDHFw
	 huJi5AoY7ooD8CfwmKOfFOAsnt2iv/mhlvfG6wl4sLpF0iK3yMTsJcGQtS3zhXMpm4
	 kebAe5WzCxwnA==
Date: Fri, 4 Sep 2026 16:11:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nuvoton: Add NuMaker compatible
Message-ID: <20260904-vastness-reformist-b28a326166ae@spud>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IflJwt5/OHqS5Pxw"
Content-Disposition: inline
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
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

--IflJwt5/OHqS5Pxw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IflJwt5/OHqS5Pxw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprfrQAKCRB4tDGHoIJi
0ohoAQDS5QLC2EVOH033EK0ak0gC8BMQhGIKYpXbYsEl2PqaBgD/cgJ7Zuhrzj8N
7+dkfbhhNuOQFiBiqtHyG7URJwwKxA0=
=XDBJ
-----END PGP SIGNATURE-----

--IflJwt5/OHqS5Pxw--

