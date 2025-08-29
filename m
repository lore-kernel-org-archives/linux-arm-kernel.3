Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CA9CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 07:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfja58WEuqOXoQlXRVe7DF+o44+fVySqKE12Qv2jW0o=; b=dq73cET0Qmgsh4biTAonOuU9dR
	VTSILf6MVQy6Vuu3whAOSAl3GWUgdJQqbmZkKmznp8QAQczubh8J3GwNr4mediYkOQOgGUh17RJ3Z
	8IaMBOf7kMcpru7nuhfEhoQVdPDS1uoRTyhhHmVwycodpUVN4O5Yee7vDG789IXMH0mg/EZL2T2wf
	ou0zGFCsW7cOv0TgYpCl2FN9L7iu360Y6aJf4hryJA2fyi38qLw3CVR13zLOiWlhEvgOeBdxY3cgd
	ypjU5IxM07ltvI98cIEnBrPaV7739XMRHhKryVdLO9/hk6g6P3i7Xn9dQ0nllLK69OJhHSEjir2F6
	jck4Wahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtqP-00000004opD-2gWH;
	Fri, 29 Aug 2025 07:48:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtc3-00000004mPs-0hJ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:33:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E254840B8C;
	Fri, 29 Aug 2025 07:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F1BC4CEF0;
	Fri, 29 Aug 2025 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756452809;
	bh=8TexSc0wl00j3j42PZV1dsW44NzMt3gu/+fUqhZ4/Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXk7yO9NhWkTMmy2WbM3DEYNEuWtQwNh0nXtKzTQoAK873uiWrOWcX0F77IMIBIIp
	 dNkZrrokge65+5MFn1mMOMolK9MPc/rObGPfS+kxTAuqEbAQVH4diimVGN0Sea8D3R
	 QdUZlytFWA/TYSmYwotJBgEhs3faL3QxfQnXKpwngk1nn/QLUAZuvqGhUIp0A5u+di
	 IpHbi1EqhyizA21OSI8aHIsWdVVoJvD0nzl3Emz4lYmkmqhZ4qAncLfn2FLxa0VFHh
	 ZvUVt5IXqVrWd9IAeBc+Z2ItQrVvc+AXebIO/H7cH0IAT1R2cqLPZDkRPuzZERwa8W
	 iYSNmGU8EvALg==
Date: Fri, 29 Aug 2025 09:33:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250829-impetuous-hysterical-hornet-d7f6c6@kuoka>
References: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
 <20250828-csi2_imx8ulp-v4-1-a2f97b15bb98@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-csi2_imx8ulp-v4-1-a2f97b15bb98@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_003331_228981_5434A66A 
X-CRM114-Status: GOOD (  10.24  )
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

On Thu, Aug 28, 2025 at 03:17:33PM +0800, Guoniu Zhou wrote:
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx8qxp-mipi-csi2
> +              - fsl,imx8qm-mipi-csi2
> +          not:
> +            contains:
> +              enum:
> +                - fsl,imx8ulp-mipi-csi2

That's a nice trick, but I think you should just list exact cases.

It's also easier to read if if:then: blocks are symmetrical. Your
previous one consgtrained reg+resetes+clocks. This one constrains only
reg+resets.

>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1

And this one constraints only "reg".

This stops being readable and maintainable.


Best regards,
Krzysztof


