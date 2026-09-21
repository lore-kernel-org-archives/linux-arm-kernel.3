Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77EDC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo1mttMAeBwlE9oZ0kKMfIeVFqGCkPvCpNBkLCVIhak=; b=Wyb86c3MvzS/8Q/cMbDqq5j0ea
	okSqBqC0tjFCKxLDc3bV9p4JvYah749YXFO13E0/zaujsgg8Y5PHwiktY2HmUbE7VnjJyr/Q/G2LP
	4SktLH10cIrMQePJMWKJUlWXZclX6WY17Cv+qzIpk8murfPpscfA1YIw5zu8clYxAF8Ns7/zX7a1o
	Z4hFDCY8HKVzRLG8GV8mAhvEN+N1a8lPiGZxG+XR+vao0GyYRV8DFG1oRLVp01wBGaDz28daoiY7x
	f8YUhaI/DUOw7Z+AA/y6kbxhxhVopuaPpqpSXz3LHwzPEtXe5qBIHXN0x8AekrcqlN1C80VrWf07D
	1BP9Z04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ffC-00000002YwZ-1FUB;
	Mon, 21 Sep 2026 15:10:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ffB-00000002Yw2-1Abg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5DCC40244;
	Mon, 21 Sep 2026 15:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037E11F000FF;
	Mon, 21 Sep 2026 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003436;
	bh=jo1mttMAeBwlE9oZ0kKMfIeVFqGCkPvCpNBkLCVIhak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OY1Y8tnRgZFAQsFAY86sn33inDXJ7p5NzoDpdtD2NzRETWTeVIDkfBva8QwenUumC
	 WGc/A1EsUoeVvhosvijBx3soZOWwMOChxaHMOKqcca8+nVcrCHcDyVakaVfMoiBf0h
	 BWCc+QIhhZRbNJ7Kko2JsfXycOT7f4RlBB97v70j8hiiLkOrgb7j/REzp2HPdQxSRU
	 brxSVbPFDYPnGtz46at+/bQAMPlTWQNzOltBi/PyRcBnKgh9oQ8/DNmyzFpDme3p6Y
	 0y02R2DQBAAPwHnM1o5LhJ6jt2s3IiojEa4uPkUREJMbcivC99fh/CU+e303YtQA4T
	 7jtb6SrbmC0cQ==
Date: Mon, 21 Sep 2026 16:10:31 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: Add Live Firmware Activation
Message-ID: <20260921-nice-russet-caracal-6db6d3@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-2-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 04:11:04PM +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware
> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> Describe an interrupt that could be triggered by the platform, to notify
> about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> new file mode 100644
> index 0000000000000..179c542f383d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> @@ -0,0 +1,50 @@
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
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The notification interrupt for changed firmware image status. For
> +      an out-of-band firmware update, some system entity would signal
> +      the availability of a firmware update to the host OS via this interrupt.
> +
> +      This must be an edge-triggered IRQ.
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
> +        firmware-update {
> +            compatible = "arm,lfa";
> +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;

Could the example use an edge-triggered interrupt type as it must be
edge-triggered IRQ as per the above scheme ? As written, a device tree
copied from the example violates the binding's requirement.

Alternatively, is the binding incorrect and needs fixing ? I am not sure
if there is any requirement on it from the specification. Where did you
derive it from ?

-- 
Regards,
Sudeep

