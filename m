Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6447D637A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7JJZhAX8z9gRFDAWAcDXD3U4FI9dk8vMX7/dG8H+68=; b=usZsKrgWqzTOEdYoMQ+DxnG0or
	2SnfzsW8DI68xJWB1Fow+qjJJJ2vbYqpO/ikYsj2xeKsMODe/NzVn9mR22L2kJD3SDs6vdft6mh9H
	mz3hZLnPhYhovcdtkDK1t4Rx5aRRHdEJEuqxdivMrkEIuupynXgGU/927Z9i/uoXPT22hUaUcnmJp
	kQjMfpwOv2PX+0XrfHCv/Sfa7rBFNWCoOwbqI4fRoH3roSuQcEDrqX5L9gVNEQ3qD3VdZEC2KlUqh
	MjXnYhQe38+wxieqQDvvIW+YkjXeBSsYyKTj0TWHFTnC2A8481vwFW/aHRa+rBAumbMwFJbVAMECW
	Iqqjd3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIUo-00000007lwo-1gQJ;
	Wed, 13 Nov 2024 18:53:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIRt-00000007lhk-3SVt;
	Wed, 13 Nov 2024 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I7JJZhAX8z9gRFDAWAcDXD3U4FI9dk8vMX7/dG8H+68=; b=LTpU2ZYiSGXxkQ8LPvYKYfpjro
	C9lf2uCVCc5YZ8E1Vky4JMigB7MC1ZQi/sqDOfXsS1OVlmvLUBwn+8IvHW7KuSQrmAZl/XwqY4U5/
	4MZy/6vSEfnPdvBpq9AM+4XoBQyivJeVlkIyKYb3VAabBumbBraXRnJOzNgsqyhMspHcH091jHrds
	6wM3fadwyJHU1tomnCnFKq1UAnS5QwMxcATOZ2+MwelZq3C45uhuL/aquNOr1UToG3lhJDpJX4dQc
	9x3aeB0+wO5SqR0CblnDaKxZ6riN4b3XIxMr9hk2uU498e3ocikNw3Tw57DNT7cZgAU+wr2rabyHH
	uKOr3xFA==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tBIRm-0005Cc-O5; Wed, 13 Nov 2024 19:50:34 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org,
 Diederik de Haas <didi.debian@cknow.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add Rockchip MIPI CSI/DSI PHY schema
Date: Wed, 13 Nov 2024 19:50:33 +0100
Message-ID: <18621846.sWSEgdgrri@diego>
In-Reply-To: <D5F5RRFVMP7R.19G82R4S878IL@cknow.org>
References: <20241104111121.99274-1-heiko@sntech.de>
 <20241104111121.99274-2-heiko@sntech.de>
 <D5F5RRFVMP7R.19G82R4S878IL@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_105041_921312_0840DB4C 
X-CRM114-Status: GOOD (  25.83  )
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

Hi,

Am Mittwoch, 6. November 2024, 15:17:02 CET schrieb Diederik de Haas:
> On Mon Nov 4, 2024 at 12:11 PM CET, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >
> > Add dt-binding schema for the MIPI CSI/DSI PHY found on
> > Rockchip RK3588 SoCs.
> >
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> > new file mode 100644
> > index 000000000000..5ee8d7246fa0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/rockchip,rk3588-mipi-dcphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip MIPI CSI/DSI PHY with Samsung IP block
> > +
> > +maintainers:
> > +  - Guochun Huang <hero.huang@rock-chips.com>
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3576-mipi-dcphy
> > +      - rockchip,rk3588-mipi-dcphy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: ref
> > +
> > +  resets:
> > +    maxItems: 4
> > +
> > +  reset-names:
> > +    items:
> > +      - const: m_phy
> > +      - const: apb
> > +      - const: grf
> > +      - const: s_phy
> > +
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the syscon managing the 'mipi dcphy general register files'.
> 
> Should this dt-binding have a power-domains property?
> RK3588 TRM v1.0 part 1 page 1097 has ALIVE(PD_BUS) for
> MIPI_DC_PHY0~MIPI_DC_PHY1

I don't think so. As you write, the dcphy is part of the PD_BUS(ALIVE)
power-domain on at least rk3588 and the new rk3576.

This power-domain is actually non-controllable and also contains things
like the main GIC - so will be always on.

And for that reason probably, that domain also is not even exposed
in the rk3588 devicetree (nor the driver implementation).

Similarly the hdptx phy binding (in a similar situation) also does not
handle a power-domain. So my thinking is, we'll stay like this for now.


Heiko

> FTR: I made a similar remark on another patch sent by Heiko today. While
> that was incorrect, I do think it's appropriate for this binding after
> which it could also be added to the respective phy nodes in the dts(i)
> file(s).
> 
> Cheers,
>   Diederik
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      phy@feda0000 {
> > +        compatible = "rockchip,rk3588-mipi-dcphy";
> > +        reg = <0x0 0xfeda0000 0x0 0x10000>;
> > +        clocks = <&cru PCLK_MIPI_DCPHY0>,
> > +                 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> > +        clock-names = "pclk", "ref";
> > +        resets = <&cru SRST_M_MIPI_DCPHY0>,
> > +                 <&cru SRST_P_MIPI_DCPHY0>,
> > +                 <&cru SRST_P_MIPI_DCPHY0_GRF>,
> > +                 <&cru SRST_S_MIPI_DCPHY0>;
> > +        reset-names = "m_phy", "apb", "grf", "s_phy";
> > +        rockchip,grf = <&mipidcphy0_grf>;
> > +        #phy-cells = <0>;
> > +      };
> > +    };
> 
> 





