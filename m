Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3728C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hb1yKVQdEBpZzZr/F4z3B7ImiUGeujqPX2pvyxmx12Q=; b=1Bs20XS2vHAr6ss07NMFnxrgX8
	l61RWdA4UeP5K0kbew/bG4ndNYvdHVY++Sw80+wn43PxlsgbKn7kpVqDLGtwPDlyPc23C/MdvEsxg
	sRnz8bLnOT+Vhiv1QLp2EBt3sTMw46y6f/thVdHUL+3RYy5cOIXp9NnvW33k3Yl5MilAShh3tv6di
	sXis9QTKst5SlGL2hNsGVTP0RLF9ulKkOLWGlPK13/6XASWK21VH4TPWZjoLirsGsUtH9Gm6etEHk
	Ai7b812UC7x90Gk6E/O7GHkdd0wlByw4hLH0Ogl9HBGwETY/cnZwWZVmEg0s2SUCooAizVUo/h9Yo
	IXAlBQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txhVX-0000000AK1k-2vhV;
	Thu, 27 Mar 2025 07:18:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txhTm-0000000AJtO-2CDD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 07:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9048EA41BDA;
	Thu, 27 Mar 2025 07:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE92AC4CEDD;
	Thu, 27 Mar 2025 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743059801;
	bh=6MsLFXJTO1nHRU7fxYGjWw4YNdH3bXJp7NDPTR8FanM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rfmlQaWlXP/aVoSXq9kgeLjNE7tRfLq0IHl/9h0PxFlaiIZ6J3yq1FMzN7FuS0v3v
	 TBr8wJwKxrN1uA85rwpEXdytFMKbfAiLfZQmHY30vWG/+5k2yNZzReX3LcVUxOOdvt
	 rbEGrSXoTriIViqdSIiJExP4BREY3TTpRPgEWbZ+Lm8PMe5vKWzxDM5K+eth+//smd
	 wjKF8A3z/0xGem/0wwl9DZfoIpXx5o50RbdPRKFVY1Lo2q//m+mnAI8v4eRnwdt6BX
	 eT0QjWJwkvwTbD6r2rC200BgzcxSNQ7s7yStryWKepIOQBdLXrDthNzK8CT3PUep3+
	 3c9qpSlN1vPPw==
Message-ID: <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
Date: Thu, 27 Mar 2025 08:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
To: Peter Chen <peter.chen@cixtech.com>, Marc Zyngier <maz@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fugang Duan <fugang.duan@cixtech.com>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org> <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org> <Z-Tz1moMNozx23k6@nchen-desktop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z-Tz1moMNozx23k6@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_001642_700618_E8331716 
X-CRM114-Status: GOOD (  25.43  )
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

On 27/03/2025 07:44, Peter Chen wrote:
>>>
>>> On 25-03-25 10:52:10, Marc Zyngier wrote:
>>>>> +     timer {
>>>>> +             compatible = "arm,armv8-timer";
>>>>> +             interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
>>>>> +             interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
>>>>> +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
>>>>> +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
>>>>> +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
>>>>> +                          <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
>>>>> +     };
>>>>> +};
>>>>
>>>> I don't think there is anything wrong here, but it is also a pretty
>>>> useless DT. There isn't even a UART to interact with the machine and
>>>> find out whether it has actually booted.
>>>>
>>>
>>> UEFI uses the same UART, so we could see all kernel boot logs until
>>> switch to use kernel UART driver for printk. If you would like boot
>>> to the console at initramfs, just add uart node like patchset v1.
>>
>> What's the point in upstreaming something that requires extra changes
>> just to boot it? It only outlines these patches are not useful as they
>> stand.
>>
>>>
>>>> I reckon this should be part of the initial DT, as this otherwise
>>>> serves little purpose.
>>>>
>>>
>>> Without this initial support, we can't add some base drivers, like
>>> mailbox. The dt_binding_check will report warnings/errors [1].
>>
>> Of course you can. You just add additional patches to this series,
>> making it something that is actually useful. So far, this series only
>> serves as marketing material.
>>
>>> Full UART support depends on clock, clock control needs mailbox
>>> to talk with FW using SCMI protocol.
>>
>> Then do it. You obviously have existing DT support for it already.
>>
>>> There is no any support for CIX SoC, so we had to add one small step by
>>> step.
>>
>> No, you are deliberately choosing to make this platform useless.
>>
>> That's a bit sad, and a waste of everybody's time.
>>
> 
> Hi Marc,
> 
> Thanks for your interesting of our platform, and your comments
> help us a lot. But I don't think it wastes reviewers and maintainers
> time, a clean patch set saves everyone's time during upstream process.
> 
> For how to organize the patch set for SoC, Krzysztof gave good summary
> at [1]. We are going on upstream [2], this patch set is just a start
> and base but not like you said for marketing purpose.


I do not think I suggested in [1] to ever send new SoC containing only
CPUs and interrupt controller, without even serial. My instruction [1]
was how to organize it. The DTS can be even fully complete, see the
upstreaming example I have been using all the time - Qualcomm SM8650:

https://lore.kernel.org/all/20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org/

Entire SoC sent to mailing list on the day one of public release of that
flagship Qualcomm SoC. The SoC DTSI and board DTS have almost complete
picture, except few trickier pieces... but it even has full display and
GPU! Plus, as I explained on my email on samsung-soc, that DTS/DTSI
patchset references all other bindings with their state, so SoC
maintainers can understand what is the overall progress and what will be
the result in DT schema checks, if they apply the patchset.

The minimum, absolute minimum submission is with the serial nodes. I
would prefer to have some storage or any other interface as well, but
that's fine.


> 
> [1] https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
> [2] https://lore.kernel.org/lkml/20250325101807.2202758-1-guomin.chen@cixtech.com/
> 


Best regards,
Krzysztof

