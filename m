Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69629D0BB7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TW7/xpfn9XaDB8fHsD00f9etqua2J2r0pJXwWEIEOHM=; b=l6nbg1WwIZqM5SLm16OGnzg05p
	nHM7a4JPweV/b962AsxoFoGnPE8IRA8Wt4Togg8w2UMFdETfuFrGqssmciyhFR4t0hj9ZY2zdWDRh
	40St4bE8uoUZ9OpSW1mKbFOHsC64nwz4v6P5nB+hgCsAOmX9XuG+b/BH4skCsS57mK7phUyYIBwi8
	Ml9jwm6F2OLmm0mtG/I0xStSTQskfxo7v1d0tYNbYh6LPOlsyiWDgNO+cfJT5VaUROLUbnShG6sW3
	+/CyqWPVEQH0Oux4VspF8erOujgvEMZmIzAe0pcDLeBrvl5N4Jb03CXWu0Ik1Ay9PCK5oyf4pL757
	kzE1599w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u7a-0000000HSER-0ISe;
	Thu, 24 Oct 2024 09:27:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tvd-0000000HPrO-3t5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:14:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22095339;
	Thu, 24 Oct 2024 02:15:19 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78FA3F73B;
	Thu, 24 Oct 2024 02:14:47 -0700 (PDT)
Message-ID: <b848ae69-aca4-43d1-aa38-2f424045ee6f@arm.com>
Date: Thu, 24 Oct 2024 10:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: Tao Zhang <quic_taozha@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
 <20241024065306.14647-2-quic_taozha@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241024065306.14647-2-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_021450_051084_387AB02D 
X-CRM114-Status: GOOD (  16.75  )
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

On 24/10/2024 07:53, Tao Zhang wrote:
> The is some "magic" hard coded filtering in the replicators,
> which only passes through trace from a particular "source". Add
> a new property "filter-src" to label a phandle to the coresight
> trace source device matching the hard coded filtering for the port.

As mentioned in here in v3 review :

https://lkml.org/lkml/2024/8/21/597

Please do not use "src", expand it to "source"

Rest looks fine.

Suzuki

> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index 1892a091ac35..0d258c79eb94 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -45,7 +45,22 @@ properties:
>       patternProperties:
>         '^port@[01]$':
>           description: Output connections to CoreSight Trace bus
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              filter-src:
> +                $ref: /schemas/types.yaml#/definitions/phandle
> +                description:
> +                  phandle to the coresight trace source device matching the
> +                  hard coded filtering for this port
> +
> +              remote-endpoint: true
>   
>   required:
>     - compatible
> @@ -72,6 +87,7 @@ examples:
>                   reg = <0>;
>                   replicator_out_port0: endpoint {
>                       remote-endpoint = <&etb_in_port>;
> +                    filter-src = <&tpdm_video>;
>                   };
>               };
>   
> @@ -79,6 +95,7 @@ examples:
>                   reg = <1>;
>                   replicator_out_port1: endpoint {
>                       remote-endpoint = <&tpiu_in_port>;
> +                    filter-src = <&tpdm_mdss>;
>                   };
>               };
>           };


