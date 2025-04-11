Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33682C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ploSJne+E/IZmHx6bIx3umfmwcCn47sCihAIEVQJIAc=; b=dta4TNbDjspCts7ons7HKoVx06
	92mBCdBOZ8wutnPM6W5AfqncM7LcyIOHaFhnY36o4i2AJ4Ci/q0m2Ri9xSjyG7kcSB1xiVS6NGeG/
	jeBpiKzu+UtxcMn5aIya+ohjWMiedHEQMXxkQKlnHNhsXFilGgzVlBfD99eaLtj1bUC12CM66+akK
	jxketq4/yYDk8AF1IX4OYnMnV6VNfvPK+mXva6FTxYa3NI740kBdXMVZQ6nvZSYGBQ/21noHtuhW3
	JhT6yoJ0Uhq8NUulvwCEaU+238wwe/7/EDEI/v2GatkiaDJ1D8WkvzptoJ1iz8RRJC3Nuv2RbIZbJ
	KhlLEwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F6H-0000000E2cF-0T7x;
	Fri, 11 Apr 2025 14:11:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EfM-0000000DyBK-1zJp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6E816845F;
	Fri, 11 Apr 2025 13:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A24C4CEE7;
	Fri, 11 Apr 2025 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744379011;
	bh=tliAMtv1OcJaSk4zt2mFjXPHpuo4+e2d80RH30k39qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYtYR9HTZBwMP5Oi7bPretfsvPfOvYCRBS72D97j7i3aPPNTx2mrMavXTUE6McB9f
	 eTbX6bKtprpTBwHE2o48DSGO3p5BNHOT+nxdbcl0Gq6RpscUvQrNXjeLq4pZV15Afx
	 Ntbw5YpLpXkixY2/VcHFc1SpYlgJHv9tGOVUeceRLfMjUPmbLjGftwcOXvB1ErfW1k
	 z+rdIwx6u/uhB7vbmz8CcpHuPlSmtfoANznSJIhe/6W4TJ/goaw/USm8ZNj5qdPXgS
	 ozeIXMulaLNv2bYN3z3FZkW/VtEbFHxfl/4UuxBFw8Y7oE/dRrYMe50F5OZeTH9Rqh
	 3DtQX7+3B2iKA==
Date: Fri, 11 Apr 2025 08:43:30 -0500
From: Rob Herring <robh@kernel.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Message-ID: <20250411134330.GA3054295-robh@kernel.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-7-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411003827.782544-7-iuncuim@gmail.com>
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

On Fri, Apr 11, 2025 at 08:38:26AM +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add dt-bindings description of the thermal sensors in the A523 processor.

That's obvious from the diff. What's not is how is the h/w different 
from prior versions? For example, why is there another clock?

> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 3e61689f6..70ac395ef 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -24,17 +24,21 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1
>  
>    clocks:
>      minItems: 1
>      items:
>        - description: Bus Clock
> +      - description: GPADC Clock
>        - description: Module Clock
>  
>    clock-names:
>      minItems: 1
>      items:
>        - const: bus
> +      - const: gpadc

You cannot add new entries in the middle. They must go on the end and 
you then need to restrict the existing users to 2 clocks. And for the 
new users, how many clocks are required? 1, 2, or 3?

>        - const: mod
>  
>    reg:
> @@ -107,6 +111,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun20i-d1-ths
> +              - allwinner,sun55i-a523-ths0
>  
>      then:
>        properties:
> -- 
> 2.49.0
> 

