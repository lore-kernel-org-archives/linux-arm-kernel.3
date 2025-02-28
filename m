Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E292EC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COq625R9+If4QE8gOV9Ke/T020e16SpptKW3azs+Okw=; b=byTlamFfJ3t6VjJ4rdtxromgYU
	wQefy7PDzJmAEo3FHue/OBUs26q2HCdOrg45lfFhfq6bdpQsSsfsTwn8sZTiM59RbSALgezYbWJrC
	3npvxy438s6Hq4R8xP8QuQE6zUtx9itc544xg4+MGGDQO0dxtHHORwunYKNoXgeSCPcX0VdXD7oxD
	4y41cus12CDlpEA8ZXznL9VzrzILuCCongAYApmCIgowleYqbuILiMEZITCzNXUn2j/K2A1OMIFvp
	yvY5dNoNWJbtsyLvwpcJG0eM+Hi15TFSuXzMpX2Q4kLDPUeM2OTNBulOgkpYxmOwPjXFdyORcB03U
	6FD/CE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuhc-00000009ytI-3J8S;
	Fri, 28 Feb 2025 07:22:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnug4-00000009ygz-0kRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:20:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RL6ZHk004454;
	Fri, 28 Feb 2025 07:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COq625R9+If4QE8gOV9Ke/T020e16SpptKW3azs+Okw=; b=OlqJxuxIkVTSHXP+
	jDR6RKK2zNWa64q1Rb9NI+MV3zkz8qmp5b+XTSiyxxj+T5w+R7aEyxWCXbcqu4+M
	8h5KMgji8a9YNan+5FY3htFN3ZiIw4Ko9AIAZypw4rbowIQtKY6gI5uv2iHjRRyO
	uXu09u58CTUOyP0bOtrGdX94kv4gH9WT0MCjUQljp0DeDOqrSYE/vQnrXY/AMW68
	spauiuawVcNj+IkI6sbk8s9MrNAUGqvhvKkYIUQKstbOTF91OIJ3s//hd/RwGmQi
	on86M3XTsrcBks39BglaOqx43r4yGl8NL12sREl8WsTlCQMgEV7MV3Vl7pL3Ij3h
	mt+KOw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7k2bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:20:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S7KcRX004787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:20:38 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 23:20:29 -0800
Message-ID: <1c483978-8e9d-4ba0-8c92-6b4f8c366e2a@quicinc.com>
Date: Fri, 28 Feb 2025 15:20:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
To: Rob Herring <robh@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
 <20250221235307.GA401276-robh@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250221235307.GA401276-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g8-R13Gx_sxjZuIiU79pSGN8ljaQUnLU
X-Proofpoint-GUID: g8-R13Gx_sxjZuIiU79pSGN8ljaQUnLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_01,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_232056_236504_06DD0CEE 
X-CRM114-Status: GOOD (  21.02  )
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



On 2/22/2025 7:53 AM, Rob Herring wrote:
> On Fri, Feb 21, 2025 at 03:40:28PM +0800, Yuanfang Zhang wrote:
>> Adds new coresight-tnoc.yaml file describing the bindings required
>> to define Trace NOC in the device trees.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 +++++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b8c1aaf014fb483fd960ec55d1193fb3f66136d2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Ttrace NOC(Network On Chip)
>> +
>> +maintainers:
>> +  - yuanfang Zhang <quic_yuanfang@quicinc.com>
>> +
>> +description:
>> +  The Trace NoC is an integration hierarchy which is a replacement of Dragonlink tile configuration.
>> +  It brings together debug component like TPDA, funnel and interconnect Trace Noc which collects trace
>> +  from subsystems and transfers to QDSS sink.
>> +
>> +  It sits in the different subsystem of SOC and aggregates the trace and transports it to Aggregation TNoC
>> +  or to QDSS trace sink eventually. Trace NoC embeds bridges for all the interfaces(APB, ATB, QPMDA & NTS).
>> +
>> +  Trace NoC can take inputs from different trace sources i.e. ATB, QPMDA.
> 
> Wrap lines at 80 char. And you need '>' to preserve paragraphs.
how to use '>' to preserve paragraphs? i don't find it on other yaml, could you share one example?
> 
>> +
>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - qcom,coresight-tnoc
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^tn(@[0-9a-f]+)$"
> 
> blank line
Done in V2.
> 
>> +  compatible:
>> +    items:
>> +      - const: qcom,coresight-tnoc
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
> 
> Need to describe what each entry is.
Update in V2.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
>> +
>> +  in-ports:
>> +    description: |
> 
> Don't need '|'
Done in V2.
> 
>> +      Input connections from subsystem to TNoC
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
> You have to define the 'port' nodes.
Done in V2.
> 
>> +
>> +  out-ports:
>> +    description: |
>> +      Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port:
>> +        description: |
>> +          Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
> 
> 'connections' sounds like more than 1, but you only have 1 port. 
> 
> Wrap at 80 char.
Done in V2.
> 
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - in-ports
>> +  - out-ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tn@109ab000  {
>> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
>> +      reg = <0x0 0x109ab000  0x0 0x4200>;
>> +
>> +      clocks = <&aoss_qmp>;
>> +      clock-names = "apb_pclk";
>> +
>> +      in-ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +          reg = <0>;
>> +
>> +          tn_ag_in_tpdm_gcc: endpoint {
>> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
>> +          };
>> +        };
>> +      };
>> +
>> +      out-ports {
>> +        port {
>> +          tn_ag_out_funnel_in1: endpoint {
>> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
>> +          };
>> +        };
>> +      };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>


