Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B8CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaIjuH2IN0F7q/2ZWWUIXcfRDWfxUpbGkwvpGwCSZZI=; b=HsfVIHywwp8R3RndGW2bDIHQY2
	axrMe1yvIFP6p6hGxX2EH7CCLt5zZVMIoS5do5kp/183LLQCyYRHpxDgkcbW7xaRY3VE99m4j+EiT
	9Zoct2Kc9trACJ8iaSksmrnwEjzZdtu1bzl5XrACtwIzrcG8FQQ18kSTyYsOGVt++xuWK6QQqLyv6
	LAhfxw1mPa8KUb2muW/nqL32hliR5xdF60RjvFfn4rF+hEDzuO8h3fAj6M3pqJKmU5zT80hAF3aGa
	Lx225QGTnk00uv+d0GHpgrgEz9a/VG4jyy2JmyNSeg3MFNWarBqcVHiJCHEEp9X/ja2TtrEqxnIop
	93rWkfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv6l-00000007FT3-3b4O;
	Fri, 29 May 2026 11:10:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv6i-00000007FSa-3X3B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:10:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797CB2247;
	Fri, 29 May 2026 04:10:22 -0700 (PDT)
Received: from [10.57.24.26] (unknown [10.57.24.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49F6B3F905;
	Fri, 29 May 2026 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780053027; bh=ANtpuVqE9Cwp87X1vN7zPmC9cfnxtdTbe9wBuu1OjwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WIL3GdzxBxmJSnUDNqMsnouS28X6VxiafbOsL1XT/1nMLBXyH4p5s/tjvjFCKjPti
	 145U2ZMaKHi33IcJARgrRtXXnkgdfsFigQxuAPsCDW7lm4zMC9EfCNyPpqAIaSIk5/
	 Fi/pXCCD64ZanA55UaMsCGT6fzrmxnEwGiYUC0VA=
Message-ID: <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Date: Fri, 29 May 2026 12:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
 <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_041028_961322_BB99B6EB 
X-CRM114-Status: GOOD (  17.08  )
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

On 29/05/2026 11:26, Jie Gan wrote:
> 
> 
> On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
>> Hello,
>>
>>
>> On 04/02/2026 02:22, Jie Gan wrote:
>>> The DT‑binding patch adds platform‑specific compatibles for the
>>> CTCU device, and the following Qualcomm platforms are included:
>>> Kaanapali
>>> Pakala(sm8750)
>>> Hamoa(x1e80100)
>>> Glymur
>>
>> Given this is predominantly DTS changes, and there is very low chances
>> of a conflict with the binding yaml change, I would recommend this to go
>> via soc or the qcom platform tree.
>>
>> For the series:
>>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Suzuki,
> 
> May I ask is there a chance this patch series could go through the 
> CoreSight tree?

Like I said, it is mostly Qcom platform changes. So, I would leave it to
the appropriate channel

Suzuki


> 
> Thanks a lot.
> Jie
> 
>>
>>
>>>
>>> Since the base Coresight DT patches for the Kaanapali and Glymur
>>> platforms have not yet been applied, I created DT patches only
>>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>>> and Glymur patches once their corresponding base Coresight DT patches
>>> are merged.
>>>
>>> The Hamoa‑related patches were posted in a separate email, and I
>>> have included them in the current patch series.
>>>
>>> Link to the previous Hamoa patch series:
>>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>> Changes in v3:
>>> - change back to the numeric compatible from hamoa to x1e80100.
>>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>>
>>> Changes in v2:
>>> - change back to the numeric compatible from pakala to sm8750.
>>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>>
>>> ---
>>> Jie Gan (3):
>>>        dt-binding: document QCOM platforms for CTCU device
>>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>>
>>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++ 
>>> + +++++++-
>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 ++++++++++ 
>>> + ++++++++++
>>>   3 files changed, 340 insertions(+), 1 deletion(-)
>>> ---
>>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>>
>>> Best regards,
>>
> 


