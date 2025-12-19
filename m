Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5498DD767FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ7sqTB2qCqBWOAqf5BpPW4NIM1Yj8QEUTn+1gFufpU=; b=lU6tcMStUZgCD5rooh8UZfGIEF
	QDYxBQtEi2b14kjob5lDo/Vl8vaelEVE5NhN6FkTTp6WJHXWCkb6mJEdFnBHQTNNl0M1+jNCvQPDf
	DIXb84mzApXfERrv7RU9B20Of1n7v2s925cgRI180xaT8Mel2DStN4JwLmlXR7JbtoJowLuYPWuTN
	IIUJfMp/Szzl91IZqo3KN8ZyqbyYZ0+Omq1/W0KiHTQem/HxPdnxHzpGsMVXRWR3xcZHKcXsscfZ1
	3WOICWa5uE8a5XZqSn2c1RqjLy1NtHt39QsJD5xVgsQGysW9vrB4lzN7otHigh+IkxjmpnCIX3Boj
	ddEo63JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZKe-0000000AGHZ-0idH;
	Fri, 19 Dec 2025 12:11:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZKc-0000000AGH4-0vo3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:11:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC856FEC;
	Fri, 19 Dec 2025 04:11:28 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0203F5CA;
	Fri, 19 Dec 2025 04:11:33 -0800 (PST)
Message-ID: <13141782-ba6e-4753-9613-2b128e008d56@arm.com>
Date: Fri, 19 Dec 2025 12:11:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
 <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041138_307208_A1ED18FA 
X-CRM114-Status: GOOD (  12.20  )
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

On 19/12/2025 09:08, Jie Gan wrote:
> 
> 
> On 11/3/2025 3:06 PM, Jie Gan wrote:
>> The CTCU device for monaco shares the same configurations as SA8775p. Add
>> a fallback to enable the CTCU for monaco to utilize the compitable of the
>> SA8775p.
>>
> 
> Gentle reminder.

I was under the assumption that this was going via msm tree ? Sorry, I
misunderstood. I can pull this in for v6.20

Suzuki

> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 + 
>> ++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml
>> index c969c16c21ef..460f38ddbd73 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -26,8 +26,13 @@ description: |
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,sa8775p-ctcu
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-ctcu
>> +          - const: qcom,sa8775p-ctcu
>> +      - enum:
>> +          - qcom,sa8775p-ctcu
>>     reg:
>>       maxItems: 1
>>
> 


