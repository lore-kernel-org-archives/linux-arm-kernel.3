Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97B6F4487A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04k7JyDxVcgVs4PUSNmQy/0829VAvNfwW9L5c6+PUv8=; b=GoDVKucYOzh7DfHH0VfIipd1o+
	ny2h2FM2rOXg1/vtFiRWWo5m92vYPWOdOeHDkeUv7AJlrbq8gT3s8m6DzGk9cNELMZfByYRCteCXu
	9Hz+R7ZYXzzxRIG2dW7zWrg9E/QPWgaT0/ttWMuvEJI382f6HsGGVNMslagSNiv+G4yF+8WXZc6Um
	aQLI4CG4bgncjWDB5izPX2NoYaOLOum6m7Z79NfMov1a5b0T3WpSJGd0v+OUh27P6f/MzhR2XPsod
	ZJV5kbGYN28/5h5a9S+QAsT/xn7fdWBQR/Agyj/kDein8jGottOXFv5GXP5IjUtKhiWM6Pvgf0RY2
	V0MHtFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBraa-0000000EEAR-1OXq;
	Sun, 12 Apr 2026 09:58:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBraX-0000000EE9w-12iF;
	Sun, 12 Apr 2026 09:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C783A44225;
	Sun, 12 Apr 2026 09:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256E7C19424;
	Sun, 12 Apr 2026 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775987924;
	bh=zIplO9XJuBXyoCejItnRIwDvvhcyaRbki3fs/p1THpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ApjeXvFzueV95XP2YOnVk5tJ0hV4tBLnKhSecuiG6Gr4VAnKHjqAds8qb8X+3u4z3
	 d+GsxDjxfrEgPac1NbkCR7/jkZEplLioV9Mo8C5k0D8W2LO3AtjRxn7pgLLlai7YiD
	 fdiQF2o2RiIAAT0s9qmOEZJg2yY0NVFO2krzfU1oE+mTo/DG24LMs99IHCa7okyUXu
	 v+iuiDzsNyyzrEkCR6sQySiSHfkoCr+gpXHP7pr8o1G6CAli+SG0hJn09J6mxoDgVe
	 Sn5L8R2ckRzp17fFBBXzuftPMtehuOJChwRh0keHyGY86ivNjGiKOZJ8OcsPkoJ0X7
	 zBRj8og8Qz+7g==
Date: Sun, 12 Apr 2026 11:58:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: thermal: amlogic: Add support for T7
Message-ID: <20260412-abiding-silver-turkey-1623cc@quoll>
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
 <20260410-add-thermal-t7-vim4-v1-1-19f2b8da74d7@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410-add-thermal-t7-vim4-v1-1-19f2b8da74d7@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_025845_327500_00557E25 
X-CRM114-Status: GOOD (  17.58  )
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

On Fri, Apr 10, 2026 at 06:48:02PM +0200, Ronald Claveau wrote:
> Add the amlogic,t7-thermal compatible for the Amlogic T7 thermal sensor.
> 
> Unlike existing variants which use a phandle to the ao-secure syscon,
> the T7 relies on a secure monitor interface described by a phandle and
> a sensor index argument.
> 
> Introduce the amlogic,secure-monitor property as a phandle-array and
> make amlogic,ao-secure or amlogic,secure-monitor conditionally required
> depending on the compatible.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  .../bindings/thermal/amlogic,thermal.yaml          | 40 +++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index 70b273271754b..85ee73c6e1161 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -22,6 +22,7 @@ properties:
>                - amlogic,g12a-ddr-thermal
>            - const: amlogic,g12a-thermal
>        - const: amlogic,a1-cpu-thermal
> +      - const: amlogic,t7-thermal

So these two entries are enum.

>  
>    reg:
>      maxItems: 1
> @@ -42,12 +43,40 @@ properties:
>    '#thermal-sensor-cells':
>      const: 0
>  
> +  amlogic,secure-monitor:
> +    description: phandle to the secure monitor
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the secure monitor
> +          - description: sensor index

For what exactly this sensor index is needed? commit msg explained me
nothing, instead repeated what you did. That's pointless, explain why
you did it.

> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> -  - amlogic,ao-secure
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,g12a-cpu-thermal
> +              - amlogic,g12a-ddr-thermal

Drop both, you need only fallback.

> +              - amlogic,a1-cpu-thermal

And list is sorted alphabetically.

> +    then:
> +      required:
> +        - amlogic,ao-secure

Best regards,
Krzysztof


