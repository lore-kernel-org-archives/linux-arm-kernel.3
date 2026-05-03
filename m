Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D7BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 21:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61ClowtrPrAEEqaUh93uzcQRo5B4kyUv1BbuM79gSI8=; b=UtOOl/zVrmwuLoncMdXilLLaF0
	B3LpzkAJYHxwLWxV6sAzcYEBmlBqLoH2+Z5hmydvZ1Aw4kE6iIqLBizD144gUjWCa9l6DraiM+AZL
	u58UFBkIfTFD2br0LiwYcNnoc5v1FK9DkPzrszhSMZnfFH7X8xt90lS+v7XhMMSdwtaLYllV6qSYQ
	fyfjk2QHO6DqtUIJ+0STC2wDhk14reDzr8ScLm7Yr88+Pnv+ghVf/BLfdLskIJKU4zhOlLD3X8cmO
	0yNw6BWFwJjv+5V98Pa6e6RcwLADlgGXV6GFTeBmeXIUWSq4/9GyFM/XW3NjwSspdMQoukOb//Pzl
	g8S+A8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJe7T-0000000BkIX-1fQr;
	Sun, 03 May 2026 21:12:55 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJe7R-0000000BkHo-3YFQ;
	Sun, 03 May 2026 21:12:53 +0000
Message-ID: <b52d5383-dd57-4bbe-a6cc-fd584cf68957@infradead.org>
Date: Sun, 3 May 2026 14:12:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: kprobes: add missing MODULE_DESCRIPTION() macro
To: Arnd Bergmann <arnd@arndb.de>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com>
 <3808c973-1315-420c-900d-122a73a34f9e@quicinc.com>
 <05cacd03-686a-4ede-b485-7f4781f69b99@app.fastmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <05cacd03-686a-4ede-b485-7f4781f69b99@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Arnd,

On 7/19/24 4:28 AM, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 21:53, Jeff Johnson wrote:
>> On 6/22/2024 9:34 PM, Jeff Johnson wrote:
>>> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>>>
>>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>>  arch/arm/probes/kprobes/test-core.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
>>> index 171c7076b89f..6e9041a76b8b 100644
>>> --- a/arch/arm/probes/kprobes/test-core.c
>>> +++ b/arch/arm/probes/kprobes/test-core.c
>>> @@ -1664,6 +1664,7 @@ static void __exit kprobe_test_exit(void)
>>>  
>>>  module_init(run_all_tests)
>>>  module_exit(kprobe_test_exit)
>>> +MODULE_DESCRIPTION("ARM kprobes test module");
>>>  MODULE_LICENSE("GPL");
>>>  
>>>  #else /* !MODULE */
>>>
>>> ---
>>> base-commit: 563a50672d8a86ec4b114a4a2f44d6e7ff855f5b
>>> change-id: 20240622-md-arm-arch-arm-probes-kprobes-34037098a2c3
>>
>> I don't see this in linux-next yet so following up to see if anything else is
>> needed to get this merged.
> 
> Hi Jeff,
> 
> The arm tree uses a separate submission system for reviewed
> patches to get into the tree, see
> 
> https://www.arm.linux.org.uk/developer/patches/info.php
> https://www.arm.linux.org.uk/developer/patches/section.php?section=0
> 
> I looked at this file as well during build testing
> and ended up combining the change with a cleanup,
> If you like, I can send my version instead, see below.
> 
>       Arnd
> 
> diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
> index 171c7076b89f..0c6639509eff 100644
> --- a/arch/arm/probes/kprobes/test-core.c
> +++ b/arch/arm/probes/kprobes/test-core.c
> @@ -1650,24 +1650,16 @@ static int __init run_all_tests(void)
>  
>  	return ret;
>  }
> -
> +late_initcall(run_all_tests);
>  
>  /*
>   * Module setup
>   */
>  
> -#ifdef MODULE
> -
>  static void __exit kprobe_test_exit(void)
>  {
>  }
> -
> -module_init(run_all_tests)
>  module_exit(kprobe_test_exit)
> -MODULE_LICENSE("GPL");
>  
> -#else /* !MODULE */
> -
> -late_initcall(run_all_tests);
> -
> -#endif
> +MODULE_DESCRIPTION("Test code for ARM kprobes");
> +MODULE_LICENSE("GPL");

What happened with this cleanup patch?
I don't see it on a mailing list or in linux.git or linux-next.git.

I was about to come up with the same patch since it still seems to be
needed in linux-next-20260430.

thanks.
-- 
~Randy


