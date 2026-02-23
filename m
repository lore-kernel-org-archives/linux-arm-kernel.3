Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CCCEEC2A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpVti8+vQOV41DfAG3g3weD8DWF02pCo1W0kB+w+a5o=; b=04ZRXOcyapzDGSaFGzigZ6VU8N
	iVev1jxlxC1dEugKiM19zfxKU0DbMfzN4Jw6M9aQ/4SkvlkEuq0tenkdNnaukkZfWRcOiakkgVReg
	GkoTG4Duv6xEfivHqoVkwjf+gP7hPwgPzzDAxIumL3qRkBsAWRT3jTlCbRKXbneLA/iRiswztFSS/
	QloiSCX8MWf51mEyecOIblN1X5fNHxNhr/BVmgCiOMwTaL4cT3FqRz4KLBFDTQjhHlzQECQWtbZSv
	Nh9wCfh2mxADATjfSvfZJDSmqR7nsZOTI68cQgts1s06zz13dy4rZ7McMY9VJbkwEGhwOo3259Aa4
	gcQUe1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vueza-000000019S9-3eaw;
	Mon, 23 Feb 2026 23:05:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuezZ-000000019Qt-0UoS;
	Mon, 23 Feb 2026 23:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qpVti8+vQOV41DfAG3g3weD8DWF02pCo1W0kB+w+a5o=; b=i+myjy45ekhukDQ4eO+7yvtmiq
	HY6/bhyCpSYU5KqLbeXBzhd7WqKtHbdccRUhvswbV5ijOZp+U0sy7sL9xcskQMLt986TAW2K5VSRK
	ZnhfncxuaDDEprHps0arI2oOWpXx1iErOKBI7OwJHl8DyYtUOuj8ZK+Ta8Fn/uRwWTDp+sqeL7z38
	ygu+3xe+v6jPQiKW1e0pm3ptbAZ1ksE+uYq7c2ApepgzovPh9c11E9HL1abYCCuT29dyxHP303+vg
	TCOyUO4o+zJNcLXO8Se0YW6deWZSvmwcQR2QRu7sbfknTTrkW4wzYjpsq3xbHhifl4nskSXXlE5EO
	AZUhZJIg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct reg-names order
 for RK35{76,88}
Date: Tue, 24 Feb 2026 00:05:19 +0100
Message-ID: <14788642.ZYm5mLc6kN@diego>
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_150529_281632_F4471E04 
X-CRM114-Status: GOOD (  15.35  )
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

Am Montag, 23. Februar 2026, 20:49:49 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Cristian Ciocaltea:
> Update 'reg-names' property to allow providing the register blocks in
> the expected address-based order for RK3576 & RK3588 video decoder and,
> consequently, fix some DTC warnings.

nit: I think this could use an additional explanation, describing that the
individual components got moved around inside the vdec io block
at least between rk3588 and rk3576.


> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
>=20
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video=
 Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Deco=
der bindings")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 ++++++--=
=2D----
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..2d3164a2882b 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,15 @@ properties:
> =20
>    reg:
>      minItems: 1
> -    items:
> -      - description: The function configuration registers base
> -      - description: The link table configuration registers base
> -      - description: The cache configuration registers base
> +    maxItems: 3
> =20
>    reg-names:
> -    items:
> +    oneOf:
>        - const: function
> -      - const: link
> -      - const: cache
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache
> =20
>    interrupts:
>      maxItems: 1
>=20
>=20





