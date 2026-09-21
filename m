Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30516C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7mBu7KzcyTyfDyGtVhqs/jTK19v7sG05dKkGBzNKj0=; b=oIQAlW8cQlC28p4sTYuwRqsODn
	Ta39rQv0J4zoHbgGiB3ZSDb9eQSlg+BUSJJCGa7/h6hqeqIwX7jtfWRFGTVvGXOin2VmAmUb7M7Qp
	mrcxYDv0yZfOeVz2lp+ekKJlBi1jDyDJB3/1+WN7uL/yVkrHFYDxxAbsJMfzexF0mt/JgkKI5HZvq
	k41m3HuutDE/3b6IeJ7K7X7mHTb4woXercMHt8zFyVNSkZYlv+oDM6XxLQUzLMb7mAq72VgZuUHNk
	h+IJsD68XqS65syY5G0RUm0XrBzv8IB5u/iAeV00zFYlO69axWfyW2iBIPj8EVOi6q/jzXolPzP8G
	1jonVN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eMm-00000002Hzg-06ew;
	Mon, 21 Sep 2026 13:47:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eMc-00000002HyB-1SKZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:47:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80A2A19F6;
	Mon, 21 Sep 2026 06:47:17 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F68E3F528;
	Mon, 21 Sep 2026 06:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789998441; bh=S74E5qHOMv58fpsLAJXvsMCedmwmZf3vVK1QuOOeH6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgGKSG3DHvEYF7Gd0tmK4Uagl3rZDrPMlHPyODGbKGP4qvFoJ/VEp+tg/r6F2ybX9
	 B2diEnSgkh5ZyCIbIZCb5uKTQPC/AgawneWOLSvzMgud2d4q1u3+aofvn9ab0zyiil
	 HEUIQIogJwWd7E21Lc2RVGqSnFyiHC6y0TYNb9cQ=
Message-ID: <cf017cb5-c048-4b22-846e-aea206da695c@arm.com>
Date: Mon, 21 Sep 2026 14:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm64: nmi: Add Kconfig for NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-33-vladimir.murzin@arm.com>
 <c02d298b-4e2d-412a-908a-16c017799c45@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <c02d298b-4e2d-412a-908a-16c017799c45@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_064722_613178_15C1E841 
X-CRM114-Status: GOOD (  16.40  )
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

On 9/16/26 10:06, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Mark Brown <broonie@kernel.org>
>>
>> Since NMI handling is in some fairly hot paths we provide a Kconfig
>> option which allows support to be compiled out when not needed.
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/Kconfig | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 2738637ccb92..df5ff59715d1 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2251,6 +2251,24 @@ endmenu # "ARMv8.7 architectural features"
>>  config AS_HAS_MOPS
>>  	def_bool $(as-instr,.arch_extension mops)
>>  
>> +menu "ARMv8.8 architectural features"
>> +
>> +config ARM64_NMI
>> +	bool "Enable support for Non-maskable Interrupts (NMI)"
>> +	default y
> We should select HAVE_PERF_EVENTS_NMI to enable perf-NMI-based
> hardlockup detector as pseudo NMI do.
> 

It seems there are ongoing discussions [1,2] about moving away from it
towards the buddy detector. So I can add it, but I'm not sure whether
it will still be necessary in the future.

[1] https://lore.kernel.org/linux-arm-kernel/amtyQH7lzLDKE3WD@thinkstation/
[2] https://lore.kernel.org/lkml/20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com/

Thanks
Vladimir

> arch/arm64/Kconfig:     select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
> || ARM64_NMI
> 
>> +	help
>> +	  Non-maskable interrupts are an architecture and GIC feature
>> +	  which allow the system to configure some interrupts to be
>> +	  configured to have superpriority, allowing them to be handled
>> +	  before other interrupts and masked for shorter periods of time.
>> +
>> +	  The feature is detected at runtime, and will remain disabled
>> +	  if the cpu does not implement the feature. It will also be
>> +	  disabled if pseudo NMIs are enabled at runtime.
>> +
>> +endmenu # "ARMv8.8 architectural features"
>> +
>> +
>>  menu "ARMv8.9 architectural features"
>>  
>>  config ARM64_POE
> 


