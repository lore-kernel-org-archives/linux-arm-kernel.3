Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA0CC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWzDnnR2orlLjSB3IfkvxeRswgtNOsr9TD17ICvN7pY=; b=2OCX7yZ2P/eeCJx7ThoT8PYJqV
	1bW9gTq5fXFiCckimUA0xIaEeS+3JkIFUAkQaPG93PC0mupT/aJYeM9UyROKbE3DIClqj5cs4l5b4
	lBpkrVH01uzPbzdOdceJu4oDyC40LTa6nbB3ls7lI+Xs4pCuCEaYDUMF84AUVhYOmor4UGFqTg+B8
	396BwD1g+0m4K0wdP/8SqSVbL2s8PxD8ijuFxv5jc8/fwLDUVUGsqg4WulNbQw8Oe6bPB3g9dfBnY
	uF8wNONctYBoi9tUCnVsMPEktMJm1dkpJJcw22UOUD8+3gW7KncVwVDrpRIuRWpYzXiWCH5nG3LDY
	e3bigg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyFL-00000000Lpo-0luV;
	Thu, 08 May 2025 10:12:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyDO-00000000LhG-01d4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F0094A957;
	Thu,  8 May 2025 10:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20669C4CEE7;
	Thu,  8 May 2025 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746699053;
	bh=al1FqgCmXx5VBt+1ZySNsT8ko0r+Xa1DTRkUn0hBPyk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=q1JOiXu16Id6bmC4kxGhe9ggBpPRqbPahqHkUlMfgo0p8an0i/GHnXDs4t2wiQP8b
	 0b0uD/z8QvtzY2RjZo6GJqmq98+WEaZuBUYWq0v5FgGBHQt9B5Zg04m2qVBFZBJDOY
	 kq4nKxezAKb4Gc7xDn9lId3CSsQ+wetxWoty2nQ3WZ0b2UU3vaEVf1ZyX1g2GhYCfa
	 HVWLvqkvxh9XGx6VIIhmVB4fB9PN2AkxJ9Bke2iY/HeK07QmyLGYnORxiMbHIRQYgD
	 ULAOYek3vcRgGQTU8RqQFjMvSSz4l0rotmoOUcOSaLfOXAxlvzFosiYSljeWDVQUDe
	 U7lQekgo0HFWw==
Date: Thu, 08 May 2025 05:10:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, afd@ti.com, devicetree@vger.kernel.org, 
 vigneshr@ti.com, v-singh1@ti.com, kristo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, khasim@ti.com, nm@ti.com, 
 conor+dt@kernel.org, praneeth@ti.com, linux-kernel@vger.kernel.org
To: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250508091422.288876-2-p-bhagat@ti.com>
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-2-p-bhagat@ti.com>
Message-Id: <174669905140.3798918.8007695230469922299.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for AM62D2
 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_031054_084775_B76A73A7 
X-CRM114-Status: GOOD (  18.08  )
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


On Thu, 08 May 2025 14:44:20 +0530, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
> 
> Some highlights of AM62D2 SoC are:
> 
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>   core variants are provided in the same package to allow HW compatible
>   designs.
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
> This SoC is part K3 AM62x family, which includes the AM62A and AM62P
> variants. While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
> does not include multimedia components such as the video encoder/decoder,
> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
> processing, or the display subsystem. Additionally, the AM62D has a
> different pin configuration compared to the AM62A, which impacts embedded
> software development.
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

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508091422.288876-2-p-bhagat@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


