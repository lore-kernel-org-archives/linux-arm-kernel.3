Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583EBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xDbO9yPXf0addhl7Z4bBdd3i4HBK1u+J4533+opM8A=; b=BYk2gfDHFoiuhZP6EFqL0sT9Y4
	XDFrTD2yDtys6tpn5nhzfFxydzrDtLwAofVXnrizbkV4MH3g2rQCszBcDhNkvnmIZR6OafZNRDmNk
	dEynKTVhAjk3Q+VKYbhIb/Wwsw42byDC/AC7X/fEqVY5rkWXga6DK+1MjIxE6RZSWEsID2gJMmp6c
	K4Tdwl7FC4b5Fc/lZ9U4iARFqj0EEJa0+KgKs1lTzhgugB40KESENJzknT04KKEzeJrp5lLk2OB5S
	8LVNs8P3zT15I9F2j2v8fAkWfTcI/VLO0nudG7Qtv2yiCu1tw+15SkVT55Xwt1ujo/M3xbfR/Y/Xe
	Ip7McBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXJ3-000000064ND-1UlE;
	Tue, 18 Mar 2025 13:48:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX8K-000000062g1-4A7e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:37:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E78EC13D5;
	Tue, 18 Mar 2025 06:37:36 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FEDC3F673;
	Tue, 18 Mar 2025 06:37:24 -0700 (PDT)
Message-ID: <eeff769a-ff81-4017-9738-98ad130980a9@arm.com>
Date: Tue, 18 Mar 2025 13:37:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mike Leach <mike.leach@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov"
 <ivan.ivanov@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, David Heidelberg <david@ixit.cz>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
 <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
 <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_063729_121237_A2A83FA3 
X-CRM114-Status: GOOD (  13.96  )
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

On 18/03/2025 12:19, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 10:38:17AM +0000, Suzuki K Poulose wrote:
>> On 17/03/2025 17:44, Dmitry Baryshkov wrote:
>>
>> nit: Subject:
>>
>> s/qcom,coresight-static-replicator/arm,coresight-static-replicator
>>
>>> As most other CoreSight devices the replicator can use either of the
>>> optional clocks (or both). Document those optional clocks in the schema.
>>>
>>> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>>> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>      power-domains:
>>>        maxItems: 1
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>
>> For the static replicator, you don't have an APB clock, as they can't be
>> programmed. It may have an ATB clock. So minItems 0, maxItems: 1
> 
> It can, see qcom-apq8064.dtsi
> 
> Also minItems:0 doesn't make sense to me. I'd rather keep this as an
> optional property rather than requiring an empty set.

Interesting, that must be atclk in fact. Because a static replicator
only manages ATB transactions. It doesn't have an APB interface.

I am not an expert in DTB schema. But the point is the clocks are optional.

Suzuki


> 
>>
>> Suzuki
>>
>>
>>
>>> +  clock-names:
>>> +    minItems: 1
>>> +    enum:
>>> +      - apb_pclk
>>> +      - atclk
>>> +
>>>      in-ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>>        additionalProperties: false
>>>
>>
> 


