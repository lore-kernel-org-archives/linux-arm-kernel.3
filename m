Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4501AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7oVO46DBh/16PeVX4JcwoYXyRBR5YI8RI3tftw12ZE=; b=joUAVbPG54lOVz1zz9kSYw3hf9
	NMM2OLslsfV6kmEDU+ogJVp/9iguBSZFPi3eVJhCoqtRJuPz6l/pcYsEYuWggTmCiI0ns+OGS2MB1
	96jraXo1ZowoOvZ7dFJ79Lr8dd5g3VBRgnYJoxhxEtiubHDkJsGekxmm7ex3kOecfh7zTc/lX+2MC
	eMVjqWZ8XCh9G8nFMs50+rG12/m1AVNiIIdfZGLnWYliphXOooykogcKYcdcQzhGI4ASaS0ADNRBV
	YnkiUOM74EDX4MLQc/Cw/NIUMkNxb7wd0cYmno4wyAwALF3DiJjkbHLEgE9429VIF3Ne/bUDSZyQS
	Y9TxNlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgvz-00000002pSO-2OXR;
	Mon, 23 Jun 2025 13:10:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfQN-00000002Vw6-1wy9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 11:33:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43268113E;
	Mon, 23 Jun 2025 04:32:58 -0700 (PDT)
Received: from [10.57.29.116] (unknown [10.57.29.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3092E3F66E;
	Mon, 23 Jun 2025 04:33:12 -0700 (PDT)
Message-ID: <9f80f7c4-01a3-4a03-94dc-2a19136707f8@arm.com>
Date: Mon, 23 Jun 2025 12:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Neal Gompa <neal@gompa.dev>,
 linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-i2c@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Andi Shyti <andi.shyti@kernel.org>, Will Deacon <will@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
 <2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com>
 <d5a616f3-67a3-4504-904e-6cec503ab157@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <d5a616f3-67a3-4504-904e-6cec503ab157@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_043319_590382_D5A5324F 
X-CRM114-Status: GOOD (  25.23  )
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

On 2025-06-21 5:01 pm, Sven Peter wrote:
> On 13.06.25 18:50, Robin Murphy wrote:
>> On 2025-06-12 10:11 pm, Sven Peter wrote:
>>> Enable drivers for hardware present on Apple Silicon machines.
>>> The power domain and interrupt driver should be built-it since these are
>>> critical for the system to boot, the rest can be build as modules.
>>
>> Nit: I'd be tempted to put this patch first, just in case anyone 
>> bisecting with "make defconfig" in their process lands in the middle 
>> and suddenly loses some drivers (although arguably them going from 
>> "=y" to "=m" could still be a surprise, but at least a bit less so).
> 
> Ah, that's a good point that I hadn't even thought about.
> Now that most of these have already been merged into different trees 
> that ship has sailed though.

Yeah, like I say it's only minor and rather contrived anyway. Not a big 
worry.

>> [...]
>>> @@ -1504,6 +1520,7 @@ CONFIG_ARCH_TEGRA_194_SOC=y
>>>   CONFIG_ARCH_TEGRA_234_SOC=y
>>>   CONFIG_TI_PRUSS=m
>>>   CONFIG_OWL_PM_DOMAINS=y
>>> +CONFIG_APPLE_PMGR_PWRSTATE=y
>>
>> If this is critical for any Apple platform to work then it would 
>> probably make sense to explicitly select it from ARCH_APPLE, as is 
>> done for APPLE_AIC...
> 
> 
> Documentation/kbuild/kconfig-language.rst:
> 
>    select should be used with care. select will force a symbol to a value
>    without visiting the dependencies. By abusing select you are able to
>    select a symbol FOO even if FOO depends on BAR that is not set. In
>    general use select only for non-visible symbols (no prompts anywhere)
>    and for symbols with no dependencies. That will limit the usefulness
>    but on the other hand avoid the illegal configurations all over.
> 
> 
> That's probably fine for APPLE_AIC which only depends on ARM64 (and 
> ARCH_APPLE) which is guaranteed to be set when ARCH_APPLE is set anyway.
> APPLE_PMGR_PWRSTATE also has an additional dependency on PM so it should 
> probably remain in defconfig and not use select.

Sorry if the implication wasn't clear, but I did mean "select it" in the 
sense of "select it and all of its necessary dependencies in a manner 
that works correctly". The same argument applies all the way down - if a 
!PM config will not be able to boot on ARCH_APPLE platforms due to 
forcibly deselecting APPLE_PMGR_PWRSTATE, then there is little point in 
permitting that combination. Which of course the user would already have 
to disable at least ARCH_MXC, ARCH_ROCKCHIP, ARCH_TEGRA and 
ARCH_VEXPRESS to achieve in the first place ;)

Thanks,
Robin.

