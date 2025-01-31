Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABBEC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3gnIl846SAu9tfnQfOzMciM9PIb15NdkYL4iUYcpms=; b=cNXeYTWszAOcXR4iUYv2r+sWAU
	MY8AxYRompDsSzJoF9bW6OiEtcVcXMO5vQo6Q8oD+TpeO+rEFDGrcIwv5x8It2UuNludBIMcEjcnY
	OyBl5mOjUpdckcydhjJE2uLYBGXFLxmDlG7tC/bF2A0T6n8rMrVUTqc4qk5KKb/0ICZRYRJCCj3or
	rXsXL+DW0admyrjh52VqRaF+j1clGPZTkzNwbQkEODN95plplDVTZv/6rnDcZeRnaUMd5giq+PNF3
	hcA7TH1ZvbKlIv+FhEjS74YHieVhKXV7cDTShHDjyD/L9jVgwVahro+P3XLtU/cK4EJLxUcqtiZXk
	eSSVsM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtcp-0000000Aw5M-43Zj;
	Fri, 31 Jan 2025 16:12:11 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtZd-0000000AvZZ-2cZr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:08:54 +0000
Received: from [100.79.217.67] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id D324D210C321;
	Fri, 31 Jan 2025 08:08:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D324D210C321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738339732;
	bh=c3gnIl846SAu9tfnQfOzMciM9PIb15NdkYL4iUYcpms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G2VTov39rrmYBiWMyE9yWrSILfGhZxzr06F8JH2GqHFzuspx00BCSmiWBbsDjUsyp
	 oXVBU8KH8BrukMrKGOrPvvDtGBseuczir06TjCxMZyTdSIbN5Ei8FguLKbk8PKHD5J
	 NC1IKKeAL6q/duree0ur7zHHvgb38S+jlVktLiVs=
Message-ID: <ceabc7b5-a9b8-4f3b-9a73-5cc2af4e9af9@linux.microsoft.com>
Date: Fri, 31 Jan 2025 21:38:46 +0530
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
X-CRM114-CacheID: sfid-20250131_080853_694285_78601F45 
X-CRM114-Status: GOOD (  11.64  )
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

Will this work for ftrace'd (kprobe'd) function as well?


