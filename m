Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CCCC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn9G0YXglV9zkgjpXDThyV5CObwySYg2SM1MvmczTyI=; b=W2jR+KEwuNS5MRFtVFBzKVtYZu
	q1wappVAg8uCFY5NAEyCfX4T9XRcUkGgbKKci7L57DTZouqeb4yZ3O6GfqJKWiLjgLE9MHtIfNJFS
	sVrGMUbyBZQf4EizO+YAdURUOW/g8oMggkd1Q922J+Xhxtmzg4dpQWLmgAqNinaq00zMaFvuEIchb
	WMXYKBSVA2otqvfYByvbZ6+BpMaLA+tvsmDiLmbY2bquX6heXF6M6E7BR+Tyfmo1qojDGedQBAo3h
	FQCSZ0UxoHtAU1OX10Fb3K4wDKGlqQWNz5ZEV1MfKFltAwZ7TidPFgKpg5rAJ5dr+HC1P4b5g4tIs
	Z0kKEuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFlU-0000000FlLS-2Jb6;
	Fri, 27 Jun 2025 20:33:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFib-0000000Fl2f-0tYT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71A59A53009;
	Fri, 27 Jun 2025 20:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0702AC4CEE3;
	Fri, 27 Jun 2025 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056240;
	bh=ZRuA5FMG1fIGDnIRCHe0RknMG0RoBJNOiEM0pkknFxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW6A2IY6Cq5WEpCi7hTOaITjU49A5NzkZsFPsLrwR/Vp9YmwbcR3DfkkUk6Mi9rPm
	 qyOnqmt41wshOgswFOLQVtARgCCg/CvR+Y/3QlVXQZVnEsCEjKZ5oRvzYgOaBBKW0C
	 zB1yFLDLt3Ht37ebtrmdpG/PLgB7VmEDtY/KBTbdkgZfVJ3rBvKl2SJXciN0zw9tpx
	 pHVyWycqja9w8QIO/vxZ87nP6w2pRRLYV96aNtdVSZdbAH0g0c5CFvvRc2VDGc9N6C
	 xYKwuPdTwBAR2qIJa5OzHtlBEGn9hlkaviZSwCDqMoUFaT6hZ+CjyWN42Zyonaneh7
	 ljI328wopW8DQ==
Date: Fri, 27 Jun 2025 15:30:39 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml
 format
Message-ID: <20250627203039.GA30239-robh@kernel.org>
References: <20250624200659.2514584-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624200659.2514584-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_133041_380584_05AD43C4 
X-CRM114-Status: GOOD (  21.58  )
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

On Tue, Jun 24, 2025 at 04:06:58PM -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/input/lpc32xx-key.txt | 34 ----------
>  .../bindings/input/nxp,lpc3220-key.yaml       | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
>  create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/lpc32xx-key.txt b/Documentation/devicetree/bindings/input/lpc32xx-key.txt
> deleted file mode 100644
> index 2b075a080d303..0000000000000
> --- a/Documentation/devicetree/bindings/input/lpc32xx-key.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -NXP LPC32xx Key Scan Interface
> -
> -This binding is based on the matrix-keymap binding with the following
> -changes:
> -
> -Required Properties:
> -- compatible: Should be "nxp,lpc3220-key"
> -- reg: Physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The interrupt number to the cpu.
> -- clocks: phandle to clock controller plus clock-specifier pair
> -- nxp,debounce-delay-ms: Debounce delay in ms
> -- nxp,scan-delay-ms: Repeated scan period in ms
> -- linux,keymap: the key-code to be reported when the key is pressed
> -  and released, see also
> -  Documentation/devicetree/bindings/input/matrix-keymap.txt
> -
> -Note: keypad,num-rows and keypad,num-columns are required, and must be equal
> -since LPC32xx only supports square matrices
> -
> -Example:
> -
> -	key@40050000 {
> -		compatible = "nxp,lpc3220-key";
> -		reg = <0x40050000 0x1000>;
> -		clocks = <&clk LPC32XX_CLK_KEY>;
> -		interrupt-parent = <&sic1>;
> -		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
> -		keypad,num-rows = <1>;
> -		keypad,num-columns = <1>;
> -		nxp,debounce-delay-ms = <3>;
> -		nxp,scan-delay-ms = <34>;
> -		linux,keymap = <0x00000002>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> new file mode 100644
> index 0000000000000..5ab6cefd35fa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nxp,lpc3220-key.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx Key Scan Interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>

You need a $ref to matrix-keymap.yaml

> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-key
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  keypad,num-rows:
> +    maximum: 4
> +
> +  keypad,num-columns:
> +    maximum: 4
> +
> +  nxp,debounce-delay-ms:
> +    description: Debounce delay in ms
> +
> +  nxp,scan-delay-ms:
> +    description: Repeated scan period in ms
> +
> +  linux,keymap: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - nxp,debounce-delay-ms
> +  - nxp,scan-delay-ms
> +  - linux,keymap
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/lpc32xx-clock.h>
> +
> +    key@40050000 {
> +        compatible = "nxp,lpc3220-key";
> +        reg = <0x40050000 0x1000>;
> +        clocks = <&clk LPC32XX_CLK_KEY>;
> +        interrupt-parent = <&sic1>;
> +        interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
> +        keypad,num-rows = <1>;
> +        keypad,num-columns = <1>;
> +        nxp,debounce-delay-ms = <3>;
> +        nxp,scan-delay-ms = <34>;
> +        linux,keymap = <0x00000002>;
> +    };
> -- 
> 2.34.1
> 

