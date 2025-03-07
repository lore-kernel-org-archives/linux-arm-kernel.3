Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E02FC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAinxqSqYdnbbnkb1uHxYXPyfcX7MUeugdwP+4COtn4=; b=YIIvhP3ECNDj90OytpMNO4TwYq
	W9MMfbpgs2cNKSvjXQgKtUjL+IeoVgjUCi46kU1kyE1lHqx3XG7gnWE9pLL3M6miHeroyy8/kL65V
	vpFNxF0eDw+h5G4mVoZxzTBBu2n0zThxGl9hVRg3WR4Pmz89vjxrReHpe95SU1Kyn4I1hZtn0aim9
	Zk3mRLMl2v+F8802AXZ35RHb92hhQiTjZ1f5vtShAfmf9X1nscHX+6fqT/lBiGM6GoYBiDEjb7YNd
	kbMA1+aXJxljKVcCztQ3mgj7t3NoE4KrOcMa1Mch/X0r2y14AtFlxsr9Jb3zw3EeSyiQ/VeMqP1v2
	VUGbQpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbCn-0000000F0jw-2KHV;
	Fri, 07 Mar 2025 17:09:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbBA-0000000F0Uk-1i0V;
	Fri, 07 Mar 2025 17:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5AE61A44B1B;
	Fri,  7 Mar 2025 17:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C231C4CEE2;
	Fri,  7 Mar 2025 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367286;
	bh=EAinxqSqYdnbbnkb1uHxYXPyfcX7MUeugdwP+4COtn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0K1jrRmxiAUJWS03xTcfLzFu2VVktzzAj9NYVtmVTFXOAx5R78Q5ipUEkNKGAOJ3
	 Mi5z8WBddzSpRXrQMw9JXzLPBt3Rrq7gXS0zkcn4iHMD5Q/pvKxdPb+1dc5yAdXVZS
	 ZoxZcgg4EABtlcq+N6NhcQYsIZshHZ8I7hlEJ7UgkUSYonGY1libiBHLJ7ItMZErpd
	 1gDQfsl9uZeNC/qPIFlot9LCDH37RKNYhTzG2vMCWVXuDni4CvWK0zuhaEawyZ+lqN
	 cFHmgWTJGYlXeT6G4F+hqtSwKsCOB9+Kt2XzWrGcXGrnKA2QEPw49M9to2iOn0mgnm
	 y70NMXdpwmeJw==
Date: Fri, 7 Mar 2025 18:07:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
Message-ID: <pnlkcc2rl7fegltovgtvp4xdxhonw72rclvhn7qmvb7xyuullm@xf5x6lcigji3>
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
 <20250307120004.959980-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uzxop7jt47pbx4n"
Content-Disposition: inline
In-Reply-To: <20250307120004.959980-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_090808_534144_E01A4DF0 
X-CRM114-Status: GOOD (  11.04  )
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


--4uzxop7jt47pbx4n
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
MIME-Version: 1.0

Hello,

On Fri, Mar 07, 2025 at 08:00:03PM +0800, Chukun Pan wrote:
> Document pwm compatible for rk3528 which is fallback compatible
> of rk3328-pwm group.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

to prevent binding warnings it's probably sensible to let both patches
go in via the same tree at the same time. Feel free to take the binding
patch via rockchip/arm-soc.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Thanks
Uwe

--4uzxop7jt47pbx4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfLJ9kACgkQj4D7WH0S
/k5higf+OtJXTgkdDcHKWNOd31O7K9VCUQJDc9jVPE6elaMvtBo5dwg6YPmSENkq
ytj0JsR4nNH7OBlOWgTMI9uiAzueeTr7kqAngX/xQknxRsHHljJJYmlWlDz5RJj1
T5uEfryN3ghnCz4YZhcSCA8VAk1AYpyipEdsVsGAAZ5GaNTUwOQ6RYuzPZTh377G
WMROK/e9xoWg5g+WZAdCV9TMstu6EDVzzWke7HfR3D3ToxiTGuB2tsM+LQHw90xg
R/wVXYjbb7sgvIdyV3d/cF6/0m/o+yXnBEubhcNEUSUXsFkVRS2X5b2vJxIuvj3P
LwEhsNNCCJ0w4nC/Xs/LVJfHstbt+g==
=W8Nn
-----END PGP SIGNATURE-----

--4uzxop7jt47pbx4n--

