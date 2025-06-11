Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC6C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOwMrjYM62F/I0XP5hjVliSSbdgmZ1PmpBHgdA2PeC8=; b=2KdI65MhoVIA0xDJtc7WFTxhhU
	xwHie2nh0m/C1mMBq9pQxT/7+yKEYzYwjejtl3v4i46+irig+YzgLd/fq9mNQaDFS/IosppT5LBYg
	OoXmWnR0oLRb2SQ4d67M6P7+pkZGOeH2ENRDXERP/5vqUgCSlGvb6fvwLOjL9rdieIW7471JWcRA8
	6TcTzObtiJZOZMaywmf+zA2nAKiFVSADJw1tyVc0uEp1uY0/2hJCzs5j3QJ2Vsv34N0b/YyktHAdC
	cNsqtbXLEDDkJBf6rSTBPfXxvktvUf5bvjtrdqftRsq2OcqeQpt83fof6P5XyVPGUbqm3HvdaGTwA
	X3hjkCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSuX-0000000BJeV-213k;
	Wed, 11 Jun 2025 21:23:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQQp-0000000AtZA-1ZzP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 18:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C037561135;
	Wed, 11 Jun 2025 18:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD052C4CEE3;
	Wed, 11 Jun 2025 18:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667454;
	bh=0Y19FOGk8myMlwMfTdM5H4mSwwbBsWo93rX/f568q98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iGFCpCTZrsKYC0IDwdrcQGmr2hkdhm76Z12iG/RVLXRUwzJLlv5whVhXsO9glSuj9
	 o2BjpFodlGHdnApf3jNLl6wITOX+8yzJJWx1/rLf0/jC7z0O0y3VqTjBVEHSzYJjzv
	 DfwuPsSX8WZZ8o0J/fp29CrVhpgevZ+9CmjW1oCPPMxBGhEB1+InoTaPIXO2uGug6d
	 itwWjXBk0rFPZdN+dfjxs1W81OE3cuS0stSFH8vA4lCcojy5uSIkc9EqSa+Qon1Lct
	 E78HEYcj6+2h7hqrZgs7+TpheNARFAzG66QFu6kkUS388sWteGaBMH+NyjQ2jCV+b3
	 dWqZNCzmsHmaw==
Message-ID: <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
Date: Wed, 11 Jun 2025 20:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,


I think there's a "gpu: " missing in the subject.

On 11.06.25 19:32, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS                                          |  1 +
>   2 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..23df3ebd689b1e885eb99ca573343fe7f2d09dc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC GPU
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: apple,agx-g13g
> +      - items:
> +          - enum:
> +              - apple,agx-g13s
> +              - apple,agx-g13c
> +              - apple,agx-g13d
> +          - const: apple,agx-g13x
> +      - items:
> +          - const: apple,agx-g14g
> +  reg:
> +    items:
> +      - description: ASC coprocessor control

Apple calls these co-processors ASC but I'm not sure that's really 
helpful to describe them. Maybe just "GPU coprocessor control registers"?


> +      - description: GPU block MMIO registers
> +
> +  reg-names:
> +    items:
> +      - const: asc
> +      - const: sgx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  memory-region:
> +    items:
> +      - description: Region containing GPU MMU TTBs
> +      - description: Region containing GPU MMU page tables
> +      - description:
> +          Region containing a shared handoff structure for VM
> +          management coordination
> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob

Like Alyssa mentioned, this description also raises more questions than 
it answers for me. Do we know what these two blobs contain or why they 
are two separate blobs?

> +      - description: Shared global variables with GPU firmware
> +
> +  memory-region-names:
> +    items:
> +      - const: ttbs
> +      - const: pagetables
> +      - const: handoff
> +      - const: hw-cal-a
> +      - const: hw-cal-b
> +      - const: globals
> +
> +  apple,firmware-compat:
Nit: I'd prefer something like apple,firmware-abi here.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    description:
> +      MacOS version the current firmware is paired with, used to pick
> +      the version of firmware ABI to be used.
> +      Bootloader will overwrite this
> +
> +required:
> +  - compatible
> +  - reg
> +  - mboxes
> +  - memory-region
> +  - apple,firmware-compat
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>

No need for the include for this example.

> +    gpu@6400000 {
> +        compatible = "apple,agx-g13g";
> +        reg = <0x6400000 0x40000>,
> +              <0x4000000 0x1000000>;
> +        reg-names = "asc", "sgx";
> +        mboxes = <&agx_mbox>;
> +        power-domains = <&ps_gfx>;
> +        memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
> +                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
> +        memory-region-names = "ttbs", "pagetables", "handoff",
> +                              "hw-cal-a", "hw-cal-b", "globals";
> +
> +        apple,firmware-compat = <0 0 0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031ea3663c39cc8c68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2331,6 +2331,7 @@ F:	Documentation/devicetree/bindings/arm/apple/*
>   F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>   F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>   F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
> +F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
>   F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>   F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>   F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> 


Best,


Sven



