Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D2BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=purajMjFhhk8y5/cpEF3Tr9X2g/M0StBEyNcpYreAGQ=; b=pYzHLcEnGtERLUkNFvaozLcJsX
	KLJSVea4w5Okka7wfaqFxrPKmIXF2CuHkoB3mFwGEpGlc/KWAA4jN+gmVJjijHrgS0GDKk146rQ9b
	0QCFMtd78i0IXHnfsxMAQA8h+OjH3nvufjxv2C+cSg3+dgWEYkbGE1ToJJnk/JLgXvX0AWADNI/11
	r6V/CY3rUNH/8elERYKpu3e6WhrHL7ORxzSw+cO4Ut6P75nCe02jkPgzrA/Go1em7rk11g8H1YNme
	tTyV81rr1215GgP3PvjuulTOrKJ0ePBccc/1AqDeAhuLgkGc2uPPsaB5PyDHkSQYma546yRreeT2e
	fa8e3dDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxJj-0000000B6tR-2Q7Q;
	Tue, 10 Dec 2024 10:18:11 +0000
Received: from out-184.mta1.migadu.com ([2001:41d0:203:375::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxD9-0000000B5HC-3uWa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:11:25 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1733825479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=purajMjFhhk8y5/cpEF3Tr9X2g/M0StBEyNcpYreAGQ=;
	b=NP0seO6ZkdS2m743DvP2W4u6umphTKJ3vID18ZeBxSHPY0Yo3J+7mkFKSH269V5fr3hvZm
	T74G377FYPbEDDgtfloYV/kw0OgMQ4wg5UvqGE2V4MaK5sHQZUXBOyaULdn1jfyo/puj2c
	8Xvj6JMIPwRply5w+fCIm6ZhRmwKpYxZ1e8npoBeJ5zXiEL4V9tkjU1oMrM1zMlh3TcH9x
	L3BssV0fnPQ8De/3uBS8KENaNxj73YxspCuc3EcZZyUcqlvizwXohOgG10PCmcmoPVZ+q+
	/0SJNDbGqwoS6ulAFy7hF/4UPKWXILs8u7EVdclE8QdaYJ82hC7QXLG+Ga0hgQ==
Content-Type: multipart/signed;
 boundary=f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 10 Dec 2024 11:11:09 +0100
Message-Id: <D67XU0SO4U6D.2GTDZE4V7RK0J@cknow.org>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dmitry.osipenko@collabora.com>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: media: Document bindings for HDMI
 RX Controller
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Shreeya Patel" <shreeya.patel@collabora.com>, <heiko@sntech.de>,
 <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <p.zabel@pengutronix.de>, <jose.abreu@synopsys.com>,
 <nelson.costa@synopsys.com>, <shawn.wen@rock-chips.com>,
 <nicolas.dufresne@collabora.com>, <hverkuil@xs4all.nl>,
 <hverkuil-cisco@xs4all.nl>
References: <20241209200120.3228643-1-shreeya.patel@collabora.com>
 <01020193ad040150-e0cf3371-115b-469e-840e-4fa97af5b207-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020193ad040150-e0cf3371-115b-469e-840e-4fa97af5b207-000000@eu-west-1.amazonses.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_021124_242409_853616D0 
X-CRM114-Status: GOOD (  20.38  )
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

--f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Dec 9, 2024 at 9:02 PM CET, Shreeya Patel wrote:
> Document bindings for the Synopsys DesignWare HDMI RX Controller.
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
>
> Changes in v5 :-
> - Correct the interrupt IRQ number
>
> Changes in v4 :-
> - No change
>
> Changes in v3 :-
> - Rename hdmirx_cma to hdmi_receiver_cma
> - Add a Reviewed-by tag
>
> Changes in v2 :-
> - Add a description for the hardware
> - Rename resets, vo1 grf and HPD properties
> - Add a proper description for grf and vo1-grf phandles
> - Rename the HDMI Input node name to hdmi-receiver
> - Improve the subject line
> - Include gpio header file in example to fix dt_binding_check failure
>
>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-=
rx.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> new file mode 100644
> index 000000000000..510e94e9ca3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
> +
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI RX Controller
> +
> +maintainers:
> +  - Shreeya Patel <shreeya.patel@collabora.com>
> +
> +description:
> +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs

s/preset/present/ ?

> +  allowing devices to receive and decode high-resolution video streams
> +  from external sources like media players, cameras, laptops, etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3588-hdmirx-ctrler
> +      - const: snps,dw-hdmi-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: cec
> +      - const: hdmi
> +      - const: dma
> +
> +  clocks:
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: audio
> +      - const: cr_para
> +      - const: pclk
> +      - const: ref
> +      - const: hclk_s_hdmirx
> +      - const: hclk_vo1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +      - const: ref
> +      - const: biu
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  hpd-gpios:
> +    description: GPIO specifier for HPD.
> +    maxItems: 1
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the general register file
> +      containing HDMIRX PHY status bits.
> +
> +  rockchip,vo1-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the Video Output GRF register
> +      to enable EDID transfer through SDAIN and SCLIN.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - pinctrl-0
> +  - hpd-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +    hdmi_receiver: hdmi-receiver@fdee0000 {
> +      compatible =3D "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> +      reg =3D <0xfdee0000 0x6000>;
> +      interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> +      interrupt-names =3D "cec", "hdmi", "dma";
> +      clocks =3D <&cru ACLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_AUD>,
> +               <&cru CLK_CR_PARA>,
> +               <&cru PCLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_REF>,
> +               <&cru PCLK_S_HDMIRX>,
> +               <&cru HCLK_VO1>;
> +      clock-names =3D "aclk",
> +                    "audio",
> +                    "cr_para",
> +                    "pclk",
> +                    "ref",
> +                    "hclk_s_hdmirx",
> +                    "hclk_vo1";
> +      power-domains =3D <&power RK3588_PD_VO1>;
> +      resets =3D <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> +      reset-names =3D "axi", "apb", "ref", "biu";
> +      memory-region =3D <&hdmi_receiver_cma>;
> +      pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdm=
im1_rx_sda &hdmirx_5v_detection>;
> +      pinctrl-names =3D "default";
> +      hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;

I just found out it isn't documented in the DTS coding style and that
the binding is technically not specifically for a Rockchip based
component, but there is a convention to sort the node properties
alpha-numerically by property name, with some exceptions.

So would it be useful to apply that convention to the example?
And possibly to the list of required properties as well?

Cheers,
  Diederik

> +    };


--f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ1gTwQAKCRDXblvOeH7b
bsFZAP9ah94RpYjb318hSsjAUcVveSXQNnXUQZtSOiciapqPPwD9HrzGbq5DsPOY
Dbp0/AwZTuRb8GPhxezjlT57mTULfAc=
=kg+g
-----END PGP SIGNATURE-----

--f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1--

