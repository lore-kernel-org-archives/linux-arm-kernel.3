Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76304C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9vsNUUo75fSekdsSnWpYVgbbSY/b4oEtYnJyx+O+BI=; b=MOLG0zqH0VxguDa2+w8xCIkKF3
	E3FDftQfrF/xaBNMs5PYTSouiI7RbSVkmVJgcU2Ue4dme57lgfk3TJGmW4qZDHQsO9roOqQMBSSgj
	uw92L8aavsDcpxW06lEHZpzqDhtSNATcOfcEKLKZfkZtTko0GVvzDLO8OzSAkcTaNQtAu/i3nmpXx
	WAifW6/ttQKP6tXm6uJdtzFJGMJvuO+C3lERKJH6KgiE448YI4rl2VHH73b4WTmor6QBmoa59QQEo
	h1RRXh8Y/3sDNupWO+sczvWKaQoY3Hjssbx6i2xSdVWIPD++3AJ+47V0AxarpQUXHX1YPwE/oCqLN
	hU5MgUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9Hj-00000007Z8e-0L0I;
	Thu, 06 Feb 2025 21:19:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9GK-00000007Yz2-4AqT;
	Thu, 06 Feb 2025 21:18:18 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7341227;
	Thu,  6 Feb 2025 22:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738876619;
	bh=a9o//Z3kQXp75IfK8oqW2d3xPTbgXldqgAgvPGnV6UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIcorzY5kCIiui65WhPzYGRM2yHa4K+sORaYzMijC/QCL+w1+g4OPg1MU82u7stwj
	 qq0M/mQLFxlNuwuD3PcZhQhIV8QhnSH527Yi+wT7+73hyynYN4wn/nfv/gdzOtSPRp
	 rrkaAIDsNF3huY0t5AHXA+KyYP587Ae/UWijCJoo=
Date: Thu, 6 Feb 2025 23:18:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <20250206211808.GA24886@pendragon.ideasonboard.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
 <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_131817_173094_ABF384A2 
X-CRM114-Status: GOOD (  21.14  )
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

Hi Frank,

Thank you for the patch.

On Wed, Feb 05, 2025 at 12:18:10PM -0500, Frank Li wrote:
> Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.

s/CSI/CSI-2/ in the subject line, here and below.
s/phy/PHY/

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - Add missed fsl,imx8qm-mipi-cphy, which failback to fsl,imx8qxp-mipi-cphy
> - Move reg to required. Previous 8ulp use fsl,offset in downstream version.
> which should be reg. So move it to required
> ---
>  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> new file mode 100644
> index 0000000000000..7335b9262d0e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8 SoC MIPI CSI PHY
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  "#phy-cells":
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx8qxp-mipi-cphy
> +          - fsl,imx8ulp-mipi-cphy
> +      - items:
> +          - const: fsl,imx8qm-mipi-cphy
> +          - const: fsl,imx8qxp-mipi-cphy

Why are those called cphy when, as far as I can tell from the
documentation, they are D-PHYs ? Does that stand for *C*SI PHY ? I find
it slightly confusing, but not so much that I'd ask for a change. It's
just a name at the end of the day.

Apart from that the binding looks fairly OK. Except maybe from the fact
that this device is not a PHY :-( It has two PHY control registers, but
the rest seems related to the glue logic at the output of the CSI-2
receiver. I wonder if we should go the syscon route.

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qxp-mipi-cphy
> +    then:
> +      required:
> +        - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@58221000 {
> +            compatible = "fsl,imx8qxp-mipi-cphy";
> +            reg = <0x58221000 0x10000>;
> +            #phy-cells = <0>;
> +            power-domains = <&pd 0>;
> +    };
> +

-- 
Regards,

Laurent Pinchart

