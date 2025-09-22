Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E43CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZEGJ6uzbKNGv933dhE3Rl87ZI/fO9WVQTbbJyWvfaE=; b=XWyyS/n77Hf3kxmG/6HtK23tvo
	ERoBdPS2wXGZT7TXBHEVqIJsxcd1e4o9UlZI/eF+1c0+nLGVP7VwwVU6tibA/Gyp8S/YfroEXzCC2
	g9DnE4TUSSPFaJ1P0N2RXS4d0ZwtAnO64P8tAk/QSCs5MdIDEuqQC8JAwFTRvwdVJwMHarymgpWkt
	dZkKKl3UVxmuo3Rlih0oXzEpQboHsJ2exaj3vLMGOqNqakgA4G2MxYbFBb1mCnRBtIIwBjMCf2nsj
	SGd2rsVss0W4slfPG9DGNtdRzixGLlaIOOHPUKBMar7RzcpMUtYkWxUw0FuCgp50Zwzh1XNY5rjlo
	NkBvCV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kB7-0000000B5ib-304F;
	Mon, 22 Sep 2025 17:18:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kB4-0000000B5hk-2aef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0150C43E00;
	Mon, 22 Sep 2025 17:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC0EC4CEF0;
	Mon, 22 Sep 2025 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758561493;
	bh=7n91RXDPAxgH1q840XCue47m4bAyVbyVfAnh6yft++U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByKyEGTiZjs/nEy3Xzn/QKsdiFqIK/jEadu1pqoZ5vZGLCg+MfsnCiu9gaEf9kl6b
	 sZK68I/axPzRYCujKthTI//IXqGF5PpFZEuTkue+wUWS7MyUtfOJPVLWib01kMEb6G
	 sUETtL4ThYkyvjh2XZDBhW/FO/uzt+xE9Cwv3gZdckKKc2zsT8B4SnvhhY5vcsVY2H
	 dlbMtRcBCAw9g5hGmHTpms6o3QXkH9AaJBTQYzVbQyNZ03UenK6S39/yV6cYQolwnH
	 +4aM0+NuPv074cEDycBfVbVpmYfW4UPWVHTsjflNIECHo9mcqO1d2VP8VkNZ9oTHKc
	 QwuHIUOw2KN7w==
Date: Mon, 22 Sep 2025 12:18:12 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: PCI: dwc: Add external reference
 clock input
Message-ID: <20250922171812.GA489088-robh@kernel.org>
References: <20250918032555.3987157-1-hongxing.zhu@nxp.com>
 <20250918032555.3987157-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918032555.3987157-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_101814_678588_67D17D13 
X-CRM114-Status: GOOD (  18.65  )
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

On Thu, Sep 18, 2025 at 11:25:53AM +0800, Richard Zhu wrote:
> Add external reference clock input "extref" for a reference clock that
> comes from external crystal oscillator.

Sigh. A different subject on every version throws off my scripts... 
Perhaps slow down your pace of sending new versions.

See my comments on v5.

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> index 34594972d8db..0134a759185e 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> @@ -105,6 +105,12 @@ properties:
>              define it with this name (for instance pipe, core and aux can
>              be connected to a single source of the periodic signal).
>            const: ref
> +        - description:
> +            Some dwc wrappers (like i.MX95 PCIes) have two reference clock
> +            inputs, one from an internal PLL, the other from an off-chip crystal
> +            oscillator. If present, 'extref' refers to a reference clock from
> +            an external oscillator.
> +          const: extref
>          - description:
>              Clock for the PHY registers interface. Originally this is
>              a PHY-viewport-based interface, but some platform may have
> -- 
> 2.37.1
> 

