Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD23C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsGCR972E6ykumDJi+osbz6UNYEchGw6p3S8g5dEUUQ=; b=FwUiPZXP3S1xFKQBgAov0WUpfB
	iR4hfvI35kp7iLr5TMYPBhzZEjr4a82FGX/DN39bG/pNGLJBI0C7i43WdfbfMyvPAVbNmgx0cGlOU
	bWBShMbxVayy6VEO2qV5F3BfbFgaGcvlCcb9wjHFdhMpaz05xRpVowxqJnR0mRxTEB6zuGwGWwJ6T
	bAtmR1WmELsdZP09tXaoAMeSlerH6lfoZE79PhTx7mx16TfkAEwUYwUtXDXMykAi/IiM9N1s0Nmtr
	8RKi1FnRGfmT26/TUooRQydiII102cZGHlhNykQe5oM3QLFlJ4mP3aCV1FfKMPABS7WgsRMtwS4Td
	YTWFOecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOex8-00000004bST-1TOA;
	Mon, 09 Jun 2025 16:02:26 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNU-00000004WAC-0jk3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749482732;
	bh=CIWnEzhNhJo0RogzKpqhhp4pyACFAjdWXagyylxLBdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqzrPSDAc+2cNjXJ73v0xcZncXH1FX0qP3TnLlCNSCaQiYDH606YRzcr5TtQNkck2
	 frr2/wlJXkF79nGu9LYxn0kYncohzivO1dlIGJyO5zFwLfW8kQfnNs1P+tHudX0YnQ
	 pc07Az6dxYrWq54Qxd/4KoKDHiegGe1KZL9LBu3A=
Date: Mon, 9 Jun 2025 17:25:31 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: Provide vfork()
Message-ID: <2ece41af-9500-447c-8203-5c57024e39f9@t-8ch.de>
References: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
 <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082536_363296_1654FFAD 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Mark,

On 2025-06-09 16:08:56+0100, Mark Brown wrote:
> To allow testing of vfork() support in the arm64 basic-gcs test provide an
> implementation for nolibc, using the vfork() syscall if one is available
> and otherwise clone3(). We implement in terms of clone3() since the order
> of the arguments for clone() varies between architectures.

Thanks for the patch!

Do you want to take this series through your tree?

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/include/nolibc/sys.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 9556c69a6ae1..e056da010f64 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -22,6 +22,7 @@
>  #include <linux/time.h>
>  #include <linux/auxvec.h>
>  #include <linux/fcntl.h> /* for O_* and AT_* */
> +#include <linux/sched.h> /* for clone_args */
>  #include <linux/stat.h>  /* for statx() */
>  
>  #include "errno.h"
> @@ -340,6 +341,34 @@ pid_t fork(void)
>  	return __sysret(sys_fork());
>  }
>  
> +#ifndef sys_vfork
> +static __attribute__((unused))
> +pid_t sys_vfork(void)
> +{
> +#ifdef __NR_vfork
> +	return my_syscall0(__NR_vfork);
> +#elif defined(__NR_clone3)
> +	/*
> +	 * clone() could be used but has different argument orders per
> +	 * architecture.
> +	 */
> +	struct clone_args args = {
> +		.flags		= CLONE_VM | CLONE_VFORK,
> +		.exit_signal	= SIGCHLD,
> +	};
> +
> +	return my_syscall2(__NR_clone3, &args, sizeof(args));
> +#else
> +	return __nolibc_enosys(__func__);
> +#endif
> +}
> +#endif
> +
> +static __attribute__((unused))
> +pid_t vfork(void)
> +{
> +	return __sysret(sys_vfork());
> +}

Could you also add a test to nolibc-test.c?
Maybe extend test_fork() with a flag to use either fork() or vfork().
And maybe change the exit() in the test to _exit(); not that it would
make a difference for nolibc (yet).

>  
>  /*
>   * int fsync(int fd);
> 
> -- 
> 2.39.5
> 

