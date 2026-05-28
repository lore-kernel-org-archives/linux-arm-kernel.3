Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89B0CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdA0LK/AwpTCWN6AH2FVw/SyWYwQPpd8pV2IwTlmuJQ=; b=IL2z5kzllxMW2xdZn11+8mI1pR
	qflBHBTITKw5PBQzbvHRVEhTE9E5zk1q4ouTiHR7VuzQSBr6AomIEGG7QV1i8GU30Y3xcBJ9/j5de
	AjYFwuIJnBOh+uB784REuS8wv9ns7ZtS1lehV6hRexG1tjT0axuAYKs2B6OlT9hu7+KX3d4MJ2UMs
	3yUl+1C4S/Kan3G0jSyELmpHXk1UogBy63iqwy02G+WbY+PObpDhba+/uFbQF+hr9r1Xl2mXv8qv6
	1RyanH0GUyogPuSdU0T1+HbAyHRx99J+w7gX6LzSAGTpTVgr+Wly6AQipqEvnc0NYh1qzcbshApud
	h7mW1kzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShkw-00000006NP2-09yZ;
	Thu, 28 May 2026 20:55:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShks-00000006NOc-3jgl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:55:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AC3A60213;
	Thu, 28 May 2026 20:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1D41F000E9;
	Thu, 28 May 2026 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001702;
	bh=zdA0LK/AwpTCWN6AH2FVw/SyWYwQPpd8pV2IwTlmuJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2LnRvI8UEy0I1QCbs5jlyFUaBshGO2OlPU+APUyjKl1MR62b63lYqDTuFjO6lqdZ
	 XR5oPUEiSCUP/s72VOIqByvOO7+7BhfgY/49H7kmbhyezZZUWbkhRckn667OjHqDgQ
	 dloOzbRU7sDA0S/apgnq3LlVuBy7RpFW9+25wR7SXDMGTXNkklt8MAFE6GP6YmlHTZ
	 0FoPuz/PY2mrXQM2766l8HbhivXrfA+PGp5lQQZUs8PSIWUBplbXDpawd1S8TVroLm
	 VJCCKU8Wc/4AJ1PD6xxEs/C9EqbR0KjvBuKEP70Dw4abf1B9rk4BLKgjQgkqaMD427
	 PokUYu6rmCFaA==
Date: Thu, 28 May 2026 22:54:59 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] mfd: max77620: convert poweroff support to sys-off
 API
Message-ID: <ahirnB_xN7H8Bnt9@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-2-30f9a4688966@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6o3onhorij5m6qa"
Content-Disposition: inline
In-Reply-To: <20260514-smaug-poweroff-v1-2-30f9a4688966@tecnico.ulisboa.pt>
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


--p6o3onhorij5m6qa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] mfd: max77620: convert poweroff support to sys-off
 API
MIME-Version: 1.0

On Thu, May 14, 2026 at 04:47:20PM +0200, Diogo Ivo wrote:
> Convert max77620_pm_power_off() to the sys-off callback prototype and
> register it with the sys-off API when the device tree marks the PMIC as
> a system power controller. This also removes the global max77620_scratch
> pointer by passing the chip instance through the callback data.
>=20
> This modernizes the driver's poweroff handling and aligns it with
> the kernel sys-off infrastructure.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/mfd/max77620.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--p6o3onhorij5m6qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYq6MACgkQ3SOs138+
s6EAwQ//aOfiIR5uQgsqKPiV53NTVyIDohHrbgeeqJoJMzxLcgKKskEm/mPnDURW
Q6khoQsGY/esT09Kz1eNNmj+IH972f6heYhU9HgGVKnqke1tWCurOT0UGWM1gb9I
SHSxNkCo2cykttjx6/rEkQb05MGIr143KyoElscAjzhCvCqIlZ32QFDj4HH2zG62
wfH9srEpZOLiU7GKoTu1HwDRkMN7jkeaDFbdVHoGKcm7Oc6cVsOiW3WS/9Blg1Rl
o+vxJVsOnUiQLTvocAHuQx55GM9KNLN+uzl20UxqrFwz1i0G+6+SKp1rGI6oz/yO
0acH7icyBQtSYHi1ZXqXf7GOtQ7HZqNwTngTOfjL5JpbSR/Vvucb3IDFDKA2KK3a
U3L9ImU3DkSrWl9Z0PeU8T015Y2xm2JaBeB5xLCeZSkLw9pDcwj2m8v4NWFK/3be
ETdmRtquIByyrChJORXxrMZH53/PqtJXm1Y7Fii0EKtmemo6b+kMaqhLfWQ6j2Aj
D3gk7xbUQILy9FeEtR4rDmq6thqYypr8zPR61nTWT+v1DP9cqLeTlq4wrRQG4mkH
8F+BLb0y/BQYT7n6dSCUb7/w56FWaPucjALjlx8+1BU8LBVIZ59WEJT6AIjzjlDE
q6W7Yyd6tj6xyzcZ51kbmVcz8eTaUzO2fJVH0V6cvefNWflmFXU=
=eQRA
-----END PGP SIGNATURE-----

--p6o3onhorij5m6qa--

