Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF2CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8WQO8COBbkdRnlOhcXHFHuFMj6D9cv++m5m8uaDFtI=; b=cNrXxwGC5S0324WV9UBWBqTHMv
	gcnYbI7TBze+etKd08HBTA5Hwm9pkVwNi1Zqq9pOHglmxL/B9mNltN9eIns/olNveHY4p0bFv+eFz
	JoP0poGaLw/flN5mNhQEIXUr3Vj2ablysy2AESbtbk6olrYe7L2POwszZM76xh0b2slqA8MDoF4HV
	4umVE2wX/sxVTM6b9yOf0uOoRLUgyrS5bGfjKM+PJS7Y2o6y56aFjJBPW+zFA2yVRTH1L2WtO7+m6
	0KRfjZ6lXCjjzTNQbu03yBR0+kVxWKS/nCE3Mysf2r0kXPGw2AGYWDGXV8UMPbRrLnPv2nCwS6sdJ
	Hr3aehYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ky8-0000000BDUx-39AJ;
	Mon, 22 Sep 2025 18:08:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ky7-0000000BDUN-24NH;
	Mon, 22 Sep 2025 18:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E12F46013B;
	Mon, 22 Sep 2025 18:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2CBC4CEF0;
	Mon, 22 Sep 2025 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758564534;
	bh=ZpBXykY5GNJ3iTwM8KdwNbZCQ0CzTVwUOQGlFr5Uj8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpGqUY9tAbHoS6O0fQsM5SICqWep8YqbeQ/cpjWS5o+s1i5vw/RlUISCLYPFuN1ZT
	 31S4Wsp+nkJ9R8+PHa4jgkgdwv6xWTMHF291bFtTiXnrJIs1zx42Gng9V9+4YIhskr
	 SYD9a4e6G+O2GAoMwFkw/NU7ge/Mw13apT+h1VWATEhMLfA19CR67v5UoNTftM00FP
	 Jpebm4E8zknwP6qq7N96XHpDDwbSUYdOtbwKH0Z3NTG/53V6uxBO2w+mRBAGhteQwO
	 bDTVYH3M1Rb1vh2Fa55Fev3q2xUjxuDgQuXuRAyj2ThNXyZ7diOTkQZqsp56tQgljJ
	 4X66QCUQ8sxRw==
Date: Mon, 22 Sep 2025 13:08:51 -0500
From: Rob Herring <robh@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: dma: Add RDA IFC DMA
Message-ID: <20250922180851.GB547468-robh@kernel.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <20250919-rda8810pl-mmc-v1-3-d4f08a05ba4d@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-rda8810pl-mmc-v1-3-d4f08a05ba4d@mainlining.org>
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

On Fri, Sep 19, 2025 at 01:48:43AM +0700, Dang Huynh wrote:
> The Intelligent Flow Controller (IFC) is a scatter/gather DMA
> controller.
> 
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  Documentation/devicetree/bindings/dma/rda,ifc.yaml | 45 ++++++++++++++++++++++
>  include/dt-bindings/dma/rda-ifc.h                  | 28 ++++++++++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/rda,ifc.yaml b/Documentation/devicetree/bindings/dma/rda,ifc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..323e1e87cee09cfc7b64bf44bef61e4d1e91afa5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/rda,ifc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/rda,ifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Intelligent Flow Controller (IFC)
> +
> +maintainers:
> +  - Dang Huynh <dang.huynh@mainlining.org>
> +
> +description: |
> +  RDA IFC is a DMA controller, it only supports scatter/gather lists.
> +
> +allOf:
> +  - $ref: dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rda,8810pl-ifc
> +      - const: rda,ifc

Also, drop. Generic compatibles are rarely useful. If the next chip has 
the same block, then 'rda,8810pl-ifc' can be the fallback compatible.

Rob

