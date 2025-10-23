Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E88CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7A5STg+v7+M98RaWbVd1lgwgdjB6XtkDPplIdfPqWs=; b=eXCxSQWnLbLA2KfRQMvB5qGie/
	e5PbOmFj3mjrzdyUw5gf1trjB4hJZzI+K7RONsT4FUM++JiCF8CGXlwEITwArq1Vxfttcd7xXphpo
	9n3kAbV8GU3gIYNvh/ocD5EiNzFONhu60O86fk4EgVItN3yv8mVxAuKxWZI1tgyKmgdGyrPU5+bGe
	1VSSpHdUu46CdJLHEtR4KLIdvs+jK99pUUw4vHbuaij97QDAVFm1U0Dmv6kE59XsYK85VFI/LPA3p
	Zl/r2zKC02YV2RCxljrnF5bMCGI3rFkTias87Oj0C67k4U+WnisdUAT7m7ljZ67aXa2IpSSExQ/Ii
	LejFmVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwYl-00000006dSb-0qQO;
	Thu, 23 Oct 2025 14:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwYj-00000006dSQ-3qaC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 14:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z7A5STg+v7+M98RaWbVd1lgwgdjB6XtkDPplIdfPqWs=; b=igB8UbZZ/jSlBOjgvs40DNh/+q
	lfGKVbX4toIlzZ6LUInugYrg/E42p3MEH9RneVAJE7uEP9Hy3Iu6LtDoDIApxt8avtS6ECYlCp+g7
	lDsjLbgaWAcozvZAD7ss4EIUj9r/R6faUa/Lm6OhPScTBxubOWr/wO4IJFjT3+RRW0yQCtmmTWBea
	DmarTpQWKQheWrA/ssSbAJmqseqjoYQ7ljAxoYBuyhpVu1AsXeJWWjWLUYO6z6xZdk5s0539ZLEni
	G17dNdNjoTIslRQFvcG1e4I7gVLQARJXJzVzqWpte62VD+tbxlytHrtuivReHg8JddABL4P1t4Iag
	bjVQ51BQ==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvh2-00000001QJE-0Mar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:49:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a27f2469b8so15089b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230692; x=1761835492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7A5STg+v7+M98RaWbVd1lgwgdjB6XtkDPplIdfPqWs=;
        b=XJ/Ao4aI6f+1u9T9cDw07TLpTczsrv9g5J9/3bv47lcB85tZddIBpDKZ2HFJgDIdNH
         hEt/TJ3Xnoxt7tk5MWafZWBhTn9lTLYr8KVyOYJnH8fdN7UUpwrzVwDNXph+LMV6LGWi
         A8fRKJ1+OU6tOoI//aY9jW5VQntDP3Toemeo/YPzawlx2kuWr/65w6WwKAd8B8EDUFOZ
         9xNmMHm+egwZVWZfpXYgXsK9jXZ84FzNXNrQZGZPXcalea4icZ8SbLcPXWJZEJuKXPmf
         1S/evHyHAAfhwJPX7Jl8vcXP8sWaZO2F6uxnl0eO5BNNDleULDT5i7DNLXrlKunjhs5M
         LDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230692; x=1761835492;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7A5STg+v7+M98RaWbVd1lgwgdjB6XtkDPplIdfPqWs=;
        b=enu2UHi//5tgajSxO5cSNASRgbiS/7zWdvVqfxP2BHnux4sf7H3/9rorzVybzpXnvL
         r9k9af2IPJ7sUe/K1TEX1CRqavtUCEwNpIBgEY+Wxp1jrkHPpPjwDg7krJKUKFORF10Z
         CAikYEt6n/VQ6w6Lb7fpDrvB8wan/U6hI8loyOovOP3FpS7R939XlU0wXZR1M8NQbTmv
         9X6BQdInzJO4eBLk3Dqf4ekCzEms8nO4cRy6stYbaCwNAAprUE67mIj1ld2R2F1UnVNW
         T7pNG5t0gv4Cla3thOk1t8r4w3k1OqJTEHXbpQ2a4dlRtJBDblYkVWdqmwnyvcoPVlu9
         /RrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0djZZwErwSDjt49kRrCAySdVf7ubHXr0Z0ncJLYGSOEVlS5PAzlkmmXen9DbFSTPhfVaOi4JEIYUVXK9VVgyS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd972ZlGrJaSVH7/bdlKtmr8rdGYf2YSJvPeN0QuvsnOnrbv5i
	gfmMxIPIv35oFBhfYSiYttkzCQrUAab0EUD3cIhaB6/m8FFRQBBb35/I
