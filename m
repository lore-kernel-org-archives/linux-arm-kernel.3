Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0E8C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVTOqWFHgjkPdqewrFgz/wabZrqJAiKjmMMOpEvLuD4=; b=SaH7uPPpPCVqXUyqis2oEJLtEc
	B4Q2ArKLSOX5mj9UvRVvxplXZF5cHmth5dSsrcATzrTQEAXgggfM/B1Ump4W1acjaugr3g5ELd905
	8Y+I2WBcJnAZ6xozxKiKa0SRQkcCFVWII+eo0vAk5Ky5AQ8WBv8wkJv7HvFouG7DfHOIpZd24O2jW
	AWEfSIBqUpn81+RYXzFi47iv8NcRTTDf5KWdn/PL9GMQqSKbGnioKB35W7on7TDXXEcEaiE/60adF
	rf6YSqEm88wbpto3sWAbs1ZdNbzMJiA2xND1/4DuRJ8LCYrRkdKk8QOsJASne8KZKSITGGtp42FeI
	76Kjwkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaC5l-0000000Ec4t-1ala;
	Fri, 11 Jul 2025 11:39:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBXd-0000000EYL4-12AW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 11:03:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 585BE16F2;
	Fri, 11 Jul 2025 04:03:33 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E813F6A8;
	Fri, 11 Jul 2025 04:03:42 -0700 (PDT)
Message-ID: <3ef8295d-2dd3-404c-9776-5792a7567f56@arm.com>
Date: Fri, 11 Jul 2025 12:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_040345_380654_518D2F43 
X-CRM114-Status: GOOD (  18.58  )
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

Hi

On 24/04/2025 12:58, Mao Jinlong wrote:
> Add new coresight-qmi.yaml file describing the bindings required
> to define qmi node in the device trees.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

Why does this have to do anything with coresight ? Surely coresight may
be using the QMI along with other subsystems. I don't see why this is
named as "coresight-qmi"

In my opinion, the QMI driver should be outside coresight driver
framework and whatever coresight component driver relies on it
could add the dependency.

Suzuki


> ---
>   .../bindings/arm/qcom,coresight-qmi.yaml      | 65 +++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> new file mode 100644
> index 000000000000..601c865fe4d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-qmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm coresight QMI(Qualcomm Messaging Interface) component
> +
> +description: |
> +  Qualcomm Messaging Interface (QMI) is an interface that clients can
> +  use to send, and receive, messages from a remote entity. The coresight
> +  QMI component is to configure QMI instance ids and service ids for different
> +  remote subsystem connections. Coresight QMI driver uses the ids to init
> +  the qmi connections. Other coresight drivers call the send qmi request
> +  function when connection is established.
> +
> +maintainers:
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,coresight-qmi
> +
> +patternProperties:
> +  '^conns(-[0-9]+)?$':
> +    type: object
> +    description:
> +      QMI instance id and service id for different remote subsystem connections.
> +
> +    properties:
> +      qmi-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Instance id for the remote subsystem connection.
> +
> +      service-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Service id for the remote subsystem connection.
> +
> +    additionalProperties: false
> +
> +    required:
> +      - qmi-id
> +      - service-id
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  # Minimum coresight qmi definition.
> +  - |
> +    coresight-qmi {
> +      compatible = "qcom,coresight-qmi";
> +
> +      conns-0 {
> +          qmi-id = <0xd>;
> +          service-id = <0x33>;
> +      };
> +    };
> +
> +...


