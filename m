Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1535F105A59C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l40fN2Oy5b1WeAkX/KOEBOHplazcSCsYd0pIlMMyM2Q=; b=ZGfctcmENGnGvxLSbFEUmZZdLZ
	NtHmYY6ihhWGvdoAMFbh923tQ7pKhPQZRwJvZXEPpJdTodZKp0r3jhLbrJnL552v1aVMYfnA5tvi3
	V0MdZf2tpZcSNI9OSwV4rcgzeedA1+FtjILSWbttpDO8jZTXNrrdiDeZtyRmwz18O3GQ3twv6vlaA
	phmV/ihu5SLSNaCdtCEmXCHYLZ0k++zDiJj5AgfUYaKsRz+yYWtnr7+/LSuk1hCdzscRbheZNQH9y
	1dqMAp2sO4otmGNhHIeZQDM/bLIH6Y8wWGDRVhzSRFOLSJs1QnknBYjVGUHFQJvfq+TqwQShR4KOw
	55Wmjzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0g91-0000000E8Jx-0Nng;
	Thu, 12 Mar 2026 13:32:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0g8z-0000000E8JQ-3vwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 003C36014B;
	Thu, 12 Mar 2026 13:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828FBC19424;
	Thu, 12 Mar 2026 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773322324;
	bh=0EHfu8EBkTO2BFs0c4rn2ZmgflDAWNcNC/ordDOgUMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdO42dxM9tJSPv75IZsQjLk7V2acXzgKUIYacc2U9uJRnuqP64Er6Yf+NmHYXsOSd
	 1qS+VbkhydnE9v+dg5/9+fQ9t8TTQA7D28of2GlZBmuWXKrjVh9NflaH4zYe3bvlw8
	 cuWEJGsQFGrb6Z0d66mcMAdNcbEv41HplkqUuX4dT7WtAiWPWWcAHBAyKHngXso8+1
	 URWUETSK/ZK5iywoo1yilhqD7+qevv1udKSXwUAmuiQ/XWxOT8v2I6DH2q662j3x8Y
	 60MMJZIs7uVWD5ZmOOzSZySwplK87JYoEBd9gKcJyFAf7UYx9qdhRsyXWXfLWQbkHi
	 vjBej2itOnGBw==
Date: Thu, 12 Mar 2026 08:32:03 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Message-ID: <20260312133203.GA2768492-robh@kernel.org>
References: <20260312092745.295578-1-hongxing.zhu@nxp.com>
 <20260312092745.295578-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312092745.295578-3-hongxing.zhu@nxp.com>
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

On Thu, Mar 12, 2026 at 05:27:42PM +0800, Richard Zhu wrote:
> Add i.MX94 and i.MX943 PCIe compatible strings and fallback to
> i.MX95 PCIe compatible string.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       |  6 ++++
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 28 ++++++++++++-------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> index 0b3526de1d62..323ed3105d33 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> @@ -24,6 +24,8 @@ properties:
>        - fsl,imx8mp-pcie-ep
>        - fsl,imx8q-pcie-ep
>        - fsl,imx95-pcie-ep
> +      - fsl,imx94-pcie-ep
> +      - fsl,imx943-pcie-ep

How is it that the RC is compatible with imx95, but the EP is not? It's 
the same h/w.

>  
>    clocks:
>      minItems: 3
> @@ -94,6 +96,8 @@ allOf:
>          compatible:
>            enum:
>              - fsl,imx95-pcie-ep
> +            - fsl,imx94-pcie-ep
> +            - fsl,imx943-pcie-ep
>      then:
>        properties:
>          reg:
> @@ -114,6 +118,8 @@ allOf:
>            enum:
>              - fsl,imx8mq-pcie-ep
>              - fsl,imx95-pcie-ep
> +            - fsl,imx94-pcie-ep
> +            - fsl,imx943-pcie-ep
>      then:
>        properties:
>          clocks:
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 7fe1e0e9b565..46c1fabcd070 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -21,16 +21,24 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx6q-pcie
> -      - fsl,imx6sx-pcie
> -      - fsl,imx6qp-pcie
> -      - fsl,imx7d-pcie
> -      - fsl,imx8mq-pcie
> -      - fsl,imx8mm-pcie
> -      - fsl,imx8mp-pcie
> -      - fsl,imx95-pcie
> -      - fsl,imx8q-pcie
> +    oneOf:
> +      - enum:
> +          - fsl,imx6q-pcie
> +          - fsl,imx6sx-pcie
> +          - fsl,imx6qp-pcie
> +          - fsl,imx7d-pcie
> +          - fsl,imx8mq-pcie
> +          - fsl,imx8mm-pcie
> +          - fsl,imx8mp-pcie
> +          - fsl,imx95-pcie
> +          - fsl,imx8q-pcie
> +          - fsl,imx94-pcie
> +          - fsl,imx943-pcie
> +      - items:
> +          - enum:
> +            - fsl,imx94-pcie
> +            - fsl,imx943-pcie
> +          - const: fsl,imx95-pcie
>  
>    clocks:
>      minItems: 3
> -- 
> 2.37.1
> 

