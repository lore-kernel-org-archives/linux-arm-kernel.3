Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE8CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR18xZLkIBD/v+YYlolu57R5lqheAjboSLyrb0PLlFA=; b=YIROOiaaDMfv1hn9SArPMVy80G
	lNrO73upu+52/v5oAIzPjqLfO2Wom1/gRui8ndhpO38USwsVmvkx8U4uElGsfv821/CGZINl488Uo
	DiCw50kLFElL7nf+m0KPQMc6KCX5zYZzPfgO5gWbPVn1F2oDzXFlQyBA52YStEs4ZT1wO6gJ1et1H
	h2vsE+FgjkWAJ43arHIARVM6SgeEKFAnw3O/mpXrnh2sQAb2F9m7jPSyKof6lx5siHWubGTAC4yIl
	BOUDhLUP/0oMZmQo/d9TQ04fzZMgtvbPPzQEtGAwr1evbv4jsKSt+49aQvXIvOH+2fRoI5UPttHBw
	B3fXuLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1jo-00000007Vm1-1CuI;
	Thu, 23 Oct 2025 20:16:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1jm-00000007VlG-1leP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kR18xZLkIBD/v+YYlolu57R5lqheAjboSLyrb0PLlFA=; b=hDv+fsz+fHrsjODgDwSVIL8Yhj
	wIK8x2/R5WjulCu2/JanQMcEjqvaT20BsXZRzwrVqBEDsSPjYeP5QqsWhvESjpJqgt1KHlSXxNScC
	4S24Wd7jrtAzlvXQShis/z+pGaZoGOa+sjbPyT8uUfTrPsXqNwD6kHte5R/9oWm55fXDrX3f1kXN5
	UcfVHoco3debcJHoJ6jmrAvUcOxREHMTZs/2zAdo7IUB6o2+pd72zCLbh1VFnN4uUNipNZMF6Cqrd
	yESY2PfJCcj6R3AzLJHhU1J0LvhVAuDErEPRoFSu0KQfbhs+/532iCFDZSQCfGHe/YhUQREZsZAEL
	E40OkGpg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0s4-00000001i25-1kEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:21:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4270a072a0bso225237f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761250597; x=1761855397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kR18xZLkIBD/v+YYlolu57R5lqheAjboSLyrb0PLlFA=;
        b=X+jq/P05yWIz13Qd16Orp1LNLws60VfuVYPkLBJc5+e9D0qpaOjYXhW2mJYQdaFl63
         5F8sEfuVVew5BhcpJds4N+NC+9FKqgk3XBgBbPuxWN9Iliwi2z1ONVqv0/bd/p6rziDF
         DiaWc0WaBleBuP+DKQVWPIPBrNtUHLpXFk+xAjDf6htQLFQSsG6H5Nzud3PY7fNuE3Eq
         i5DD1nFs9OUrund1Ye36VrJmuYlWqc6/IXHhstRkU1ShjgW1hg7bl8J4SQSFAV52qRBq
         EBLH/lD7FUwp0Wnh5GdxOk+BRjRZ9goUQNOXUyd9sKlsN9KXnLLjaf/215DJ+60uIIhX
         G4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250597; x=1761855397;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kR18xZLkIBD/v+YYlolu57R5lqheAjboSLyrb0PLlFA=;
        b=Q5H529tFDvqMf1Lt5lFEwt3tCB1dJbEkzhKLmQq+Ecde8AKtzVEIGpcVkvX9AyrvlJ
         RmF7nuTjNAgf+PjNpfsDB3M4aTvasmUDFLqNix6V5m9j97ZA53cYWa0URoq7ph8mAM9P
         2hwHR2v2SHRyZmtG2IsqorwTZKvsh1XcMtFvJLP8581RZ1p8UsM7GMgKxuFhYKZ3iLXR
         WzC8Lbo64cfnD7zfKoojwmYNWoM3awIs5lnnfzwFxmDdni3hDhXGInjuRtQ2m1DZWQ6X
         xUOGOs3QngMWjaqMQXMnPh84GSo3jyvZ3X/SnAddpr4q/uZPkwMKkZm758uz8IXHfv2R
         QRBg==
X-Forwarded-Encrypted: i=1; AJvYcCVvxEworabfS4QN0sqeU8XwGJ6KQPoDodSOL/kSj+vAUMaiXoDwfOcMr6pezJLs5pXzhB3xtydiVO4G+6txtoHI@lists.infradead.org
X-Gm-Message-State: AOJu0YzYCwQ6Vi/3OjzmMffO1QRN57vNa0w7oPvnjvxwQde8s0Jfwjkw
	BFOFC3vrGRa9RtXeYa/I5CQ1dBt0HiSbXkMCL3pOJzUiwpQAkvEeYg70yRpGHGkANlM=
X-Gm-Gg: ASbGnctgqoO4PBGWvTy5ldM6pay/jvBu0V9rnC3CSAzAPzAOAiALyvZ6F1ZOIatfhWq
	8RR4puh66b5Z7cx09wY9YcOqVk1PDcbkSfTFykj1X21VqVo7ozFDkLcZbjNLjoK3ECYPu3eZ1X6
	X2aiQMACK1EN611fT5wXqtXCzPmzjENaoVkIJA3+/TZbPenu5+K8VSEaSiwbIJwPNok3iIkVtHn
	8NPnVPr5zCa2xZ9NlIQB6CJPuEi8oFleUoFVzgrZl+871u0QDuAGRIwb9bhmkJ3fXCmMLeE2i/h
	LEH5WKfZJpkiqMqzQ/QW4a9wB+3dmFzQk6VdHOefxqG2locxHdldplNMzt/Un2y2ztF4yz1uLK4
	YRllQz1shp+8ihOKtFS7JCM6XAEPMq0p37gq5tR6FigYGy2qDqEk88gbJV+yAndngNsQG1+3rTz
	sv6XSrJwwl+/F71x94xW2/
