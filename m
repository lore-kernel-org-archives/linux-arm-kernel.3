Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB8E67A81
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy3+kba2dbQoweVaI1VGdzN2GtWOJ2p2G+6HU11mQ2U=; b=sMemTP5idPFT3SbdKhlrWTTzv7
	4qfYN1JqrIK/LNvye+bwBAVR3sQ0IUAElrxNNedroAxIOU7CorqzM/LbJYtCJW6fQMF01gPmwser0
	9uTcp8ofhD8RYjpn8SfFys7TBiub62FdRmmS2jGSg2NSkdjvJDqxnd3UKuzfz7mzdJ70XNzr9C2Q3
	yO8MrFHXF2fizQIr+P5X2xV/WVyHwRGLErzjuzp3/r+8YdHCERJ9+c/e1bLw4J+NdkkAzR2phJwJa
	C9EI8om4zpp2Urns9cSxRs6dNT3z4fzbDqCHWalzAN9ZfrfqRsC9TIhaUBcWyxjFl8WpflmchgGgP
	jjfPjDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJuG-0000000EeQC-2lG9;
	Tue, 03 Mar 2026 07:11:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJuB-0000000EePo-1GPy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58FF143437;
	Tue,  3 Mar 2026 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5567C116C6;
	Tue,  3 Mar 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772521854;
	bh=pBHQLMDwk1MY9/39mtqq/JiDGHIU87rGe3pEu29CWLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpHGIKcu+rt4IsNFB7vxOydVo4a2Zit6xSIB4dZdDP7+9aR2cwMdHaEBRkG7RycU0
	 +rGDnNsbt2qHHvh7R+lxNXMwX6GufP2QZxfvyO4B6jSUNkcvDPVTDPcXoRzcJ0nDYV
	 0jMJVKDTS9QyqEG2+F0JbVllCrtbZVYFMZo76pdCXL6daxKQqLAp3ttWfbV5EVlUwq
	 Aki9qA16Swm5iS+TcO6MudNns36+8UcHrncNwvtLp1xhEwKoAH2XIbJGUzB6dbZ1+e
	 7iJ4mmYFWU5wUSWu5ey6DWkvkqQmLKn7iKDm7KmcrG62QE9tYHwGl7yyaJr+zGj8a0
	 IsEmHjuMFxCEg==
Date: Tue, 3 Mar 2026 08:10:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
Message-ID: <20260303-rational-thundering-firefly-9dcaa9@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-5-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_231055_599428_9538EF64 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> There is no Variscite module named VAR-SOM-MX6UL.

VAR-SOM-MX6? And there is.
https://dev.variscite.com/var-som-mx6/

> 
> The official name from the manufacturer is VAR-SOM-6UL.
> 
> Change SOM model name to VAR-SOM-6UL to reduce confusion.

That's just one paragraph. Please write concise commit msgs so reading
them will be fast and easy.

Not a sentence.

By a sentence.

In multiple steps.

> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 5716d701292cf..99dc1b3f1ba92 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -688,7 +688,7 @@ properties:
>            - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
>            - const: fsl,imx6ul
>  
> -      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
> +      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
>          items:
>            - const: variscite,mx6ulconcerto
>            - const: variscite,var-som-imx6ul
> -- 
> 2.47.3
> 

