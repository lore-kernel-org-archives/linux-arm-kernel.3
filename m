Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDECC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 20:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+cTrFvTZmZa1sNXWsVMilcdJxSARaG+9sQN4X5vosE=; b=Yk4cfyseqVZu7A/fbZiI6yhVxs
	bVp/p1BipnPP03gro9pFsqBAW/MaXpLBcWHCt2bwGvnQroL3280N/VydX7E5vpvli40N4I2L9KT9x
	emNwLhJw7D1q6EGV+0jTTzfqF4j+ihYtXOD3+u6KhADYKhvgAxZU2AVJHWb8LFDk2MvrlpKJWfqO0
	AnS5V1iabR6O0FMKcMTnBd7Z39QF1FsrbhIGfmpVDPxM8P1HuAcuKnLqJeDEAQZVYfQWlW+pMCT8W
	EjI5ts7h4irWf6ujRPomobaTTUr17x88dOK+Sdq7v5qYZOzg70zO7ncriiq8AuBWycEGRuD+2wMjU
	3bGPFxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Ly-000000080wm-0My1;
	Tue, 10 Jun 2025 20:13:50 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP23F-00000007Va1-2Km5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749573733;
	bh=hS9bew/V9dOguSA0Tn0RisCGc1oHuJaDh8mlmT55Dlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfCoWXmP9M9d2PUtc3aKPyBuRWWT8BMhuiSPV2cuX1PYHPHiO/K5CSh9KXk007Jfz
	 XXmnmnncq/sEDQDzP52wwGhIe4CzhCS10deNuG0GpSwyakhXpx2PPS8YKNuQKMWuOy
	 akbGSb17qyCAzrv5C/6OyAz3FljQe5nMRaei+JLA=
Date: Tue, 10 Jun 2025 18:42:13 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/4] tools/nolibc: Provide vfork()
Message-ID: <5ce6fcb4-be3d-461b-9b17-495eff6ea2d5@t-8ch.de>
References: <20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org>
 <20250610-arm64-gcs-vfork-exit-v2-2-929443dfcf82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-arm64-gcs-vfork-exit-v2-2-929443dfcf82@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_094217_789448_83F9CCCB 
X-CRM114-Status: GOOD (  19.89  )
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

On 2025-06-10 13:29:45+0100, Mark Brown wrote:
> To allow testing of vfork() support in the arm64 basic-gcs test provide an
> implementation for nolibc, using the vfork() syscall if one is available
> and otherwise clone3(). We implement in terms of clone3() since the order
> of the arguments for clone() varies between architectures.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/include/nolibc/sys.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index aabac97a7fb0..5932ae8828a1 100644
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
> @@ -340,6 +341,32 @@ pid_t fork(void)
>  	return __sysret(sys_fork());
>  }
>  
> +static __attribute__((unused))
> +pid_t sys_vfork(void)
> +{
> +#if defined(__NR_vfork)
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

It seems that on SPARC __NR_vfork has the same non-standard return value
as __NR_fork. It therefore needs the same special handling in arch-sparc.h.
Maybe with a helper to avoid the duplication.

If you want I can fix this up when applying.
Otherwise the series looks good.

> +
> +static __attribute__((unused))
> +pid_t vfork(void)
> +{
> +	return __sysret(sys_vfork());
> +}
>  
>  /*
>   * int fsync(int fd);
> 
> -- 
> 2.39.5
> 

