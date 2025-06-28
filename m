Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A48C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81T8MWqJ+j4Mt5q08zXBg9GIKZHrbGdt/QLdVed2iY4=; b=Ztq/tlDSASejy3v6C0Cphh2ZUb
	aAMLrVHSbtNfem3MVa1+3PYZZ4fI7Kw6u7TfaIsDh4OhJq9NlYkzmjS3vwG3abyUzrr8i1yPTRweg
	D1yNzkAxkChaCX3I9adKPq0mwghePT9tATxyplJlaBfaRqlIvEKW7cyW/BpdyegEg3rEz5RJkllvE
	4abmenvAR3Na2K4qvkhQh5QcK6FEvDCM96oMIvu8UsOrwLezNDvoEs8fCg46nTX+NQPuWCpYWjeC1
	RbGjO+160C8ZoxzFrrRmVkVvVjTMcLEg0x2wKFlUNY4mld9CuxCyUpfQChU2UPzgMeGDmuyS0flUq
	zAws6Nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUph-0000000Gn3C-0O4i;
	Sat, 28 Jun 2025 12:39:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUm3-0000000GmlV-25iy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 12:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA99661135;
	Sat, 28 Jun 2025 12:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B29C4CEEE;
	Sat, 28 Jun 2025 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751114114;
	bh=CYSbec/13UMVZGeQLR3wotXbDDONkq50TGJNSWT436k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQes4/p/zWhLH1vIXHJ6EYJpbnSlJLSKX/W5m/64aItzRchj+bmijLd8dzlHdxROI
	 RGK5yGDmHq+IAmK6Oalnz8tYvI6CIRQeta5xo201Osm0+0mbxn53f+l21VwneM+yHB
	 W2KBhvWhByAAh+gkbh9b3VQKzKngPYghy0Mma6VyvC3sT/SILYwaecpgpAtl6KRnP3
	 aT7zBPJlt8DjgOyxPPqzTWDV4P5Rarqb01+/jGIqVrJGYifcnazIAU5uZ2eRZlYkbM
	 gNyKySFC97O/+GwCOeID70B19CoifUoz9c8BvOrpI+2e2LlSUJcz8UAM1w5a5cVAEs
	 WXjgvbHj6jo+A==
Date: Sat, 28 Jun 2025 14:35:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-binding: pci-imx6: Add external reference
 clock mode support
Message-ID: <20250628-petite-fabulous-firefly-80a6f4@krzk-bin>
References: <20250626073804.3113757-1-hongxing.zhu@nxp.com>
 <20250626073804.3113757-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626073804.3113757-3-hongxing.zhu@nxp.com>
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

On Thu, Jun 26, 2025 at 03:38:03PM +0800, Richard Zhu wrote:
> On i.MX, the PCIe reference clock might come from either internal
> system PLL or external clock source.
> Add the external reference clock source for reference clock.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index ca5f2970f217..a45876aba4da 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -219,7 +219,12 @@ allOf:
>              - const: pcie_bus
>              - const: pcie_phy
>              - const: pcie_aux
> -            - const: ref
> +            - description: PCIe reference clock.
> +              oneOf:
> +                - description: The controller might be configured clocking
> +                    coming in from either an internal system PLL or an
> +                    external clock source.
> +                  enum: [ref, extref]

NAK

As explained in other thread this is the same input and you just
call it differently.

Best regards,
Krzysztof


