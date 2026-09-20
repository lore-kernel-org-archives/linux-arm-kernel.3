Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAD8C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8l6bCKfnpTk8lTywgNZZDMe6ju/mRjx+c2z09OSzvU=; b=BiI6CTyKZMaTbJWmMiQK67ZrHQ
	CzvWXhj9bLNQ1yVJSktjBftDkp/NTlZFAM/1Yft8SWmyx7v1V/D+I6PuosW3pxhWaTS5DrKqpQMIc
	hROC6KOy41BEml9Q+k4wCwfEB34HDkqFxYKGiEp1ijHNlohcLu2oKiCbLqvMCWwg7eQWN/llZpF5q
	QwWKHlPX3AQUakJlU0PrdVS5Bv2YGgkbHLPRIugEB7/yU5nDeQeI8EkNvNMPA/3UGd2Ekbsw709dj
	XjSynIQyxxg5lHj9xb20xCdV1mKG7JNsFLZy1ePTljYygbLogtGVYIsLYP7kRobt9Fc0hpnY7HOfV
	G1cyEYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FLS-0000000HJ0r-3RDH;
	Sun, 20 Sep 2026 11:04:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FLR-0000000HJ0k-11yW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:04:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4197B40BF0;
	Sun, 20 Sep 2026 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295A61F000FF;
	Sun, 20 Sep 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789902268;
	bh=u8l6bCKfnpTk8lTywgNZZDMe6ju/mRjx+c2z09OSzvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOPNlNEiYAZUe79Q9Liu85a8BGIIS8E0OfeJbsnGVr30TOXlPYqwXnomyBNvhhoUa
	 9u0xBttz1oe0wjaRhXXEd7VambHGaZcJiTWBZz1Zq71mW2VSBmy+mPyrwzeCibWhTF
	 5/oPtyVPci0x4N4DSD4+IEIEjVtd9wijm2klNEyaPT6qmnOGmQ0FnrzXaxu9cjnzGc
	 oZzdx5102V3sLiVIMQXEa6dIDJ/vOizWCF6igUmJZPPs+Vh/2QPI0ekWWU1x7gMsKZ
	 ZJqbPzTVzGkA44MbVy8lQRlD38p7h46RWQMj9/jqp0DZEl3CJq69Uu3kSrEVICvwxM
	 mCIpXa2QfEPmQ==
Date: Sun, 20 Sep 2026 13:04:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Antoine Gouby <antoine.gouby@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
Message-ID: <20260920-accurate-hallowed-aardwolf-ed281f@quoll>
References: <20260917102011.69071-1-francesco@dolcini.it>
 <20260917102011.69071-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917102011.69071-2-francesco@dolcini.it>
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

On Thu, Sep 17, 2026 at 12:20:08PM +0200, Francesco Dolcini wrote:
> From: Antoine Gouby <antoine.gouby@toradex.com>
> 
> Add Toradex OSM iMX95 SoM and the Toradex OSM development carrier board
> it can be combined with.
> 
> The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
> from SGET using the NXP i.MX95 SoC and is available in Size L (45x45 mm).
> 
> Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 36e28e0e4ad9..9413c3e225ea 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1578,6 +1578,12 @@ properties:
>            - const: toradex,aquila-imx95     # Aquila iMX95 Module
>            - const: fsl,imx95

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


