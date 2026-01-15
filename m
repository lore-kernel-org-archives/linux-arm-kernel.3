Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B4FD44C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI509Vv3186unAMORIIpfV3KeehX7JVVaivSm/M3Cx8=; b=uUr4YkFV+W//WWCn/UNr2GrTCa
	rhQVlLSaXZF6G0T14TPTM5YWrtVebpAe2ZG4NhYi3SzpiMqh7WFxdOfxaDd3OQUjTF0q0/2PJlImI
	RWqDidzi6z/f5j5cImXdSFpcr9iap/X7wi20tELD0x85beH/gc3x/J4yosupqZp4ZCsH9/AQqnFnV
	ueI8L+jI4hoAvBJWYjCEkg6nScoIRulerrEdLnM1klfTEEF3aIq397zPLPr8CbX38QV+hEwHqo1l0
	L7fE9goEu+zmBhx9yRjU/yvnsHOA+P7jeHn2Y9WaO5Y6feoDE3+NxrIBmvQ10jPb2XRCwLScDaVvR
	LZsbRyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOjp-0000000CXbW-034l;
	Thu, 15 Jan 2026 14:54:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOjm-0000000CXaz-1fc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C054943FD8;
	Thu, 15 Jan 2026 14:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884E9C116D0;
	Thu, 15 Jan 2026 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488853;
	bh=yJ9GqM1gOFD0ndQugmXUKz0yy2pEJJfQ0+pAcG+HjUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVP99+sVpVRfPr6kBrKkoKCwr3XeuE7I+EUQ/95geaFsvnoZcOM1HABIoOIsTCPOt
	 oD2XyDILOoBGmT76LRBkfcS4xADkAl8PTXkkDIU66a4cArsrtXfV509ADZEKRmwxTz
	 eQq+MqTT0H+RXdpFnGKRlO1hSuvwg7LGp3oE8p+9PwUxX1+vT3dSwLTIjR35+RqP8N
	 FqTV7+YzeDhoL7tHDpATJHKJev34gpyWyolzAEf5eqsiJzMlX6E2+aY8V53vVP8u+0
	 OSMkbTpVej3FPSjEEu7Eqye8SOJPlN4NlXfKtKHrrQDrarUaE/eq6P590Ct5r72np1
	 915GD8GhHqboA==
Date: Thu, 15 Jan 2026 08:54:12 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add STM32 TAMP NVRAM
Message-ID: <20260115145412.GA621905-robh@kernel.org>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065414_481930_A4E97871 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Jan 07, 2026 at 08:45:32PM +0100, Dario Binacchi wrote:
> Add devicetree bindings for TAMP backup registers. These 32-bit
> registers are retained in all low-power modes and in VBAT mode. As a
> result, they can also be used to store sensitive data because their
> content is protected by a tamper detection circuit.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> new file mode 100644
> index 000000000000..e03469fbe436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 TAMP's NVRAM
> +
> +description: |

Don't need '|' if no formatting.

> +  The TAMP peripheral integrates, amongst others, Non Volatile RAM

What others? Are you saying this binding is incomplete?

> +  (NVRAM) with 32/128 32-bit backup registers which can be used by
> +  software to store information or communicate with a boot loader.

Wrap lines at 80 char.

> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp15-tamp-nvram
> +      - st,stm32mp25-tamp-nvram
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nvram: nvram@46010100 {
> +        compatible = "st,stm32mp25-tamp-nvram";
> +        reg = <0x46010100 0x200>;
> +
> +        nvmem-layout {
> +            compatible = "fixed-layout";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            fwu_info: tamp-bkp@c0 {
> +                reg = <0xc0 0x4>;
> +            };
> +
> +            boot_mode: tamp-bkp@180 {
> +                reg = <0x180 0x4>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.43.0
> 
> base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> branch: stm32-tamp-nvram

