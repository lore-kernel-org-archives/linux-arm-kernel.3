Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE81E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpQTZv/tOeEkOWuEq6JLmHmoNBmXuxp6EJNP5sdzSMQ=; b=1I0/tLv4ylrzgl4+dstPu5WVBN
	deLG+ASWYrgIos697H6WhBuPQw6aZBlWToq3zbF58vZTCvWMKd+cuy2aZTRGBTizLIxAXwsL2yZvs
	VS5f/VcDb++8cSOX5wFP+CAqaImmJZ2SWTEFLQVrM1hPkA5TTMFK6AwBysyTJMQNITEYkP35yF2bJ
	lYfjn/AGf/pCWiSYvj4TY1vu7bf7PBliSIip19bhZd8Fjc8Iuv36IW1HW4ucmI6mQuLxg6mkmIjCH
	v97ITjdlV0/BsehxNPR3eOkWqZ0CSQSGGb/7i5agDDVNCywLxDkayqwBiUvqlb5+N0+APNIqxVc7I
	MmjrBmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDmH-0000000GXOl-3mBF;
	Thu, 05 Dec 2024 15:28:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDlF-0000000GX8g-1Q7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:27:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 635C31063;
	Thu,  5 Dec 2024 07:27:50 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 958453F71E;
	Thu,  5 Dec 2024 07:27:20 -0800 (PST)
Date: Thu, 5 Dec 2024 15:27:18 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <konrad.dybcio@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
	<arm-scmi@vger.kernel.org>
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <Z1HGVhi5xebqc4d4@bogus>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_072725_488944_2A54D5F2 
X-CRM114-Status: GOOD (  28.73  )
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

On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> Document the various memory buses that can be monitored and scaled by
> the memory latency governor hosted by the QCOM SCMI Generic Extension
> Protocol v1.0.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v3:
> * Restructure the bindings to mimic IMX [Christian]
> 
>  .../bindings/firmware/arm,scmi.yaml           |   1 +
>  .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++++++++++++
>  .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 ++
>  3 files changed, 269 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
>  create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 54d7d11bfed4..1d405f429168 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -24,6 +24,7 @@ description: |
>  
>  anyOf:
>    - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> +  - $ref: /schemas/firmware/qcom,scmi-memlat.yaml
>  
>  properties:
>    $nodename:
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> new file mode 100644
> index 000000000000..0e8ea6dacd6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> @@ -0,0 +1,246 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/qcom,scmi-memlat.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SCMI Memory Bus nodes
> +
> +maintainers:
> +  - Sibi Sankar <quic_sibis@quicinc.com>
> +
> +description:
> +  This binding describes the various memory buses that can be monitored and scaled
> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
> +
> +properties:
> +  protocol@80:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +    patternProperties:
> +      '^memory-[0-9]$':
> +        type: object
> +        unevaluatedProperties: false
> +        description:
> +          The list of all memory buses that can be monitored and scaled by the
> +          memory latency governor running on the SCMI controller.
> +
> +        properties:
> +          qcom,memory-type:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2]
> +            description: |
> +              Memory Bus Identifier
> +              0 = QCOM_MEM_TYPE_DDR
> +              1 = QCOM_MEM_TYPE_LLCC
> +              2 = QCOM_MEM_TYPE_DDR_QOS
> +
> +          freq-table-hz:
> +            items:
> +              items:
> +                - description: Minimum frequency of the memory bus in Hz
> +                - description: Maximum frequency of the memory bus in Hz
> +
> +        patternProperties:
> +          '^monitor-[0-9]$':
> +            type: object
> +            unevaluatedProperties: false
> +            description:
> +              The list of all monitors detecting the memory latency bound workloads using
> +              various counters.
> +
> +            properties:
> +              qcom,compute-type:
> +                description:
> +                  Monitors of type compute perform bus dvfs based on a rudimentary CPU
> +                  frequency to memory frequency map.
> +                type: boolean
> +
> +              qcom,ipm-ceil:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description:
> +                  Monitors having this property perform bus dvfs based on the same
> +                  rudimentary table but the scaling is performed only if the calculated
> +                  IPM (Instruction Per Misses) exceeds the given ceiling.
> +
> +              cpus:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array
> +                description:
> +                  Should be a list of phandles to CPU nodes (as described in
> +                  Documentation/devicetree/bindings/arm/cpus.yaml).

And what exactly this list of cpu phandles represent here ?

> +
> +              operating-points-v2: true

Can you elaborate why the protocol can't add a command to fetch this from
the firmware to avoid any possible mismatch between the DT and firmware.

> +              opp-table:
> +                type: object
> +
> +            required:
> +              - cpus
> +              - operating-points-v2
> +
> +            oneOf:
> +              - required: [ 'qcom,compute-type' ]
> +              - required: [ 'qcom,ipm-ceil' ]
> +
> +        required:
> +          - qcom,memory-type
> +          - freq-table-hz
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/qcom,scmi-memlat.h>
> +
> +    firmware {
> +        scmi {
> +            compatible = "arm,scmi";
> +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
> +            mbox-names = "tx", "rx";
> +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            protocol@80 {
> +                reg = <0x80>;
> +
> +                memory-0 {

I am not sure if it is just me, but I find this binding hard to understand.
Hence I thought I will look and the example and get better understanding
instead.

So these monitors are numbered ? If there were any meaningful name it would
have been slightly better but irrespective of that I find it hard as why
the communication with firmware is not based on index and why they are not
part of the bindings though I see indices used in the driver.

> +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;

Also I see that the type can be easily derived from the index, care to
elaborate why the firmware expects it to be sent, if not why is that
information needed here in the DT ?

-- 
Regards,
Sudeep

