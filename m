Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A7D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5elQBFEHbJlxFLK/U8geAkzp/tbJO8V9jLQWafGrL4=; b=PJ53jvhdsZl1NJzaHK266F45al
	c51FFELv8obvqi375D7fINfrqCPwHWrX+03zgBw8rEZpyUB0EDu+/r/okhG9GZDd5UgjXVkWdaHMi
	ZYXtDzZsnk4Yz+3CNv0U4iiUAbJy0BVj9Glrx3R/e9mgPl3juQjTcx6W0glkWM6fsWjOIJnZ8hgGJ
	eR3lz6Hm3z8bPV8Mo2zlE3OMx/df6NOBGueOAtvTKCYQom1WLq3d61XBs8+16hDDEC2xmSHnF/atx
	6UEtYJcl1rPtrxF4zSkhvDpnl73o+qZUfc1xNLcCotqkKAeg9sxnQY4C3zoRq3iRjoKcjVeTozlvr
	OL6zm6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1Sd-00000003lgR-0URu;
	Fri, 15 Nov 2024 18:54:27 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1Rg-00000003lXS-3yYP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 18:53:30 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cbcc2bd800so18222366d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 10:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731696806; x=1732301606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5elQBFEHbJlxFLK/U8geAkzp/tbJO8V9jLQWafGrL4=;
        b=c5zc3F7yBTVn7+4hFgitW7RhOgjwplvEUHdMQSLmlRx6dMH0L8Fx/GPVrA3mi77yEU
         6ul4ygTx6gM0XvW2Ch15/m1aPGqW77ZWwcKoePWu5znK/Qdt9qvyYClfJlGrkjEQPRTR
         Gme4vDv7aCYKs0+zNfL9rhS8KYYWb/dh4H6AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731696806; x=1732301606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5elQBFEHbJlxFLK/U8geAkzp/tbJO8V9jLQWafGrL4=;
        b=hJ2uDQW+BK3rNefGHkthJwSyFEs55AISQuqk6CWIs7y00lDmR0NsIe2df8+dPqgh5N
         1YJcmCOtpo+qfGV96BS91STjE+w6kzwPXdGw0Fn2m5RrH0uFk1brY2YXSlCXrjjndu2R
         whklQNYzlKs2p5/uizRW4FxagaTzC2eZqA18DfZtjBQY4yL/QLy0UWZP39Rx7QsJ3jIq
         I1LI54yvv+bVxl9DpE1fZZtlbESD6GA22flOwsZm+0mHcyWBA43nAv+tXQm8kopoI0k8
         ZA1mGl0ElMpSCziz4E/RNpAFnI7sJUds6sIDShULfRK5DE4SE53iDWO2ymO8mIjGLsPA
         MGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuABsSDvnAnSfPPhnoZxhLGn3bZ8Ij6ld2Qdu9n7duOroO01E+RTuc1BioTxRa/vVJ7dbgGLuvVo5aQEDWe9Sp@lists.infradead.org
X-Gm-Message-State: AOJu0YwNnGZfBfOkxdACfGHgZK3hkVjDXV+hSgtbLO1JE2jK0LI9/JyT
	WceZw6biZPZnSgenJ0JR0Nl4+RnkTc1Sfe1J0n2gCWm77hXu/1Z+//VkGtmxsA==
X-Google-Smtp-Source: AGHT+IENzcn3L8l6GMiTpIvz1WW2qSAUSbXEx7SiZS3NLUHADjwn+UVn3VsP/poiLGJW1U8cFqG/Aw==
X-Received: by 2002:a05:6214:4988:b0:6d3:8e50:65cf with SMTP id 6a1803df08f44-6d3fac951d6mr67538556d6.20.1731696806055;
        Fri, 15 Nov 2024 10:53:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee773205sm20958426d6.16.2024.11.15.10.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 10:53:25 -0800 (PST)
Message-ID: <3cd75897-df45-4938-9d19-60df062a5b9b@broadcom.com>
Date: Fri, 15 Nov 2024 10:53:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Elliot Berman <quic_eberman@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Andy Yan <andy.yan@rock-chips.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
 <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
 <ZzdOOP0KuMMdo64W@lpieralisi>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <ZzdOOP0KuMMdo64W@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_105329_083467_5B7D2237 
X-CRM114-Status: GOOD (  21.21  )
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

On 11/15/24 05:35, Lorenzo Pieralisi wrote:
> On Wed, Oct 23, 2024 at 09:30:21AM -0700, Elliot Berman wrote:
>> On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
>>> Quoting Elliot Berman (2024-10-18 12:39:48)
>>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>>>> index 2328ca58bba6..60bc285622ce 100644
>>>> --- a/drivers/firmware/psci/psci.c
>>>> +++ b/drivers/firmware/psci/psci.c
>>>> @@ -29,6 +29,8 @@
>>>>   #include <asm/smp_plat.h>
>>>>   #include <asm/suspend.h>
>>>>
>>>> +#define REBOOT_PREFIX "mode-"
>>>
>>> Maybe move this near the function that uses it.
>>>
>>>> +
>>>>   /*
>>>>    * While a 64-bit OS can make calls with SMC32 calling conventions, for some
>>>>    * calls it is necessary to use SMC64 to pass or return 64-bit values.
>>>> @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
>>>>          return 0;
>>>>   }
>>>>
>>>> +static void psci_vendor_sys_reset2(unsigned long action, void *data)
>>>> +{
>>>> +       const char *cmd = data;
>>>> +       unsigned long ret;
>>>> +       size_t i;
>>>> +
>>>> +       for (i = 0; i < num_psci_reset_params; i++) {
>>>> +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
>>>> +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
>>>> +                                            psci_reset_params[i].reset_type,
>>>> +                                            psci_reset_params[i].cookie, 0);
>>>> +                       pr_err("failed to perform reset \"%s\": %ld\n",
>>>> +                               cmd, (long)ret);
>>>
>>> Do this intentionally return? Should it be some other function that's
>>> __noreturn instead and a while (1) if the firmware returns back to the
>>> kernel?
>>>
>>
>> Yes, I think it's best to make sure we fall back to the architectural
>> reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
>> since device would reboot then.
> 
> Well, that's one of the doubts I have about enabling this code. From
> userspace we are requesting a reboot (I don't even think that user
> space knows which reboot modes are actually implemented (?)) and we may
> end up issuing one with completely different semantics ?
> 
> Are these "reset types" exported to user space ?

AFAICT, they are not, but arguably you already need custom user space 
which is capable of doing:

syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
LINUX_REBOOT_CMD_RESTART2, reboot_cmd);

in order to utilize the custom reboot mode. I could imagine that with a 
discovery mechanism, a wrapper could be written to check that the 
specified command is actually supported before issuing the system call, 
or even have the system call do that under the hood.

I don't personally feel like this is very important in the sense that as 
long as a fallback exists for an unsupported reboot command specified, 
the system does reboot.
-- 
Florian

