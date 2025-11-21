Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C34DCFC29A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYYPervbEOjVJJBzptFxIG8219f/76+NO4AhnB1hXNo=; b=ofF4diDS721w49LVy/La0xBAtT
	JSbblS0t3JEZxXdUzXXNWJr1PyMbE47scohQsQpn0kWzb5ZQjW0ENp0NuCrR7vcCKFQ7EJYHAQvxS
	8CO8MoUnwA2Pefa1KBLeowiAf6EsOuMQiN142nuoG3yGl0vEaACbjG/0UPP/vgZrLPEct8eJpv7hP
	DmxgXz1/k8c0w1aJupHoxOStUDttlhh9hWuVcl9WE1Qr95V6Mjq9J76p9HdcFgzTMkZBoHiWmPsGH
	tc0WnpeatbNa3+lC2DlMj4o8pEqYa/boankYVdP4Fdcaf7fHjZA1/zHc/6cblegrYFzmPWT3CYHOT
	szKvBeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVvb-00000008r6w-43hJ;
	Fri, 21 Nov 2025 18:32:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVva-00000008r6a-15Zv;
	Fri, 21 Nov 2025 18:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A574A44291;
	Fri, 21 Nov 2025 18:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8A6C116D0;
	Fri, 21 Nov 2025 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749933;
	bh=FYYPervbEOjVJJBzptFxIG8219f/76+NO4AhnB1hXNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/yYFmzqxyIdBmUAV3gvjPj/hP22PY1qOyfhcIG1rM8hK2Vzo88PaB+kyb7aHOQ7F
	 thaWNLoxl+yG+fzCBrfnlX9Vy9goHiqa3eQnFfrBgCwdnk3BYwBaQkG5Q4cJJRB6kp
	 p3uVQk32svVFtHsiAfNRJRJ80Uoep2McqKajzidFe8fiHzqlktKSnaE3UVlE5MbacI
	 tv7WuIP6qWHO1k4N0h4/oV7A97d8B5p4HeHCFb+Pq76JfsijWXJjBatDCApieSaK8O
	 kqd/Z47QdEupQOoV+00I7E4wq8s5hPwkaKmW4EwUKyACipEEQ4CuEycFSzB1Tj2qJ2
	 wgKZ9tvnGqb1g==
Date: Fri, 21 Nov 2025 18:32:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de,
	robh@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	finley.xiao@rock-chips.com
Subject: Re: [PATCH v9 1/2] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251121-pardon-employee-9dec9bc4f722@spud>
References: <20251121075350.2564860-1-zhangqing@rock-chips.com>
 <20251121075350.2564860-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OODCh6Xp3HC9Xyhv"
Content-Disposition: inline
In-Reply-To: <20251121075350.2564860-2-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_103214_318206_88455B18 
X-CRM114-Status: UNSURE (   8.71  )
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


--OODCh6Xp3HC9Xyhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 03:53:49PM +0800, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OODCh6Xp3HC9Xyhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCwKAAKCRB4tDGHoIJi
0tYmAP0XdiQ7FjAMJRMNG+AfR5MdexmkPh6Y1Wk7sVStJYlgngD9FvuK+OKz/JB9
1pNXBM31iSC3eLIx+nz+r2s7DT8gNw0=
=hCqX
-----END PGP SIGNATURE-----

--OODCh6Xp3HC9Xyhv--

