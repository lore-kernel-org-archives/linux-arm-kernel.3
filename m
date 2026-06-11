Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB87CCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzHuIpFbYrCgFwipPgG7Z1jCCHIP4pv/lJwgbnEmeHI=; b=mYMx6ex7q/rcOSu3W0SYnhv23t
	eEF+B0LLOGKlNi1hyxAMi7uRsyM5G90a+OMqa147HXGG5Uv/K3FU15dlGpwJ6lIagRLcdNVfEeiq/
	ZjqXN/kbjNK7I+TlQHv2WR4u7lTh6bFyUydhqD8Zf8yxinO3A6fy5C6R1NTVrgW+qxPbXYNp0OUNL
	YcqEQcTfJocVYWAaIstBQC8QYemMCAP0UyxA7P3NsPLByG6xatGNkYg7lWEdNDZ/P1U/J6Df7pPbw
	QlnTt1s68fkQiSyg7+WJTJm6EVWpJDHGBmSaPfR8zeTlePtqNQ/vQBhOijXjvVEvQGyWQIYjw2yDp
	1GSP3RBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXl8B-00000009wzM-26Nl;
	Thu, 11 Jun 2026 19:31:59 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXl86-00000009wz2-1JvM;
	Thu, 11 Jun 2026 19:31:54 +0000
Message-ID: <ac98ff55-99df-4c90-8e6b-ab1dde219b5a@infradead.org>
Date: Thu, 11 Jun 2026 12:31:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: arch: fix brackets
To: Manuel Ebner <manuelebner@mailbox.org>, Vineet Gupta <vgupta@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>
References: <20260611183525.153058-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260611183525.153058-2-manuelebner@mailbox.org>
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

Hi,
A couple of comments but overall this is a nice cleanup.


On 6/11/26 11:35 AM, Manuel Ebner wrote:
> Add missing and remove needless parentheses, brackets and curly braces.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/arch/arc/arc.rst                 |  2 +-
>  .../arm/samsung/clksrc-change-registers.awk    |  2 +-
>  Documentation/arch/arm/vlocks.rst              |  4 ++--
>  .../arch/arm64/memory-tagging-extension.rst    |  2 +-
>  Documentation/arch/powerpc/vas-api.rst         |  2 +-
>  Documentation/arch/sparc/oradax/dax-hv-api.txt | 18 +++++++++---------
>  Documentation/arch/sparc/oradax/oracle-dax.rst |  3 ++-
>  7 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/arch/arc/arc.rst b/Documentation/arch/arc/arc.rst
> index 6c4d978f3f4e..553851f43be7 100644
> --- a/Documentation/arch/arc/arc.rst
> +++ b/Documentation/arch/arc/arc.rst
> @@ -36,7 +36,7 @@ Important note on ARC processors configurability
>  
>  ARC processors are highly configurable and several configurable options
>  are supported in Linux. Some options are transparent to software
> -(i.e cache geometries, some can be detected at runtime and configured
> +(i.e cache geometries), some can be detected at runtime and configured

   (i.e., cache geometries),
or even
   (e.g., cache geometries),

>  and used accordingly, while some need to be explicitly selected or configured
>  in the kernel's configuration utility (AKA "make menuconfig").
>  


> diff --git a/Documentation/arch/sparc/oradax/oracle-dax.rst b/Documentation/arch/sparc/oradax/oracle-dax.rst
> index d1e14d572918..67867ea7be40 100644
> --- a/Documentation/arch/sparc/oradax/oracle-dax.rst
> +++ b/Documentation/arch/sparc/oradax/oracle-dax.rst
> @@ -438,7 +438,8 @@ that in user land::
>  The output bitmap is ready for consumption immediately after the
>  completion status indicates success.
>  
> -Excer[t from UltraSPARC Virtual Machine Specification
> +Excer?t from UltraSPARC Virtual Machine Specification

   Excerpt

> +i guess this is wrong, but i don't know what's correct
>  =====================================================
>  
>   .. include:: dax-hv-api.txt

and then you can add
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

