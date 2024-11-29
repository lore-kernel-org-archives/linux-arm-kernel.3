Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043CBD6EBE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfKS4fvx1HE8D4a7HK4n2c3BoWQV73qYXLEuG+SrWDc=; b=mZeEykE8ddweyCu9pU8794dAyz
	Kkdfx6K7NrkZlNQe8+Ao+JdO8jQXR9AvXO1Y8k8D1oyDgzzHpD35pEjI8rnGFdlokUBy8LTH8nJSY
	wIKzc5Kq1mBqfWaaaJQIP2Dr2QH/k8fzXBgczsR0kkX4UQT+d711q/v6r92NgVbYhEr3teLHuANxx
	PHs9B2mxv+TnBs1TkTyPZWs/oCgi4JuX1V1pOKu3zX32W1QBx9UHeb+GrRdsikkb0I9+EGmLmRVMr
	secWGtT0SY3mJrvac7DttPMwtNjb+4Tl0W80abp8bPAkhkjwcOWnY3Uuk4Dtue/spv3RWxGVk+vRg
	IQFEnFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvFS-0000000H3rI-2Lrv;
	Fri, 29 Nov 2024 07:17:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvET-0000000H3lM-3g56
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 07:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8C8E5C2458;
	Fri, 29 Nov 2024 07:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CC3C4CED2;
	Fri, 29 Nov 2024 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732864564;
	bh=yfUMcS/42xc22dFe7ApSwq6gDTwMxL0f/YsB9GrDmHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OM5swOw3L1BAa8TgjDLNaPD2oVuJGxzlpg9LJlS7Wpnn6Kns4WLL3qhuuxt6Ob14Z
	 YFfS+qnoJ8NhMOBA88PNiV7nytXrP4iOgLCMKt8EnYHSDft4YzGQhfmNQfa6aQTuYd
	 wFGDkOrSODM2BfdFJH1sJhCjCM8D6bfB2BjrRHwL2fkDvfanzptMPIhYqoeTDGv3jd
	 6/1q5/BJpo++JYRg/SQwKpq0xPC2r4ORO3rHjNGkKrS1W3+1ppSpOG6gJgU0vXuflb
	 qfQ90xSq46FTfejzB+Solr9cMTt7n1kV648yJk0qRq5V4se6GVeYRUvPHf64xpj/XE
	 VvQUsBjBm2/3A==
Date: Fri, 29 Nov 2024 08:16:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Message-ID: <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-1-76cc59bbf117@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128-z2-v2-1-76cc59bbf117@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_231605_960917_47D06188 
X-CRM114-Status: GOOD (  16.21  )
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

On Thu, Nov 28, 2024 at 11:29:16PM +0100, Sasha Finkelstein wrote:
> Add bindings for touchscreen controllers attached using the Z2 protocol.
> Those are present in most Apple devices.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../input/touchscreen/apple,z2-multitouch.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c4c0b41178728d5e0a782979d6eecd32e0a83618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/apple,z2-multitouch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple touchscreens attached using the Z2 protocol
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: A series of touschscreen controllers used in Apple products
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - apple,j293-touchbar
> +      - apple,j493-touchbar
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  apple,z2-cal-blob:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      Calibration blob supplied by the bootloader

What is the expected size? Fixed size or maximum?

Add it to the example.

Best regards,
Krzysztof


