Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E908C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CWQ+Ltpzm0FOglk01f1SBbns7Cqp8rGnr3E8DmO8mI=; b=fIAIMGOnl0/pGjq5QwxHagSv1J
	UnmvaeVeGZ7QXMV8ogYRCdhbOd2jNqUk7kZCnHPiRrsT48h3P8ZbbSIhCAruwHwCrqDqohv2USRo6
	5aYqoTOW7pgGkLmEfc1iJrzIL2yt+7k4srqAMt1eygbesLdWiN0jsXAwEZg7QFlpbdbbKNJ5heslW
	ap7q+yF8/RMf+0FtwoAt1n/GI8b3cmkg2BRcEWFxG/tR0J698fri0nhTiKAtKcYx0/Jpeecu01byZ
	hICjeEXlG8SOJd3ofzL7jvk9JfiuLk3+xLJDbzq1F7U/y7VTEpiFCfvJEK4AXIUcryHu24Kasjhwf
	h0SCGnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRIm-00000008YU1-1wIv;
	Thu, 30 Jan 2025 09:57:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRGf-00000008YJc-18tt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:55:26 +0000
Received: from [10.156.205.88] (unknown [167.220.238.88])
	by linux.microsoft.com (Postfix) with ESMTPSA id 250B62109CF3;
	Thu, 30 Jan 2025 01:55:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 250B62109CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738230924;
	bh=8CWQ+Ltpzm0FOglk01f1SBbns7Cqp8rGnr3E8DmO8mI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WTmKbxGtIfYc2mv3Cak/Vwplr5T5/GHoFm736jp1fVaNrpl8fmdlj0kmdF5iBAqRD
	 LNVVWiE6Hsd5uZhgE9dVXwVyq3Tzatl49e24vAKqpYDxCHKaZhJGJO6xhOYyI9SWXR
	 FPmMX70ExaE325FCoXSRlMRurmu2vSZB/gXdSpFQ=
Message-ID: <b7ca6841-a103-48ea-8353-4e8c089e9176@linux.microsoft.com>
Date: Thu, 30 Jan 2025 15:25:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: Enable livepatch for ARM64
To: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
 Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org
References: <20250127213310.2496133-1-wnliu@google.com>
 <20250127213310.2496133-9-wnliu@google.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250127213310.2496133-9-wnliu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_015525_325126_792CDAD9 
X-CRM114-Status: GOOD (  11.82  )
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


On 28-01-2025 03:03, Weinan Liu wrote:
> Since SFrame is considered as reliable stacktrace, enable livepatch in
> arch/arm64/Kconfig
>
> Signed-off-by: Weinan Liu <wnliu@google.com>
> ---
>   arch/arm64/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5..c292bc73b65c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -271,6 +271,8 @@ config ARM64
>   	select HAVE_SOFTIRQ_ON_OWN_STACK
>   	select USER_STACKTRACE_SUPPORT
>   	select VDSO_GETRANDOM
> +	select HAVE_RELIABLE_STACKTRACE if SFRAME_UNWINDER
> +	select HAVE_LIVEPATCH		if HAVE_DYNAMIC_FTRACE_WITH_ARGS && HAVE_RELIABLE_STACKTRACE
>   	help
>   	  ARM 64-bit (AArch64) Linux support.
>   
> @@ -2498,3 +2500,4 @@ source "drivers/acpi/Kconfig"
>   
>   source "arch/arm64/kvm/Kconfig"
>   
> +source "kernel/livepatch/Kconfig"

Looks good to me.
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.


