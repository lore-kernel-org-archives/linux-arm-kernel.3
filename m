Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B470F433C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBwXk2mFeUfbraRQD9wTYvcPCdXxbNoM45CB1BhIBBs=; b=dKtqRA6m3UK44LN5hx6z8a7Wsa
	bnsAK/UgcjZN12zG2L/gOjnsQrefXqGCikmDvPuWo/Q5c4g+OFDVHPLAd+xRSP6JYru2h9R/DVf37
	Z9FhIC97P5vMjZ7N+V6xWL/DXRUODbzMe9J4E73vPeIeJ9yky2WgnlexJX81amXyAqCaFLbGdZ/xs
	/MV+n6TUFBe1ywYANZmOteg5lVn9OB0t9ZM28h5VsmVtj5VsqZNm/pqiT8Qn6WMA2stRYa4sMT6JF
	MKAbiITni4dnpKdVj0Gye3N8anFC0/VCIO+/b7SpROtXi8iK8El0eQtxS0Q6QClBpv0ZBnIJ1kmhi
	RxcSxkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD85t-00000001e6J-3VtX;
	Wed, 15 Apr 2026 21:48:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD85q-00000001e65-2VfG;
	Wed, 15 Apr 2026 21:48:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8A5560120;
	Wed, 15 Apr 2026 21:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E72C19424;
	Wed, 15 Apr 2026 21:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776289697;
	bh=gAPjSmYjlAZJG9i+cMI+wy3rlcXaGDsPq4l5oXukpWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akOXoQdpYx6F35U2Oi8V/sfnOibsWcJeDCkUV1hZaLCMahRZS7/fN506jwYd9lRQn
	 lU9jov35+5SdAZlC7KczMJm8VO45bBWR7qFyN6uWUDn3nWbQgUmxkdaHpgORFV4amQ
	 XppiywyWSYqj0cZLzTZmGTcHE5WIQFLpnw2yjEtxaYHMcO4T4gKPGJSLRSXgDizRNr
	 2rgGC0+6Xa0n60nS8LN131nt/POlLg48AVdnbT9f8CnhT3Qe9wHH7KyOU2RX+FJJ7h
	 NqZ70IyRHdwn2ciRMFdOWCuiw/wiHhpSV2sWMQ3qE7MldvuRaBc5uxXVSOpo7YYedc
	 x+5uulJZ2jmEw==
Date: Wed, 15 Apr 2026 16:48:15 -0500
From: Rob Herring <robh@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
Message-ID: <20260415214815.GA602572-robh@kernel.org>
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
 <20260403-add-mcu-fan-khadas-vim4-v2-1-70536b22439a@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-add-mcu-fan-khadas-vim4-v2-1-70536b22439a@aliel.fr>
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

On Fri, Apr 03, 2026 at 06:08:34PM +0200, Ronald Claveau wrote:
> The Khadas VIM4 MCU register is slightly different
> from previous boards' MCU.
> This board also features a switchable power source for its fan.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> index 084960fd5a1fd..67769ef5d58b1 100644
> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - khadas,mcu # MCU revision is discoverable

The revision is no longer discoverable as was claimed?

> +      - khadas,vim4-mcu
>  
>    "#cooling-cells": # Only needed for boards having FAN control feature
>      const: 2
> @@ -25,6 +26,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  fan-supply:
> +    description: Phandle to the regulator that powers the fan.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>  required:
>    - compatible
>    - reg
> 
> -- 
> 2.49.0
> 

