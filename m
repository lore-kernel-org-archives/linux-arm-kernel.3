Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D454EC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSnwBDp+fSUDCJeOQEKYv5ZVpjB4BL4Sn9hUbks/+LI=; b=Z26Rdl0nXrEA776Xp2LVTr6hp+
	fP52JmFMymWOBWt6SaJw7QKUWmWv90dfs7cWxXevfdO18OxmPHKn0sPdbxSKlilko4xT9Tav4okpd
	zsXKv0qpPBzsv5sE5t1Bi+Ubz+sXFcItJrUGPpq2y3y/6vwR7K8VgJg8BmBZmdpgtQHde/PJQUMIy
	A/7pWkIxHq2J01COWw6Q69GxuIHDFqj+AoHaPDBUStUCTFe8m9+XJhyJ4l9XJIbAM39n/Se2Blq5a
	9ppn9kI7dRXM06RYViA59AD1U3Nm437bk8fEaHchMtWewdzFrFzS6FCz8QOB/O6vx/fbRldh4JGvw
	oLEcYpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0k-00000000LBT-1dDM;
	Tue, 25 Feb 2025 16:42:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwIr-0000000HaYc-2UTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 835D15C70F0;
	Tue, 25 Feb 2025 14:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55A7C4CEDD;
	Tue, 25 Feb 2025 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740495176;
	bh=9C5oZ34+32K1qOoiP/odmBMxPo1y7u2d3iAaqcJQqhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nniS8Ylf0dMMCUmZyFFlrxUqtB/4nEuBBDOKSb2OukGdLPfst0NMG6qXCMbdBzdH8
	 HZHY9wlPcJS58E4+vFSZKUwd2+FODlZ56AkpvHLitB3jlw/ESa8gsFi6Xq4/MVjbmZ
	 jNQ0j6ZVf9PJS6/xsGXgbyOQJh4TdLdEalRnix6pv3LMz+qTewWMqmhQKs+Q/VaZ8n
	 Sawyr7ETjhek+V9WX//mOuZCRU8R1kfnLOs1ThvaZQlWT/MQ7PCpJQa8y8gnFbffPI
	 2fTYOgjKcBoYQKmvXAV4qNA0PamytmpOgQ7fJg0AAHHsYxfq5FJb8Uju9GkhXetzzz
	 m6Gs2RSmY4azA==
Date: Tue, 25 Feb 2025 08:52:54 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: soc: imx93-media-blk-ctrl: Add LDB
 subnode into schema and example
Message-ID: <20250225145254.GA2361434-robh@kernel.org>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
 <20250224142831.485159-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224142831.485159-3-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_065257_741010_3F49BF47 
X-CRM114-Status: GOOD (  17.75  )
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

On Mon, Feb 24, 2025 at 03:28:23PM +0100, Alexander Stein wrote:
> Document the LDB bridge subnode and add the subnode into the example.
> For the subnode to work, the block control must scan its subnodes and
> bind drivers to them, do not misuse either simple-bus or simple-mfd
> here.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index b3554e7f9e76d..d914dea6ecbb5 100644
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
> +      ranges;

Given the address below is 0x20, this looks wrong unless the parent 
address is 0.

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
> +        };
>      };
> -- 
> 2.43.0
> 