X-Google-Smtp-Source: AGHT+IGDdj2clyde62LaWC85mqGvgAg4Mcphg+WaGFRuMk1QFzv1PKO3ZTThd0ZWB4kpfNj4J8wWgw==
X-Received: by 2002:a05:6000:2681:b0:429:8c97:f9c2 with SMTP id ffacd0b85a97d-4298c97fb46mr917173f8f.10.1761250596713;
        Thu, 23 Oct 2025 13:16:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ec1dfsm5702040f8f.43.2025.10.23.13.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:16:36 -0700 (PDT)
Message-ID: <82770e98-a9f7-4a89-a076-01394cf6b880@linaro.org>
Date: Thu, 23 Oct 2025 22:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
To: Marek Vasut <marek.vasut@mailbox.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <3381308.aeNJFYEL58@steina-w>
 <e6b282cf-e9de-43b7-a8d4-30e67cefe430@linaro.org>
 <5d042f21-274e-4b69-849a-3342d77942eb@mailbox.org>
 <00555ed7-1aee-459a-ae60-0242809d7b85@linaro.org>
 <07aba8d4-533d-40f7-bcd3-548704d7d228@mailbox.org>
 <f1bc82c0-8800-42e5-8a4d-aea209acd0f2@linaro.org>
 <656164be-5ce7-4f9e-b6cd-0eb1b9305132@mailbox.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <656164be-5ce7-4f9e-b6cd-0eb1b9305132@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_202112_876996_32B40651 
X-CRM114-Status: GOOD (  18.89  )
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

On 23/10/2025 22:05, Marek Vasut wrote:
> On 10/23/25 6:01 PM, Krzysztof Kozlowski wrote:
>> On 23/10/2025 17:53, Marek Vasut wrote:
>>> On 10/23/25 5:32 PM, Krzysztof Kozlowski wrote:
>>>> On 23/10/2025 17:27, Marek Vasut wrote:
>>>>> On 10/23/25 5:22 PM, Krzysztof Kozlowski wrote:
>>>>>> On 23/10/2025 16:03, Alexander Stein wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb João Paulo Gonçalves:
>>>>>>>> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>>>>>>
>>>>>>>> Enable the necessary missing configs for the i.MX95 to boot and also
>>>>>>>> have Ethernet working:
>>>>>>>>
>>>>>>>> * CONFIG_NXP_ENETC4 for the network controller driver
>>>>>>>> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>>>>>>>> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
>>>>>>>> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>>>>>>>>
>>>>>>>> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>>>>>> ---
>>>>>>>>     arch/arm64/configs/defconfig | 4 ++++
>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>>>>>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
>>>>>>>> --- a/arch/arm64/configs/defconfig
>>>>>>>> +++ b/arch/arm64/configs/defconfig
>>>>>>>> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
>>>>>>>>     CONFIG_FSL_DPAA_ETH=y
>>>>>>>>     CONFIG_FSL_DPAA2_ETH=y
>>>>>>>>     CONFIG_FSL_ENETC=y
>>>>>>>> +CONFIG_NXP_ENETC4=m
>>>>>>>>     CONFIG_FSL_ENETC_VF=y
>>>>>>>>     CONFIG_FSL_ENETC_QOS=y
>>>>>>>> +CONFIG_NXP_NETC_BLK_CTRL=m
>>>>>>>
>>>>>>> Are you sure this should be module? Shouldn't NFS boot be supported by
>>>>>>> default? I might be wring here though.
>>>>>>
>>>>>>
>>>>>> NFS root is supported already with this being module. Yes, it must be a
>>>>>> module, cannot be built in.
>>>>> It seems I am using it as built-in on MX95 Verdin (patch is posted on
>>>>> the ML), and yes, I do boot from NFS root without any initrd/initramfs.
>>>>> It has to be built-in for that use case to work.
>>>>
>>>>
>>>> Every arm64 platform is supposed to use initramfs and we already use all
>>>> over the place.
>>>
>>> Shouldn't the platform also be at least bootable with the defconfig ? If
>>> yes, then initramfs is a mandatory requirement for a NFS root boot (not
>>> a ... supposed to ... optional one), which does not seem to be the case
>>> until now.
>>
>> It always was a requirement, nothing new here.
> 
> Is this requirement documented anywhere then ?


Dunno, just dozen of emails.

> 
>>> I would argue the ethernet MAC support should be built-in to achieve
>>> maximum utility with the defconfig.
>>
>> No, you missed my earlier point - all decent platforms already use
>> initramfs since it is really not complicated.
> 
> Is my understanding correct, that the in-kernel defconfig is not meant 
> for practical use and is meant mainly for build-testing/build-coverage ?


It is 100% practical use - we all test our boards on defconfig. It is
not build testing, but actual runtime usage and testing. And as
mentioned many times - being able to only toggle KASAN for defconfig and
still fit in boot partition size is pretty useful.


Best regards,
Krzysztof

