Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA791CC6B00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STeLW19jGstgWHuibr2aAR/XyFe/iRRk7X6Hft2sjyk=; b=vwq1F2mXWlZSZCn7hAqGJTQQDS
	sa4gutpInnD07Nh3M39Am9rINKV5N2wbIHMICug2Db637nCWmNFpgoADmXbkxlMNXlnmrLmPWmxXc
	jn6mmuIJBMaxZgdW97pE7zqnH6ZX+xRXcU0ee6azDnz8Xx1D5QQMi7nrIFQTPOksPa6v9u9ax0tSy
	r+JKsUxBegBdEuxeyw1cTLuPPf9pTtMgOrbNfSKDoCuqXiO5gsaGfUshcCgSNYQn6XRL9E1AuYPcI
	ldQ3NwTkCWuMI3Vwlp/5tMfPgGNfo/lBXvc9y9717tAHo9isUpkXW7PzA9RiJB6ZB14+H3lpf+ycW
	rUFnj03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CT2-0000000H57o-1myi;
	Thu, 02 Apr 2026 07:27:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CT0-0000000H56k-452Z;
	Thu, 02 Apr 2026 07:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D95961855;
	Thu,  2 Apr 2026 07:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538C8C19423;
	Thu,  2 Apr 2026 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775114869;
	bh=5bRmQu9RvXClAs1iQSBeDGNT17zARgjIP+fvVutZf3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9ShTm8PDRbfUkdE2e8mHA6CENFhMOiZjJlaUOV+LDDB35fjc6k2zilgX/TrwmJal
	 FOvXn6YWtFw6qmigqe/nFB5W4OO1pXv9HA8amyqLS2mBan2o+6JxuTRqjpiO5M34UY
	 XsJwXuhBkdWUJCf3/7AGcEcabFjA38M7h1FIJkqsfnjXvq0JQYy487pRkXambMbyfT
	 53Qes3UBdJe6dc2+jQgoYs9wQ08TNJHATIUcv5ZlRipcllGLi+6rMEJvAS8QciMttb
	 V/SIkpejAErs+Dhn1ezID1cClJMBXtByHDUfF8N5jsbhGNrsVIrIIyLeHyxhv7ELU1
	 8iYezR9Y+rHvw==
Date: Thu, 2 Apr 2026 09:27:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: ti: phy-gmii-sel: Add
 ti,j722s-phy-gmii-sel compatible
Message-ID: <20260402-curly-heavy-bustard-bd8c63@quoll>
References: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
 <5ac1c52827a1a246584dddb62335f9ce4715eceb.1775045279.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ac1c52827a1a246584dddb62335f9ce4715eceb.1775045279.git.nora.schiffer@ew.tq-group.com>
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

On Wed, Apr 01, 2026 at 02:25:22PM +0200, Nora Schiffer wrote:
> The J722S gmii-sel is mostly identical to the AM64's, but additionally
> supports SGMII. The AM64 compatible ti,am654-phy-gmii-sel is used as a
> fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  .../bindings/phy/ti,phy-gmii-sel.yaml         | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
> index be41b4547ec6d..6e12a75100eb8 100644
> --- a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
> @@ -47,15 +47,21 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - ti,am3352-phy-gmii-sel
> -      - ti,dra7xx-phy-gmii-sel
> -      - ti,am43xx-phy-gmii-sel
> -      - ti,dm814-phy-gmii-sel
> -      - ti,am654-phy-gmii-sel
> -      - ti,j7200-cpsw5g-phy-gmii-sel
> -      - ti,j721e-cpsw9g-phy-gmii-sel
> -      - ti,j784s4-cpsw9g-phy-gmii-sel
> +    oneOf:
> +      - items:

Same comments.

Best regards,
Krzysztof


