Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C726C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFcHorTUBEe8HH5fPF6fLxNdXPVjEeVsVHcG5iH8mGY=; b=YGJMgzrZWvi25ybzi5lTnxZNoo
	25yVSXm7JCUEIC/oHbiPYKemITGbnFaSxqb1BIiIZv4jg9KYO37fxebdLxmoXvFAj7n2I2pYtdc/u
	1gEUIxBJz9OS0jAmapETMWDvwyPel7nDlkPzbN3Rr16Cx97AUBKvayixJTPhKpmL+dfdzFDtdIo5k
	XzTyCzUl/IYkLnFisG7uArfjPqg8ZCS3B7WUi0781YJGNrTSgcVJVfBBhOShOmul5aPENx3d7dynv
	givu4BNrGNKJxDpjlToaYhqHjIMiapWPXWeaAVCKo8SkrXYViNE3BO2jBpRCuR8dzWEx+wcX055ak
	NmuMRc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByKQ-00000007vGN-1E8Q;
	Mon, 05 May 2025 16:06:02 +0000
Received: from hours.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByCA-00000007tol-2niX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:57:32 +0000
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 4E544440F5F;
	Mon,  5 May 2025 18:57:15 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1746460635;
	bh=JShUoHNOxcFtMymlCDbXQT4jf0W+lgjQzqYxCFWCtdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ORUpY0pXkoPMM3sK8BZwYsIzlsNX4uinKRBLTP0+ztPwc/savUZQbYomplJ73ST7H
	 IC2/HweQzUlIOCO7ruYHaeuA957fPRWdRiTIJQMK5ye42lVqWbVptq1VFUQz45sUYc
	 R19iKlNYQN/DGJjk5Sa7EgQk8d8ghtbHJ1kmDHYZt7LtX9tEC/hO/+04lB9SBOHthY
	 lnLqDB0V05YnVrO3QjB8Df6qyJ+JP5QYUhHNewzMgFHhztAWPG0z3elAQneVRHp7c1
	 B5JwQrAQ0TGH5j8pQS3N7AzuldtQPksuU+M1t8umBmXRgLrg0SJJTZe5Sg82SWYM/j
	 NhAOHS8MHPC+g==
From: Baruch Siach <baruch@tkos.co.il>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 cnxt,cx92755-ic to DT schema
In-Reply-To: <20250505144644.1288617-1-robh@kernel.org> (Rob Herring's message
	of "Mon, 5 May 2025 09:46:43 -0500")
References: <20250505144644.1288617-1-robh@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 May 2025 18:57:22 +0300
Message-ID: <87v7qfyrrx.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_085731_363988_08795C94 
X-CRM114-Status: GOOD (  16.27  )
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

Hi Rob,

On Mon, May 05 2025, Rob Herring (Arm) wrote:

> Convert the Conexant Digicolor interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  .../interrupt-controller/cnxt,cx92755-ic.yaml | 47 +++++++++++++++++++
>  .../interrupt-controller/digicolor-ic.txt     | 21 ---------
>  2 files changed, 47 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
>
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
> new file mode 100644
> index 000000000000..3f016cf47812
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/cnxt,cx92755-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Conexant Digicolor Interrupt Controller
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>
> +
> +description: Conexant Digicolor Interrupt Controller
> +
> +properties:
> +  compatible:
> +    const: cnxt,cx92755-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  syscon:
> +    description: A phandle to the syscon node describing UC registers
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@f0000040 {
> +        compatible = "cnxt,cx92755-ic";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        reg = <0xf0000040 0x40>;
> +        syscon = <&uc_regs>;
> +    };
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> deleted file mode 100644
> index 42d41ec84c7b..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Conexant Digicolor Interrupt Controller
> -
> -Required properties:
> -
> -- compatible : should be "cnxt,cx92755-ic"
> -- reg : Specifies base physical address and size of the interrupt controller
> -  registers (IC) area
> -- interrupt-controller : Identifies the node as an interrupt controller
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -  interrupt source. The value shall be 1.
> -- syscon: A phandle to the syscon node describing UC registers
> -
> -Example:
> -
> -	intc: interrupt-controller@f0000040 {
> -		compatible = "cnxt,cx92755-ic";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		reg = <0xf0000040 0x40>;
> -		syscon = <&uc_regs>;
> -	};

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

