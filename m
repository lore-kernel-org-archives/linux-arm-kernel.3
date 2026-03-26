Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4D810A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml56bmMQs+EdQaWlI5ji6anspM9XUiYKvzv1220W3jc=; b=IDuvXWEYNEPvfbgc7MrxSlHLDS
	zZMugyg6nodRKbHQA4geeQiWJTdC0epnQqDCu3Q9fvn2bwKx4aDKHbpXVKBaJ1I+Exkw+RWi4/zPk
	AYTcMacQYjjxA1WwE3ecChxjErry2kYRPPErPhvJjcJRGaQ/jBM2tsqjVlbC6gcxqFJwJmsyYcSsa
	wo5ZKkXmF6FIbn/u9iX7MzEtwdrIM2m+NSQM8c+8ztmI1H4xUub41/3p2hBvJWZeOVtb8VxDb7Goj
	5wvascCyCAaXPA9AsEyGV+dCWaef8K8/pM5VF5xsRLrF9HZ5CIluiEPVM7qDR45lIC4+Eq9ZG7r6P
	ya2qm0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mZn-00000005kGo-06FK;
	Thu, 26 Mar 2026 15:24:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mZc-00000005kEL-42h7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3865443830;
	Thu, 26 Mar 2026 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8768C19423;
	Thu, 26 Mar 2026 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774538680;
	bh=VC8lDUeLQaF89olSSrKq5JgPweNUCYlwAaUQYICMSVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaAEnN52eATLIBzXKxWYkAjEQF54lvKDkYc4MOirqFrd5bD5DAIMQRi7Z6XFDonBb
	 WKa61FlMkBcd/iXQJ6NVvj56BLrUfSeujVI4srqkrjEo0YNkS+P6/Xr/rSzIa4TTE8
	 2nnxiSlLoWZ9fwxqX9ylNk7h2LFe47bb/mfRrR6P0j9DmK3EzFipJ7bxp5c8xm2TuS
	 NiMdnWVRBzuXH1POPXiMkAnG50ifQBOXsOongqLa/bTPgKB4QNBbt70yCIYs0d7SRq
	 J1Ih9mzFlDLWUDBMRSL14ekNbotN/3lElMlAvI5lwEmHOwIOUc4QCgy+qNYqG3bT9G
	 pKTZSBiYPPjOg==
Date: Thu, 26 Mar 2026 10:24:36 -0500
From: Rob Herring <robh@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-cxl@vger.kernel.org, Michael.Zhao2@arm.com,
	linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com,
	rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de,
	catalin.marinas@arm.com, krzk+dt@kernel.org,
	linux-doc@vger.kernel.org, mchehab+huawei@kernel.org,
	tony.luck@intel.com
Subject: Re: [PATCH v3 09/10] dt-bindings: firmware: add arm,ras-cper
Message-ID: <20260326152436.GA2484010-robh@kernel.org>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
 <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-9-48e6a1c249ef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-9-48e6a1c249ef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_082441_056350_895070B3 
X-CRM114-Status: GOOD (  21.03  )
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

On Wed, Mar 18, 2026 at 08:48:06PM +0000, Ahmed Tiba wrote:
> Describe the DeviceTree node that exposes the Arm firmware-first
> CPER provider and hook the file into MAINTAINERS so the
> binding has an owner.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  .../devicetree/bindings/firmware/arm,ras-cper.yaml | 71 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> new file mode 100644
> index 000000000000..bd93cfb8d222
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm RAS CPER provider
> +
> +maintainers:
> +  - Ahmed Tiba <ahmed.tiba@arm.com>
> +
> +description: |
> +  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
> +  a firmware-first CPER error source directly via DeviceTree. Firmware
> +  provides the CPER Generic Error Status block and notifies the OS through
> +  an interrupt.
> +
> +properties:
> +  compatible:
> +    const: arm,ras-cper
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description:
> +          CPER Generic Error Status block exposed by firmware
> +      - description:
> +          Optional 32- or 64-bit doorbell register used on platforms
> +          where firmware needs an explicit "ack" handshake before overwriting
> +          the CPER buffer. Firmware watches bit 0 and expects the OS to set it
> +          once the current status block has been consumed.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt used to signal that a new status record is ready.
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle

memory-region already has a defined type. You just need to define how 
many entries (maxItems: 1).

> +    description:
> +      Optional phandle to the reserved-memory entry that backs the status
> +      buffer so firmware and the OS use the same carved-out region.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    reserved-memory {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      ras_cper_buffer: cper@fe800000 {
> +        reg = <0x0 0xfe800000 0x0 0x1000>;
> +        no-map;
> +      };
> +    };
> +
> +    error-handler@fe800000 {
> +      compatible = "arm,ras-cper";
> +      reg = <0xfe800000 0x1000>,

Wait! Why is the reserved address here? There's 2 problems with that. 
There shouldn't be same address in 2 places in the DT. The 2nd is 
reserved memory should only be regions within DRAM (or whatever is 
system memory).

Rob

