Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E092FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWViPOsVeyWVoHpKCVIXPaB33XvaMdD6qBGDAw7UGpo=; b=pWRmkT8rZMUrVqc02RHR0TOkbj
	/n8whUmIRwQeFivam56gOM6g9G61utGPeC/HBcuVzYJjFYArDIu00YxV5zYrjMFni0yQE0QFjPNgN
	7Gr2T0wEnzhHll5PXT9mF20olK5wDSYM9E7tGxXL8tCi7gWMbsOGAUJqp6Fc83Ver8Q0ClApIoQbN
	6OpfwWr6rldHLfjnIkFWYuvJFPy9xihUUTQ/rSYTKxM97L7SJnCzyGgulxYT5yhbOvZdhwNA8KN2b
	bLQl1e1Y01cmSzZXtXr12qUJ1mu+YwQxjjgnncYwdxEi4q1PUtLzOElaGI190N4Z++7czUp97fS4B
	o03q0YRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9Om-0000000FJES-0LBN;
	Tue, 05 May 2026 06:36:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9Ok-0000000FJE2-3f9U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 06:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0C2E60125;
	Tue,  5 May 2026 06:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB56C2BCC7;
	Tue,  5 May 2026 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963009;
	bh=TFqejn3IsKpgwjK1Z2L0fPwG+m/H57fk/+s9Zz00kQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtJNlD1gP5UTFF7E3XRVex68cbvPUFAtSI0ibdDgLfDF40rX4XRZFZQLNg/DgHC+8
	 8ZBzi52k9sTkVUKDuZ1kgVKzNrSBsDFPa8Prw3DCWcpRzFiwyYubaQv3x0U8FA7rei
	 5QJHEctJm5XiD3S8QNSxl1fKVnVwK2INCqUm/rnQNIB/idr+LcqD5mpZsuvuiED2KQ
	 BBevOhz4ISTmkmiwI9LMP0LwnQvJ6bv9YaoAznU9k9iLGFciAIECBHcdSzl4lLVVc8
	 pEXvEIjgTzNfe1xhXzD8JuAg0TPbaWdn/S1E7hTo+d68vTMqES3Smqrr4VX0+P3IhN
	 iC/aNUuoY4N4w==
Date: Tue, 5 May 2026 08:36:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v9 5/7] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
Message-ID: <20260505-voracious-gregarious-stallion-ff6c34@quoll>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-6-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504131148.3622697-6-khristineandreea.barbulescu@oss.nxp.com>
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

On Mon, May 04, 2026 at 03:11:46PM +0200, Khristine Andreea Barbulescu wrote:
> Extend the S32G2 SIUL2 pinctrl binding to describe the additional
> resources used by the updated SIUL2 pinctrl driver.

Please describe hardware, not drivers. Statement is not even true -
drivers do not use these resources, unless you organized your patchset
wrong (see submitting bindings documents, both).

Nothing above explains why you need new compatible.

> 
> Besides the MSCR and IMCR register ranges used for pinmux and
> pin configuration, the SIUL2 block also contains PGPDO and PGPDI
> registers for GPIO output and input operations, as well as EIRQ
> registers used for external interrupt configuration.
> 
> Add GPIO controller properties:
>   - gpio-controller
>   - #gpio-cells
>   - gpio-ranges
> 
> Add interrupt controller properties:
>   - interrupt-controller
>   - #interrupt-cells
>   - interrupts

Do not explain what you did, but say why.

> 
> Also update the binding example to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
> 
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++++++++++++++++--
>  1 file changed, 98 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> index a24286e4def6..0bd341f1e84d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -# Copyright 2022 NXP
> +# Copyright 2022, 2026 NXP
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
> @@ -17,26 +17,39 @@ description: |
>      SIUL2_0 @ 0x4009c000
>      SIUL2_1 @ 0x44010000
>  
> -  Every SIUL2 region has multiple register types, and here only MSCR and
> -  IMCR registers need to be revealed for kernel to configure pinmux.
> +  Every SIUL2 region has multiple register types. MSCR and IMCR registers
> +  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
> +  registers are used for GPIO output/input operations. EIRQ registers
> +  are used for external interrupt configuration.
>  
>    Please note that some register indexes are reserved in S32G2, such as
>    MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
>  
>  properties:
>    compatible:
> -    enum:
> -      - nxp,s32g2-siul2-pinctrl
> +    oneOf:
> +      - const: nxp,s32g2-siul2-pinctrl
> +      - items:
> +          - const: nxp,s32g2-siul2-pinctrl-gpio
> +          - const: nxp,s32g2-siul2-pinctrl

I don't get how this binding develops. You were asked to grow existing
binding instead of deprecating it and now you did not grow it: you added
completely new compatible.

Please go back to previous version comments.

Best regards,
Krzysztof


