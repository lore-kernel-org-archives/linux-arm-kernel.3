Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E839CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep7ZM0DXdAg7QmwhZzhF+x5i+V9wwSk/tPABrGHUwuY=; b=U2i+kb7z3YTQsHQhR3asfFDlW4
	t3uGjhtibWhqKHT7ve5Nv2YD087Z+RHkApaFBRcWQubAtN4a20G99w05B5Iq43UK/DNRknnHkH9/p
	+vOHcw1D9G5UDIva5FQiJNrwH95mBp6ab/+iX9MF1MzMUWrV89OxrphyghRXMWojjbwvfk69nF7rV
	ehMechxXgPVEAgFSu4Dno+rBH91mGpm5GjvNvLmoO6rKs7wcfAmNGbe+GdGRj/0nGUQRbWGmzYBGb
	l/8LxZ82amJ982HFAmOyCkXQ1nI1XGqkZ3nZ7y7qcWQZrgFV0OzSqhu2twmBJ394Rg2D8O+WQ+ROg
	n37CoiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOKT-000000026GN-1FdJ;
	Wed, 07 Oct 2026 09:52:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOKR-000000026Fy-2Sp8;
	Wed, 07 Oct 2026 09:52:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6E7F6021A;
	Wed,  7 Oct 2026 09:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8AA1F0089C;
	Wed,  7 Oct 2026 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366770;
	bh=Ep7ZM0DXdAg7QmwhZzhF+x5i+V9wwSk/tPABrGHUwuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f6gc0VziYb2OPPtYu3qn3Td52W4Jm9BAOCgRpm0XbynqDBN/ijWPFEyImgpN8cGVf
	 6nndLeRCF+DrDBrp4ADDyk9ycJwh3GJciNJ1ZIrqXgbu6beEAajj6Mg6BYcgRpvY/V
	 7fYdQ/VSgYsKUp9M9ocl/n31sqQBgwEZez4JqpuKobh77WUS9phEUMhUuZmacIiVz6
	 a1Qr1UCFc/Kae1+oZEfNu67Md/ryIjO0zlHOvAK2+ELjqQ/fdHLFpHI5ZNV8rviGEv
	 /leVubWhWw8KHDBvB6ufawxDlg3twcUJejadSHI64va0jey/ZtHkwBYaVk9MmO9fpw
	 hFUT+5squul9Q==
Date: Wed, 7 Oct 2026 10:52:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Message-ID: <asYWbtDDtYuMZql5@squawk>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
 <20261007-quarkpi-ca2-v8-1-b83192bed07b@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EJ/9AV6+bq7LOx4K"
Content-Disposition: inline
In-Reply-To: <20261007-quarkpi-ca2-v8-1-b83192bed07b@163.com>
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

--EJ/9AV6+bq7LOx4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--EJ/9AV6+bq7LOx4K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYWbgAKCRB4tDGHoIJi
0q5MAP0fodGNWZAsaLDlNyoV2LAs0BRTRQdJOrUpEOfLFQkd4AEA4rlIu3exzSoy
WZh9G7NQi3ExqcxwM9BUqmK4HJSRww8=
=u6QM
-----END PGP SIGNATURE-----

--EJ/9AV6+bq7LOx4K--

