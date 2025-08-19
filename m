Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90D6CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC94HbjbZIou/94/bfCKcAs3uf+gkU3X2AP/y0yU9yg=; b=4WazQKHYGs0dzbvqFOnfIuCFbV
	kUujY4uFD26GiTW1QzfvQywrQDIhT9i03ahD/U5bZqVN1m9fllQbWdCs0auAE4FL4jv43HK6v9iPU
	S1p9HZa2eMiVL0UKczJ6LN0TONpdRcWriWK8NSyq4BawHS6Fe/Ek/0guc5TjLTs/ygVv4itR4rRcE
	Uv+x0LiQzGO/N3OpFhEvRtXDK8/MxQXXDyr8Ws9AKGN9qjpZkrhPrY1XeLgdIvUCWEOTvf0SDzBUu
	698A0ggpMd8rL8lKKCddRR1e5q6buoa/VEhg3RWkjsCNFhKIe440CC08gX1iLlL6g6ZHoSPbNqFMJ
	k3Z8P5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQq7-0000000BCrk-0px5;
	Tue, 19 Aug 2025 18:13:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMJq-0000000AadG-4Azq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C01261428;
	Tue, 19 Aug 2025 13:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7FEC4CEF1;
	Tue, 19 Aug 2025 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755609846;
	bh=oMo/cdh38YCbOBw4iwATq7ozwW1TpUbE0yXhbYlUgU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+j8zTCxQdkcMEhMaej6GiAgIOaXfofvg7es9Jp2PGsrXvywOcYTBRmEuFNsYF/G8
	 qIviixcV27EuzpLCP/Nry898wPulNLltPxo16ILqFJjYM1R5Du+rz8J7TWL0oQ73Lx
	 Whwuwctm1JUeUeLNkuYPDOxjtAwdXZOaMTUS1hGTWXYn597TaUkbprtT5KuRs0qqzT
	 +fBOqlgcskasEvnBNDu8U3MYiGCiDf+G1RHobrmRS2I7i2xvaFcNOsSsfmgjjZs+Xl
	 iM7QRM7IS/3barZzPVPJn10e8de0FtZU4lWfYLD2JnIikAi9RjwVlfyjyHiHYwfnmm
	 Uf6IF5fk5eAjg==
Date: Tue, 19 Aug 2025 08:24:04 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <20250819132404.GA84481-robh@kernel.org>
References: <20250818183427.3601986-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818183427.3601986-1-Frank.Li@nxp.com>
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

On Mon, Aug 18, 2025 at 02:34:26PM -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual call it as system reset controller(SRC), but it is not
> module as linux reset controller, which used to reset individual device.
> SRC work as reboot controller, which reboot whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> new file mode 100644
> index 0000000000000..cb8aa510a21f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale vf610 System Reset Controller (SRC)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |

Don't need '|'

> +  IC reference manual call it as SRC, but it is not module as linux reset

calls

Linux details aren't really relevant.

> +  controller, which used to reset individual device. SRC work as reboot

works

> +  controller, which reboot whole system. It provide a syscon interface to

reboots

> +  syscon-reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-src
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    syscon@4006e000 {
> +        compatible = "fsl,vf610-src", "syscon";
> +        reg = <0x4006e000 0x1000>;
> +        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> -- 
> 2.34.1
> 

