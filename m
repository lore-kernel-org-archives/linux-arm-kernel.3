Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFEAC54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 03:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqTjFur0lfqoeKNeUhFzDfOPVG6UrWH0xExo04huC1s=; b=vUMSgj1W2cAU8W6PaSP3xF7+9z
	JDdb3J4iTZ/lbCBMlUIeTszBDgJctbDFtYQe8EbxuVofeI516JEwrVilxwwDuYme7ZNfGS/FrF/CE
	7XOfPSBSAAEXiyvOmNxvU9OFVRqfINHQmAnn/0+eOMSJbxvvXy+wSDkKwIKJCLYtfiKS74nP0vkmA
	L6XKp57jOP1yGtaxDNLFcGrYlYJiR7eQL7hpnwj8t202VMczDVv5crzTHOFasWzM9eSzntLf06Kaj
	0JhmkrPN1m7ZrBDPUDkbC4Idf4T8LrN14HNFogLZLwjRk0if+hx35vF3hnNUtVTjSwyG4H1VQ9/fl
	90C8uPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJOys-0000000825x-2bxD;
	Mon, 26 May 2025 03:58:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJOwi-000000081uv-0peZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 03:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6307C5C59CF;
	Mon, 26 May 2025 03:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D4DC4CEE7;
	Mon, 26 May 2025 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748231775;
	bh=tdbyF2MXiShQeoNhDHocB+/AC1J+q95yF45AcGx2ogo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lqQjZUtAkvgH0wNxm8AvpynZWZkNCt8YvOHPEiBFlndGisFDegfNseJtuRzMmkV/r
	 eVW+NEb/PjuOrmkg2YecuzYhWC4wetyQmUAArAgg1yH6qBXRknIj86j+xEx0Ikl2OC
	 BbHmffFbTulHaOWv1IcC1LzzrLjesiAXsvstAWKblMwmh8OXbIyTbWx/mq5KDRwtyF
	 UpWTErLmB8KhoYf8Y3bHIiYBtZhdG1m9Onu6Ty2obmUuOTy/92rGOrHznZo56+Doa6
	 eTqaq9zO2CEILjzwFPkGd3utF0H4I/rn2cRZADLIfFhxnBKGCT0r5e/MKkup5/sUfA
	 h+mBA7kWLa9kg==
Message-ID: <1d25a01f-2761-41c3-85e6-b00100308ec7@kernel.org>
Date: Mon, 26 May 2025 05:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] DT bindings docs for Driver Xilinx ZynqMP AXI Timeout
 Block (ATB)
To: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, maciej.andrzejewski@iceye.com
References: <20250525195955.2843076-1-maciej.andrzejewski@m-works.net>
 <20250525195955.2843076-2-maciej.andrzejewski@m-works.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250525195955.2843076-2-maciej.andrzejewski@m-works.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_205616_375961_B286190C 
X-CRM114-Status: GOOD (  25.90  )
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

On 25/05/2025 22:00, Maciej Andrzejewski wrote:
> Add DT bindings docs for Driver Xilinx ZynqMP AXI Timeout Block (ATB)
> 
> Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
> Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@iceye.com>

One SoB is enough, considering you sent it from the first one.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


Please organize the patch documenting compatible (DT bindings) before
their user.
See also:
https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> ---
>  .../bindings/soc/xilinx/xlnx,zynqmp-atb.yaml  | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml
> new file mode 100644
> index 000000000000..d92747fba947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,zynqmp-atb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx ZynqMP AXI Timeout Block peripheral
> +
> +maintainers:
> +  - Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
> +
> +description: |+
> +

Drop blank line

> +  This module implements a driver for the Xilinx AXI Timeout Block (ATB).

Binding is about hardware, not driver. Please rephrase everything here
to describe hardware.

> +  The ATB is used to detect and handle timeouts on AXI transactions.
> +  It supports configuration and handling of timeout interrupts for both
> +  the Full Power Domain (FPD) and Low Power Domain (LPD) in Xilinx SoCs.
> +  The driver reads configuration from the device tree, sets up the necessary
> +  registers, and handles interrupts to report timeout events.
> +
> +  AXI timeouts can be harmful as they stall the bus and can potentially
> +  stall the entire Linux system. Due to hardware limitations, this driver
> +  cannot completely prevent bus stalls; only a limited number of AXI timeouts
> +  can be registered before the bus will eventually stall.
> +
> +  It is important to note that this driver should produce dmesg error output
> +  (grep for "atb: Timeout detected") to notify the user that the system
> +  configuration is not properly handled. Once an AXI timeout is detected,
> +  additional measures should be taken to address the issue.
> +
> +  The bool properties enable the corresponding interrupts for the
> +  FPD and LPD.
> +  The driver will read these properties and configure the ATB accordingly.
> +  If the bool property is not present, the functionality for this ATB will be
> +  disabled.
> +
> +  Enable this driver by selecting ZYNQMP_ATB in the kernel config.
> +
> +properties:
> +  compatible:
> +    const: xlnx,zynqmp-atb
> +
> +  fpd_afifs1_enable:

Neither this nor any further properties look like we expect. Please open
any other bindings or example-schema to see how this is done - missing
vendor prefix, following DTS coding style for naming.

> +    description: |
> +      ATB instance 5: FPD Main Switch to M_AXI_HPM1_FPD interface.
> +      This is used to detect timeouts on the M_AXI_HPM1_FPD.
> +    type: boolean
> +    default: false

No, there is no such option. You cannot assign there value.

> +
> +  fpd_afifs0_enable:
> +    description: |
> +      ATB instance 4: FPD Main Switch to M_AXI_HPM0_FPD interface.
> +      This is used to detect timeouts on the M_AXI_HPM0_FPD.

I don't understand need for these, but could be because of missing
hardware description.


> +    type: boolean
> +    default: false
> +
> +  fpd_fpds_enable:
> +    description: |
> +      ATB instance 3: FPD Main Switch to SIOU slaves.
> +      This is used to detect timeouts on the SIOU slaves.
> +    type: boolean
> +    default: false
> +
> +  lpd_afifs2_enable:
> +    description: |
> +      ATB instance 2: LPD Main Switch to M_AXI_HPM2_LPD interface.
> +      This is used to detect timeouts on the M_AXI_HPM2_LPD.
> +    type: boolean
> +    default: false
> +
> +  lpd_lpdm_enable:
> +    description: |
> +      ATB instance 1: LPD Main Switch to M_AXI_LPD interface.
> +      This is used to detect timeouts on the M_AXI_LPD.
> +    type: boolean
> +    default: false
> +

This wasn't ever tested... Also, missing required and additionalProperties.

> +examples:
> +  - |
> +
> +  atb {
> +      compatible = "xlnx,zynqmp-atb";
> +      status = "okay";

Drop. This binding looks very different than any other. Look at others
first - nothing uses status, format is different, you miss several
important pieces of binding.

> +
> +      fpd_afifs1_enable;
> +      fpd_afifs0_enable;
> +      fpd_fpds_enable;
> +      lpd_afifs2_enable;
> +      lpd_lpdm_enable;
> +    };
> \ No newline at end of file

Patch warnings.



Best regards,
Krzysztof

