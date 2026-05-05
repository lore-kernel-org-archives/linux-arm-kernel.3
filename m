Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACC4CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ubr1+uDm3FoW9dpo4RQgP1WtmCyGWGEIRKL26AR+yo=; b=S8gstR9IYnU/Qmpv2EPZmGA1Gw
	FNprQKG3izqYJEaVbDbGYQPUx//GfwanE7OVTsG0fQV/ZOlKxSe0LbaCw0JGD/vis7ig375UO5C1D
	IB4Vh/6MAV0vCagwUy+OirDxWRHZl9rda/G0b+qvPbVgFhqTP+yCCyvsCwQ7+IOzj3ZSpI48GyP0x
	s2ooeAVAqDYjzFmrLFY9MPlRzXbJdeNQAtpH17tcMjvA3Vx4cnjFwoeNW0DzE59IiEyX7lilUPQAF
	7rlWlRNri1bCCEEO9+QuQ8dVfC4uS9H5Q5dP6HXHqrnkdWl4kxoGgwajxN213kjsmXkVBRrkwm99s
	ede/PlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLit-0000000HKoi-1HzB;
	Tue, 05 May 2026 19:46:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLis-0000000HKoX-0rwu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A556360181;
	Tue,  5 May 2026 19:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3495CC2BCB4;
	Tue,  5 May 2026 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778010385;
	bh=1l6AEA47+DNTOgppu+35U+rjWMbfBF3LPM2Zl6wdbXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icb6EM9M4wYOqC/VuwHxS0M/UXNyYVLcNjMd7PZyHTm/2zFQT2eDMMdXkE/5Xmo14
	 G7A7ThX9bpWOmxLhYCINxceTgPHzgcOt6B1ssdkU4aZF0GGgYbD7VyUKO+foRVmmsk
	 xcwKabE2PEim2EG7PkMiCo6501EQpQDkz3rFWEfqxJhffz6Bqh/4G1bWHzeYIBMWXk
	 5qXlF4tpd3oXMLoNbCIuGQJcbqMznh2G/Q5e13YzlIIP9jKUdM2n48JfKnEJEPIgnz
	 w3RqYR5B4UQFVCWmFsvvzR/r/k04FSLIOFnmfm0u2fKcioAuJd3+T/5JL5bSoDZSq1
	 iJaRnYVkae4Rw==
Date: Tue, 5 May 2026 14:46:23 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
Message-ID: <20260505194623.GA3806254-robh@kernel.org>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
 <20260421104358.2496125-3-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421104358.2496125-3-shubhrajyoti.datta@amd.com>
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

On Tue, Apr 21, 2026 at 04:13:57PM +0530, Shubhrajyoti Datta wrote:
> EIO (Extended IO) GPIO is a Xilinx IP block that exposes
> multiplexed I/O pins through an EIO interface.
> 
> The EIO GPIO block has 2 banks with 26 GPIOs each (52 total).
> The GPIO width cannot be determined from the hardware registers,
> the driver relies on the compatible string to select the correct
> bank/pin configuration. A new compatible is therefore required.
> 
> The block is currently present on xa2ve3288 silicon.
> The compatible string uses version 1.0 matching the IP core version.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v3:
> - Update the commit message
> 
> Changes in v2:
> - Add description of EIO block
> 
>  .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> index 30a7f836c341..1ca067217509 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - xlnx,eio-gpio-1.0
>        - xlnx,pmc-gpio-1.0
>        - xlnx,versal-gpio-1.0
>        - xlnx,zynq-gpio-1.0
> @@ -30,7 +31,7 @@ properties:
>  
>    gpio-line-names:
>      description: strings describing the names of each gpio line
> -    minItems: 58
> +    minItems: 52
>      maxItems: 174
>  
>    interrupt-controller: true
> @@ -89,6 +90,17 @@ allOf:
>            minItems: 116
>            maxItems: 116
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,eio-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 52

The min is already 52, so you can drop this. With that,

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> +          maxItems: 52
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

