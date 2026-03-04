Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6E4EFCE4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV2/IuavxCdYbHUsKgqZBeTb6Uexm2xp+WQkT9yEXR0=; b=tNFvOXvJYl/KTct2bxz4biY3vA
	fvRvG03Cw/TEBPGIhyanQV2BbXxP42kgqxuaL4ee+AwoOzE6LsLbh3iBBgwKXlyEryt74Ya3rOuQw
	oaOthKhehpsLsydbyHKyaKSUwBYTDUoiaL8Kqp1WsUXNb7eEwqVr7uQ1BeyM6ZI3jBKQtb3RvfR/B
	PvjLBnASeitMTycnop92C8JRDL12IweUIwdR35mjx5YEMg1kR4TqlWR/UxPUdguktctwH6VCzNXwN
	Q8pffaI21tQzzOWTph2QZ1/ZLm9+4gDnhfW2hah2Gdg5GX8ZkEDZkHJD1r6ZWDvaB9vMrQXvqg/qA
	mulklwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxujA-00000000acR-24Tn;
	Wed, 04 Mar 2026 22:30:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuj9-00000000ac3-1moV;
	Wed, 04 Mar 2026 22:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D843A600B0;
	Wed,  4 Mar 2026 22:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EDCC19425;
	Wed,  4 Mar 2026 22:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772663398;
	bh=3FJZfyaoW2n8+C7MJpN0vluz5q4yQ6pJg7+9Bbmp5R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+GbCzwk4GlVqiwIPJABB76mXAR3wqrOTfo1lvjjpnv6x7zylGb9wHz43E5HJIS0j
	 CssMiOArG4aJlhv/fi7LrqOgNk5VQKkroK8s/8C7AkbmAaXp9sUPmhwmMgup/GuhR3
	 L3XpZkQR/xulaKOzP7hqWBYhkZWOx2h1fhRxLd33uccA4TuAEhXlR0fzEDSeAtgaU2
	 SSw9Y+SOrk7ezmNWfWuBskZ5X4H71k+afPeF/8H5Z6zRMhLSWUbBuKqh463mkiJ53e
	 7m/HWWVxFipET9XJ9Gjdr02ca6tGpQdSxx7itamHhwy3DDDUaq6UBu+euMBheufV9O
	 ehROkvxXwqSBw==
Date: Wed, 4 Mar 2026 22:29:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: rockchip,vdec: Mark reg-names
 required for RK35{76,88}
Message-ID: <20260304-stack-marbles-c788714a116d@spud>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
 <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3FZK3G5ptjaGHPxj"
Content-Disposition: inline
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
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


--3FZK3G5ptjaGHPxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 11:00:40PM +0200, Cristian Ciocaltea wrote:
> The Rockchip Video Decoder driver expects reg-names to be mandatory for
> RK3576 and RK3588 SoCs, however the binding does not currently require
> the use of them.
>=20
> As a consequence, driver would fail to probe with a hypothetical
> devicetree that doesn't provide the reg-names for these SoCs, but which
> is otherwise a perfectly valid DT from the binding perspective.
>=20
> Update the binding and make reg-names required for the aforementioned
> SoCs.  While this change introduces an ABI break, the expected impact on
> potential users would be minimal, if any, since the old SoCs are
> unaffected, while the video decoder support for these newer variants in
> mainline driver and devicetrees hasn't been released yet.
>=20
> Moreover, this is also a prerequisite for a subsequent binding update
> introducing an alternative reg-names order, according to the
> address-based listing in the vendor's datasheet.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260227-urologist-gratitude-7984733f=
2d41@spud/
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video=
 Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Deco=
der bindings")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3FZK3G5ptjaGHPxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaiyYQAKCRB4tDGHoIJi
0mAVAQD3bq2yM/By7Zecxq5OzU8kDn07EEIF/g5RIu7wrl4UsgD9H1u53E7eYcZi
Q2t9M8Kv1f4EBbnxZmdj/4yTVs7csw4=
=axN/
-----END PGP SIGNATURE-----

--3FZK3G5ptjaGHPxj--

