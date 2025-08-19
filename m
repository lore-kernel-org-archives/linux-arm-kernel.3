Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45E9CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmK+qgOqDb3hVkpsJu3bTuDCz/PmofVJHeeBCq0iCFE=; b=f/QKeRMCPwIBEzcUDr+YNwpimo
	J1DXnC52wWub0k0DrWOdMfVns9U8AjdaRzi4o+4QP3+8De5rWZnc2eVLo9kVw5Yuy51VgDspSmm+u
	RMyvFLXnd+61v5AJCdhpkIkB3GtmXMsoq+UcmOgMoJqqXXmG4ftGu0G4/RjCO10TPQzdJjqFJ0BvX
	5vyZiImRnqfOLIjH4MjpTjdcgKZOzggD0ePMD45EBt47uxTPipHKNS2SJ96oOE3vDytH+1EZVejmH
	+QRi2DOI4blE5+braW8DBo1FrtAfA+cObNRAEAbVFT4LT0q9ROu5u3Dpssyv2lICehThamxhqZwdw
	X3LoRslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1q-0000000BkeD-2IkJ;
	Tue, 19 Aug 2025 22:42:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSH6-0000000BSTp-1vTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1DE3613EF;
	Tue, 19 Aug 2025 19:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDACC4CEF1;
	Tue, 19 Aug 2025 19:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632739;
	bh=5+kZM9FbVDV+s3RqTCNRp+ZjDOmphXSaFf1t6iPNim0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7P4H0LAB1KdNUDFG3dgnmKr7y1WRKpgp16Pm9IkMckikQ66uTBEQNghp7y7vEh8o
	 NvwQOmsVwM4Vm4O4ctHiKx6iYcApEG50DCeGLI87TiAjwYrbk1k+4m3n90y+y9jmh1
	 EDnAJNdGbpt44euYOB3gQ47ATic1Iiz5CiWSdSKVlyKbVAUXiHV8MxE4fih5bkylgu
	 aEa9a2nNXGL5Hy2q416+gBF4TmUGuMMEV+C8VajvzzQD9nhX2FzeQCAN/7EQfvVpGW
	 J8vd1NnE4XMLCkICEzV9eMq+mzDTiPJnHRQqMwqGTb2ltDOpIGosEzAx9hAfnLB6vU
	 pI4oN0GM/gkSA==
Date: Tue, 19 Aug 2025 14:45:38 -0500
From: Rob Herring <robh@kernel.org>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
Message-ID: <20250819194538.GA1214644-robh@kernel.org>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
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

On Tue, Aug 19, 2025 at 03:27:43AM -0700, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Network On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3b5f2b949f69617a014d0ae2831c9c767178f8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Interconnect Trace Network On Chip - ITNOC
> +
> +maintainers:
> +  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> +
> +description:
> +  The Interconnect TNOC is a CoreSight graph link that forwards trace data
> +  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
> +  does not have aggregation and ATID functionality.
> +
> +properties:
> +  $nodename:
> +    pattern: "^itnoc(@[0-9a-f]+)?$"
> +
> +  compatible:
> +    const: qcom,coresight-itnoc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0

Drop these. Already defined by the above ref.

> +
> +    patternProperties:
> +      '^port(@[0-9a-f]{1,2})?$':
> +        description: Input connections from CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description: out connections to aggregator TNOC
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - in-ports
> +  - out-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    itnoc@109ac000 {
> +        compatible = "qcom,coresight-itnoc";
> +        reg = <0x109ac000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb";
> +
> +        in-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                tn_ic_in_tpdm_dcc: endpoint {
> +                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
> +                };
> +            };
> +        };
> +
> +        out-ports {
> +            port {
> +                tn_ic_out_tnoc_aggr: endpoint {
> +                    /* to Aggregator TNOC input */
> +                    remote-endpoint = <&tn_ag_in_tn_ic>;
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

