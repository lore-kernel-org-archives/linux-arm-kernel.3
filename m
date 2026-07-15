Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A80BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iI7cm50TUfbt29M1XzW54/S6U86vKbruO9GvSiUuH0=; b=aSAzKAFqYuaCVBsg68LmOzjxwp
	aamFLTSuB5yTDgK+1fkOBi+DEtmDYSz37U7sYqwFX4meIxQGlHIJc6qpJh5YT2+Ee1lbST42dr7K7
	MaXbRf2vNPvhXMTwo+ssjqjuFkaoReJewTqpc9K/eMS8luSmswhEUuPcr2qJdUpr/dsgQu3sxYoT9
	x8jC/0b9NNuGIG9sUyHGXC969QjxE5PvNe10wtavkR/3G4KDSCAFq6Yf+ajdAa6CNA6Gvkslx4NYV
	3QxmvisbHjqSUIKpeGSijsciudnbTXYF7AVOl8/bnz4Y+7iueV/b9EIdI/3WjoDzanmZMT9hqBi5o
	GzVL4Gcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjy18-0000000EbtT-3HIk;
	Wed, 15 Jul 2026 11:43:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjy15-0000000EbsP-3R2H;
	Wed, 15 Jul 2026 11:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4iI7cm50TUfbt29M1XzW54/S6U86vKbruO9GvSiUuH0=; b=sWAGpdJCjLiATuC2iZfg0E1iT8
	5rxsKju5Y4nlh3QLn3hMx6qr69JvQ1H46Qx/HsW0jfcCJ9E1uEAmYxCjAQk2N1mtHLO9iWgx3hQs8
	hURR00Tun5XOsU60sNFUfEPbTRh8BX9ZGBbA93gw79jfPTfSrl2OZEsjqWvI64QdLJvaUQ5Wx/+G5
	KKAilP1EEdH8GzlFbgiWs3V+WrQiRkVrbjAZc+M5qkCbE2v7zdTBdvkCY5p0xCv7498A0R+kbF7Uu
	OXI6aZs476f1wARdihN6FYfJJSsSUK9FYe2uyZvk04uj3HRJz4PWbcZoATcASfIVPLNZLOCeHh7bx
	6hx4xtyw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: srini@kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add
 rockchip,efuse-write-enable property
Date: Wed, 15 Jul 2026 13:42:56 +0200
Message-ID: <2363663.KTMopqUuYO@diego>
In-Reply-To: <20260715110107.409204-2-hrushirajg23@gmail.com>
References: <20260715110107.409204-1-hrushirajg23@gmail.com>
 <20260715110107.409204-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_044307_909074_EB2E6104 
X-CRM114-Status: GOOD (  18.12  )
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

Am Mittwoch, 15. Juli 2026, 13:01:06 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Hrushiraj Gandhi:
> Add an optional boolean property to explicitly opt in to write (OTP
> programming) support. eFuse bits are one-time-programmable and
> permanently set once written; write support must therefore not be
> enabled by default on arbitrary boards.
>=20
> Boards that intend to use software-initiated eFuse programming (e.g.
> factory key provisioning) must declare this property and must ensure
> the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
> is present and correctly sequenced during writes.
>=20
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> index b80fd8d1ae5b..8a7195245c84 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> @@ -46,6 +46,17 @@ properties:
>        this property is defined.
>      $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +  rockchip,efuse-write-enable:
> +    type: boolean
> +    description:
> +      Enable write (programming) support for this eFuse block. eFuse bits
> +      are one-time-programmable; setting a bit is permanent and cannot be
> +      undone. This property must only be set on boards where irreversible
> +      OTP programming from software is an intended use case (e.g. factory
> +      provisioning), and where the required VQPS programming voltage
> +      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
> +      correctly sequenced by the board's power design during writes.

Devicetree is not a configuration space, and I think this really does count
as configuration - as the efuse will be writeable on every board.

You mention the VQPS voltage. If I'm reading schematics and application
notes correctly, this is a separate input used solely for writing efuses
and _needs_ to be 0V (off?) during reads.

You mention "needs to be present and correctly sequenced", who is supposed
to turn on/off that regulator?

So you very likely need to define that regulator and can even use its
absence as an indicator to disable writes.


Heiko



