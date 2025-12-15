Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5898BD5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 17:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhzbYLgHXrFCqrqlgyb3hLVshmQ6tTLHabXaDs+ph84=; b=cIxIUQ/A2djxQYBQuGDPqWR7Xh
	MYlSTqmoXOfzq1/BikPNAYzi5zyq91Ur+O6Bvml7wHs6Mh5jw3HHxM01n3zSXbgEeMx9iStmmMVT4
	K2sB2/NMI13KHJot6KuTwol9IASqwh+JkiJvTFJ3WG3uZS8/xSPl9jknCNmOpXEIrKP3w+sLB+9bm
	vH8txSJPFUpk8BIfq8QBfotSBiN0N/MLy0qUVFwupiPBtcHg7g39S5LERfHovTDQL1D+Uw4t8FHBe
	WDllmuLzSMMwjU2T3n63XqFiKuk4QZ4nBuezrLudNhd2yrnZg6nyFQ+BuiRim/W9/YOkhV0KXCkIS
	XgeZd3wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCmo-000000045nh-1yi4;
	Mon, 15 Dec 2025 17:55:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCmk-000000045mx-37xI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 17:55:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vVCmL-00053K-QB; Mon, 15 Dec 2025 18:54:37 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vVCmK-005osn-1G;
	Mon, 15 Dec 2025 18:54:36 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vVCmK-008zqO-0i;
	Mon, 15 Dec 2025 18:54:36 +0100
Date: Mon, 15 Dec 2025 18:54:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_095502_944270_34B86CA5 
X-CRM114-Status: GOOD (  35.71  )
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

Hi Liu,

sorry I didn't fully answer you please see below.

On 25-12-08, Liu Ying wrote:
> Hi Marco,
> 
> On 12/02/2025, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> > 
> > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Document the Parallel Display Format Configuration(PDFC) subnode
> > and add the subnode to example.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > [m.felsch@pengutronix.de: add bus-width]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > @@ -26,6 +26,12 @@ properties:
> >    reg:
> >      maxItems: 1

...

> > +            properties:
> > +              endpoint:
> > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +                unevaluatedProperties: false
> > +
> > +                properties:
> > +                  bus-width:
> 
> In v1-v5, I thought the output bus format can be determined by the sink
> device(a panel or a bridge) hence properties like bus-width were not needed.
> But, if this property is really needed, then reference video-interfaces.yaml
> since bus-width is documented there.  Should we reference bus-type defined
> in video-interfaces.yaml too?

You're right, the bus-width should be determined by the connected panel.
But there are cases where a 24-bit panel is connected but only the lower
18-bits are muxed. I added the bus-width property to handle this case.
In the end most users don't have to specify this since the correct
bus-width is coming from the panel bus-fmt.

> > +                    enum: [ 16, 18, 24 ]
> 
> The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP supports
> below formats.  It seems that the enum here may tell RGB888, RGB666 and RGB565.
> How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> 
> 000b RGB888 -> RGB888
> 001b RGB888 -> RGB666
> 010b RGB565 -> RGB565
> 011b RGB555 -> RGB555
> 100b YUV -> YCbCr 24 bits
> 101b YUV -> YUV444

This enum is about the physical bus width. RGB565 == 16-bit, YUV ==
24-bit.

That said, I don't think that you need to specify the bus-fmt since this
is coming from the panel. As said above, my itension with the bus-width
property is to provide integrators (dts-writers) a possibility to limit
the physical available bus width.

> > +                    description:
> > +                      Specify the physical parallel bus width.
> > +
> > +                      This property is optional if the display bus-width
> > +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> > +                      is connected and all 18-bit data lanes are muxed to the
> 
> Per video-interfaces.yaml, s/data lanes/data lines/.  "data lanes" is a
> value for MIPI DSI/CSI, afaik.

I can go with "lines" if this is the preferred naming convention for
DRM.

> > +                      parallel-output pads.
> 
> How about just saying that this property is optional and by default it's 24?

I wanted to make it clear what this property does.

> > +                      This property must be set to 18 to cut only the LSBs
> > +                      instead of the MSBs in case a 24-bit RGB888 display is
> > +                      connected and only the lower 18-bit data lanes are muxed
> > +                      to the parallel-output pads.
> 
> The __lower__ 18-bit?  Isn't it the __MSB__ 6bit in each color component?

No, the LSB are cut, this is why it's so important to use this property
if you connected a external 24-bit display to the lower data
lines[17-0].

If you don't specify this property, the MSBs are cut/lost which is far
worse than using the LSB information.

Regards,
  Marco

> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - ports
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -81,9 +141,12 @@ allOf:
> >              - const: isi
> >              - const: csi
> >              - const: dsi
> > +
> >  required:
> >    - compatible
> >    - reg
> > +  - '#address-cells'
> > +  - '#size-cells'
> >    - power-domains
> >    - clocks
> >    - clock-names
> > @@ -112,4 +175,33 @@ examples:
> >                 clock-names = "apb", "axi", "nic", "disp", "cam",
> >                               "pxp", "lcdif", "isi", "csi", "dsi";
> >        #power-domain-cells = <1>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      bridge@60 {
> > +        compatible = "nxp,imx93-pdfc";
> > +        reg = <0x60 0x4>;
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +
> > +            pdfc_from_lcdif: endpoint {
> > +              remote-endpoint = <&lcdif_to_pdfc>;
> > +            };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +
> > +            pdfc_to_panel: endpoint {
> > +              remote-endpoint = <&panel_from_pdfc>;
> > +              bus-width = <18>;
> > +            };
> > +          };
> > +        };
> > +      };
> >      };
> > 
> 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

