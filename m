Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF2EE0AC8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztFf70XQmtOcFdkjd9eAEGAybK/h15l2kNa9UDfPqcI=; b=xaWAtYNs1LtPQlFwDtV6rvf0iP
	ED3c4ZEXz5DKDcBkMOfcJyGoyG9f0PIF2ET7DaSoPFFnSAhccssQYnpTr94Qis8XEBTpOmuoT+/Qx
	isKWWChLAUunrgab+5cmaSST3TdC5B+Jexj5vIObqYNsGAt+W2cLbnffZqI7tMDf1nr8iu4oaMWiF
	UP7JtmItqgfPe/bNNcNGVs6QcbVZRvLSUB5O6v4MbEBGWNP78vNs3mVIw4VQSfq7c8dsQZjk9+1Fd
	gajU0DPWT8P2Yx6cqBlFPtJc64OPBOY5olUtSlUJj9Po+YL9TEmGOyzstMvTjNY6jb7Y28g2+6b0Y
	kHMG1RMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofoA-0000000CLvA-3NHD;
	Sat, 07 Feb 2026 10:44:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofo8-0000000CLun-1oji
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 10:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE89340026;
	Sat,  7 Feb 2026 10:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5C2C116D0;
	Sat,  7 Feb 2026 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461095;
	bh=6cOaTZGKJjrtSSk0AAQbqk7GenswhEuaH5sr7s77y6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCAsms6qe4d8dsRcI0XEJTEdlTwUIODywaGcNWHhhXswGBg2t4kpZueVw435itkC5
	 St6uzRaFBL80zgOA+Oi98GpVM7AE63/exTP6/9RbB4tyqVFyPSYaN9i4cqwuNYDr4O
	 hWh21vTDQABVd50Pd1DZD3Rfx4ai7h9XCe3HZh/Ph28MnB1qLQOyRq8mXXhLuO9OjG
	 Eag2X8Bko51+ya53MFzjBIP8EUgNJXh8+jsnsGhhYRw3YPPMjouHx97pRRjgjaDBb3
	 enl6qHr+7ymZch0IBCkMLETJruQ5HmV2MySi8Z7aXfwbXY4u88kp4Ws8LZ+aUx+i8U
	 CNA7oeQtWcaoQ==
Date: Sat, 7 Feb 2026 11:44:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwinfo: ti,k3-socinfo: Add
 nvmem-cells support
Message-ID: <20260207-armored-diligent-grasshopper-b58d3f@quoll>
References: <20260206191914.52878-1-jm@ti.com>
 <20260206191914.52878-2-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206191914.52878-2-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_024456_501260_593651E2 
X-CRM114-Status: GOOD (  15.50  )
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

On Fri, Feb 06, 2026 at 01:19:13PM -0600, Judith Mendez wrote:
> Add optional nvmem-cells and nvmem-cell-names properties to support
> reading silicon revision information from alternate location using
> NVMEM providers. This is used on AM62P to read GP_SW1 register for
> accurate silicon revision detection.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1:
> - no change
> ---
>  .../devicetree/bindings/hwinfo/ti,k3-socinfo.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
> index dada28b47ea07..58cc937e13351 100644
> --- a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
> +++ b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
> @@ -15,6 +15,9 @@ description: |
>    represented by CTRLMMR_xxx_JTAGID register which contains information about
>    SoC id and revision.
>  
> +  On some SoCs like AM62P, the silicon revision is determined by reading
> +  alternative registers via NVMEM cells.
> +
>  properties:
>    $nodename:
>      pattern: "^chipid@[0-9a-f]+$"
> @@ -26,6 +29,15 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  nvmem-cells:
> +    maxItems: 1
> +    description:
> +      Reference to NVMEM node containing revision information.

Intead items with description. And drop 'Reference to NVMEM node
containing', redundant. Just say what NVMEM it is supposed to be.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


