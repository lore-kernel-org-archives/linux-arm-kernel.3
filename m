Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB0FC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD7HrBct3iPXCOCg6GBhxFLmNa6T2PdVjBcEySVUgIc=; b=hNMf4BuiCybLrjSn0w3BiiypPl
	qWAw1F859pvqntjfU5z3oVrWcFJFv2qj97FqH4I4TsOnyodl8GLx7XDXzfCxY5knn6Sd2518GsX+T
	47IdFPkNqwX4APF9VobTp4PIe+iAOxyyhTM4fYYTcOYPtwRPC1/bbqh4Qkoc2XqdB1L6qhxS3fFlc
	kAlR7IeDHnUvoG4dBJxNLzOA1AP8aWt2BIyXBH2YKvqCp1N5nwYZdfaQLmPz/EoXgdh2/dGvHt5fS
	PxK2bS7nHKu5z8MjLi4sGotAR9KJrARjOtPqUPU2wyxLdGSDC34MFMbkyqiBmMCi0YOuLYSc5ging
	2gS7s9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWaq-0000000EzBp-3FsY;
	Fri, 20 Jun 2025 07:55:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWYc-0000000Eymz-11CN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 07:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6A31617EE;
	Fri, 20 Jun 2025 07:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CF9C4CEED;
	Fri, 20 Jun 2025 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750405985;
	bh=4m726/Z0me12Me+hnL7MnK4ol0AFM26gZ8tqBJ8UZHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0qlmAo65bRWeUlFDIeElHSlh4l/ayGsWEX6JUZ093r4Q3ZYb3XIAq/+ZDziGhFFt
	 hyLFw4gzwjY9GE3pJfOwRv8ij+j06A66cK+JfskFOgnzLK8eU6C0dB0tKXlxgoC3+o
	 6ijUUtjhR/Eo9cyOuFWOaDBAMApb4gw4AaJJwig1KS2lyUVcdskkSRvy6xspBO2sJA
	 8U9G1PuY8NpEZNiaZF88uW2H0W+AUGtvzd/SdWP7iHbY3kAyfemQsZRhKPeyOKbgSG
	 h5I+fPW/3iyG3d9DhqIh/AisUvv/tCr/d2L9r6seTOjp21aQw70mmRcvqfa5aHU+ur
	 SQ7p6sNFTLOAA==
Date: Fri, 20 Jun 2025 09:53:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-binding: pci-imx6: Add external reference
 clock mode support
Message-ID: <20250620-honored-versed-donkey-6d7ef4@kuoka>
References: <20250620031350.674442-1-hongxing.zhu@nxp.com>
 <20250620031350.674442-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250620031350.674442-2-hongxing.zhu@nxp.com>
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

On Fri, Jun 20, 2025 at 11:13:49AM GMT, Richard Zhu wrote:
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
> index ca5f2970f217..c472a5daae6e 100644
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
> +                  enum: [ref, gio]

Internal like within PCIe or coming from other SoC block? What does
"gio" mean?

Best regards,
Krzysztof


