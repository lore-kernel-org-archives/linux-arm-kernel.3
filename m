Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98281CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygVK7PPX7sJIICzV5JhCjyvebdnrlwk5X1BS1henDE8=; b=U7J2+LKymq8ZP0vEy1VNfwIaxv
	gdS9JO2/Tr4LTNQY2OD0xgF0feHxtT6P8HAUD2KC+vE3rZS4WVeXB/k1q9f8XwM3q/AegEjCOo4HC
	RovJrWvosc3QdkIQUBwAcyHCOljP7CvR6x3u+/hXI3CYOvu180c5JBwLHWqNcX6b+BdF9mVSiMzBa
	T0P2YlI1m+E0EdZ9VmUMe9+k3aHcd2/7jBAwAXlC3KFO3EXq0OkscV3YG0Px9kqVXMB8EMvP+rdm7
	HOfM3cMZkxUQzjA/uvY0jM+RmQTbG9axXmpQBFqMbrlFPCkwAvk2/EfuF1DYKMzqHC+Atpq1lDLE1
	Eh2iqOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAjM-0000000ES8d-3TIz;
	Wed, 27 Aug 2025 07:38:04 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAga-0000000ERTT-435N;
	Wed, 27 Aug 2025 07:35:13 +0000
Message-ID: <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
Date: Wed, 27 Aug 2025 00:35:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@outflux.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Rutland
 <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250827013444.GA2859318@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 8/26/25 6:34 PM, Nathan Chancellor wrote:
> On Mon, Aug 25, 2025 at 03:31:34PM -0400, Kees Cook wrote:
>> On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>>> On Mon, Aug 25, 2025 at 5:35 PM Kees Cook <kees@kernel.org> wrote:
>>>>
>>>> Yeah, that's a good idea. What the right way to do that?
>>>>
>>>> config CFI_CLANG
>>>>         bool "Use Clang's Control Flow Integrity (CFI)"
>>>>         depends on ARCH_SUPPORTS_CFI
>>>>         select CFI
>>>>
>>>> ?
>>>
>>> I don't recall what is the idiomatic solution for renames, but I
>>> remember Linus talking about this topic and about avoiding losing old
>>> values if possible (perhaps getting a new question in `oldconfig` is
>>> OK as long as the `olddefconfig` respects the old value).
>>>
>>> I think your suggestion above will still make it appear twice in
>>> `menuconfig` -- there may be a way to play with visibility to make it
>>> better.
>>>
>>> A simple possibility I can think of (assuming it works) is having the
>>> CFI symbol for the time being introduced just as a `def_bool
>>> CFI_CLANG` for a few releases so that people get the new one in their
>>> configs.
>>
>> Ah, I think this works:
>>
>> config CFI_CLANG
>>     bool
>>
>> config CFI
>>     bool "...."
>>     default CFI_CLANG
>>
>> I will add that for v2.
> 
> That does not appear to work for me. I applied
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index c25a45d9aa96..0d3ed03c76c2 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -876,8 +876,12 @@ config ARCH_SUPPORTS_CFI
>  config ARCH_USES_CFI_TRAPS
>         bool
> 
> +config CFI_CLANG
> +       bool
> +
>  config CFI
>         bool "Use Kernel Control Flow Integrity (kCFI)"
> +       default CFI_CLANG
>         depends on ARCH_SUPPORTS_CFI
>         depends on $(cc-option,-fsanitize=kcfi)
>         help
> 
> on top of this series and
> 
>   CONFIG_CFI_CLANG=y
>   # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS is not set
>   # CONFIG_CFI_PERMISSIVE is not set
> 
> gets turned into
> 
>   # CONFIG_CFI is not set
> 
> after olddefconfig. CONFIG_CFI_CLANG has to be user selectable with a

Could/did you test with 'oldconfig' instead?

olddefconfig is going to use the default value from the Kconfig file,
which if CFI_CLANG which is undefined/No/Not set.

oldconfig will use the old value from the .config file.



> prompt but the only solution I can think of at the moment results in a
> duplicate prompt for Clang.
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index c25a45d9aa96..93bf9b41a9de 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -876,8 +876,17 @@ config ARCH_SUPPORTS_CFI
>  config ARCH_USES_CFI_TRAPS
>         bool
> 
> +config CFI_CLANG
> +       bool "Use Kernel Control Flow Integrity (kCFI) - Transitional" if CC_IS_CLANG
> +       select CFI
> +       depends on ARCH_SUPPORTS_CFI
> +       depends on $(cc-option,-fsanitize=kcfi)
> +       help
> +         This is a transitional symbol to CONFIG_CFI, see its help text
> +         for more information.
> +
>  config CFI
> -       bool "Use Kernel Control Flow Integrity (kCFI)"
> +       bool "Use Kernel Control Flow Integrity (kCFI)" if CC_IS_GCC
>         depends on ARCH_SUPPORTS_CFI
>         depends on $(cc-option,-fsanitize=kcfi)
>         help
> 
> Maybe that does not matter for the sake of keeping things working?
> Otherwise, we could just keep things as they are with the patch set and
> expect people to actually use oldconfig or diff the results of
> olddefconfig (which I think is good practice anyways).
> 
> Cheers,
> Nathan
> 

-- 
~Randy


