Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59569CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsBE60q/zqo892zMCzCegAkvXqdUN52ebGS40OGlI4Y=; b=K2F13JCO/rAq1dpCDJi/ZfQrCH
	sLSZ+vpTRh0lXEGY6j/usT3YwAdi56mapYqR5fvB/Zhy7Z2DAHZavb2heccl3zMrLSIN5W4MUafVI
	iAS4d+E8iIUBEOuUMbGnVJ2uBSC6MS6czdaBa4nzKe3XIJG095qs0Z6bXpiuhRnxoeLbzmUOd0p2N
	eHzIosxTN69jgFiC22UIw8PSBOnX1vLaJbmKvZEnPr5R/KCTmVVE+qMhRgiPoNNdpdTXsqjC6AwSx
	xfDN0gYHjeXQ0tJN3hOJHs1CZIF+kKT+VBWYelIXCE3wCK8DGN7esgTqqVgoHmkTqDAX6a72pJdDN
	oh8birPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Ul-00000001hc8-0Itk;
	Wed, 15 Oct 2025 13:24:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Uj-00000001hb7-1Mpg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEFA945440;
	Wed, 15 Oct 2025 13:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4B7C2BC87;
	Wed, 15 Oct 2025 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760534684;
	bh=+PQNqX6gMuYpsO5dyv6A77vO1jpZNDtI0y4dh0PlVsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNH2wHcGLKEopWnn6dtv3Guntm2gDqa28wUfwL7veY1feRvROo/0HdYgMSYoieIYm
	 3rzdAECnSHKGJ/UXeqdJErE9r3dYGT7BhbpLW+FOXaVBfm/QK0qoOctjLWjZ0HqO9j
	 7GOT1sxoQ4tHehql3ulZjEYyeKJC2LZlwakqKYeHi8IK0CkWV8dW9iUYlLlTrHG19L
	 FCbMtJiUgOhcAN+m5h0b+4l+5PNFQYpmkAIGOF4xx8wynBMhRdc8gyde0XgIsLsejY
	 yyoFXyFQDN38p8XG6KKYnhZrcODRMQ1plSTEghFIteWZHGXdVgAvqlM6w5ov+J1Ww7
	 KTuthKBgE25Ug==
Date: Wed, 15 Oct 2025 08:24:42 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Message-ID: <20251015132442.GA3241958-robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-2-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_062445_402453_7FA96CA1 
X-CRM114-Status: GOOD (  16.54  )
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

On Sat, Oct 11, 2025 at 06:51:16PM +0200, Marek Vasut wrote:
> i.MX95 Display Controller display engine consists of all processing
> units that operate in a display clock domain. Document DomainBlend
> block which is specific to i.MX95 and required to get any display
> output on that SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> new file mode 100644
> index 0000000000000..703f98e3321e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 Display Controller Domain Blend Unit
> +
> +description: Combines two input frames to a single output frame.
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-dc-domainblend
> +
> +  reg:
> +    maxItems: 1

No clocks or other resources?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    domainblend@4b6a0000 {
> +        compatible = "fsl,imx95-dc-domainblend";
> +        reg = <0x4b6a0000 0x10>;
> +    };
> -- 
> 2.51.0
> 

