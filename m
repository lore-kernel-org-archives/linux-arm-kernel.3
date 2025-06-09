Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73383C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kp/NTlrvXjRtay9xcRY38fHO9S3vFj89fcXu1mx8a3U=; b=MBg1BPPADaBgCSVMZCkYYiKQ/4
	mysn9K5ubuT1tJDjDaVO04EYNkWEZNgTd4iFZYzqbhmJ8cJjaGJFmPA0nArtPa8agrJcVnA+vzznA
	CoxtMHVw7spUjNBtYhry9qUhWmC6oWTRqR2oFvS1BEgxy6wU26eR3MzPKtOAp544Ty6TuyaUe0rqN
	28ExnfCDH4vwrcLy90waTHXKK39NSgwBYXuSy/Xz8J5j8bqZT32FyxYHpBsI1j/JhXliLWH8cSkVX
	GMkss0sQ0tC3g86qfZHLZHu/MByUMaFthVSsDWqTSlK1ecB24it8viLZ5sWvNIS9pAddYUEzIXEvS
	RuHx9UdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfqk-00000004kFr-3UzM;
	Mon, 09 Jun 2025 16:59:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOey2-00000004bdM-38O7;
	Mon, 09 Jun 2025 16:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 592BE4AA08;
	Mon,  9 Jun 2025 16:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C84C4CEEB;
	Mon,  9 Jun 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485002;
	bh=Kp/NTlrvXjRtay9xcRY38fHO9S3vFj89fcXu1mx8a3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O53xgeT0xMQ7WkdILi0titHR+l9WlKCyu+lfdTwnd93b06Q9r5YOOBxFWlPjZZDsM
	 D2gpLyq7GReO7h/mm/rnu9TuEvAEyClyaap0phr6bkEX5Pm3dQ3Bv+OX2jSyB7Caps
	 0Q/Bzoaa3vrlgR3XE6TKwTQrKBTtnD4scSznZGPhXb3tEkRlonx1w3hZtAwBgSnaso
	 nOmrSnD+tPm4U0gnW4tJxWc40uiervok9vFwrNUF12dth7v5oM6A0tVuobzJIG0Mc6
	 zBzMl37Xz3shkf4n1pz1E5QwZk4hze+/NHKU7wJxKH1B+6Pm6TAF3UKuNL6itIpkvO
	 /TAE692nMYoIw==
Date: Mon, 9 Jun 2025 17:03:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsun Lai <i@chainsx.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, andrew@lunn.ch, inindev@gmail.com,
	quentin.schulz@cherry.de, jonas@kwiboo.se, sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-rockchip@lists.infradead.org
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: arm: rockchip: Add Firefly
 ROC-RK3588S-PC
Message-ID: <20250609-undiluted-giggling-65f3751de78e@spud>
References: <20250609113044.8846-1-i@chainsx.cn>
 <20250609113044.8846-2-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="drNe0XH7oe7eadcd"
Content-Disposition: inline
In-Reply-To: <20250609113044.8846-2-i@chainsx.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_090322_803889_346A68C4 
X-CRM114-Status: UNSURE (   8.78  )
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


--drNe0XH7oe7eadcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 07:30:43PM +0800, Hsun Lai wrote:
> This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.
>=20
> Link: https://wiki.t-firefly.com/en/Station-M3/index.html
>=20
> Signed-off-by: Hsun Lai <i@chainsx.cn>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--drNe0XH7oe7eadcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcFxAAKCRB4tDGHoIJi
0ivmAP0SUEPU9XV0AJYQlDwUnQjC0k4TkFd6vo4Osi486h5d4gD6A2RnAPs5+Wo+
SIkO8Q2TaLDNjTkl83igAeqmWhUsiQU=
=R2PU
-----END PGP SIGNATURE-----

--drNe0XH7oe7eadcd--

