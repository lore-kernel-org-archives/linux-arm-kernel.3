Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 23:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8GMZUQ4kctjd5ob2vHzMcXsKzhPQ9HspBdqMS8v5z8=; b=tQkUvxvCTxLI3XANovPjMuJ9KB
	3MmquFQCy0+MbSIUjzXPw4fl+Ie4a3ZK20fvAVNjpZQ/ShGIm4wk/nVAc3Jg1o+dg/Ank9NdMlCW8
	eNvMdfAMKWhZHz5n5qg2ZidgQlK9qaCbNSvx6WiRA96luqYHcxmhxib32pXbkqbHImQbYD0b/DRxW
	ArPO22P8rvrnqELL+cp+cHdKFezame7+JX+AmWAI1FB6NAYhjUhwIltAnzoe047htgh6GYkY5jXTH
	qQ7Zvy6DI3TwI+Xiohf3CiZrjNUEn/8mnuHDHK5J8qf9Xqr1tDyEn5DTK57uZL99KhNy68Ne9ZrFK
	cKDjYH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcqt-00000007Avd-46dU;
	Fri, 21 Feb 2025 23:54:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcpS-00000007AqX-3X8p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 23:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 726E668316;
	Fri, 21 Feb 2025 23:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F5EC4CED6;
	Fri, 21 Feb 2025 23:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181989;
	bh=/YFrwlZgyvLoJMUeq+tvf10yh7R4xJNFEg5KwtEoi2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGB2ubSjMbE6ueP9Gqq/84p4aoMNKf5redslySU1HfRmrAGAB+WTs0uN0rlcHj2/S
	 /C33QhzEcp347yjR7IjJfmzQAZaMwDFv97KvhwwXzN01mYS1puRP4RAkqhJZTRy516
	 t8BxpUPsAU+QgITpLUJxHCTWHRphP4ebBQFsZGs1KF+YJi0OW56vzjt8XTXijJFVPJ
	 CHDLgVM/4xGktwYIkgHFEvlkqtLJ4JeH+gZR/UY+q4I6zYEEPEmMbI0Yf/bCogRcOl
	 6xTfn4UyKw/F3TtA32gdHnr3JAmIcz8q7+Qwjcd7ZX5bLRYKUxJ9vjnJ078aFlOMvm
	 bmlu6PSROh/rQ==
Date: Fri, 21 Feb 2025 17:53:07 -0600
From: Rob Herring <robh@kernel.org>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
Message-ID: <20250221235307.GA401276-robh@kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
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

On Fri, Feb 21, 2025 at 03:40:28PM +0800, Yuanfang Zhang wrote:
> Adds new coresight-tnoc.yaml file describing the bindings required
> to define Trace NOC in the device trees.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b8c1aaf014fb483fd960ec55d1193fb3f66136d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ttrace NOC(Network On Chip)
> +
> +maintainers:
> +  - yuanfang Zhang <quic_yuanfang@quicinc.com>
> +
> +description:
> +  The Trace NoC is an integration hierarchy which is a replacement of Dragonlink tile configuration.
> +  It brings together debug component like TPDA, funnel and interconnect Trace Noc which collects trace
> +  from subsystems and transfers to QDSS sink.
> +
> +  It sits in the different subsystem of SOC and aggregates the trace and transports it to Aggregation TNoC
> +  or to QDSS trace sink eventually. Trace NoC embeds bridges for all the interfaces(APB, ATB, QPMDA & NTS).
> +
> +  Trace NoC can take inputs from different trace sources i.e. ATB, QPMDA.

Wrap lines at 80 char. And you need '>' to preserve paragraphs.

> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-tnoc
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^tn(@[0-9a-f]+)$"

blank line

> +  compatible:
> +    items:
> +      - const: qcom,coresight-tnoc
> +      - const: arm,primecell
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

Need to describe what each entry is.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  in-ports:
> +    description: |

Don't need '|'

> +      Input connections from subsystem to TNoC
> +    $ref: /schemas/graph.yaml#/properties/ports

You have to define the 'port' nodes.

> +
> +  out-ports:
> +    description: |
> +      Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port:
> +        description: |
> +          Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.

'connections' sounds like more than 1, but you only have 1 port. 

Wrap at 80 char.

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
> +    tn@109ab000  {
> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
> +      reg = <0x0 0x109ab000  0x0 0x4200>;
> +
> +      clocks = <&aoss_qmp>;
> +      clock-names = "apb_pclk";
> +
> +      in-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          tn_ag_in_tpdm_gcc: endpoint {
> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
> +          };
> +        };
> +      };
> +
> +      out-ports {
> +        port {
> +          tn_ag_out_funnel_in1: endpoint {
> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
> +          };
> +        };
> +      };
> +    };
> +...
> 
> -- 
> 2.34.1
> 