X-Gm-Gg: ASbGncvgdSmg8+v7jyCPqeEbPK2DvzRflQcJUWKRClML5+lrfKVhXkpMT7fIIhQTyZG
	yZxctMi5v8QZNU+OeuEeX9L8hzVTMlsNNC+PQR821wcc0GUic33iErtjSvpoDqkBbdw3VdIJ3Jc
	ttcRnDcapwG1Ym+eU/7/gY8+bAl1OcEX8UeO2xlDogiIIkR977PUoC3dbkNlCTtXdfKLXMVeqRk
	RyVPGXMVxZhtpqTDWOJbqDbhKNm1iygcM1iQIaU8esKrX1S3UAJGfwH7gs7jJIAhcYQb8XNMfm1
	Sz/MsWCEVDiNh4MCE4q1g/RxDk5jm2WO6l4f3ndj2B4pKVhxGSAOTvXdyKhaSxXtKxijws1XFDY
	rlCHhhPGOlA25yfAlC1ww3TElSyIlJlZj5jlRjj2hsWtLUZmgMD770MO4xzorI/mev5PFeuCb89
	LnHll7ArAmNn0cCYcEA6msmZA18/nwY0fn
X-Google-Smtp-Source: AGHT+IGug+cluxOUq0HAqc382+2RbJPtSE3MYuJbYfvni05jZVEd26sYnhBkfVlR88Cf13K3xjU5VA==
X-Received: by 2002:a17:903:94e:b0:26a:3c75:5241 with SMTP id d9443c01a7336-292d3fcce91mr74013375ad.9.1761230692165;
        Thu, 23 Oct 2025 07:44:52 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de15fc6sm26181005ad.42.2025.10.23.07.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:44:51 -0700 (PDT)
Message-ID: <d092101f-76d4-439e-a17c-b92c46e99ce9@gmail.com>
Date: Thu, 23 Oct 2025 22:44:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
 <87wm4l3dh8.wl-maz@kernel.org>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <87wm4l3dh8.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_144928_157351_5C40E094 
X-CRM114-Status: GOOD (  18.19  )
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

On 2025/10/23 22:21, Marc Zyngier wrote:
> On Thu, 23 Oct 2025 13:01:52 +0100,
> Yicong Yang <yangyccccc@gmail.com> wrote:
>> On 2025/10/22 22:33, Marek Vasut wrote:
>>> On 10/22/25 4:20 PM, Marc Zyngier wrote:
>>>> On Wed, 22 Oct 2025 14:35:28 +0100,
>>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>> The AMU configuration register access may fault and prevent successful
>>>>> kernel boot. This can occur for example in case the firmware does not
>>>>> allow AMU counter access from EL1. Guard the AMU configuration register
>>>>> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
>>>>> Kconfig option is explicitly disabled. Other interaction with the AMU is
>>>>> already guarded by similar ifdeffery.
>>>>>
>>>>> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>> ---
>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>> ---
>>>>>   arch/arm64/mm/proc.S | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>>>>> index 86818511962b6..123538ffeda6b 100644
>>>>> --- a/arch/arm64/mm/proc.S
>>>>> +++ b/arch/arm64/mm/proc.S
>>>>> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
>>>>>       ubfx    x11, x11, #1, #1
>>>>>       msr    oslar_el1, x11
>>>>>       reset_pmuserenr_el0 x0            // Disable PMU access from EL0
>>>>> +alternative_if ARM64_HAS_AMU_EXTN
>>>>>       reset_amuserenr_el0 x0            // Disable AMU access from EL0
>>>>> +alternative_else_nop_endif
>>>> Why?
>>>>
>>>> We ensure that the AMU is available in the macro itself by checking
>>>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>>>> the offending sysreg access. This is similar to what we do for the
>>>> PMU.
>>>>
>>>> Does your HW advertise an AMU, but doesn't actually have one?
>>> The hardware does have AMU, but it is currently blocked in old TFA version and access to this AMU register here causes a fault. That's why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and the AMU access is made available on this hardware. But even if I do disable ARM64_HAS_AMU_EXTN=n , I get a fault.
>>>
>>> This patch is mainly meant to prevent a surprise in case someone does set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register access.
>>>
>> then I think it's more proper to guard it with CONFIG_ARM64_AMU_EXTN
>> (I think you mean this above?)  rathter than the cpu cap. then with
>> the patch kernel won't touch the AMU registers here if the kconfig
>> is disabled on you AMU supported hardware and AMU unsupported
>> firmware.
> No. Not preventing EL0 from accessing the register is a data leak to
> userspace. This must be acted upon irrespective of the kernel being
> AMU-enabled or not.
ok got it. so this is a security concern to ensure EL0 access is disabled on AMU supported
hardware even if the kernel support is not compiled in. thanks for the explanation.

thanks.


