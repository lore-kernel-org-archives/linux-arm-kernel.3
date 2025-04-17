Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC9BC369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kschL53MSaVaysIxs6HHIiGjn5oKcsIyywYRx1So5L8=; b=D8pTXCJp8nnegIzJgTlK2qGZa6
	zBmm+zOu4D/fp6XktZ2YzDPEPmlQib9t9eGDER1x0IfDNIWpsE70ohQrAWrdk9zoEiAPT6ZVTkJex
	3g6S9O6OTnWOemfGtvjbxprG0bk5dboM8im23mv2I4EcRaNrYSHk7PYwZ1RF7AufOkOiOyjShOZ4i
	V5du1GU72irFy9ub+SUrmBxy9pCBv0lC42Q6PIMHkqvUbA9xAB7w6KsCMrni7/d6+YeE8ZcrMvYC3
	DrzIG/7zjc36oQttu6FWfliq05Aqcb4DW6v2X3agXrCFoPlG5PUCusnxbqTLD2rbDmDDFKrBisy+D
	lZidEPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JFx-0000000C0cW-2avD;
	Thu, 17 Apr 2025 07:01:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JAu-0000000ByrV-0bTI;
	Thu, 17 Apr 2025 06:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20A50A4B19A;
	Thu, 17 Apr 2025 06:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A849AC4CEE4;
	Thu, 17 Apr 2025 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744872999;
	bh=94/KX2GjYz2N9JAPsojJnUJAFMOUlgKCxSZ0WjvUW3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4A/dWYgQVaFF1cTdRfhNl24mWuQxLEvXEtyA0czyDEkhtUJSnjW/tS4CI1kJNW00
	 WBaLlNHRV4cBVJQeAeUTym8syOtJcfHhHt1xLJX9L8hhWqTrMtH+sU2gLK5XSN8xB3
	 qY9T8bYvVI0BekjB2AFX2TzWBZkZ6HheCBk9C1VNO6IPVStuJkqKirM7QfNmAWpt7j
	 sLakMk4HmpXnA6IYGt5QBNN92bO95JeFkjSA1xvPFgkt1S+Lm1R/xDym74k1OAHSwV
	 AK6CK/leK/qAtkmHHAdUce4k6ylABcAt2ro/d1/jUf1q4XlY8gDMmDW5Rz8F21/kAH
	 wIxCGjq8y5JFg==
Date: Thu, 17 Apr 2025 08:56:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
Message-ID: <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_235640_241369_50316F85 
X-CRM114-Status: GOOD (  14.46  )
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

On Wed, Apr 16, 2025 at 11:53:56AM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for type switch by pericfg register between USB3/PCIe.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/phy/mediatek,xsphy.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index 3b5253659e6f..5033d77c1239 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -151,6 +151,22 @@ patternProperties:
>          minimum: 1
>          maximum: 31
>  
> +      mediatek,syscon-type:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        maxItems: 1
> +        description:
> +          A phandle to syscon used to access the register of type switch,
> +          the field should always be 3 cells long.
> +        items:
> +          items:

Missing -, because you have one phandle.

> +            - description:
> +                The first cell represents a phandle to syscon

Don't repeat constraints in free form text. "Foo bar system controller"
or "Phandle to foo bar system controller"

> +            - description:
> +                The second cell represents the register offset

"Baz register offset"

> +            - description:
> +                The third cell represents the index of config segment

"Index of config segment", but what is index of config?

Best regards,
Krzysztof


