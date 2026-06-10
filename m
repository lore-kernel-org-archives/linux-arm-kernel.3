Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35618CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCCH/VgbRHBb4PmFFXzngg3cdXaL0zFP6UWahwSZ9uY=; b=kwtSd+mCaEoNZxPBUGw9TJq4Hk
	i4JHKPWNaBNXMtR6fp8VtVpXUf3fZbFtsZifBRJGxEbMTrBbB6aF3yOSxR5HqO25FBGQLti+KH5is
	367awQgmPyXoLOom7HusfUiRxf2NNekgm43w5kBwieOrUK+Z54t/nxcJEpGz8f350khgZ+TgDx6sg
	GZcC/yxIz5WEv+1s/00P7ub/KqecZfYkOABl8j/H9ox/myM5j6m+YmsDFlsIRjHKeziwa0nVH4zZ7
	u/H3krtd1fM6iFlQ1esrwCT1kq6idcvz1n9HRfeXhXsRvvdShUnqVBgjlDQJSd5lXvSqEn1D8zUBD
	j4X8EuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDe9-00000006ycS-329R;
	Wed, 10 Jun 2026 07:46:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDe8-00000006ycI-2p0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11293439C7;
	Wed, 10 Jun 2026 07:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3301F00893;
	Wed, 10 Jun 2026 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077603;
	bh=fCCH/VgbRHBb4PmFFXzngg3cdXaL0zFP6UWahwSZ9uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C49aIVZA/Wo8M3MQ58t32Z8sViV9FAODsrfwDWa9zaffeyyBxe4PXOpYIkhCTG8eJ
	 gvZ99CFz1P3jMBjjt8OJ7vhEr9gDwmdJC2Sx0CjQJENvJk1/5ztlpyELULPn80YKJC
	 643XiP6fewFkVf52h5eyVaMeX4e3RmA01e+UrmbF+btfOzDVA+PbIzXLgl8UHxPAvQ
	 AEYMRR9anqkCQ29eoGSWVuup6nRub3Po/i+nqSewCmf3vzzlSyj5pxD6P4pSRo4wCB
	 /DVuaUTlBnFoYR2XjSgavxsconKFmiTiNMS7KNGaFIptEfNrx6xCCvb1+VoXHV7VtE
	 yY/BBydLJiXnA==
Date: Wed, 10 Jun 2026 09:46:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <20260610-large-just-lynx-d8cb7f@quoll>
References: <20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com>
 <20260608-imx93-ldb-v2-1-1b1fe621bfda@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-imx93-ldb-v2-1-1b1fe621bfda@nxp.com>
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

On Mon, Jun 08, 2026 at 05:04:22PM +0800, Liu Ying wrote:
> i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
> register which control video output through a LVDS interface.  Allow the
> LVDS Display Bridge(LDB) child node and add the child node to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index d828c2e82965..124f5c206ee3 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    '#power-domain-cells':
>      const: 1
>  
> @@ -92,6 +98,11 @@ properties:
>        - compatible
>        - ports
>  
> +  bridge@20:

You have dpi-bridge, so this should not be different. You should not mix
addressable and non-addressable nodes and NXP decided recently in
3feaa4342637eef673243dd38ccb32e8dc8efd5a that everything will be
non-addressable.

Writing bindings ask explicitly to post bindings, so if you decide to do
half-baked solutions it's on you. Half baked solutions are not allowing
to bypass standard rules.

Best regards,
Krzysztof


