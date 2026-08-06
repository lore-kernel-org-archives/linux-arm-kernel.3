Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DD1C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8O3Jm/KCpUxHmdI56AF1wTxRqOJCMDI/5j9/Q6443Ro=; b=PdvjEXzkHfHxK5Xr60Fq1LkhbZ
	MGbKl2oEisLc3u7pgvImBhvpVkw7MnIMvUDrLSHqUYs9F7b8juxvRR91kJS3utia1H6FMqWwLgtix
	mkvdVoWJorv1ushEp91ICRKHKJdo2l8rZgMpYdA3y+puQjA3C9Wew+JvEg6fgDtCuzOvU2hgyUIPC
	Tu9iumHsvqenySCNq6JQ/kUmDFyhCR2QvSPhs3yQbZZ/K2wpg6bUJ9Ub0oTsrcFD77kN29oTwGKm1
	HxI+JYDrDunLRpuu7dR6d1RgnMYm0ygHpPKj88AS/3PYpSbM8SdAo/9EuCbqc+zSpUXl6NwU9CbdB
	YVGVNKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxxd-00000005rTK-0ZB3;
	Thu, 06 Aug 2026 13:16:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxxb-00000005rTE-1AK4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:16:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97D0B41F96;
	Thu,  6 Aug 2026 13:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DAA1F000E9;
	Thu,  6 Aug 2026 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022194;
	bh=8O3Jm/KCpUxHmdI56AF1wTxRqOJCMDI/5j9/Q6443Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OYTTH2YZ95hRG04hyNETNtpBAmuqnutIGsr5526ph4/Spdpox8qylIrZLTN2uJeBJ
	 v6OAiOPKkmABiofnuehJ9uheHaIhy99SVgixWZkBUyUc9/4tmUcXoOIcri5X5/G2YD
	 zj6/fCqjKXrLbJuL7JOHgFKZZKwN9mbs4H9cfEImkJQC4VjC/HiJAaUYyQ+DNouog6
	 uevVcXkGTmcu/rmvNKUgidInV3RVrEPw8CD7UN9FMBqSMYCT0ZXfCgP2TxMJhjM8ti
	 tdzuY4Lmjf5fOxwo6R3fOk3huIa7nmHtCD0tA4V8JEPvXIpYtdGB2Ql7SLIO3UdBpP
	 MMgcU7pcNIdmA==
Date: Thu, 6 Aug 2026 08:16:33 -0500
From: Rob Herring <robh@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005 PWM
 fan controller
Message-ID: <20260806131633.GA30560-robh@kernel.org>
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-axiado-ax3000-pwm-fan-v1-1-f6db4cf2166b@axiado.com>
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

On Thu, Aug 06, 2026 at 02:01:29AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      | 68 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
> new file mode 100644
> index 000000000000..a985f49bbdcd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/axiado,ax3000-pwm-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axiado AX3000 and AX3005 PWM Fan Controller
> +
> +maintainers:
> +  - Petar Stepanovic <pstepanovic@axiado.com>
> +  - Akhila Kavi <akavi@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description:
> +  The Axiado AX3000 and AX3005 fan controllers use a hardware tachometer
> +  block to measure fan speed. Fan speed is controlled through a PWM signal
> +  supplied by an external PWM controller.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: axiado,ax3000-pwm-fan
> +      - items:
> +          - const: axiado,ax3005-pwm-fan
> +          - const: axiado,ax3000-pwm-fan
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
> +  pwms:
> +    maxItems: 1
> +    description:
> +      PWM specifier used to control fan speed.
> +
> +  pulses-per-revolution:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    default: 2
> +    description:
> +      Number of tachometer pulses generated per fan revolution.

This is a property of a fan, not the fan controller. The fan(s) should 
be represented as child node(s) under this device. Use the common fan 
binding, fan-common.yaml. See other bindings using it.

Rob

