Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF78EFB810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7H8NyBcPHigDJSEhpHMGwIYI4QhNo5Z9fMpwieBCdE=; b=LGjAfk5qpCaYjRpQtOkXZ82Jj0
	xdUKlVJv+/8Nxe6YVxtzBEs6eAVd/YNbchWASy8G95Va+pc40Avwog79LDhKj0yTYiGLVLj4jDRCH
	Rs3l/nnBJfv2P2a/rcpEu+R5ouDgWlI+CpC1BurfHztNkAi5cC5jjZM79Qqj6LFgrKaOpIwz6U5nl
	ltYw/PXsEFQ6StPU0e5Zk6s8WOvvJYeu12j1d5iiTjdk8v21x3vRLi+2eA/ytCoqgKRQTkWNYEk9E
	pB39A5LFeOoERDcRS4EwqhVbq1GH6A17ZmdpwbslkFGuvkY9ZdMUUb0UDJo+mXSyHN6qlE0eh5uzI
	7mGrtI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumg9-00000001ZOf-0P0G;
	Tue, 24 Feb 2026 07:17:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumg7-00000001ZOE-0Tjy;
	Tue, 24 Feb 2026 07:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F562444A2;
	Tue, 24 Feb 2026 07:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15FC116D0;
	Tue, 24 Feb 2026 07:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917474;
	bh=ZMh4vpCa85zcZS/Y7zH3k8Ve9kxMakJv2iTLPBLSNo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+5HWqEZHfg0FoEnG4fHf2ZhyrpsNOUKd2qi35HYtRG8FTW5zR9XPp9BVtMs/FPhM
	 PUPFc1hpeyS8OINAhJjALN4wQgYOqAKf91SE/Hb2WFFSpQAFOCruqZSe6UNXSRM03g
	 o82U+ceElYq2mtyHxQPXbsdzz0ECoBaSAKTCLkZ+vrlvVf2CWkgnxGH/A1rm3PKFG9
	 kEfNhTBW8ryhxmhzIsaBjowEczeBLyyS3yKvNLIZTXi5l7JB3QNhBCgo3nve7Yv26D
	 iCOoKnxPXpyV28BDcK40vawyctTrnZr8zsWA10Y+Whf2sSWtNXiZQu0P6FDEepf2M5
	 RTRCdrdhAKZfA==
Date: Tue, 24 Feb 2026 08:17:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
Message-ID: <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_231755_214184_4893BD12 
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

On Mon, Feb 23, 2026 at 09:49:49PM +0200, Cristian Ciocaltea wrote:
> Update 'reg-names' property to allow providing the register blocks in
> the expected address-based order for RK3576 & RK3588 video decoder and,

What? The register blocks SHOULD NOT be provided in address-based order.
There was never such coding style, never ever we gave such hint and if
you found Qcom discussions you would see me and Rob objecting to it.

> consequently, fix some DTC warnings.
> 
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
> 
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings")

No, nothing to be fixed here. Describe the bug, because missing order
to address-based is for sure not a bug.

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..2d3164a2882b 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,15 @@ properties:
>  
>    reg:
>      minItems: 1
> -    items:
> -      - description: The function configuration registers base
> -      - description: The link table configuration registers base
> -      - description: The cache configuration registers base
> +    maxItems: 3
>  
>    reg-names:
> -    items:
> +    oneOf:
>        - const: function
> -      - const: link
> -      - const: cache
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache

No, ABI break without point.

>  
>    interrupts:
>      maxItems: 1
> 
> -- 
> 2.52.0
> 

