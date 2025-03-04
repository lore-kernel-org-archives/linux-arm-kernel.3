Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2ACC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UppPJbgBQG3tMWymmjiZvKZRJ2z0w+E752FJLqR3jWg=; b=UCwMdbZzVnSZn967pAwodvYCWD
	TJ3GLmU4RHNHZdC1FQ9aOz57cd3az5dXs69DyMGa6GzFeEPjfw2e09Ary8vx0OLCR9krx/Fq97XtL
	+3JPpkAJR1PVYBGtwyE6RiUSO6W0VML0Zpxt7F8+suSCxYeiUf0zujB7tl3HO1jcAxYwdHfi1KS17
	9Wr6QFw6CR2evH2plz9xNehgg1FSsbiu5Kv3+BrbbBm+Iu/ocYcsDNvmn1NlLAy9fcRZ+bsumeh9/
	yLxkxUMUcoL8sMhKgrWguWFsyeIqeQCJF983/Qm1JTCiT4EcDH+Ziy3dV1GOg0OTB278ekaWSXbLj
	PwMJzFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOMM-00000003pKL-402h;
	Tue, 04 Mar 2025 09:14:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNHE-00000003Z6Y-1iVo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 08:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UppPJbgBQG3tMWymmjiZvKZRJ2z0w+E752FJLqR3jWg=; b=PKvadSOznf7G+BM0Mzva0wpuvF
	ODNfEcZ9Xq+bbNYEmYrwRlNZ4MeLAlw4nBQy4qvmVfQMQq2zunTFU4+S3OaROSMWW1HVPOLHGhYsA
	ci4jHglYuXTzWudsiWHO71sLsWoLy2cy/xz3h7Cqp5XWaTCYqHr9hoea/3ZH3USyywpKU3Hx5L9X8
	ldesYOn1X1khrxplwOD2p4AGRQbuuTNuYnF9xKLGXtN3R4/D4qNRG8MnWAAoZFUFoazzlhjXUwT/p
	J/KTX8RPCMXvcoZHLabfiBkVUsgWxsyXAYKG6Ui9tC8EBNZlxgGTuimI2Ms/L2YD/bkJOFU1dLjxE
	NGfL70Ow==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNHB-00000000PID-0DV0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E77615C53FF;
	Tue,  4 Mar 2025 08:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E5C4CEE5;
	Tue,  4 Mar 2025 08:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075507;
	bh=/S/hdDRbQrJo2up60ogcSpBJLmTR8FQezMvSl2ll4/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJFy/antoVkyiFQMJKZ/5j5aeF/sT4nJRyzTOcz+G02QivQvaFciX+FxRIgHQ5KYl
	 GaxUt/4HStgZL9OEoJFr//CkyWGSzJu4jvM0A+YagjkrWayNZZlpz6z6cRlY3yQWkz
	 0Xh2nHqNWCamu9ZspFDyBmAlTWLi/lzAdqbTymoMeljyH6E7a6NYk6eQduqbS/Dpz9
	 27ja2gJ7zqRSB3TchxY1r8Dn8f7idlbUuNzsSnjFIz2HDAAxYimdVnsWekJHIAg3Zh
	 EI+DZXnv1TaWhClR/83hwG9iaVdqSRib79ScOaKt9QExqSFwWWUjhlOI3czDVo2dfX
	 irFogFnd9kHSQ==
Date: Tue, 4 Mar 2025 09:05:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-2-quic_songchai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227092640.2666894-2-quic_songchai@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_080517_340117_43A45F42 
X-CRM114-Status: GOOD (  28.36  )
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

On Thu, Feb 27, 2025 at 05:26:34PM +0800, songchai wrote:
> From: Songwei Chai <quic_songchai@quicinc.com>
> 
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>    TGU configuration space
>         offset table
>  x-------------------------x
>  |                         |
>  |                         |
>  |                         |                           Step configuration
>  |                         |                             space layout
>  |   coresight management  |                           x-------------x
>  |        registers        |                     |---> |             |
>  |                         |                     |     |  reserve    |
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | priority[3] |
>  |         step[7]         |<--                  |     |-------------|
>  |-------------------------|   |                 |     | priority[2] |
>  |                         |   |                 |     |-------------|
>  |           ...           |   |Steps region     |     | priority[1] |
>  |                         |   |                 |     |-------------|
>  |-------------------------|   |                 |     | priority[0] |
>  |                         |<--                  |     |-------------|
>  |         step[0]         |-------------------->      |             |
>  |-------------------------|                           |  condition  |
>  |                         |                           |             |
>  |     control and status  |                           x-------------x
>  |           space         |                           |             |
>  x-------------------------x                           |Timer/Counter|
>                                                        |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new coresight-tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> Signed-off-by: songchai <quic_songchai@quicinc.com>

Don't duplicate yourself.

Anyway, this is marked as v3, I cannot find previous versions, no
changelog, no references.

What happened here in this binding?

> ---
>  .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> new file mode 100644
> index 000000000000..a41ac68a4fe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.

2023 and 2024? Where was it published in these years?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trigger Generation Unit - TGU
> +
> +description: |
> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> +  to sense a plurality of signals and create a trigger into the CTI or
> +  generate interrupts to processors. The TGU is like the trigger circuit
> +  of a Logic Analyzer. The corresponding trigger logic can be realized by
> +  configuring the conditions for each step after sensing the signal.
> +  Once setup and enabled, it will observe sense inputs and based upon
> +  the activity of those inputs, even over clock cycles, may detect a
> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> +
> +  The primary use case of the TGU is to detect patterns or sequences on a
> +  given set of signals within some region of the SoC.
> +
> +maintainers:
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Sam Chai <quic_songchai@quicinc.com>
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-tgu
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,coresight-tgu
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  qcom,tgu-steps:
> +    description:
> +      The trigger logic is realized by configuring each step after sensing
> +      the signal. The parameter here is used to describe the maximum of steps
> +      that could be configured in the current TGU.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +
> +  qcom,tgu-regs:
> +    description:
> +      There are some "groups" register clusters in each step, which are used to
> +      configure the signal that we want to detect. Meanwhile, each group has its
> +      own priority, and the priority increases with number of groups. For example,
> +      group3 has a higher priority than group2, the signal configured in group3
> +      will be sensed more preferentially than the signal which is configured in group2.
> +      The parameter here is used to describe the signal number that each group
> +      could be configured.

And all groups are indexed by number? Or do they have names?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 18
> +
> +  qcom,tgu-conditions:
> +    description:
> +      A condition sets a specific requirement for a step and defines the subsequent
> +      action once the requirement is met. For example, in step two, if signal A is
> +      detected three times, the process jumps back to step one. The parameter describes
> +      the register number for each functionality, whether it is setting a specific
> +      requirement or defining a subsequent action.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 4
> +
> +  qcom,tgu-timer-counters:
> +    description:
> +      TGU has timer and counter which are used to set some requirement on each step.

Wrap according to Linux coding style, so at 80.

> +      For example, we could use counter to create a trigger into CTI once TGU senses
> +      the target signal three times.This parameter is used to describe the number of
> +      Timers/Counters in TGU.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0

Drop

> +    maximum: 2
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description: AXI Slave connected to another Coresight component

So this TGU can be connected to anything in coresight graph, no
restrictions?

> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Most likely you miss also: in-ports


Best regards,
Krzysztof


