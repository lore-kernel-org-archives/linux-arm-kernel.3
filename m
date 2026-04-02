Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42463CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWBY0pZceTfmIslp4RsoXgNEJ+6kNrIWhi0knsdek70=; b=qi8bdEMOCI/5Cyq1GN5dQS5MBf
	03RGejkj1+XcTXsgzQWUdedGCYFHBIBgb64QqetUywdD2z04v9eeE4ktgnkhH1vi8fjBr7x+6pht5
	V8AseNm5u6aOSc8kMT8mYQ+nmyeQJcirGBKWmzvRzQxKL3U1kTBd8FWRJsejgZLoSwmmU1uId6vdT
	Jd8ATNP9VdjYod1sJENQ1nPUhz7jn/SevD4dp0PkvKq1iRjzFLQx+7+OCGR75M1BX6pevncSHxJd5
	BEl2r6wx+MQQ9qggyh+A5rzvusSURfS0kaEbYtYGN0xO4ArkJ4yYQscVH+CWcpwXrz6+LWpYmSaqE
	UUIOR2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CRm-0000000H3zB-2eDO;
	Thu, 02 Apr 2026 07:26:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CRi-0000000H3qi-0JV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259E9417CD;
	Thu,  2 Apr 2026 07:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6963AC2BCB3;
	Thu,  2 Apr 2026 07:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775114789;
	bh=blzi+T4vd5l4tALbxLrPzAlbbRECYcrNpOOCXZdxEDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S14FL0JZWL6qg7m8F40cl5pAxVUDbN2pm/RXu3fvuAMv9tyD3fhtUCYvt7qEiXMGY
	 Iqx9FYReEemJcRhxPyw26Z1lNNVqiMNxiUysxMlEUfyZ7yRNndLuQqfnPr1QKrYKVQ
	 d31qPl/5MRUQDrZicnF49mCooe2xh/Hn/T8DQYBbIuqR+6afg5fr6oIucm2+GIITpI
	 qihyv8ZtiHzCbYfkf+Vr1xs4n83GGIXAjb29GAeOSKcGhLWhsx7FDbwx6fASpuk7X2
	 zUgTWcVv/Y8kHk4lNVCxFQAYqBdVvnzK4rB/VFnIA8VRILFMlraHy+39GJsoipr+DT
	 5bjF3dwhQqJEQ==
Date: Thu, 2 Apr 2026 09:26:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: ti:
 k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss compatible
Message-ID: <20260402-discreet-sparkling-turkey-ce23e9@quoll>
References: <e7ec1b928357d1240a962a88dc6ac67fd2c92357.1774958552.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7ec1b928357d1240a962a88dc6ac67fd2c92357.1774958552.git.nora.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_002630_189234_46A1C8D3 
X-CRM114-Status: GOOD (  16.49  )
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

On Wed, Apr 01, 2026 at 02:05:42PM +0200, Nora Schiffer wrote:
> The J722S CPSW3G is mostly identical to the AM64's, but additionally
> supports SGMII. The AM64 compatible ti,am642-cpsw-nuss is used as a
> fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
> 
> v2: keep ti,am642-cpsw-nuss as a fallback
> v3: resubmission for net-next, no changes
> 
>  .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> index a959c1d7e643a..70d25f5ff1cfe 100644
> --- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> @@ -53,13 +53,19 @@ properties:
>    "#size-cells": true
>  
>    compatible:
> -    enum:
> -      - ti,am642-cpsw-nuss
> -      - ti,am654-cpsw-nuss
> -      - ti,j7200-cpswxg-nuss
> -      - ti,j721e-cpsw-nuss
> -      - ti,j721e-cpswxg-nuss
> -      - ti,j784s4-cpswxg-nuss
> +    oneOf:
> +      - items:

s/items/enum/. No need to make it a list, wasn't list before. It is not
making code more readable.

> +          - enum:
> +              - ti,am642-cpsw-nuss
> +              - ti,am654-cpsw-nuss
> +              - ti,j7200-cpswxg-nuss
> +              - ti,j721e-cpsw-nuss
> +              - ti,j721e-cpswxg-nuss

Best regards,
Krzysztof


