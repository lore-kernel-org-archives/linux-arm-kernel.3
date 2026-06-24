Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834B9CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsErrDI/mgcCYhyXKs4NAB/r5R1yy/JAlJmDhHKMVUo=; b=fkkkLg+GXvZfK6BGfIhZCBnDmF
	50v8nCkfxYJSTtzebIlyjRc4SDTAoMcm1KmXZ5CH0e3rU1BjljZxpGTb72yOntzqZCVXKF33zZ6qZ
	Fry/1VZ/f9PoVr64r03wnH2rvCXghJhufylOWD6neequuQkFABZ4wke6uHqAmknVRI2yI4+Pfdf0f
	UMUP5wWkVmKoiUN3TXPj2pbJv4U7GgkHaTIVsgMCxpK2EgstrBfM2Jc4EaGyC8b8Go49Hd3lMoyqq
	pQi4UEtR4z52LV3YF0fatP8EoX3r7gi40voeJahNhCG1zirV8pVvRzoV1jGZulkdLZbEAhBXaVbX9
	4R+KR6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQbQ-000000086to-0R8b;
	Wed, 24 Jun 2026 16:37:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQbO-000000086td-1z3D;
	Wed, 24 Jun 2026 16:37:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC3494369D;
	Wed, 24 Jun 2026 16:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E3A1F00A3D;
	Wed, 24 Jun 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319045;
	bh=SsErrDI/mgcCYhyXKs4NAB/r5R1yy/JAlJmDhHKMVUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZIR/ww8kd5Wkj3xWfPpdHxIMhi3TEMx0JzM9Uc+2pgczg3xBnti4IQQcWebTZXGe
	 YhRX3U4AEfu0f8Di5E4tzW6MLB11dqtcJj/TU24vxorEm4fySGMd94TEFp6FTwSjzW
	 qlur4txbLATnb0fEJFEMEVMHa5+66a4RLCDtMnoGLamATZuI5uOWbL2PbpKlvx6mLC
	 jAxgsvz7+gA3s7M9s0Zd7jyMtXn/QQKsNZjnvRaDxE/27Dp6JtM7ubnT5/mEWGeHbR
	 nkOffsaHxOxXmbKLsWk+eOlsJRxnrr4de5yIgVNrtKg8XaNE3Fm5yiyoX6FTVAfyy7
	 AA7x0gMQMKYlg==
Date: Wed, 24 Jun 2026 17:37:20 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/7] dt-bindings: net: rockchip-dwmac: Allow 9 clocks
Message-ID: <20260624-pushover-umpire-2744c5b17d9f@spud>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iu3PME21ajoZ7jPL"
Content-Disposition: inline
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
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


--Iu3PME21ajoZ7jPL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Per Heiko's comments,
pw-bot: changes-requested

Cheers,
Conor.

--Iu3PME21ajoZ7jPL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwHwAAKCRB4tDGHoIJi
0t6UAQCGHAggz42SGgsn5kHWftoPdggs6Ej/e9AZZFp538uTbgEA9wRMI5IUOoth
h0Ufb6nzQPziJL1JprN+zfmV4EYGGAQ=
=PF6F
-----END PGP SIGNATURE-----

--Iu3PME21ajoZ7jPL--

