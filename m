Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B67CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct8HY92i6QZ17YyTCxgrZWO6N6bGL7NsPGPY6sbzL1w=; b=G1qpR11Jq80T25itbzfVH985Lh
	z9XEFDqdoB6bX63um6buLCxDCWzY9P0EWmg9X/EQsoXDUpxbkpxp/RqmFAlDxoQCF/y+0JaMgGyfz
	YpRBAjWQpJXjPatRsh3c5GsnJuSzmpEk6Db2jKNlb3ywslwca7SxHlW7FB2duOMaov+sueTWFPm0h
	qQaPos4Ctr4zHguHNQZ3wT6EJSXxNypUbVaudjkB2exLiEzu4yZYNEF2IeUX/NNyw/TDI91gFmemf
	NtJf6/8T6gLLl5SEwzeX+w+9I39toz2kQoM7oCVxW0O55ESK423OO2r+sX4xjfGvanpY/FpMwbn59
	LDE5neUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTedW-00000009YG5-2D3d;
	Sun, 31 May 2026 11:47:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTedU-00000009YFh-2ZoR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 11:47:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B968C4020D;
	Sun, 31 May 2026 11:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363291F00893;
	Sun, 31 May 2026 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780228039;
	bh=ct8HY92i6QZ17YyTCxgrZWO6N6bGL7NsPGPY6sbzL1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TnsFonrrBOVdJXLe1AySwEBB+ooQtPGNMReKfpeM7ET3Nt5+omF8h4GU5185mDWSy
	 ppHIKAR4DsR8dRb+22Ry+cjAyLnA4lJIB+tWwyVCXa9XhH2svVYpkoJ8Cv48RMOsNA
	 I9wBKL8IeybkWVI/RjH6b5NGPSSpbfKwIJzAvpx9K01WXdO3BiHvxtz8rzYHZKDnFt
	 OVSItln/t3ZwzEQUTptgDu7tLRUArTc29bIEDRZNcEgl3GbVo+Ep/6RUi57gZ9Omq0
	 gM1hscwckle8DxzmU3rI2d58VYmUa/yRNMNBII3P67kPLsayflvuweivChd6dzdXBB
	 k8mSNLi6q8e2A==
Date: Sun, 31 May 2026 13:47:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: imx6q-pcie: Add optional interrupt
 entries for intr, aer and pme
Message-ID: <20260531-benevolent-malkoha-from-wonderland-cdfafc@quoll>
References: <20260521093255.61585-1-hongxing.zhu@nxp.com>
 <20260521093255.61585-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521093255.61585-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_044720_693913_5F90BFAC 
X-CRM114-Status: GOOD (  14.62  )
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

On Thu, May 21, 2026 at 05:32:53PM +0800, Richard Zhu wrote:
> The i.MX95 PCIe controller introduces three dedicated hardware interrupt
> lines:
> - intr: general controller events
> - aer: Advanced Error Reporting
> - pme: Power Management Events
> 
> Earlier i.MX PCIe variants (imx6q, imx6sx, imx6qp, imx7d, imx8mm, imx8mp,
> imx8mq, imx8q) do not have these dedicated interrupt lines.
> 
> PCIe basic functionality (enumeration, configuration, and data transfer)
> works correctly regardless of whether these interrupts are present. Mark
> these interrupts as optional to maintain backward compatibility with SoCs
> that lack these hardware interrupt lines.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 9d1349855b42..cf709132ff1e 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -58,12 +58,18 @@ properties:
>      items:
>        - description: builtin MSI controller.
>        - description: builtin DMA controller.
> +      - description: PCIe event interrupt.
> +      - description: builtin AER SPI standalone interrupt line.
> +      - description: builtin PME SPI standalone interrupt line.

Same feedback as before, nothing improved. Schema says imx6q has these
interrupts, commit msg says otherwise.

Please read entire binding - you would easily guess what is there to do.
And you already received such comments.

NAK


