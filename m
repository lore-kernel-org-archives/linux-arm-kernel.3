Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A9ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWAhSnRiE8GPAZSm4oQQtqwekOOMPU0V6QfkW4vSi3Q=; b=Dv8LNajVukBjLY498svfBeS4Lb
	ws0prWD0YrAp9Ff3iKvU9GzTMBzb1+fT3/K2S5EU3s9mRT6vBOfVmExsTrRTVGElmpXs6YGqZ1DIk
	iDVufB/x57GvtRUHWBQhzIZlWwZxOg+UWmEpJjGThIExYGafbNjRhaiucUZFjPg1fScqAMP0/MaIx
	5Vy9j9FZ8TU1QZGhjMpIAGSumo/yvRogsMH1hhZA3U1XDvzBQv3BFxhdNRO26V+q92t1atMrpwewm
	o25CqRl+rp2j8fwWt0Mi5ECOW2mA7iuTAkMHqfUtI6s+L4menXSzvtXKNRj/W6MzvpHIB3UX7l/rv
	u15SIFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vLO-00000006uZB-0wWf;
	Thu, 09 Oct 2025 18:26:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vLL-00000006uYn-1HPB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0513344C4C;
	Thu,  9 Oct 2025 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E19AC4CEE7;
	Thu,  9 Oct 2025 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760034382;
	bh=JWAhSnRiE8GPAZSm4oQQtqwekOOMPU0V6QfkW4vSi3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW9FQA/t/VZ2QlytcYC19B7HGRg5novCD/Vl51YJWjjfz65BQozCs18mPZHmPYO/2
	 EyxqhWZ7DHoXdqqsAZ1dqQjUnUSJ/I68qzv9/wABk8nMjbmx1ALvGHQALkpj+qUTSI
	 2n0XbkngP28f80RwpbnPsYQ3zVyDgYV0ffyCPLc2lNbT960sPe4cn6jN/7g3GNErNf
	 jVDPEj1tnnTmCPo43m57PIJSTMQJTchLP7tubHzm0u800U6/GRT3FlA8Gchpy6KaEV
	 nCLB0yvyEF7jLIEzMeFaipLsfsn+QxhYpUv5cv2WvV3L/kBVSXBINvUtrYKywJ4dKD
	 zDv7JZqT5TZfg==
Date: Thu, 9 Oct 2025 19:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Message-ID: <20251009-june-greasily-3b7315339c94@spud>
References: <20251009-mini_iv-v1-0-f3889c492457@gocontroll.com>
 <20251009-mini_iv-v1-1-f3889c492457@gocontroll.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfuq9rSWFptVSRA3"
Content-Disposition: inline
In-Reply-To: <20251009-mini_iv-v1-1-f3889c492457@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_112623_359186_D8314A73 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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


--lfuq9rSWFptVSRA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--lfuq9rSWFptVSRA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOf+SgAKCRB4tDGHoIJi
0pjkAQC9hkkb+EqvQuGO93dBxS/UYEXTZKdiGAckdllZ4l3NAQEAz15iBgfNIgV0
nj7aKLkyVW135fPNT6jo9WLpCE4+IQ4=
=8DJS
-----END PGP SIGNATURE-----

--lfuq9rSWFptVSRA3--

