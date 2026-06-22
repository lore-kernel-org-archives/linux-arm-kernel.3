Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7538CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE2b1Rn9vfLTVVEPttskMNsAr+Hsn4NycpgaiI4qn4s=; b=EmGgOU+pIsPI08KjtjScHYS1yd
	RcE+ibdvmIJDaDkyqdJ5MmY9KD27AhaIKW7IRLnznznh7MkqM32tSSWeIHLUT5RfEJ0iRLmA5K9Ck
	Mgf4OtY+tO8eYrQWw833nUubqtgowYf/XzvFjXGI12tqEqOnBXDT8raUhlBAU6SF3C1bwEQQbSUvt
	7GDZA4nDb8yLo2BWF9XHuIT41E9Rcys92S1bogGuIFH2/Br+sik5r7Fih0aiacLL6ZZ0c6J1U4IdW
	6g0nSQLvn78m2GTdDdb/h3ICwIB+lnxtHLthLSMzbdXceKGXUeMq1OHrxbPhhsWpTTvL9I/3YsEdz
	Eh8qLGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYU7-00000004VN8-0C1f;
	Mon, 22 Jun 2026 06:50:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYU5-00000004VMo-0sk8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:50:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE1DA6001A;
	Mon, 22 Jun 2026 06:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785621F000E9;
	Mon, 22 Jun 2026 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111015;
	bh=AE2b1Rn9vfLTVVEPttskMNsAr+Hsn4NycpgaiI4qn4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUcvahCnIwwrZZImhiv+n854ZNgVM3ko57w5UawDsEJw9uDSwM9HmPAATwWErihCq
	 jUjjCdGQm1PXwPIb4qnXJtwCx2oqAq87rDONcpjikE+lySWRd+B04d7QG16qigsmwP
	 Iue0i8UvcYNi5oL7NaiuN+ss/HrxE4u3kMREz+cStYhgGR22bac4G6Sok7ZF1LIABS
	 K+oCXUq2eBFyxCw8RlqiBiq+/u8KKWn+kI4UAWiE7k+dk+UC01hS0K0hG0RqIFTL9T
	 EU9w3TV365xKIdkBTvMps6J3KLXI029V6czi311N2pscDdQ6vDvHz09zyUWU3GUvYk
	 gSezYnub6rKtA==
Date: Mon, 22 Jun 2026 08:50:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 3/4] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <20260622-independent-meticulous-skunk-4fb221@quoll>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>
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

On Thu, Jun 18, 2026 at 05:41:37PM +0800, guoniu.zhou@oss.nxp.com wrote:
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
> ---
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
> 
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 64 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 534fa219d9f9..b4d0a7670fac 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -46,7 +46,27 @@ required:
>    - power-domains
>    - clocks
>  
> -additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      properties:
> +        '#address-cells':
> +          const: 1
> +        '#size-cells':
> +          const: 1

These should go to top-level. In if:then:else: you only narrow them,
e.g. you disallow for other variants (": false").

if:
then:
....
  required:
   ....
else:
  properties:
    '#address-cells': false

> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$':
> +          type: object
> +          $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#

This as well should be in top-level and here you only disallow it for
other variants.

You can avoid cross-tree dependencies by using compatible style:
https://elixir.bootlin.com/linux/v7.1-rc6/source/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml#L41


Best regards,
Krzysztof


