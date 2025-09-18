Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0C2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwAA7N/gwU9vvxaOkhQLh7iQOXGHAmWCp41XQkJ8zqE=; b=vOs1nhsasVVDZ5kRYcu/ohgAVA
	n4fxgubrOMngB8BEmR+XzO1WJq8MAuBkfxUK1QJ06oZk7Y487g4N0oaW8mQOhByMvdP+ixjB2PblG
	8LLeTHE5+icOgUJsUt72QsvUL+Bx1g88yY/tDznXBvGgjdVXQkipvjReo8c27zEnACIpunYcFTcJ0
	PydNtSuFePJm8/ZSIztchcdYlQbG+h6IXriP4JPZ+81+2ub0QwMgGLs38413/n0C5+RKKEo/45yOs
	bclrEEoYA39jvEihHWXwjDm4Nh30qwZhpcbMPk1gBD9KttmcUUvWqW83K8q5emaH9844R6jZ0e6di
	+PDUsevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGOW-00000000KfN-0waa;
	Thu, 18 Sep 2025 15:18:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGOU-00000000Kf9-2SXy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:17:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1091D601BC;
	Thu, 18 Sep 2025 15:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146BDC4CEE7;
	Thu, 18 Sep 2025 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208676;
	bh=PwAA7N/gwU9vvxaOkhQLh7iQOXGHAmWCp41XQkJ8zqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qweo1iQhAC30pHWKFE1qPULk83VJKNWKb7TQ8qhxQ1APVVSjQoO/nAxoVeqalQQwg
	 HcA9PpVdMlRm+Z2kvPyPA/cDC5hpCnBD6L2hMsurZMNaH/Z7gSUABiW9G7+YvfXCYG
	 M2RrphGRYha2tADyOw/2YpVxvtFN+hZPrRkQAKSUNNf7wsEc59IJyqrS8K9YRE7fO3
	 mloIFb/eLWCBukUQLLXiEmt/DiquIKqdYDM3lCicU9qeNzc7GxXtAOemBdBqJEFthk
	 NeUUPy/V1givEvdjwTF0mpaGA9qCaR5HkuE1KdkE2U3++JQgvOeBbIUEz3U4yVbNsY
	 RU91i703FkoGg==
Date: Thu, 18 Sep 2025 16:17:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Mathew McBride <matt@traverse.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: embedded-controller: add Traverse
 Ten64 board controller
Message-ID: <20250918-swimmable-pep-582ad2b47580@spud>
References: <20250918061441.5488-1-matt@traverse.com.au>
 <20250918061441.5488-2-matt@traverse.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ujBo91dhmfbCNWuk"
Content-Disposition: inline
In-Reply-To: <20250918061441.5488-2-matt@traverse.com.au>
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


--ujBo91dhmfbCNWuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ujBo91dhmfbCNWuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwioAAKCRB4tDGHoIJi
0k+OAQCqPL25/HhER43nZqXe+/QZqLWdoysaPuEX1g4hfCALCAD7BRnfD7KBWnUy
dQDZnU+/e9dIBwMKq/G9ZYH1tx4d8g8=
=+R/J
-----END PGP SIGNATURE-----

--ujBo91dhmfbCNWuk--

