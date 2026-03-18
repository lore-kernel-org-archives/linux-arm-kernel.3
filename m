Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89371FCD0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJEMSWj7THc1i6OeftyniTQHEicRtowRE6jVrmessVI=; b=w48dF8fE1UhFdvhrk6jBciihJL
	jLbv8NWH6Aq8opL2ey6m1h6BLOOUme3NXad08Mz6Txywn8m1MMzq/qWC73U8h7fqJCkQzeiYPqHiG
	QQArmIH/3UHO18eprlzGrLYgpmDGAzjvRQNn0ZZI4scd9sGR8YbxUQwuc68kNe9LPGVcmMEwJZGLa
	lG3QxaEqHKvC8V2pw2CUlGVBvTLm47Osl/3hfyQvgfb2rm1z9LcOJEoCin6xEVM0GCemqsKnqQmDX
	yvBbWzRYjW3IJPoTqmGtcwV3hTPV7Rbd/HDJyVK47aIgbrXR104iuaQsTd4LE2bPoiQiEzZnUUcnG
	efCEFcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ltc-00000007z9e-44UB;
	Wed, 18 Mar 2026 08:04:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lta-00000007z8u-3xt9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB90D43612;
	Wed, 18 Mar 2026 08:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D28C19421;
	Wed, 18 Mar 2026 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821089;
	bh=BNZJqxIClI2fBSgwO/46dhcMM92h1ibxW4eJAJnSv/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCeIFrcIMvvnfLj/xzXoG6ODnyEEEx7oJAGP5mPwBs/f4rQ1qJyDkUi9u4A4htdgn
	 I68ejqvMuYjKtH+UfY2/LOJx1D3Ik9GvSjoYY2pOzJFEcZhFGqR+NdczRbMIez12bc
	 /kskYnARtN0AiwtWP4hRaB0lEA0FARdMo88ouEKdtgBccapPyPvZfcFztCe4PFdZ9f
	 yBrvNDh3ikBIuWPf6gHbFYbgXaLe9zeWrGaUmTwlss4U6TXEkjPzL6YWclNkVwV6Md
	 yil6ZCmTkPp2cG3Ru6YTn14W0obcU320pxBkUHPV9nsC0Fchuc0HxfBn/mymuoqeBX
	 6Z/WcIxA2ZmDg==
Date: Wed, 18 Mar 2026 09:04:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm: Add Live Firmware Activation
 binding
Message-ID: <20260318-inventive-tortoise-of-romance-c7ceba@quoll>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_010451_028227_B10D1FF7 
X-CRM114-Status: GOOD (  21.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, vwadekar@nvidia.com, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 11:33:27AM +0100, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> This binding describes an interrupt that could be triggered by the

Describe hardware/firmware, not the binding.

> platform, to notify about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> new file mode 100644
> index 000000000000..92f0564fd672
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Live Firmware Activation (LFA)
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +  - Sudeep Holla <sudeep.holla@arm.com>
> +
> +description:
> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
> +  firmware interface to activate an updated firmware at runtime, without
> +  requiring a reboot. Updates might be supplied out-of-band, for instance
> +  via a BMC, in which case the platform needs to notify an OS about pending
> +  image updates.
> +  [1] https://developer.arm.com/documentation/den0147/latest/
> +
> +properties:
> +  compatible:
> +    const: arm,lfa

Does specification has a version? Does it support version discovery?

> +
> +  interrupts:
> +    maxItems: 1
> +    description: notification interrupt for changed firmware image status
> +
> +required:
> +  - compatible
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    firmware {
> +        arm-lfa {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

arm-lfa is specific, so this could be as "fota" or "firmware-update"

Best regards,
Krzysztof


