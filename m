Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E33CF34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMeUxIUge8SIb9Q/2/CZRRNZLgX29sMTi2QSxQpaPu4=; b=a4I+NVzEbVjTDLKriT2giJxmqr
	eAll2MVe2N5meVwAY/t2OK9iwAdpNEmO6tlvB8gpwqr1Q3Jko61vvUXRfYFh2holeod993GodVIsK
	cvE8MnGcdxpPObmMhuRY/ugeTNfZqHjlXiBgaGVNbeBxZSGBUk0KeZYYdlwQZ3GW7uMdpEVOl+ksM
	wIwSlQRBwj929SkR20D01xFhxI/HXDS4flJgz3F6zkzNlXtx/PjFCfWXrZjDsVURlT7INqNYt6H9e
	saYnTR4EKE9xyess5dKzePjas+atoNVHlTGQA1h0VAx6CE+EBvy4FK1HsRaV1GRQahcIzVUeTDzky
	HpYKL5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCK5Y-0000000G3cP-1QRR;
	Mon, 13 Apr 2026 16:24:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCK5V-0000000G3bw-266r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:24:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82C03357A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:24:26 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7C433F641
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776097472; bh=ca3Hsb1xEPYF4Zp0GZJuEQqYeXADs3iCcyIw18ya/No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezfUSDpOaflGMX733XM/xQFpiHYLpeUoOE3/7t4C8ZrrNYPR6c+BNUGCKJxVxjj63
	 jN2QaG7uNCEBGDpvFx4MzS3xd/vxIczyufD59jS33hKSwxwNvmkNL0ldnGhWBDMUCI
	 Lp+MSWINO4eCuaXtF2i6ziYKsr7oAvSEmOfvPZqQ=
Date: Mon, 13 Apr 2026 17:24:22 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, pawel.moll@arm.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT
 schema
Message-ID: <ad0YtjflxRQggNbS@e142607>
References: <20260411183355.8847-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260411183355.8847-1-khushalchitturi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_092437_709265_54EB9A51 
X-CRM114-Status: GOOD (  23.80  )
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

On Sun, Apr 12, 2026 at 12:03:55AM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Changelog:
> v1 -> v2:
> - Modified compatible string to use an enum instead of a generic pattern.
> - Updated maintainers list.
> 
>  .../bindings/arm/arm,vexpress-scc.yaml        | 53 +++++++++++++++++++
>  .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
>  2 files changed, 53 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> new file mode 100644
> index 000000000000..9b8f7e0c4ea0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Versatile Express Serial Configuration Controller
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Sudeep Holla <sudeep.holla@arm.com>
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
> +      - enum:
> +          - arm,vexpress-scc,v2p-ca15_a7
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

