Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01082CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JDlQ8uzlvj2ruUR4yCJvNZFDixeB2/kwpGfVbnLKXc=; b=iFYrt3cUBmpnbyQRCxF2WBDT1i
	xajh/ASovI+Xi2U5BT1KQC3bWLtxMQZEt+Hf0AhtlH+v7BQS+Rwzp+ARGFtk/bx1zthRT8f+nN7Az
	ozVoaBX2NiMDbnSFx56HQ/xE/KYI5dm39wNAbNxTMb7qGaOLoOvdfbOI1z2O/frCgn3+Os8YZMiJC
	Ob0NNP7clQ9Z44fS5dbAW/K2SozvvFdI2r5NWaa0iaz2U6lyb9RVhSBLKUtD56ZizVKkNs7BIeZQL
	LxVmDq8XOUyZntEPblUIELnbHIm5gBEd68Vcphhdk0+VIFQQnBLOr90wRTHswcXyjIQF5DHmL+AfJ
	ruRUB+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3xQ-00000008FRz-2c05;
	Mon, 18 Aug 2025 17:47:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3FA-0000000852P-3wOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51BF2600AE;
	Mon, 18 Aug 2025 17:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12B3C19422;
	Mon, 18 Aug 2025 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536520;
	bh=4JDlQ8uzlvj2ruUR4yCJvNZFDixeB2/kwpGfVbnLKXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHuc2mk0vjVH9GvL4+Sejb0i88yCxRQPDa/S1zHykWesFOy4lVoPclbtAherEKjxm
	 LVeyc68wG2WA7mWaqrO3YmqQt7nUFxXt19QZMQDXDBIXOiIpsPx9dzuPaTQ4w6+cDs
	 2ZS4Ldc2rToQOmkZUjS0vtVnGU5Ya7DTYQ679Tobk+/u/goh6rdFWXOqJp20VzsVzo
	 7AHPvbvX6laSaM2q6Ajh3Kai7fWYIFWrUMVISnTzilGPg2wcfqx+0onD+3jgMu+SBq
	 bkAfNXMzPjQh9YV1MuqikohBZAluxs6e23//Nr8p8ypaAOpkEO6Ca0xjNfzGVNhLJs
	 OQS8/9gmNpB8g==
Date: Mon, 18 Aug 2025 18:01:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: thermal: qoriq: Add compatible
 string for imx93
Message-ID: <20250818-photo-annually-0d87c4d06b00@spud>
References: <20250818-imx93_tmu-v3-0-35f79a86c072@nxp.com>
 <20250818-imx93_tmu-v3-1-35f79a86c072@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oPltdRaYEbsqi37T"
Content-Disposition: inline
In-Reply-To: <20250818-imx93_tmu-v3-1-35f79a86c072@nxp.com>
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


--oPltdRaYEbsqi37T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oPltdRaYEbsqi37T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNcggAKCRB4tDGHoIJi
0kVGAQD/a2PJxB0NyQoM1hisKZXKpeMuWnGPrk6iUuo0/adFTAEAi7jKc+5GsLQ+
AdgzhUAkr5oOFTq1HY/QmITWZs0WIwU=
=twvX
-----END PGP SIGNATURE-----

--oPltdRaYEbsqi37T--

