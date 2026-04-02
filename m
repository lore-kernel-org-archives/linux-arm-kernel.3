Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FCCC6B3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oXjBQ/torh5P8+CjW1wSwlzDV92+ceQvdRgdn1olPk=; b=xUJieIEmN4iTPRZJNAhHtAUuYx
	4hx4stJGuO88I+IirdGDiddFgR9W+3M6cdHY5LsNVnHIgPAJfnVatA1iX6WDCR38ccqscsQeb7h4s
	TfSAtrS/9fXeGiveHE5Hjgtaglj7aDTy9TADUQgkULhm1zpuNDuRQ6HduVLSVIq4DnXKXrrz0r+Fp
	spSgECzcv3dAc1nssqNQl1sDtVReZtGFI2WVH8mvcu+CvHymoGVOwi3yS/ad89sL26rSOb7/ZjMYC
	LGoqQhwVbrfKcvSsPH2MNv4H15lMdrptjExkogUpFBLNKcyDcSDEDMoVybgZI3bEKn71NRWEC1u78
	k33s8QXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jhu-00000000QIS-055u;
	Thu, 02 Apr 2026 15:11:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jhp-00000000QHX-2Rb9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 15:11:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA631764
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 08:11:27 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C5163F7D8
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775142693; bh=Cu6uyomYmnumjabskOuIe1bm69rCQyKSO2rE7I8UmIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ1fxxtl2xuGfQO7DZwuq29qZBKdSUIAUBesBd09ujGGyr72l6m1/pTUZU7LZkCgs
	 NkbnPS1lP2SXLRl4bkHHTg5Yek+0L9VSqy4KwCLt5IhVVrCUBV4qJO0cUyasICyL9n
	 cOhU3cs4Fq6aNc2qUGyQmwtCEli5Tu2rvUN7cvPY=
Date: Thu, 2 Apr 2026 16:11:22 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, pawel.moll@arm.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: arm,vexpress-scc: convert to DT schema
Message-ID: <ac6HGqZM15ijTZFl@e142607>
References: <20260331172959.35745-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331172959.35745-1-khushalchitturi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_081137_815890_DB1C0393 
X-CRM114-Status: GOOD (  27.10  )
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

Hello,

Thanks for your patch, I have some suggestions to improve it.

On Tue, Mar 31, 2026 at 10:59:59PM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  .../bindings/arm/arm,vexpress-scc.yaml        | 51 +++++++++++++++++++
>  .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
>  2 files changed, 51 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> new file mode 100644
> index 000000000000..7870410211a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Versatile Express Serial Configuration Controller
> +
> +maintainers:
> +  - Pawel Moll <pawel.moll@arm.com>

I'm not sure Pawel wants to be maintainer for this file, maybe add me and Sudeep
instead. I'd also wait until Pawel replies.

> +
> +description: |
> +  Test chips for ARM Versatile Express platform implement SCC (Serial
> +  Configuration Controller) interface, used to set initial conditions
> +  for the test chip.
> +
> +  In some cases its registers are also mapped in normal address space
> +  and can be used to obtain runtime information about the chip internals
> +  (like silicon temperature sensors) and as interface to other subsystems
> +  like platform configuration control and power management.
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: "^arm,vexpress-scc,[a-z0-9_-]+$"

This is way too generic. I suggest you have a look at bindings/arm/arm,vexpress-juno.yaml
and see how we defined the possible values for the compatible string there. For the initial
conversion I would suggest you only define as valid the "arm,vexpress-scc,v2p-ca15_a7" value
but in a way similar to Juno's file so that it can be extended in the future.

Best regards,
Liviu

> +      - const: arm,vexpress-scc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        scc@7fff0000 {
> +            compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
> +            reg = <0 0x7fff0000 0 0x1000>;
> +            interrupts = <0 95 4>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/arm/vexpress-scc.txt b/Documentation/devicetree/bindings/arm/vexpress-scc.txt
> deleted file mode 100644
> index ae5043e42e5d..000000000000
> --- a/Documentation/devicetree/bindings/arm/vexpress-scc.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -ARM Versatile Express Serial Configuration Controller
> ------------------------------------------------------
> -
> -Test chips for ARM Versatile Express platform implement SCC (Serial
> -Configuration Controller) interface, used to set initial conditions
> -for the test chip.
> -
> -In some cases its registers are also mapped in normal address space
> -and can be used to obtain runtime information about the chip internals
> -(like silicon temperature sensors) and as interface to other subsystems
> -like platform configuration control and power management.
> -
> -Required properties:
> -
> -- compatible value: "arm,vexpress-scc,<model>", "arm,vexpress-scc";
> -		    where <model> is the full tile model name (as used
> -		    in the tile's Technical Reference Manual),
> -		    eg. for Coretile Express A15x2 A7x3 (V2P-CA15_A7):
> -	compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
> -
> -Optional properties:
> -
> -- reg: when the SCC is memory mapped, physical address and size of the
> -       registers window
> -- interrupts: when the SCC can generate a system-level interrupt
> -
> -Example:
> -
> -	scc@7fff0000 {
> -		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
> -		reg = <0 0x7fff0000 0 0x1000>;
> -		interrupts = <0 95 4>;
> -	};
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

