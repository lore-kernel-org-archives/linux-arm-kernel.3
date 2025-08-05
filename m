Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607ACC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pqwMScuPTwzx0lyuc5MF37k0uqjqh5/S7oN85LSRqI=; b=hUTPuLVdUQmP84OhXuRriN7voT
	/okHiX9+SG+tgivChAjSa+09ZMfaRc2Z8KG+eFBS23u4zm+LbZBhkt9HWctCy4DCZprYGpuBF9RUw
	ZsTO7eDOXgjqMdA7TCI2VRj4nIKtHVClS0Tus/VsgYuIikSjYc7qc9lq60q4hDFWj4ysWPietbcnL
	Wl8pCDi3MZBqGDB7v1XGakWcMRoeWOyw5Jnf8wh/TbgRxmlKYaQS0SAr7pZLoqV8iPN9hnDSoT1Y3
	snPFI1rveAMXIT6GTsKS/sPbOXUIGmWWPhkw+OlgmUZF7rHlG37Bl7wqqvGH6JJmKc4R/i+hE4npi
	FPumedTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJhr-0000000D9s0-3F4N;
	Tue, 05 Aug 2025 15:36:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIIk-0000000CwUY-1d5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:06:07 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575E5wPf4055648;
	Tue, 5 Aug 2025 09:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754402758;
	bh=5pqwMScuPTwzx0lyuc5MF37k0uqjqh5/S7oN85LSRqI=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=timMHIc8NKwRvpd+gXcAFdjLUIPylpbG6DYc1V3fi+tmzewXaCGClsKpRHs2v0Tef
	 Fw+UetwtQBW5POwb2L+5/jjdA6rvCpfL+vssv0gn5GPdB4umxQTfxZSyWNRhLNJvpI
	 YdEpgnZzBvzEdqIuZhxkAdAWKU3+B+S4r1+rIqsY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575E5wjF3496847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 09:05:58 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 09:05:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 09:05:57 -0500
Received: from [10.249.34.164] ([10.249.34.164])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575E5uk02223144;
	Tue, 5 Aug 2025 09:05:56 -0500
Message-ID: <f28d866d-3123-4484-9524-054442fa3cec@ti.com>
Date: Tue, 5 Aug 2025 09:05:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
From: Brandon Brnich <b-brnich@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Devarsh
 Thakkar <devarsht@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Darren Etheridge
	<detheridge@ti.com>
References: <20250804180106.2393256-1-b-brnich@ti.com>
 <b5ba5a22-dc0a-423b-963f-5db6c7e04665@kernel.org>
 <b52fd6d4-b907-44dd-bd9b-e15c3321ad79@ti.com>
Content-Language: en-US
In-Reply-To: <b52fd6d4-b907-44dd-bd9b-e15c3321ad79@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_070602_681627_B283879C 
X-CRM114-Status: GOOD (  19.12  )
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

Hello,

On 8/5/2025 8:34 AM, Brandon Brnich wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> On 8/5/2025 1:02 AM, Krzysztof Kozlowski wrote:
>> On 04/08/2025 20:01, Brandon Brnich wrote:
>>> This adds node for E5010 JPEG Encoder which is a stateful JPEG Encoder
>>> present in J722s SoC, supporting baseline encoding of semiplanar based
>>> YUV420 and YUV422 raw video formats to JPEG encoding, with resolutions
>>> supported from 64x64 to 8kx8k.
>>>
>>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>>> ---
>>>
>>> Changes in v2:
>>>    - remove invalid clock-names attribute
>>>
>>>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/ 
>>> boot/dts/ti/k3-j722s-main.dtsi
>>> index 5cfa7bf36641..fb24c14614b4 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
>>> @@ -385,6 +385,16 @@ c7x_1: dsp@7e200000 {
>>>           ti,sci-proc-ids = <0x31 0xff>;
>>>           status = "disabled";
>>>       };
>>> +
>>> +    e5010: e5010@fd20000 {
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2- 
>> devicetree-basics.html#generic-names-recommendation
> 
> I got this name from the already present node in the am62a device 
> tree[0]. Should I replace both of these with more generic name such as 
> jpegenc?

Please ignore above comment, I was thinking about the label and not the 
node name. I understand node name needs to be jpeg-encoder.

Should label also be more generic? I see a few examples where the label 
is jpegenc or something more generic than the specific part name. But I 
don't see any specific rules in the devicetree specs on labels.


> 
>>
>>
>>> +        compatible = "img,e5010-jpeg-enc";
>>
>> Wrong compatible. This is TI, not IMG.
> 
> Devarsh has pointed out the same, I will update compatible that matches 
> TI version in v3.
> 
> Best,
> Brandon
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
> tree/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi#n1149
> 
>>
>>
>> Best regards,
>> Krzysztof
> 


