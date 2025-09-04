Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF18CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23UPQiq3HKBeZ/6vZvITYqpan987DHIDAc6VTlI3ndA=; b=dM+xlYPt3akB8mfvIEY8Qr3neA
	vEUQFiomQ8pahSHti0pkEvjMAOwWrTVaFP/er4e4TMMT9WfFZzbQoanzcrQEEXym5MqDlQSvQXXJ9
	XQZztPE2mR3b3S7kQhv0zcEzIWtGH7M6UVNXGMLJTB1PafxaB/kBrIL9yKR1vniBU3/MgQ29x1rQs
	Iea4lIs71z8llJ9G2YIht/yGDGBDEkMFn1xuEl9jY6EpaxxoZPQBbG8kju2/hZRAY9PirFbNEA8UJ
	GVEMj5rLIvu8LyxUC23wCiALIilfQmaLEQSKKp4BIfFQrADp7os6iBHjsre+nLPxFr86/cM749ch0
	0ixaX1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4cz-00000009xaT-3pUR;
	Thu, 04 Sep 2025 07:43:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4Na-00000009rRs-0y6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C80AA4390C;
	Thu,  4 Sep 2025 07:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4589AC4CEF0;
	Thu,  4 Sep 2025 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756970853;
	bh=Z8XSQTvtPUkxAQ9BXix6/Yhokfu8nsR+89vawyheIsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRT50ZUhGaiA9XuQgRPkzuI+B/6okbH+qUPwIurIe99vYFu8u3r7UVXtK1fXYfue3
	 Tct/kxZsTf047c3Q4Xw5jRmOGoEwB2CQYuadcmL4NKKRsuhK0krkwqDd7CKrRZdZyA
	 Jl7w7prXAnR/VYEi4qarJDsN5UgokGCtLY3SwZicKhnp/Bn/M3w26Yzkpo9zyP+xZc
	 yY0p+KiSnrKQ/v0H+Hc6Z3+meX1Hy8obFSgfJWvt41GUkH5hbjr2aKJrQoWuRSIfeC
	 VVn8p9MnyRgrJ6kd16q039oE8lvlHbuZYl1zouYM7MqI3j2qRdKokXcOILRYQGmxKp
	 WhXOd9rsF1oXA==
Date: Thu, 4 Sep 2025 09:27:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb
 child node
Message-ID: <20250904-misty-mini-buzzard-af2aec@kuoka>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
 <20250903123332.2569241-7-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903123332.2569241-7-laurentiu.palcu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_002734_291775_F7626FD2 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Sep 03, 2025 at 03:33:24PM +0300, Laurentiu Palcu wrote:
> Since the BLK CTL registers, like the LVDS CSR, can be used to control the
> LVDS Display Bridge controllers, add 'ldb' child node to handle
> these use cases.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml     | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)

Nothing in the changelog explains this patch.

What happened with entire previous review?

> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d62..f83d96701bb04 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,28 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nxp,imx94-lvds-csr
> +then:
> +  properties:
> +    "#address-cells":
> +      const: 1
> +
> +    "#size-cells":
> +      const: 1
> +
> +  patternProperties:
> +    "^ldb@[0-9a-f]+$":

No, don't define nodes in if:then:. Where did you get this syntax from?

> +      type: object
> +      $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +
> +  required:
> +    - '#address-cells'
> +    - '#size-cells'
> +
>  required:
>    - compatible
>    - reg
> @@ -46,7 +68,7 @@ required:
>    - power-domains
>    - clocks
>  
> -additionalProperties: false
> +unevaluatedProperties: false

NAK, so schema warned you above syntax is wrong and you decided to
silence the warning with this hack, right?

Best regards,
Krzysztof


