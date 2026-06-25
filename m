Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1EBCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6av/h+22Y5C0CsgbTSVpHRmTlyTXAkoJakqSuQu5Hw=; b=OsYoT2N4T7AkfsngEKjtqGvHig
	owSY7V5Rg/aIoIfqCmYvqoe2QwOqDXqIIrhAP1slQRUlpOXVq1igRfTEb0u6T1/G+IYHUt3eOuHBi
	vpaD4fDGtovz9G9tBFx0a8t3T1INLeJCBJ03+xZWk0lxR2hg2xuOm7afgCyaEs2NhdIVzfy3b5eID
	jfFSrNONlOxKlP9Bti1QhpCl3AhiYhBAlj2QgY6+uUqIJEZXOjl289aYjri48W4U+OTesmnIkoEAQ
	iRZLmlUdV+J+lgyF/HOMaOlkeBY7C3K4N43tx2OOfb34JwWxBb5zO88Z6WFJQQSopaMpjbTyAf8WU
	jVLWwlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wces5-00000008nD1-0e4Z;
	Thu, 25 Jun 2026 07:51:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wces3-00000008nCq-3Toy;
	Thu, 25 Jun 2026 07:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D18FD60217;
	Thu, 25 Jun 2026 07:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554561F000E9;
	Thu, 25 Jun 2026 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782373894;
	bh=N6av/h+22Y5C0CsgbTSVpHRmTlyTXAkoJakqSuQu5Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1PMiipRVoh6SIadxsYDgIeP9v+jyFl1D88Ut6/Dqn4PhMKaytQnMXbgI0X/mJiAF
	 8o6eiGmy41edYeG7PvVy2yX4ZbRt78OOjm79jvngQyZCkBA62mqMenOLLBKeeQ/CcR
	 FNf9ddJwLllAMMQjoPHwakTTHJB6PfI0C+Z+PKvSb8q9ihYtvGOiNFUxSyofY6suez
	 UE3KsMHolf06IcsUZIsGPN6ruXBROATm+yMMOjG3votO9X93DD5vqfEPTTxto4AxC7
	 BvhL+kAjS2UXasWrROUANJTBIIcvBZfTKEP0RfZxfIqzUp/JnCiNsLT4Mt+MzVhb/n
	 obEjArSD3B1xw==
Date: Thu, 25 Jun 2026 09:51:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: add
 simple-mfd and child node support
Message-ID: <20260625-striped-demonic-jerboa-502afb@quoll>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625023958.569299-2-a0987203069@gmail.com>
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

On Thu, Jun 25, 2026 at 10:39:55AM +0800, Joey Lu wrote:
> The MA35D1 system-management syscon node hosts the USB PHY register
> block at offset 0x60.  To model usb-phy@60 as a DT child of the syscon
> node the binding must allow:

Explain why do you need child node. If you have fixed device @0x60, you do
not need DT child node at all. Compatible implies that child existence.


> 
>   - simple-mfd as an optional third compatible so the MFD core can
>     instantiate child platform devices.
> 
>   - #address-cells and #size-cells (each const: 1) so child nodes can
>     carry a reg property.
> 
>   - An open child-node pattern (patternProperties "^.*@[0-9a-f]+$")
>     to pass dt-schema validation.

No. Do not explain what you did - we can read the diff. You must explain
WHY you are doing that.

> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> index 3ce7dcecd87a..1fda7e8f4b5d 100644
> --- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
> @@ -19,6 +19,8 @@ properties:
>      items:
>        - const: nuvoton,ma35d1-reset
>        - const: syscon
> +      - const: simple-mfd
> +    minItems: 2
>  
>    reg:
>      maxItems: 1
> @@ -26,6 +28,16 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":

This must be specific.

> +    type: object

Missing ref and additionalProps. Please look at other simple-mfd.

> +
>  required:
>    - compatible
>    - reg
> @@ -43,4 +55,3 @@ examples:
>          #reset-cells = <1>;
>      };
>  ...
> -
> -- 
> 2.43.0
> 

