Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D33C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hSPhY9fRP5wAkvwT7nZpif6uF6urSydxdtYszdoWwI=; b=VMPZkDcxL2ljVnSWIdnAoysEWu
	L2zsaH2dRgrR0io3/exMeHjADPyWQi4x3KW9M2QpItbtx+XtD4LC7PSsw+7vBnTYkNFpjuSFfkJ5K
	kgLMY7yuUqwF8GqGLe1skE7mdP9OBb/NRqdsJ0eY1CvUjdNzFSgSWs3D1FX7KFVpIR4T3M1Yk9kNz
	MclOp0DTpDrqTQkyTbdiABzxmr0ki+RjIi6twn/5mXy9R4Or6jWG0RneKGUOApuB1dqiVI2W0IIzJ
	iZTT1i2LaroT61fvjyNdUFVnp2RM7SGOhgotUX+ZA60sReys7ypW3LyculrjXnIFsKeTTyRJ4SoWp
	rIL89TCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA97l-0000000E0Tn-2coH;
	Fri, 25 Sep 2026 16:50:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA97k-0000000E0TU-2gFQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3256240235;
	Fri, 25 Sep 2026 16:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F271F000FF;
	Fri, 25 Sep 2026 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355012;
	bh=3hSPhY9fRP5wAkvwT7nZpif6uF6urSydxdtYszdoWwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=haU9ZjH+gG3+lhEZKeklSiZDBp5v+46afCM/D3mYa0ciFqt+7RJxilyj+iZ7y9KQ8
	 xjv9EOd/5/HLiRWxe4a00ogF+t60IeJ3Awt8fA+UWn/LQTEZ/VcDb5rK9xtcluArqH
	 wCmxJqR4Is8sklxqjKMMBSLhXd1lrXYuxb6APjR6bNv/DkguAUGLvuQZxRzSO45ubb
	 Wv5N0tDCMsTWmC+GEWVdXCUOO2cOmnsbmVVevQUXO8VvhP154dmXm5O45eM7dVf+0p
	 kXh4geg0XTXUs216GsQ6JdR24LsdvuhZGlYRRInXsiSMnx2z1ubECb/V6QxqTJ0KIR
	 ZTWAHsRsaeGXg==
Date: Fri, 25 Sep 2026 17:50:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH v5 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2
 board compatible string
Message-ID: <20260925-overhear-guileless-d1d23ef374e6@spud>
References: <20260924164922.117236-1-ag@ffroot.co.za>
 <20260924164922.117236-3-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UztgH/KZeoyLTOhi"
Content-Disposition: inline
In-Reply-To: <20260924164922.117236-3-ag@ffroot.co.za>
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

--UztgH/KZeoyLTOhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--UztgH/KZeoyLTOhi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaramQAAKCRB4tDGHoIJi
0rRSAP9x38BQMzrbM9+ELZfonFtJsqSlkUsjT33bxwS8bBMJLwEA8+U3TdZHtyqx
TALSS6VNdeQl5j3JI5+n7At4xFLHeQE=
=lsv0
-----END PGP SIGNATURE-----

--UztgH/KZeoyLTOhi--

