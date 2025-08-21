Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA6ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqV32R8BauF0D9RcGuPTvw5bHyckwkMGjqU7llEphYg=; b=c2RvpC2rn3mj2PzPqLd6zs+47g
	KbiRf/TZXUOpMASbzcpcuJyiXO697n9C5Rr0ttiPjPTSMY9ANl5aOxWt8JQG88X74i0FbmYyPSjd6
	iRvqjbyxTk4I6hH8qkLxcm7Gf6kok37BIXTAqcY3uHPa6nD/SKuoyKjU0gKjGQD4w5ilI+4mSItoP
	Pw19RcUDMEiVUPrEaFq9W5vajOkHS/AQju+K+6pBXZTsvdy4FrIK7vuVxEPjYJsys7djpjXzGNcWe
	SJtT4Gp/uzN5BIUALFO3/MF5mLyz7PvFK72L+nnhUFLHHmbQ2PMhhHaWjaIf4gL3ZAyUSTjlaO/RS
	NaC3Sqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEdx-00000000vp2-2hMC;
	Thu, 21 Aug 2025 23:24:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9hb-000000008pD-0beF;
	Thu, 21 Aug 2025 18:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72C90434D4;
	Thu, 21 Aug 2025 18:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C22C4CEEB;
	Thu, 21 Aug 2025 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799674;
	bh=cqV32R8BauF0D9RcGuPTvw5bHyckwkMGjqU7llEphYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoZuMqbtNodZBdlB7WdbDgWySAkmHnvNA4/90X/Eojf8vkCVPMu46gsuc/pSMYzqc
	 O3Muhgm5HPqVV+9TW0jNkSlqdfyk86ROBJOUHV/MeKY5hlvyo++ylCpXZmha89oo9C
	 TR0hSVJSRTupBpsI6qgdt4DewUjOof+bPu5Y0/jr+KSYYmvud64kznOaF5F0yBXNbZ
	 hJfB2AQJ9X0VG+3N7u3AZHC1WwqD5GGaXMpxjalBbFccke4uRA0vx3+iueKGR8BmLs
	 HjF2a8p8GpQsPlZS0qk4mF8+E6B9F52WjhNLJ5gTaZ+r6syy3RFsFVUEDWlyrLojb/
	 8l/twFM5g1ppw==
Date: Thu, 21 Aug 2025 19:07:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsun Lai <i@chainsx.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, andrew@lunn.ch, inindev@gmail.com,
	quentin.schulz@cherry.de, jonas@kwiboo.se, sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
Message-ID: <20250821-java-tapping-a828a2775e29@spud>
References: <20250821110942.172150-1-i@chainsx.cn>
 <20250821110942.172150-2-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BT4qYPKxiViwhuZI"
Content-Disposition: inline
In-Reply-To: <20250821110942.172150-2-i@chainsx.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_110755_206215_F94D69E4 
X-CRM114-Status: UNSURE (   8.88  )
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


--BT4qYPKxiViwhuZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 07:09:41PM +0800, Hsun Lai wrote:
> This documents 100ASK DShanPi A1 which is a SBC based on RK3576 SoC.
>=20
> Link: https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/
>=20
> Signed-off-by: Hsun Lai <i@chainsx.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--BT4qYPKxiViwhuZI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdgdAAKCRB4tDGHoIJi
0qd9AQCqoS6NzL53hBCjSPNRb1IEtMcHrfzfvhXri8oJ6S4m7gEAtCM6t9wk+Rjr
r9QVywY0EGRtNRxOMkSUulbpp+KCSgk=
=qr+H
-----END PGP SIGNATURE-----

--BT4qYPKxiViwhuZI--

