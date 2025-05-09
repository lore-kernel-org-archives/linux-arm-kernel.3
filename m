Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E31C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cODXcFGpa9GJFjzICuWLyHSlxQKolQxsmG+8RFxJT0o=; b=CgpRpoMrPqKdxvaryZgvr9/1w/
	qu8fCz5uCWRohD4HeVe4Ws7vZvbwXqrF8QBxGl8oZwn74/ItnfaW78/WrRi7kOEFJSKBZ+zdMkIWj
	4o3nn2U7cVSiwGMiwO9wtM3poYbvKowKBymhLWAXhQTimpUBVRUIhsOXID1n+ZEEYNmDB8N3fiwIq
	csq+IZVteBrxJJTqc/TN1AWMdx8u/PpBMXv/qfi/EW0qzJ/lPmLXaMER0TnyHXX1YviZGMMiWhfkl
	qCBygyvJLFi8q95SZ6arQxUk05sjk1VZK5i2qIfZMN+j57HDP7CjOF5FEDoef7srBynOsNKla82ig
	qJ3OFJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOOG-00000003tce-07VX;
	Fri, 09 May 2025 14:07:52 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNWC-00000003i4j-0sTF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:12:01 +0000
Date: Fri, 9 May 2025 09:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cODXcFGpa9GJFjzICuWLyHSlxQKolQxsmG+8RFxJT0o=;
	b=zWGd0EQ+8vwKEEyyvYLpMj3w6+t+dVUvx+YxYEje5TTjAKGyvwHo56Dq0FM+ydfl4ear/w
	Yazo/NFZdnpNRn2m/a8/IJ6uHYDqVOyPs03uuabxbB44XGKCfxdfrFy980HCw7O1XQ6bkA
	dWzLb0cmlUch88AfOQa3fYufS22+gOk52D8iJ8P3KdA8UjT7cDLx8BceHL7N8Q7ugqlFcx
	NkbpkaH9bnnpAQfiz1y24McCjKDUMHQziyz0CGiapGPtv6fbwOi7kl9LAtBMuuTf1RjUMS
	nXp6fkLAaZ3FAB+fGva2BRQSBzkT1yutZQHb/moew7rpLTF4S4FGcJdJzmTcdw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: power: reboot: Add Apple Mac SMC
 Reboot Controller
Message-ID: <aB3_GaSrJFKgxNXO@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-2-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-2-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061200_387429_A38830EC 
X-CRM114-Status: GOOD (  17.02  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , May 03, 2025 at 10:06:49AM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> On Apple Silicon machines a clean shutdown or reboot requires
> talking to SMC and writing to NVMEM cells. Add a binding for
> this MFD sub-device.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../bindings/power/reset/apple,smc-reboot.yaml     | 52 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e55e524914c2f57f7acf239fdefcbdc7a993b69f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/reset/apple,smc-reboot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC Reboot Controller
> +
> +description: |
> +  The Apple System Management Controller (SMC) provides reboot functionality
> +  on Apple Silicon SoCs. It uses NVMEM cells to store and track various
> +  system state information related to boot, shutdown, and panic events.
> +
> +maintainers:
> +  - Sven Peter <sven@svenpeter.dev>
> +
> +properties:
> +  compatible:
> +    const: apple,smc-reboot
> +
> +  nvmem-cells:
> +    items:
> +      - description: Flag indicating shutdown (as opposed to reboot)
> +      - description: Stage at which the boot process stopped (0x30 for normal boot)
> +      - description: Counter for boot errors
> +      - description: Counter for system panics
> +      - description: Power management settings
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: shutdown_flag
> +      - const: boot_stage
> +      - const: boot_error_count
> +      - const: panic_count
> +      - const: pm_setting
> +
> +required:
> +  - compatible
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reboot {
> +      compatible = "apple,smc-reboot";
> +      nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> +                    <&boot_error_count>, <&panic_count>, <&pm_setting>;
> +      nvmem-cell-names = "shutdown_flag", "boot_stage",
> +                         "boot_error_count", "panic_count", "pm_setting";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f91f0225133490607ba0d79ad4225892ef31a66..d85d9d9065db4dc5869788f8a81d9d9a425d7ce3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2282,6 +2282,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
> +F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
>  F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
>  F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
>  F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> 
> -- 
> 2.34.1
> 
> 

