Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah5EDiHoXZZ+lJdmyeIH71Txk5rReWMRYVm4i/71Zto=; b=xecQMslApDHigrkmYh6ePb14mo
	hhoEDN+AzKtmqPZi2pygBCKRVXeOIPtaYZd4f4ok/mK21epe732GVkmGXMPgMQSzMj/aPttlgXnpp
	inoCFzjNaSJG7+tE7TEeFXtBzqgi70JspdSLXND7+z8tE3X3/FxraaiTCfdm96l2TQnGk7csa2LsD
	qMQ3RxMsTp7NhmvofUaJLs8+Vl1SyQ0cRIKA6Th9PcAT1QMv5e1u5MhGuim+6FrrwmF9AtsRIPV+r
	/ju0HsZcE2zHBzZoZW8d3Kw8oEUkDfaulfPMMF+xyZNTEOb/e3We5+CGCO0OvF+cJ8KV55tVWNlzh
	gG8zcLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC6b-0000000Elly-0b62;
	Mon, 29 Jun 2026 13:32:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC6Z-0000000Ellp-1Qts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:32:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B857660008;
	Mon, 29 Jun 2026 13:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF3F1F000E9;
	Mon, 29 Jun 2026 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739974;
	bh=Ah5EDiHoXZZ+lJdmyeIH71Txk5rReWMRYVm4i/71Zto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IQxSl2C5ZVoL+RZJnQ3IGrU4zyMNjh1eQY3r2zP0WlKD7IATkcPbK7dfca6hsG4pS
	 pxjIWksqD+fcsHFRVIPvbQ6FTsyowM/bEaqgt+NVPjJCSiRYd+l6crhjRUhImCH19w
	 9I6J+a/uYOHnEzIIuT7pFCJk295i8ji9aSw6zH/6ougbdQwIKenkRyWE2agDpYPaZd
	 WexRZ5Gk4UluaTfonEeEXYmc+VEBKlpLdLb7mKSr3gxNOyytLSeGUpSOGGrljN6vhe
	 shavK04GKdJYbw9MOmNjGQJwg2mstrjuZDbIHCHdSSIKzM03CI/PHPFeooC9mLYtZ7
	 stxgnBRbClUQQ==
Date: Mon, 29 Jun 2026 08:32:53 -0500
From: Rob Herring <robh@kernel.org>
To: chancel.liu@oss.nxp.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <20260629133253.GA2593312-robh@kernel.org>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
 <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
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

On Mon, Jun 29, 2026 at 04:47:31PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
> 
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
> 
> [1]https://www.nxp.com/part/IMX-AUD-IO
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> new file mode 100644
> index 000000000000..5085574d221b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP AUD-IO Slot
> +
> +maintainers:
> +  - Frank Li <Frank.li@nxp.com>
> +  - Chancel Liu <chancel.liu@nxp.com>
> +
> +description:
> +  The NXP AUD-IO slot represents a physically present I/O connector on
> +  the base board. It acts as a nexus that exposes a constrained set of
> +  I/O resources, such as GPIOs, clocks and interrupts, through fixed
> +  electrical wiring. All actual hardware providers reside on the base
> +  board. The connector node only defines index-based mappings to those
> +  providers. This connector type is present on i.MX95 19x19 EVK and
> +  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion card.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx952-evk-aud-io
> +          - const: fsl,imx95-19x19-evk-aud-io
> +      - const: fsl,imx95-19x19-evk-aud-io
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 32

You don't know how many GPIOs are on the connector?

> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffff
> +      - const: 0x0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0x0
> +      - const: 0x1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-map:
> +    minItems: 1
> +    maxItems: 16

You don't know how many clocks are on the connector?

> +
> +  clock-map-mask:
> +    items:
> +      - const: 0xff

> +
> +  clock-map-pass-thru: true

The purpose of this property (for GPIO) was to pass thru flag cells 
which are standardized. That's not the case for clocks.

Anyways, these properties need to be defined in dtschema first.

Rob

