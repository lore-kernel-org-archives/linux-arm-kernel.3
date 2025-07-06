Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96258C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulGSgijGk7YC4OX2ohfRWb9ZlHPzonSC7Ykb9+yR8PE=; b=szMxlNQZZXhT4KGQDHpt20L3VD
	cEKrV3z7awSTjowILirqdxgI/HyS/+Qe5dGtGHMWBGsm9PhKt5/4ANyaLx1fgKbNghF4qB9zj4Rv4
	Vh24OlvqOEsjT41LNUzpf0wu7t0XbdMmTDou8MumhSCogC/Id1DoxZ55QcDs/0ThnK9jKnn9havJh
	7jMY0MZVyInbbHZR4HKo5sII5WYccpLzynCXpvLiPOvuDYi+kNu1+niLDz/rfThvTuqLvuxugslPj
	gzJ1HA6P72SqoP7H09r/BqWMCu/qRVZCKTERx4EIIC7JKuPxkgZ9bLqpKe+7wS8WM6iczJ71mm6/o
	hoVrv/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMZj-0000000081M-1S3j;
	Sun, 06 Jul 2025 10:26:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMXP-000000007r4-1st3;
	Sun, 06 Jul 2025 10:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ulGSgijGk7YC4OX2ohfRWb9ZlHPzonSC7Ykb9+yR8PE=; b=bIhsV5Rx1JReBI9s0QhcdYeFOr
	2A06OeQ6hmRD+/EoF6jfCAXR6MuqjNvAKN84SjrW0l03TQPhYgBsdVXPUdvySFjUBVJn+Iq3SUJy2
	rgQT6RvuAR/L0nuvAPdkCRv+0m44QJs8cw7k1yj1493jDGA62tqBO9n55Ll+VW3h0X1/bvIxwtFmO
	CeGOJ8QzRP1nOoc8IY44p/4lj7Xg6HoWcvdH3N7iQqpe58GRc76NPDUi3LrAheSFXYnqEtqgrQ9UB
	pYF8oUVNwkMlzJMyD5lt0K94x/GWsIyYMcJjM5uENGeDQfSwBHgBL+hOrVgyNGvcytiWimKBT3HZH
	mJzVYP/w==;
Received: from i53875a35.versanet.de ([83.135.90.53] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYMWu-0002nC-9F; Sun, 06 Jul 2025 12:23:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Detlev Casanova <detlev.casanova@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: vop2: Add VP clock resets
Date: Sun, 06 Jul 2025 12:23:26 +0200
Message-ID: <5453371.fEcJ0Lxnt5@diego>
In-Reply-To: <20241115162120.83990-2-detlev.casanova@collabora.com>
References: <20241115162120.83990-1-detlev.casanova@collabora.com>
 <20241115162120.83990-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_032359_479896_9D68B636 
X-CRM114-Status: GOOD (  15.29  )
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

Am Freitag, 15. November 2024, 17:20:40 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Detlev Casanova:
> Add the documentation for VOP2 video ports reset clocks.
> One reset can be set per video port.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-=
vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop=
2.yaml
> index 2531726af306b..5b59d91de47bd 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.ya=
ml
> @@ -65,6 +65,26 @@ properties:
>        - const: dclk_vp3
>        - const: pclk_vop
> =20
> +  resets:
> +    minItems: 5
> +    items:
> +      - description: AXI clock reset.
> +      - description: AHB clock reset.
> +      - description: Pixel clock reset for video port 0.
> +      - description: Pixel clock reset for video port 1.
> +      - description: Pixel clock reset for video port 2.
> +      - description: Pixel clock reset for video port 3.
> +
> +  reset-names:
> +    minItems: 5
> +    items:
> +      - const: aclk
> +      - const: hclk

the vop1 uses "axi" and "ahb" (and "dclk") for these reset names.

The vendor vop2 code also uses that name in comments, like
/*
 * Reset AXI to get a clean state, which is conducive to recovering
 * from exceptions when enable at next time(such as iommu page fault)
 */

So for these two we're not resetting clocks, but the parts of the
vop2 ... so I'd strongly wish for matching names for the vop2 :-)

Thanks
Heiko



> +      - const: dclk_vp0
> +      - const: dclk_vp1
> +      - const: dclk_vp2
> +      - const: dclk_vp3
> +
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -128,6 +148,11 @@ allOf:
>          clock-names:
>            minItems: 7
> =20
> +        resets:
> +          minItems: 6
> +        reset-names:
> +          minItems: 6
> +
>          ports:
>            required:
>              - port@0
> @@ -152,6 +177,11 @@ allOf:
>          clock-names:
>            maxItems: 5
> =20
> +        resets:
> +          maxItems: 5
> +        reset-names:
> +          maxItems: 5
> +
>          ports:
>            required:
>              - port@0
> @@ -183,6 +213,16 @@ examples:
>                                "dclk_vp0",
>                                "dclk_vp1",
>                                "dclk_vp2";
> +                resets =3D <&cru SRST_A_VOP>,
> +                         <&cru SRST_H_VOP>,
> +                         <&cru SRST_VOP0>,
> +                         <&cru SRST_VOP1>,
> +                         <&cru SRST_VOP2>;
> +                reset-names =3D "aclk",
> +                              "hclk",
> +                              "dclk_vp0",
> +                              "dclk_vp1",
> +                              "dclk_vp2";
>                  power-domains =3D <&power RK3568_PD_VO>;
>                  iommus =3D <&vop_mmu>;
>                  vop_out: ports {
>=20





