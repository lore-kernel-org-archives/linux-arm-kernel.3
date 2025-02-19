Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFF6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 06:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMweWeNSzeI1MWtj+pEFAXNqqqyma+C3FI/z06gKBZ4=; b=bx56aptIB+q/LtShuJhRrBXTiR
	QIWJCcx/b//5bcwrxEdgqmKLf6onDxqW2DzlKjvURQM+umO/pjMf9rmTbAoxywdla6J8VGGkulOY0
	WoAgkK/yGPzxCEi9q/37n953rOVYjukumfCLp0ZfmHJP0OUoKWgkZk2k9hvLDhEE/N2ptU5aDhdcL
	tFeupCOFW2/XHL3uiIdCsR/nTpa5meU2XHZx9GGSDyrvVZOtbDbXAQ1gHSd/uvTM2n9W3CaFRvK2Y
	dC9C+i30DpsmLdbsZgTzmZCvLe8qCHrY8WQfw1nXdqHQ8wPoI5SWb3irKyp/twkelL40k8lw6+I4Y
	oPwElsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkdGO-0000000B0Ba-3GSQ;
	Wed, 19 Feb 2025 06:08:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkdEu-0000000AzwM-2KOa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 06:07:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f2339dcfdso8000605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 22:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739945239; x=1740550039; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MMweWeNSzeI1MWtj+pEFAXNqqqyma+C3FI/z06gKBZ4=;
        b=W882FkBWDXyqRUzvANP+rEn7p0/jvoU5AHMNHepMi5fK6rvRxb6eXr6I4buRzxu4IQ
         ElXN4ZBngXSV9LwlhHxSKZuhUNqrPQRB7QnDn5O1JpI4QMF1cM7hiOpbNc9pJDEskSae
         mbmIUCXUvZrtOEotRkE7yiwbuacOkrJb2D2L7SdbOkqe8AXe5V5QjNGhgcMRrSixKPFZ
         Kc0SbQq96h4VnCollzxVlmxpZTMXmsQqP75aeN6c0We7CH0NxqIGGByw2/5ob85okgW/
         Dfm1OTFx/1fEkUfAET4lbPD3y06LVbBol1Mohq/+FEDR6BC9BHGZxEUxUhxN0G/ELlDq
         iN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739945239; x=1740550039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMweWeNSzeI1MWtj+pEFAXNqqqyma+C3FI/z06gKBZ4=;
        b=qO5kORg4QDowUjRoPJdKz8iiX3QjZ3EY/NJOKxB3hZlJQ9J3sEsxdxtoqznBB1Z7hI
         UVEQtQAJDUu4VfTX9wNDgA0v5za8y/UMuv7PFSsTsEWtrLaFZTdatap9PT/Yp2MryC/a
         GZS6DJrpdy9mn7ZIhYQYFCRzuV+Yx6p9pj+bjgOfyb7eiD1veEiA7+9oAi2nSdFQmoeL
         fXDGN9OTurpSfZMsajxxYJvfyxuqn8fDVQaoZ3OCk/LfXw6V3xJk5NaqAiNvb6CNiIDT
         ml1pHQz7LyyJ9DR40N8laP3FAKvhf8qhsJnRMTXzc5zFjSKb5pYDncKk5TWfIG0p6yD1
         3VjA==
X-Forwarded-Encrypted: i=1; AJvYcCX0RkjZCVWWlY1M1MHkDaqNFjPVbADKZx6s6yFWY19OuoSoA8BaMU1ohdIbng1/NerfwT+ek8X5ik+7vUkaRlrc@lists.infradead.org
X-Gm-Message-State: AOJu0Yylw92roeV2rpN3AbKh/k1OUq0SmWllCAJjyXP+UM6rmg11zqAy
	8J34ifeUQM5U2mBcNwN91I17JAZeNI7oRjsghB3tQQXPGgIuCyrl
X-Gm-Gg: ASbGncubOEdHN1X83d5jaDzbHlWsLa2koD9t/AlptFPP2E8RqsA7MBYA0r97rLcOcyP
	/LCjn6L/GdBjYtUUEmPojarTARv5wtUVIgFyL+KlR2JMUfmDJmPOvlndnt9dATH8gqO161oOm10
	JCl5ll1/ZuAgY6B+VWqmW/SG0SJE/nHkt1dXbKkMZyZR+AWtupr9++VFBzTd2yjpjbAkVTv84kp
	XWD4168Eb23FzZgLsPUQiReliEVnR11vzy8c0odK/qKrLUJdF0gaLVHTYYCJ4B9S25YTT+kqfvi
	BuXH4xDHrKlS3Vr/5HvhPXky7KbsJYjL2XDjxRW8puSYscmklX5sOKhDh8TNrbGo
X-Google-Smtp-Source: AGHT+IFDDkfL+/p8rzt9E4xU1vtBKwXwGcdJQ1cGVlgttlla+I+hR4jexAvPi61qQULzGxFmQbFgbg==
X-Received: by 2002:a17:902:fc8f:b0:221:751f:cfbe with SMTP id d9443c01a7336-221751fd1f5mr30886355ad.19.1739945239041;
        Tue, 18 Feb 2025 22:07:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349226sm98602605ad.24.2025.02.18.22.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 22:07:18 -0800 (PST)
Message-ID: <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Date: Tue, 18 Feb 2025 22:07:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_220720_594939_927FD714 
X-CRM114-Status: GOOD (  24.89  )
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

On 2/18/25 19:41, Heyi Guo wrote:
> Hi Guenter,
> 
> Thanks for your comments.
> 
> On 2025/2/18 13:33, Guenter Roeck wrote:
>> On 2/17/25 19:16, Heyi Guo wrote:
>>> Aspeed watchdog uses counting down logic, so the value set to register
>>> should be the value of subtracting pretimeout from total timeout.
>>>
>>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>>
>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Joel Stanley <joel@jms.id.au>
>>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>>> Cc: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
>>> index b4773a6aaf8c..520d8aba12a5 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
>>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>       u32 s = wdt->cfg->irq_shift;
>>>       u32 m = wdt->cfg->irq_mask;
>>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>> +
>>
>> It is unusual to use a register value here and not the configured timeout
>> value. I would have assumed that pretimeout is compared against wdt->timout,
>> not against the register value, and that the multiplication with WDT_RATE_1MHZ
>> is done after validation. This needs an explanation.
> It was supposed to be a straight-forward way to check if the pretimeout value is supported by the hardware. I can change to wdt->timeout if it is better.
> 
> Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we restrict the pretimeout to be larger than wdt->timeout - max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - (timeout - pretimeout)).
> 

The kernel internal logic should handle that. If not, it needs to be modified/fixed.

>>
>>> +    if (actual >= reload)
>>> +        return -EINVAL;
>>> +
>>
>> On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
>> and with it the validation in watchdog_set_pretimeout() does not work for this
>> watchdog and why this extra validation is necessary.
> 
> watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, but we can't determine the hardware pretimeout value if timeout == 0 here.
> 

Sorry, I don't understand what you mean. If watchdog_pretimeout_invalid()
returns false if timeout == 0, aspeed_wdt_set_pretimeout() won't be called.
Why does that preclude depending on it ?

On a side note, I do wonder why the driver accepts a timeout value of 0 seconds.

Guenter


