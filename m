Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BAAC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIY3KLx0NVnJTNGRra+GZa2Kh3/iY8HTWhCvE4KM1q4=; b=r9PEHVrdIQNl94dtm3c2pyUqll
	5+KjyPqNlAh/OqzIWUuBbp9sJlZd4tf5AGYuMvpbVzE63ipWYzFVWd8KT7+YUNg1MQW82LEFmlM3n
	hQBz/T6eomeJEhAyc/K5C/mKJuCFueQPu6W1V4U4ojVZX9Y7vLKj9t2nCkpaHPh5oKiNqBaX0v56G
	MdXIgyFT6xwSBvQje64HiLBVaH/6ESCVBR+xYn1CPnOdXFrCw75TK6mJGywRiNRmMw/02+bDhRJtb
	reJcg+YZF16yshk9o/qFVTz9UlBWlpgXs0LS6QDDSjV4mgoy/XpEXHudg6B/9oY3yZFf+TdZtTXW/
	POmOx6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpZa-0000000752l-2aST;
	Mon, 20 Jul 2026 15:06:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpZX-0000000751l-20mA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:06:25 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6FC7289;
	Mon, 20 Jul 2026 17:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784559922;
	bh=/QIDt4LDCYGQcnJdj1Dx87jsIpu4s/yJXTsEwMTLmgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3cegZmAnmCW2CNzqSdb2q8JVLanloll2EzhTtVk1ic2L5aFlHGrajBqIGJFe1rcy
	 o4Gglr/L8bi13h+aJFHIxGtpZw8MLBGC0YWlR4sXY5TASofRax5yZxxlsavmlyo/KX
	 82TdkU5WQOKXYQu8cuHOZcQY2WO2YdW846QVrbfI=
Date: Mon, 20 Jul 2026 18:06:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v13 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <20260720150620.GA26742@killaraus.ideasonboard.com>
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
 <20260720-csi_formatter-v13-2-4dc9a80e4cfd@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-csi_formatter-v13-2-4dc9a80e4cfd@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080623_669767_7DCE221F 
X-CRM114-Status: GOOD (  18.54  )
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

Hello Guoniu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 05:59:47PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v13:
> - Add Reviewed-by tag from Frank and Krzysztof
> 
> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)
> 
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
> 
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..fbbf1b3f1790 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,18 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^formatter@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +58,23 @@ required:
>    - power-domains
>    - clocks
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$': false
> +
>  additionalProperties: false
>  
>  examples:
> @@ -57,4 +86,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...

-- 
Regards,

Laurent Pinchart

