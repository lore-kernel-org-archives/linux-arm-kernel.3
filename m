Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F416C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO3iykXBoqpJM6cX5Wn7kdtgNhFMtoZX+4Fz0CvhOA0=; b=VrjqNEA7HY/BTfCudEt4hS0fKF
	tjyZ/mwg/jG3xq+RzfOxjyppyO1MC4yP5HUu2f1TV5BwjWoOBdX3PRfZpvEhkRipjAWwoq59v52GS
	9egFmLZxR6hyE4gWl5EXcD+QRzVUNsShDgTTwMoOpJ5SQ1wStlBUdCGac9eycKuB7ELqxm4bCA/c8
	RTRIDBtOTJv3h6X5fxZFbn/N3djT9Ur9XuOu9qFqpvaSdYE/mOz4oe2Th8pwJC3FAh764IVM4kHuN
	489+maJ1dku95zDbCTMSG5VK11hKZ/SZo67gcMS5caxBxNxq+G1xK9IBG9uc/COz0G2zdMWmvJgoz
	cReqD7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPIo-0000000F2op-0jO8;
	Thu, 01 May 2025 08:29:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPGu-0000000F2hL-2ZnQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 08:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBB885C41BA;
	Thu,  1 May 2025 08:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800E4C4CEE3;
	Thu,  1 May 2025 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746088075;
	bh=DIRp7PCO2q81pcfAhNFooEuVcja7gndPQjMS3ZpawtY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kdlRCrUMmhE/tpd3yMnCUQ8nqFZey2KO2cjBF/eRRiX7S7tIBNUvPpONHiNjtp0Jw
	 B3y0ddPIIL5h9wwXGQ9ORHG+J9rQeGilBbUOKKoX4iu/59rIZEAnup83l3Mdlrog0j
	 haFWGO7+2NbfFDawZSIKTGd95wYawI4fdGk8jBEyL0uV4WZGwJ+AaI6gVLp51uq6Ce
	 bswu/fX8jr/Uo+9LBf9DJs9mFhVah3+xuv5ho2wZzUDv9Ub1zudwGIgRfRV2p6sD3K
	 IlzdE+73rrDDkwgXh3h0uxSA8vWF1/9iUXCzsxTfpmc+Rxhy7rUC2IHUKg0unU/7Gx
	 KbLQJCgkOn/sg==
Date: Thu, 01 May 2025 03:27:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, v-singh1@ti.com, 
 vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, afd@ti.com, 
 conor+dt@kernel.org, nm@ti.com, praneeth@ti.com, devicetree@vger.kernel.org, 
 khasim@ti.com, kristo@kernel.org
To: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250501072923.1262414-2-p-bhagat@ti.com>
References: <20250501072923.1262414-1-p-bhagat@ti.com>
 <20250501072923.1262414-2-p-bhagat@ti.com>
Message-Id: <174608807383.1458182.1498162135150593654.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_012756_737826_BDB3873C 
X-CRM114-Status: GOOD (  16.38  )
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


On Thu, 01 May 2025 12:59:21 +0530, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
> 
> Some highlights of AM62D2 SoC are:
> 
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster.
>   Dual/Single core variants are provided in the same package to allow
>   HW compatible designs.
> * One Device manager Cortex-R5F for system power and resource management,
>   and one Cortex-R5F for Functional Safety or general-purpose usage.
> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>   single core C7x.
> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>   which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
>   and TDM Audio inputs and outputs.
> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>   external ports with TSN capable to enable audio networking features such
>   as, Ethernet Audio Video Bridging (eAVB) and Dante.
> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>   controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>   peripherals.
> * Dedicated Centralized Hardware Security Module with support for secure
>   boot, debug security and crypto acceleration and trusted execution
>   environment.
> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.
> 
> This adds dt bindings for TI's AM62D2 family of devices.
> 
> More details about the SoCs can be found in the Technical Reference Manual:
> https://www.ti.com/lit/pdf/sprujd4
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/ti/k3.yaml:37:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250501072923.1262414-2-p-bhagat@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


