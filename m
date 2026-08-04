Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6950FC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js87OwqmTpS9sHRBiU0fT8MlwqmYlv79UzB9vD7n/gk=; b=czWN99AB+2cKutwMBvYQiV/HPL
	ZmqyhBUoDmsfsedAGJr48dPCdNLnb6/B7ID1H4i0SN9w2Lg2ZsOmB/Vspctzq7BmhSbriCgQBkuMi
	jPjDSODB6KJBje3mHAODkOQZgxdN/3JaVAFXyS2aUabA9TFPDMSzhLoW3M3zlewEadaYmwV8YhEHh
	4ibIdhCT7B1quTY+dLVypBFnrz3d5VSFfY4yQjVelBhoiAlTZoB1LdEF6ZjHOv3FAq7nkIndWpOs2
	XUpwd6S81a9Cx7GJ6KGd4iuhquICYKz6FHv2zDchIKTcQPbyNfwBjQbj3XtfTSTnpKGDXtb0xl2qu
	rriFzkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9DF-00000001BGg-2xA6;
	Tue, 04 Aug 2026 07:05:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9DE-00000001BFK-0GMP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9015343904;
	Tue,  4 Aug 2026 07:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA511F000E9;
	Tue,  4 Aug 2026 07:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827119;
	bh=Js87OwqmTpS9sHRBiU0fT8MlwqmYlv79UzB9vD7n/gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KfJPEmk5lhn7Ry7aZYrcliqPckiu93PDB64UKbTIbbUIZvBwt08XWRI0VARMd+1Ht
	 TPnghCudxoFv5SZQY30r/cDbHV0U0SaGItHSZD5hX2Ouh/e/8Tl8gBUceB0UWGwbVg
	 9DyDVEOihqBYO36a3RdSJXCRDyJ5c03ist4Qig2mEkQ9Nm4EzobLLDkBd+dcXB6lAe
	 KBsheqqiODb8Ci6m5jS2WOGo3B/qbalLq5w7JMq04l+LjZHoB+3MLvYoFLgQKXvgyE
	 /2YWUeMiMbkSToPRmiYjqDe1fLMZ9lLBbVzOurmOpQPycqfVFZSfcPq0OeELJ64tVD
	 0QskokzevnlrA==
Date: Tue, 4 Aug 2026 09:05:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Allow
 additional GPIO chip selects
Message-ID: <20260804-smilodon-of-imminent-recreation-aa579b@quoll>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
 <20260803074913.1656675-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803074913.1656675-2-cwweng.linux@gmail.com>
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

On Mon, Aug 03, 2026 at 03:49:12PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> The MA35D1 QSPI controller provides two native chip selects, but the
> generic SPI controller binding defines num-cs as the total number of
> native and GPIO-based chip selects.
> 
> Remove the maximum value of two from num-cs so that board device trees
> can describe additional GPIO chip selects while retaining two as the
> default chip-select count.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> index 377ccf4fb224..f837367e6d5f 100644
> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> @@ -30,7 +30,6 @@ properties:
>  
>    num-cs:
>      minimum: 1
> -    maximum: 2
>      default: 2

Isn't num-cs the number of native chip selects?

Best regards,
Krzysztof


