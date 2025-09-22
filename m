Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32615CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhX96/VCknrVdxhhCQa4qsun1A72hXqHFX6SP6yo38U=; b=iYSV7krulGrQYWnoH3SSoVln4B
	ovjF0osLG8H9CiqHqlPEojXN4Cdzde7dEjnLmIPNcRAeDqIkvAJPKu0GfJE4W4l6r10Z/GfNPtz3W
	D1YTOhGQ83clG9n95QjIn8ZdPK18QXho0Utwjdrp+fZpXaA+4kNEZ1A+ZcmRWoa8LXF4LQ3x+tc5E
	Cmg6OzXZmLpuzjuzuC+4nYXkiNaDLSNY0cehzEP5UM9R1vsRIodpxaHLm3ULJCjGgoosBI39KuCAm
	3jMTjBd6BIeifqoqtU3jYmpxkkZ9zS/D4lAb1ZdwcQOvDKefDwA1rWteO/7cdDKBipk6ZnePiWhH+
	nEFCGMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iob-0000000AtMl-2ark;
	Mon, 22 Sep 2025 15:50:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ioa-0000000AtMJ-153Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF954601AA;
	Mon, 22 Sep 2025 15:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E990C4CEF0;
	Mon, 22 Sep 2025 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758556255;
	bh=vbMWpitNm5DxTqLLDH+qpPPtWqFkWWec0kTvC3CnpIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3/hIOqUGt7lMUrCdD6KiF2I0jx9XcFlOlEkom9VEIoyZlauSSBxyIAauJWW6meE9
	 CtB/Jy8U8SKffhmKvaLp2hc2TQKqT1EOkWr5EyPwDIzAXyb7gP0n83QvuLvz78sHFE
	 XhL91XDLSF4+JnnKPKi8E5s7KO0ayFhjSFSXqX3n7v8VQADUM7K8Lo4IzqoP4WyDTR
	 zW3dUiUUdQq60f2+U16QPNRp+Gpr5mCZ1rc8Yc8iyosATMNsojw6RJYnEaptLBJyIj
	 6ENvvD4G3x25o+b3tWndQlEh80qPVfoqyQFj6NT9hB7BBx9C6h8MYpXD9OjWmO2sg4
	 3xnTgNRwUcmxw==
Date: Mon, 22 Sep 2025 10:50:54 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: pci-imx6: Add external reference
 clock mode support
Message-ID: <20250922155054.GA38670-robh@kernel.org>
References: <20250915035348.3252353-1-hongxing.zhu@nxp.com>
 <20250915035348.3252353-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915035348.3252353-3-hongxing.zhu@nxp.com>
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

On Mon, Sep 15, 2025 at 11:53:47AM +0800, Richard Zhu wrote:
> On i.MX, PCIe has two reference clock inputs: one from the internal PLL
> and one from an external clock source. Only one needs to be used,
> depending on the board design. Add the external reference clock source
> for reference clock.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index ca5f2970f217..6be45abe6e52 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -219,7 +219,12 @@ allOf:
>              - const: pcie_bus
>              - const: pcie_phy
>              - const: pcie_aux
> -            - const: ref
> +            - description: PCIe reference clock.
> +              oneOf:
> +                - description: The controller has two reference clock
> +                    inputs, internal system PLL and external clock
> +                    source. Only one needs to be used.
> +                  enum: [ref, extref]

This seems wrong to me. There's still only 1 ref input to the PCIe 
block. If you had 10 possible choices for the ref clock source, would 
you add 10 clock names here? No!

Can't you detect what the parent clock is for the 'ref' clock? and 
configure the GPR register appropriately. Or that mux should be modeled 
as a clock provider.

Rob

