Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09227CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vmts3eVcq1AB/MaOX1+dMbZWrM8G02gzaeVnUoYstpY=; b=PRCEMNc2x2+lwAqbp3oaN8cBQ0
	yuzmeaPAzweChA9A6rx2mgS7932QsNw+X6ZGN9vtr1+CaF8XZHvwHp+pbzjTWrrBROT2eRtpxeXL5
	QL5AtjK6bIzdI/k4SzZnvo+POjGoPVDbocZsYjr5JO1DODTS0V0miQyvu9migvg+ORZBkAYxSJubl
	N3cvZZeCbpxuaPXjYiiRyLD7vdqsdKTLPHIfa4ufaUGSP+El/YVPkOf2cj9iT3MHU4IrCgzRJK5ST
	d0e3N4HT1m4PKCe9HoJLWvNcjXHhb2MZaarhw2hw369JLlTgFBJTTosX1dQSNTqNm0p9jEYnJWxXp
	+EYGdY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7eW-00000000oO7-13IQ;
	Thu, 18 Jun 2026 07:59:08 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7eT-00000000oMp-1yhW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:59:07 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781769539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmts3eVcq1AB/MaOX1+dMbZWrM8G02gzaeVnUoYstpY=;
	b=iHsAZ1Jp6nMQWYrVGGLThRws4MJ9eNCU22+ngX8PXCh56gz2+Vbb24ZIj6VGb6/jM/lMya
	7u+JmEvYY1JMZM82d6xmfBZcRD77TXUYJe7RDF4Rvhk6o9Y4oUKwc+bcBM43seA8EKzAXD
	jqJ8XMf6IIrR60MXQaKBLDsvNNEHTWt4MUAG6DUP4bCRjZlgF3DPSSZcWF4biChXaQ2rvJ
	rMa6+HeOo+GYXNQnVeNDf02rSmTd03tFHgF1wMH8fR/NRxStYWyprrfJFu6hm+FJmrw0Pc
	98X6LUc1KD/DrZ71YOD/uup/O4qaQgMykCC/fGXLxh8paDGre4D2TXrTsR25LA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 09:58:52 +0200
Message-Id: <DJC0L3CRJ0WL.IZEYVLPROMM1@cknow-tech.com>
Cc: <kernel@collabora.com>, "Andy Yan" <andyshrk@163.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: display: vop2: Add missing reset
 properties
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_005906_067917_47FB409A 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Cristian,

Thanks for this series :-) Just 1 nit (at the end) ...

On Wed Jun 17, 2026 at 8:52 PM CEST, Cristian Ciocaltea wrote:
> Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
> clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
> provided only on RK3588.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-=
vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop=
2.yaml
> index 93da1fb9adc4..d3bc5380f910 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.ya=
ml
> @@ -82,6 +82,20 @@ properties:
>        - {}
>        - {}
> =20
> +  resets:
> +    minItems: 5
> +    maxItems: 6
> +
> +  reset-names:
> +    minItems: 5
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: dclk_vp0
> +      - const: dclk_vp1
> +      - const: dclk_vp2
> +      - const: dclk_vp3
> +
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -148,6 +162,12 @@ allOf:
>          clock-names:
>            maxItems: 5
> =20
> +        resets:
> +          maxItems: 5
> +
> +        reset-names:
> +          maxItems: 5
> +
>          interrupts:
>            maxItems: 1
> =20
> @@ -194,6 +214,12 @@ allOf:
>              - {}
>              - const: pll_hdmiphy0
> =20
> +        resets:
> +          maxItems: 5
> +
> +        reset-names:
> +          maxItems: 5
> +
>          interrupts:
>            minItems: 4
> =20
> @@ -246,6 +272,12 @@ allOf:
>              - const: pll_hdmiphy0
>              - const: pll_hdmiphy1
> =20
> +        resets:
> +          minItems: 6
> +
> +        reset-names:
> +          minItems: 6
> +
>          interrupts:
>            maxItems: 1
> =20
> @@ -289,6 +321,16 @@ examples:
>                                "dclk_vp0",
>                                "dclk_vp1",
>                                "dclk_vp2";
> +                resets =3D <&cru SRST_A_VOP>,
> +                         <&cru SRST_H_VOP>,
> +                         <&cru SRST_VOP0>,
> +                         <&cru SRST_VOP1>,
> +                         <&cru SRST_VOP2>;
> +                reset-names =3D "axi",
> +                              "ahb",
> +                              "dclk_vp0",
> +                              "dclk_vp1",
> +                              "dclk_vp2";
>                  power-domains =3D <&power RK3568_PD_VO>;

Place reset* props below power-domains (like in patch 9) ?
So everyone who copies your example has the correct sorting order.

Cheers,
  Diederik

>                  rockchip,grf =3D <&grf>;
>                  iommus =3D <&vop_mmu>;


