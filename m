Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981CBCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMEyZY83mtOf98Y87sETCEyUJVbj7dvZ+NURWwy5N3Q=; b=P+CIJc2qsiBVjjDApzurMNUONJ
	d4PtXJoOdZykbKg2zTkfetosQrOehwivoISxzXsnFcboIUYM7r3+00X8q/bwuJTWsDoJtsodZLgnd
	85ZMt8vJ5c9FSgyxJ3B6DK2gLaaUphhX/IP7Yf8ECgpF73cOMr3Daxw7yrsqreVxeZKSUm5tjxigZ
	eozadiMjnri6fF0cOQMfVNz4dTQqnU92opstBHfWcg8b9irBTkGClkd60s1i4QwqVMhhmZPhinntL
	qykTP3VoWEV1myMkfMHrB6Qxi7M/7oxAkf6z33daG0QsYH4rfmFHnqmtKcqLoIgDsDuXCe8KUwR2i
	DC//pOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0g3-0000000DbHy-0WEc;
	Sat, 03 Oct 2026 14:25:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0g1-0000000DbHi-2Ja9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 14:25:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6A0B60D82;
	Sat,  3 Oct 2026 14:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CA61F0089B;
	Sat,  3 Oct 2026 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791037524;
	bh=oMEyZY83mtOf98Y87sETCEyUJVbj7dvZ+NURWwy5N3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NHo6pYqliX0+vL+QohnXX/giy7sbKAGQFfZ7psJ1t0iNtAJCNHZjWMOx9qFUYy6Eu
	 lmKTKVwGGe1fznnkHQFp+ITSLz0bdrlPkufCWnFxHxoqhKV6P0TBsYS3wFNk6JR+Dm
	 5A8OCHv8w+pJVKMDB+L0k0BuKcX77OYJmNU5ByIawM00JvFI7MzbCnCVguc4b1FjSW
	 dc/RcjuKIvDBJHg+m1EzPVxGXLIo8f6KScvqkl3TROpoiuEy/ZUr0N/m5e/AIhe+vw
	 oivzL7MmWh4WycM+wtW88TrzYk1yosBV2WZmZHh6Sa3mPoJGGjNrrIFI4654JPzdQm
	 3kWwhvNfaPljQ==
Date: Sat, 3 Oct 2026 16:25:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1
 SPI controller
Message-ID: <20261003-innocent-placid-markhor-e7c6ec@quoll>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001131818.110028-2-cwweng.linux@gmail.com>
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

On Thu, Oct 01, 2026 at 09:18:16PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Extend the existing MA35D1 QSPI binding to also describe the MA35D1 SPI
> controller.
> 
> The SPI and QSPI controllers are separate hardware IPs. QSPI additionally
> supports dual, quad and DTR transfers and a target-mode timeout function,
> but these differences do not require additional controller-specific
> Devicetree properties.
> 
> Both controllers expose the same Devicetree-visible resources and provide
> up to two native chip-select signals. GPIO chip selects are supported
> through the generic SPI controller binding. Since the MA35D1 QSPI driver
> now supports GPIO chip selects, also remove the existing restriction
> on cs-gpios for the QSPI compatible.

This has to be a separate commit.

> 
> Add the nuvoton,ma35d1-spi compatible and update the binding description
> and examples to cover both controllers.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 41 +++++++++++++++++--
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> index 40965ec5163b..72f2e1e1219a 100644
> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> @@ -4,7 +4,17 @@
>  $id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Nuvoton MA35D1 Quad SPI Controller
> +title: Nuvoton MA35D1 SPI and Quad SPI Controllers
> +
> +description: |
> +  The Nuvoton MA35D1 SoC contains separate SPI and QSPI controller IPs.
> +  Both controllers expose the same Devicetree-visible resources and provide
> +  two native chip-select signals. GPIO chip selects are supported through the
> +  generic SPI controller binding.
> +
> +  The QSPI controller additionally supports dual, quad and DTR transfers and
> +  a target-mode timeout function. These capability differences do not require
> +  additional controller properties.
>  
>  maintainers:
>    - Chi-Wen Weng <cwweng@nuvoton.com>
> @@ -14,7 +24,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: nuvoton,ma35d1-qspi
> +    enum:
> +      - nuvoton,ma35d1-spi
> +      - nuvoton,ma35d1-qspi
>  
>    reg:
>      maxItems: 1
> @@ -33,8 +45,6 @@ properties:
>      maximum: 2
>      default: 2
>  
> -  cs-gpios: false
> -
>  required:
>    - compatible
>    - reg
> @@ -59,7 +69,30 @@ examples:
>              interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>              clocks = <&clk QSPI0_GATE>;
>              resets = <&sys MA35D1_RESET_QSPI0>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
> +

No need for a new example, for exactly the same node. Difference in
value of a property does not justify it.

Best regards,
Krzysztof


