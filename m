Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2388BCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQXUTzzCj82gfW4QWCXnO/vM+d1/Db+iUW/tg6Y56y4=; b=sJkmMmYf9SoO5mjg3Hwyh2k3l+
	eTBmaoTW8VZf7CgZOdMycbQInMRTcqBGwMIHvpFmlKYTwJNyiF8llFCY5Nt3Y0ilip7On5hFZ2yG7
	Ew1tn+OhYnO4vCdvv762bJKe3EJ1o+qANCwo1gsCENx5KYpkBhHnAqbRZxbpII8AF3DEQzEZ2WcAr
	2Loa/XAoo7iW5JO/p5PItj+glFn+kWqB5LOEmNGxSUe+4jmdG1tv12RZDWe0oohyis87/w0KImkvz
	6g70dgVxQyF7hokqiNLm0fWBiGIsTFmTztgzrjgrFN/0A3JFwMmszrM2VAXlSWSOOaboEFJI5kqLf
	0Qu45Wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jkY-0000000B1oz-1g1t;
	Mon, 22 Sep 2025 16:50:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jkX-0000000B1oY-06Pr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4ACA6601FE;
	Mon, 22 Sep 2025 16:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97B2C4CEF0;
	Mon, 22 Sep 2025 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758559848;
	bh=SmYHS6MJbi0vRw6qB/2BTayFi9UqFpognQacTg5pVXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgRpaLe9mPRAsaZBexDSLcYyDGflu/cGHmjb5A9woWtWBlZh8F+Y5dWKZcg7Z4z0i
	 HtICrPn/KFhQzRUKM108f42vF4MgHew/4egR5ogSg81mN/p4u4TKOVl54Zl3aXz0t1
	 ggStJsUqvvbf0cVxY612FdiDDuN2pJcbXZ1tgNrEoQ5AhUrdCzatcgF/e/Dtvilh4q
	 PkhvkyYOEGn1hxon29vLtkRZNnuYG/dRHVy/HLewwRhbvdl0L6RZMfeI/Mxc5/A2C+
	 KVasxB4FpAIaSBIVys8eBlJVfEyGlJeMrr/JJfyLieBk3hyCck6PGHCPPWwsZfeZ9L
	 hcxxm1LYYEsxQ==
Date: Mon, 22 Sep 2025 11:50:47 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: PCI: dwc: Add one more reference
 clock
Message-ID: <20250922165047.GA436960-robh@kernel.org>
References: <20250917045238.1048484-1-hongxing.zhu@nxp.com>
 <20250917045238.1048484-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917045238.1048484-2-hongxing.zhu@nxp.com>
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

On Wed, Sep 17, 2025 at 12:52:36PM +0800, Richard Zhu wrote:
> Add one more reference clock "extref" for a reference clock that comes
> from external crystal oscillator.

See what I just commented on v5.

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

