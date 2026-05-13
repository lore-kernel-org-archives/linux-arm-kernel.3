Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C4CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d444E3MdN7IH9yjOwqEN7TueuW8/sZBnX9CisoRQ36s=; b=cvbNQ3mJqJvfx/6fPj4kKm4GIL
	ftPiYST0Pcgs9mc8MJwMtf/YTzNaK+AzzCwr76QFXHDFnovVFGs12pSoX5SQmg8iShatWj/Dkhxpb
	tBwFYe5lsg132laWMXcmMDfwmoa5jot1VWGF13IiR2WwlInXqxqFE9Ch/jJC3hswSKjCbku7IAMsQ
	ZuN9yzKGhh06lfa3Ng6Tc0moy/Ncoyg0Bf1GTJcFdLviIaRN6HXiru0eKcnvBAj6lFmsWFN5QJxuE
	1s9Ge6Y0Lj8fh6g5i+bNIjg9wGsoIbJAZ5I/mFz1emZTGZJIXNoKRcnMfZhF7edZaVZuv50YdUdEt
	OZTfq63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6qG-00000002BjV-0f2h;
	Wed, 13 May 2026 10:29:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6qC-00000002BiK-1o9P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:29:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6q0-0003LM-VQ; Wed, 13 May 2026 12:29:12 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6q0-000aCm-2B;
	Wed, 13 May 2026 12:29:12 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wN6q0-00000002oGI-2KJN;
	Wed, 13 May 2026 12:29:12 +0200
Date: Wed, 13 May 2026 12:29:12 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <ymhkemd7ojr4aa5ak2ang4774ks2hpg4b7cpx27n7mk2cuvhj5@wn7h6j2eiu4f>
References: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
 <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032924_473706_6AD01427 
X-CRM114-Status: GOOD (  19.67  )
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

can we please wait for the outcome of this dicussion:

https://lore.kernel.org/all/uyh5s6g7bvuufnhfjrmungp5dbyllxfrgfzaxno22knpxxojmj@qqvh75ezblpp/

before we're going further?

Regards,
  Marco

On 26-05-13, Liu Ying wrote:
> i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
> register which control video output through a LVDS interface.  Allow the
> LVDS Display Bridge(LDB) child node and add the child node to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index d828c2e82965..ab563b457e07 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    '#power-domain-cells':
>      const: 1
>  
> @@ -92,6 +98,11 @@ properties:
>        - compatible
>        - ports
>  
> +  bridge@20:
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +    unevaluatedProperties: false
> +
>  allOf:
>    - if:
>        properties:
> @@ -163,6 +174,8 @@ examples:
>                 <&clk IMX93_CLK_MIPI_DSI_GATE>;
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
>        #power-domain-cells = <1>;
>  
>        dpi-bridge {
> @@ -190,4 +203,29 @@ examples:
>            };
>          };
>        };
> +
> +      bridge@20 {
> +        compatible = "fsl,imx93-ldb";
> +        reg = <0x20 0x4>, <0x24 0x4>;
> +        reg-names = "ldb", "lvds";
> +        clocks = <&clk IMX93_CLK_LVDS_GATE>;
> +        clock-names = "ldb";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&lcdif_to_ldb>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +          };
> +        };
> +      };
>      };
> 
> -- 
> 2.43.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

