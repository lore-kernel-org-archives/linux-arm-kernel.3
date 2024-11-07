Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989E0D5D688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbJO3dbXNpQnR3iJHZxSHK7iyUPlFTSlGwkLGcjOHeE=; b=QI/16XLiWFjPq4ezLCHXp8HPZ9
	jofNruWzP0r534y+COH7s9vBBXFwoiAWsvHHH9lZBheesYNblbyMXhcTBuuySLCoEfLzUTAFYRqjG
	k1WKPM9vzr3731niGXdadj9udx1F27H/6V244mHr3sC69l2f+/KbRrznLP21MBT0Rw1tDYC8lfFfT
	hnUIzua5NLzde7qC2Vv7Kw2ZjxBqPpsCWqZzqHpi3LOQdtb8HVIu/nl468xsky11S6zHcidhPWyKD
	mxgmBaB29zdEiGoWI6OYWRPerYCfpC/e2XrEcOtWp7i8rkxghhFWbhcgvpd4OS1eXIUl87t/2l4cN
	d1Zc48qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A2s-00000008PVy-1RCN;
	Thu, 07 Nov 2024 21:28:02 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A18-00000008PPF-1aXT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:26:15 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-83a9ca86049so54253839f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731014773; x=1731619573; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbJO3dbXNpQnR3iJHZxSHK7iyUPlFTSlGwkLGcjOHeE=;
        b=A37l5SaoZN9W4j3wRxj4r52zCXGKFoa7H2Hy9zdAE8SvQCLElT4Jg7YVI2Q7aVNTlU
         chYJxVtSyz3Xka0FU8mioaKGAMTlqh9jR5fvPjBD1nmAq5q2IZIo4UZBn0tGgFnXSdOM
         hdyZFN6c61XCq1rxYAHL4t9mbbNgpNuPVijes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014773; x=1731619573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbJO3dbXNpQnR3iJHZxSHK7iyUPlFTSlGwkLGcjOHeE=;
        b=NDZmjtq3wLX3WkurUg4345fvgMYS3H9EH4/0lOjfZUwwGEL2k+Ggv7bF7u7WZjl9f4
         uhOes4FbdhMsxomTHIzVsC3pfBTh3pg0+8y3PRgkgbcO3GBGx5QeI8NwepbGuNg4NvcE
         Lm0KXtyS+/oDZZsoLJR3sqZhUG8kglifkP0g84vubq+H/2Bc+bN+3sJ5X7vkB8HuvKGu
         1xcsMUD14Oi2atRZoovAWw+MZw+QjfIXQWYav5FCWCRWQ5Grdg4h/BXn1EWcePbAPZi3
         wafxrTM5HSoHE8H1Oe21w8Zppa+Fwe4kTFx8SWv6qmzivp5zjVX0a8rNeTwC1AN6s0A1
         U39g==
X-Forwarded-Encrypted: i=1; AJvYcCUcNluWpuhof76lxDWmuqpqbKtlMjgU00hgS34py/WhXJbcNZPV288jufUmCCxhq3ZVrD3WH/HuvNdxyUkrSmIM@lists.infradead.org
X-Gm-Message-State: AOJu0YzWuOnKe1l7d4EuNXgFj003uTuWuvNuG9U8/E+op+wD4x8O5NXC
	egOQVRfBL81BtJdgrpXmWvzMTqgYWQxnop2OcPdNGxlV8Y2lJg0PYN9enRmDqkc=
X-Google-Smtp-Source: AGHT+IGv1W0IBGbUb1SRVApID2NMF4i/V9ewtBGRHdjk7cvd+POlTLdWckQhOcqpxXqpRi1WIif7Yg==
X-Received: by 2002:a05:6602:13c1:b0:832:480d:6fe1 with SMTP id ca18e2360f4ac-83e03069279mr58064539f.0.1731014772676;
        Thu, 07 Nov 2024 13:26:12 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83df50670fdsm48482339f.23.2024.11.07.13.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 13:26:12 -0800 (PST)
Message-ID: <50f87b47-e326-4e87-a1d4-cc24ea70f432@linuxfoundation.org>
Date: Thu, 7 Nov 2024 14:26:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Define PKEY_UNRESTRICTED for
 pkey_sighandler_tests
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, dave.hansen@linux.intel.com,
 yury.khrustalev@arm.com, will@kernel.org, linux-kselftest@vger.kernel.org,
 Aishwarya TCV <aishwarya.tcv@arm.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20241107131640.650703-1-kevin.brodsky@arm.com>
 <96cc8ce1-1f64-45d5-8567-eb2adba1b47a@linuxfoundation.org>
 <Zy0AQnqIWRM8s9kb@arm.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Zy0AQnqIWRM8s9kb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_132614_477257_52D4831A 
X-CRM114-Status: GOOD (  18.84  )
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

On 11/7/24 11:00, Catalin Marinas wrote:
> On Thu, Nov 07, 2024 at 09:50:20AM -0700, Shuah Khan wrote:
>> On 11/7/24 06:16, Kevin Brodsky wrote:
>>> Commit 6e182dc9f268 ("selftests/mm: Use generic pkey register
>>> manipulation") makes use of PKEY_UNRESTRICTED in
>>> pkey_sighandler_tests. The macro has been proposed for addition to
>>> uapi headers [1], but the patch hasn't landed yet.
>>>
>>> Define PKEY_UNRESTRICTED in pkey-helpers.h for the time being to fix
>>> the build.
>>
>> What does mean to say "time being" - can this be removed in the
>> future. If so please add a FIXME so this define can be removed
>> later.
> 
> There's a dependency on this series:
> 
> https://lore.kernel.org/r/20241028090715.509527-2-yury.khrustalev@arm.com/
> 
> Which I did not notice. Typically the uapi patches are picked by Arnd
> but first that series needs to be reposted with the comments addressed.
> 
> I think for now we either merge this fix from Kevin (happy to add a
> FIXME comment when applying), change the kselftest to use 0 instead of
> PKEY_UNRESTRICTED or revert the top two patches here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/pkey-signal
> 
> I'm fine with all options really, it's not essential that we get the
> kselftest patches above merged in 6.13.
> 

I am good with taking this patch as is with a FIXME to cleanup
later.

thanks,
-- Shuah



