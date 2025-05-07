Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69E1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERe9+7kvf0o1lJlXoIfr5udw1hG1nDgtxYWN2WeyNxA=; b=iw4AO6xtTChG7YXYVGzDqATVQd
	1z6qFnwB9FNOuY+uoRoBOJIuRvTttbCyLNKhWe8yRR9ox8bo7qL14MJwN7alq2O/hpnd3ESabL9ra
	q4O5a6KloY0rFeQAZYNK3ki9JwUEe3iYPNsMpw9oZU3XLT3aqhkZCTePuzXxXB4hyOpZzDh4Gi16O
	pHzTxASjib+7p9UZRzbIAmUHwmeylucCtr9CQHuAZ3nuyaq479hHXahklPMedGuk6FFyeyRbCycWU
	MCfdI0Nkby4CKeH1AJ4KS1UuYBnXSqnua4qILD4kpdLAUpOMfESKP6qL0ZWGBd41yoovjzGo+gq34
	Pdz+S2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVj7-0000000E6hR-2pWC;
	Wed, 07 May 2025 03:45:45 +0000
Received: from golan.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVh7-0000000E5yl-1Co9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 03:43:43 +0000
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 0599A440758;
	Wed,  7 May 2025 06:43:23 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1746589403;
	bh=Aed/X3ndFGxW3Cv/Mmx0GvVxagOhwtAd9qDxrnSW1W4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JA9vqH9dNiRJAb04g3xMN2FZ5MlRAPpYW6VFuRa1wUgBJsIkmEXj0eLdnPxVBKmOD
	 rVHf0doxKFbF5OWm6tEOkwE8/ey9MbR0WSTG2+OGwG+CrImazH4hP04lIl/qqJcDaR
	 DiU3EhDlo/7ffReeP8FQ+8Uq1jds6Pidv3tBZcQr5RkqinKG67BZC8Wn/zjNpmHN1U
	 OiqPtp4Os8IB1GYbDnsciGtCfv8tvKzoGV1OWr216MDbExxKfi5qesQrUnZ/cZyJ98
	 4L8d+ikEwi3aWxGmA20iJBPKVRddYoJ7XYHeIRri9Iz2mfKbnR/Jn5vGYNKw5q+Ewe
	 8vcHZUlVfoy4Q==
From: Baruch Siach <baruch@tkos.co.il>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Jiri Slaby
 <jirislaby@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-serial@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: serial: Convert cnxt,cx92755-usart to DT
 schema
In-Reply-To: <20250506220025.2545995-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 6 May 2025 17:00:24 -0500")
References: <20250506220025.2545995-1-robh@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 07 May 2025 06:43:30 +0300
Message-ID: <878qn9ytjx.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204342_033774_D28AF61C 
X-CRM114-Status: GOOD (  17.67  )
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

On Tue, May 06 2025, Rob Herring (Arm) wrote:

> Convert the Conexant Digicolor USART binding to DT schema. It is a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  .../bindings/serial/cnxt,cx92755-usart.yaml   | 48 +++++++++++++++++++
>  .../bindings/serial/digicolor-usart.txt       | 27 -----------
>  2 files changed, 48 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/digicolor-usart.txt
>
> diff --git a/Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
> b/Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
> new file mode 100644
> index 000000000000..720229455330
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/cnxt,cx92755-usart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Conexant Digicolor USART
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>
> +
> +description: >
> +  Note: this binding is only applicable for using the USART peripheral as UART.
> +  USART also support synchronous serial protocols like SPI and I2S.
> +  Use the binding that matches the wiring of your system.
> +
> +allOf:
> +  - $ref: /schemas/serial/serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: cnxt,cx92755-usart
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    serial@f0000740 {
> +        compatible = "cnxt,cx92755-usart";
> +        reg = <0xf0000740 0x20>;
> +        clocks = <&main_clk>;
> +        interrupts = <44>;
> +    };
> diff --git a/Documentation/devicetree/bindings/serial/digicolor-usart.txt
> b/Documentation/devicetree/bindings/serial/digicolor-usart.txt
> deleted file mode 100644
> index 2d3ede66889d..000000000000
> --- a/Documentation/devicetree/bindings/serial/digicolor-usart.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Binding for Conexant Digicolor USART
> -
> -Note: this binding is only applicable for using the USART peripheral as
> -UART. USART also support synchronous serial protocols like SPI and I2S. Use
> -the binding that matches the wiring of your system.
> -
> -Required properties:
> -- compatible : should be "cnxt,cx92755-usart".
> -- reg: Should contain USART controller registers location and length.
> -- interrupts: Should contain a single USART controller interrupt.
> -- clocks: Must contain phandles to the USART clock
> -  See ../clocks/clock-bindings.txt for details.
> -
> -Note: Each UART port should have an alias correctly numbered
> -in "aliases" node.
> -
> -Example:
> -	aliases {
> -		serial0 = &uart0;
> -	};
> -
> -	uart0: uart@f0000740 {
> -		compatible = "cnxt,cx92755-usart";
> -		reg = <0xf0000740 0x20>;
> -		clocks = <&main_clk>;
> -		interrupts = <44>;
> -	};

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

