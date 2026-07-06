Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E43C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eij9NN45WHadIIGng5xyGjgH3Ez+ECAyMwLT2E7r2vI=; b=DDKpW+AKQDnPWDXx3MdZ8q0hPK
	zfAUdWdcHP1UatoTOHWQuDfdZ8vqka9JHocJdbtCk0KbNfuDuRo908/99xbeX6uwNPfzIB5GLlL6x
	mNrtpuqDzEaK8juKilNiak2WNQa8RDsPcTiFIsGwxAHjChZb6kVrMgqqmjWiLGorbnwuZbJXXXgBq
	SeCsaPLlsYRfg1sHvpeg6povs0hIN6stJuhRprSWV+HxW4ZXJyT6s+kdcfu30wKMSgUucezHy1ebo
	mo+31nOBYy8LnU3eA8QgZCiHg1h86zSf+q4cJcoEQXMd3IgBYBvI6s677Sm+CndqZzL8NPseU+b5r
	sx6YgIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmfI-0000000D8h8-0YoF;
	Mon, 06 Jul 2026 16:59:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmfG-0000000D8gS-33KL;
	Mon, 06 Jul 2026 16:59:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ABD443659;
	Mon,  6 Jul 2026 16:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B62F1F000E9;
	Mon,  6 Jul 2026 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357166;
	bh=Eij9NN45WHadIIGng5xyGjgH3Ez+ECAyMwLT2E7r2vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tthd+//5QgLILAIfB0QHO6lE41MLDOU/r3L8hwfmH0olc6rLxrZWLnodbJtvF+3hL
	 lONKGvsrpCVW3fdUlriEmaNn8iByl6R0iXdB+hj1fU15bvNoyptacRs999/J+HSXah
	 w73yTP5yQgp0NnP5ztPs9VdXKZMtNVqmROruFsOsGT6lwFdsBZl3Ynr3l7rHdOqGxy
	 9AzO3IqKXO/jFN+mvfjrHxq/hpNrzyM3zB5zRCriy5XL66kQVb3WLnMWpghWYF2hWY
	 mUfMXPS6uVqb80iy/ZlLi1V1eKSBWccVAZTUvW+ZL0fPVRYb+WHFJbiIPGwfLetQp8
	 pNdFaNyn/iMtw==
Date: Mon, 6 Jul 2026 17:59:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Yanan He <grumpycat921013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Wu <david.wu@rock-chips.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: rockchip: Add Alientek DLRV1126
Message-ID: <20260706-quickness-paradox-2ddd7328fa86@spud>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
 <20260706-rv1126-alientek-dlrv1126-v2-2-ff3176ca362b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U1flhJ3EtlV9yrdK"
Content-Disposition: inline
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-2-ff3176ca362b@gmail.com>
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

--U1flhJ3EtlV9yrdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--U1flhJ3EtlV9yrdK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakve5wAKCRB4tDGHoIJi
0klkAQDRoPqv3BY5GD0PHqXAy86oOarOTHzm12zfsS7VHsKg2gEAwSFbwlMYUfLW
PYYq6cTfP88NVHtb4MWFRQaHkvWc+Qs=
=5jfH
-----END PGP SIGNATURE-----

--U1flhJ3EtlV9yrdK--

