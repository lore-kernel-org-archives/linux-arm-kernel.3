Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E26DC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKU4vnqU/VYaJQ55+TKAhS5xj/KuQfRHxHui1BDv+k4=; b=MBC8eGiICnTwTAHM4ZrYXrqisD
	wbjyvhHX3If1FzgwL6gibzLFEx5a5X/7JeWbR+29ErLN97E+jvIJqGNqPuu0WGt30x0CjUD6N+yif
	0tj50862bdtDWu/1B5zeBtYO0iwKu7djBVsuj7az4OUQiKUTRQZ/T4hyFuytrLq6DVm/TS6my2hmq
	zxUvyK25jw2nwJPVIV2EZCcc4gLB4hFSgEbv09nK3NTEYUBhd2iNKlsAuaK9e6GZi+KDjztWpIKhR
	sVgAm9BY/XgwdFnQV099rbM9k5XSUdTIlmYBW5HNz7hURcLq4a9R9JpdZRuxzOB/bFZAbUNmtMWuL
	1QDBx9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTJ24-00000000nW4-3MgP;
	Sun, 22 Jun 2025 11:38:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTIzn-00000000nQ2-33tp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 11:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C36A1A4A26A;
	Sun, 22 Jun 2025 11:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D371C4CEE3;
	Sun, 22 Jun 2025 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592182;
	bh=6EBc43I0hRetS6oG4fS9WzjeCLsol5+NvkR7edl/i6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=becY3tL9N6PqEruLxFbcmySSiLdV9J7nYdd79GVeM0qf3neU8OvEIkDSYQpmmL424
	 voDH4OKqkMpRFZK7XznSONMPSuSJEl39rst9RufOf9MnVdA8T3E3u+7o79pc+8ts7Z
	 5UuPjFOzzIVQSU7HUD923hyVnEFBW/XPBlmZNImlXNbpcQ15Rqbgglvp1HPaGGusNO
	 c9x9bCFxKFUXv5TvSpm9fLl1/yVKi/R3jMDXSqpU2xEBlYXcjRV8GGL5dst3tfRMM9
	 OhdG12UGrBRnoRb7AlixQPmPavJJiwV7ML+2N5Qudlcfw8+VOx0lv2peTxVTqQQa8e
	 8c6bdPLi1zUGQ==
Date: Sun, 22 Jun 2025 13:36:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: mfd: add NVIDIA VRS PSEQ
Message-ID: <ug3zbannk22ziy7g25rhe4v2vv2vlxg3ylwvksy2mbzkf3lb2f@uib4qcvxjig6>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
 <20250619084427.3559207-2-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619084427.3559207-2-shgarg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_043623_895778_D1099A13 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Jun 19, 2025 at 08:44:22AM +0000, Shubhi Garg wrote:
> Add support for NVIDIA VRS (Voltage Regulator Specification) power
> sequencer device. NVIDIA VRS PSEQ provides 32kHz RTC support with backup
> battery for system timing. It controls ON/OFF and suspend/resume power
> sequencing of system power rails on below NVIDIA platforms:
> 
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v4:
> - no changes
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> - fixed indentation
> 
> v2:
> - fixed copyrights
> - updated description with RTC information
> - added status node in dtb node example
> 
>  .../bindings/mfd/nvidia,vrs-pseq.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml

Does not look like mfd device. Isn't there appropriate directory for this?

> 
> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> new file mode 100644
> index 000000000000..65bf77f70c44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nvidia,vrs-pseq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Voltage Regulator Specification Power Sequencer
> +
> +maintainers:
> +  - Shubhi Garg <shgarg@nvidia.com>
> +
> +description:
> +  NVIDIA Voltage Regulator Specification Power Sequencer device controls
> +  ON/OFF and suspend/resume power sequencing of system power rails for NVIDIA
> +  SoCs. It provides 32kHz RTC clock support with backup battery for system
> +  timing. The device also acts as an interrupt controller for managing
> +  interrupts from the VRS power sequencer.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs-pseq

I2C devices, even internal to vendors like Qcom, Samsung, Renesas,
usually have models and version numbers. This looks really incomplete. I
don't think generic compatible would be acceptable for I2C.

Plus, pseq is redundant. Can it be anything else?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      The first cell is the IRQ number, the second cell is the trigger type.

That's the default/standard, drop description.

Best regards,
Krzysztof


