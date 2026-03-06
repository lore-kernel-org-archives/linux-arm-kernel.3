Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82476F01807
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNYGnAuuMlGv59bKnDmD1x55CrnvqLndsXtOPnDOdSA=; b=jPlnWWvpGsMur7uSypbcc57fM3
	EVvLZvcxvvHZl1cqPycuWkVKYNYO6Dk1RBUfxY56rij+V4iqG9yrDHNB6l/7rqczZ9TwquF0clXNf
	iwr/nrLTvNtWlOP67gu2eXoz8lC1G1HGwLlGm8Xy+nas3lX1l82Nvk+xF4xhivyBJceKkVzazxvK4
	W+phc6FhE9nVvFzlPJBiAxSua8mXPoUHJVa+MfnIZy+IopmrKy7bNXFMpQcgqW8X53diTd2fClC6c
	XW3IS0AFoboeXLmF1GI8hdz1ySENEs3JPrrkXxHL4MktMt8cCjEvTbvcKPFMoOETL4AoYp7LbiQJ5
	xTkBSqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQHd-00000003Eqj-3z7m;
	Fri, 06 Mar 2026 08:11:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQHc-00000003EqF-0yh1;
	Fri, 06 Mar 2026 08:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54BF560018;
	Fri,  6 Mar 2026 08:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD4AC4CEF7;
	Fri,  6 Mar 2026 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784699;
	bh=z9VBi6pOx8Va4AA4xwcH/uPaUx+DgL/34IOWs+N6mLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBjr3coqedIIM6OuBzN2FI+ExSsr3RFCudu+q9X34MRrL74sG63KuhtUd7d8QdcSM
	 BWKJcq9HvTuubpyD5WGJM8JGcqxVC6elr3ELNXo99TRJ1IrgxoQAuR6GQGIOlxCpng
	 BFUDgOJSqYW2lN93LwQTrtk5B77bVfEoP2jdSp5IKNW8Z1wsRykX2tamStvHv9t023
	 yYyN95tjzyJWSZIzXCOm3Eglrrp0Y2iUM2yUqIm/DjXYxppCD9N1oGAx0S2uD5/0aU
	 v5TrYO9vCUZRaLzhYj3Ag1TANXlyu4s1FIBbRsqZhgAJAHBIhN3fXl7dZf1H69HMyi
	 0y31qrvoRxESg==
Date: Fri, 6 Mar 2026 09:11:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
Message-ID: <20260306-primitive-lilac-catfish-fbbf9e@quoll>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305074328.639993-2-jian.hu@amlogic.com>
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

On Thu, Mar 05, 2026 at 03:43:25PM +0800, Jian Hu wrote:
> Fix a typo for T7 gp1 pll.
> 

And also Fixes tag.

> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> index 49c61f65deff..b488d92b7984 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -72,7 +72,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,t7-gp0-pll
> -              - amlogic,t7-gp1--pll
> +              - amlogic,t7-gp1-pll
>                - amlogic,t7-hifi-pll
>                - amlogic,t7-pcie-pll
>                - amlogic,t7-mpll
> -- 
> 2.47.1
> 

