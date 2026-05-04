Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D34CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WVzZ9GmbB+FVObMpzZGUB3oQElcwYh5kIlgy1BGmtU=; b=HJoslu1fOle4HSytoNimSDGbeY
	u9Wr6AGJPUHEUnmzMGW7hl+53qtclcxGbrf6ICkeVYj5AZf8f0DMvFmN2dAWjBt60sG2oRbkLLs6I
	LhrGtdjJnEZERPZUT4sVuFmNFlqD3b4lPdZuhrJ09tUqEOakoPJ9NRHJXUTK+ZDbCt5LAszuLqQri
	c+C9IOytHgVq/tWR7Ol7ANU7058Y/Z3UQSAJZNYY+v4DYIFq3zEYB8Trv1OmJacInWV7Hi+CRLBQm
	tjIwuepQxe85Kgp/FK3nLJpbyzIHXSt33eEmCgPK9EYzbl6Z2Jyp7puT48lSTGL3HkeC/BNd8RSIp
	3V61atyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwXx-0000000Dlkh-1FKP;
	Mon, 04 May 2026 16:53:29 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwXv-0000000Dlk3-0cfq;
	Mon, 04 May 2026 16:53:27 +0000
Message-ID: <ed5b40f7-9250-4550-bcff-e2be9bc2159f@infradead.org>
Date: Mon, 4 May 2026 09:53:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: kprobes: test: add MODULE_DESCRIPTION
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260504065957.2040055-1-arnd@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260504065957.2040055-1-arnd@kernel.org>
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



On 5/3/26 11:59 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All loadable modules must have a description, and since commit
> 6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()"), the kernel build
> warns about it missing:
> 
>    WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
> 
> Add the missing description tags. Noticing that the existing license tag
> is unnecessarily hidden in an #ifdef section, remove the #ifdef and
> use conventional placing of the initcall and module_exit tags as well
> as the license and description.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/arm/probes/kprobes/test-core.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
> index 7a2baa135f0f..2de28088dac8 100644
> --- a/arch/arm/probes/kprobes/test-core.c
> +++ b/arch/arm/probes/kprobes/test-core.c
> @@ -1649,24 +1649,16 @@ static int __init run_all_tests(void)
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

-- 
~Randy

