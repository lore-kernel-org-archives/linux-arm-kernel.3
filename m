Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D68C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht0dRD9M1MygnScOVw6Bzwunrv6mJ0iuFtlnecwrQ7M=; b=q3e2lqxWEQrCpmY6lPpsqXleKA
	Qs4ZyzXZAMmfxJ9Nuy4SRx/68ZApGL0qwQ34M8UU7s+5Bq6epww9M+KbvS7+ffP3G+8Yeqau0XQJL
	h/mxaANy6olQYOn/LLLv25+Z/m/baUrPMEbm9GTr6upzD/QAKk9wYHdYsnvzGy+loM12CGV/5923Y
	EeuHlaiE67bVNLIVcZLg3GRHO9Obv9Bg7vy+tHVTKQsFuczWMVOwYHU348CEntpkNtFmuFbUMbzZ9
	4Ot6X53lDvcN1fEvBAwASV2ID+4eAMdidq5C5QIBYNd0tUlJzCcsii1XRgHAEolRcaXAh17bUhz8R
	Z3Np1BXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpju3-00000007Kfr-2PZx;
	Wed, 05 Mar 2025 08:14:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiwH-00000007DQE-288p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6E2B5C6657;
	Wed,  5 Mar 2025 07:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F00C4CEEA;
	Wed,  5 Mar 2025 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741158788;
	bh=XALvqM3rTWffhLsWC4ScvJKu3JsXVYqY3UUNekYl9No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+/l0hObN4qKsYWxBrpFijsi02TehWWysBo4MjWPA8ItPzuoALg9Uaez6f5FmwXY+
	 EOMyRWxseN3yrkKFDCbKFYldEFyWxReQhqsaJQcNeAXHtyAGu7bPgpgmAh3u468eiF
	 2ddsAG64Ft1sBD8NwU6gOfhdP6qO4r42pBdbe7ys41rmbi4NmTSTP3Z5r9WFKJjkAC
	 +cTk7qkt+mDJmmEcuHaOC+jASwD1KrY8LtfnY7PWy6Q8Nh6zITlyAmAvKWMAKIwAFZ
	 GAv8p+Mqg3Czhe5X3OLm2S59GThK88/bPQrG06wjar9NNJHdE9lDyVOS+4cYPqcuGV
	 l1HqCvQPSZdDg==
Date: Wed, 5 Mar 2025 08:13:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: imx93-media-blk-ctrl: Add LDB
 subnode into schema and example
Message-ID: <20250305-dandelion-axolotl-of-excitement-05fa70@krzk-bin>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
 <20250304154929.1785200-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304154929.1785200-3-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_231309_638572_6DD729D1 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Mar 04, 2025 at 04:49:21PM +0100, Alexander Stein wrote:
> Document the LDB bridge subnode and add the subnode into the example.
> For the subnode to work, the block control must scan its subnodes and

Don't describe drivers, but describe the hardware.


> bind drivers to them, do not misuse either simple-bus or simple-mfd
> here.

I don't understand that simple-bus or simple-mfd statement. There are no
such compatibles here.

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index b3554e7f9e76d..cd785111928bf 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -24,6 +24,14 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    '#power-domain-cells':
>      const: 1
>  
> @@ -46,9 +54,20 @@ properties:
>        - const: csi
>        - const: dsi
>  
> +  bridge@20:

@20 looks wrong. Use 'ranges;' and try again your DTS...

Binding is supposed to be complete. We have several examples when people
added children one-by-one, everytime with different reasoning about
child addressing.

So please confirm: this is complete and no other children will ever be
added here... or you are 100% sure that all future children will be
unit-addressable (will have unit address and appropriate properties).

BTW, I don't quite get why this is both syscon and has translation for
child addresses. Does it mean your child does not use the same MMIO as
parent, thus leading to unsynchronized reg access?

> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        contains:
> +          const: fsl,imx93-ldb
> +
>  required:
>    - compatible
>    - reg
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
>    - power-domains
>    - clocks
>    - clock-names
> @@ -77,4 +96,36 @@ examples:
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
>        #power-domain-cells = <1>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges = <0x0 0x4ac10000 0x10000>;
> +
> +      bridge@20 {
> +          compatible = "fsl,imx93-ldb";
> +          reg = <0x20 0x4>, <0x24 0x4>;
> +          reg-names = "ldb", "lvds";
> +          clocks = <&clk IMX93_CLK_LVDS_GATE>;
> +          clock-names = "ldb";
> +
> +          ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                  reg = <0>;
> +
> +                  ldb_from_lcdif2: endpoint {
> +                      remote-endpoint = <&lcdif2_to_ldb>;
> +                  };
> +              };
> +
> +              port@1 {
> +                  reg = <1>;
> +
> +                  ldb_lvds: endpoint {
> +                      remote-endpoint = <&ldb_to_panel>;
> +                  };
> +              };
> +          };

Messed indentation.

> +        };

Best regards,
Krzysztof


