Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C18DC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bh+EJq1eUrlDF5qFb56orBglILXN8HN0hoYDeEXxPU=; b=mAR62UmQCUiBAv2MsUu9ZB595X
	QypNn6xrvX4L76HlzZrKdcSL8GIp5HbTrxmglORw9t9zqs3cx52RJ9R3nxj975/GBZ6q86SCk16Ez
	Ebs8Ndjdsau/kN2dWz7vMJYDeexxLonQwGd7CAezPCKzuiZ/A5oAJyEMnYXm4opp0YThCEdNsfKOu
	BOiSu2fWOUzIBk8fCYL7qFn9cbWFEw33Au43EO/+BiJrruP6c1tI4wmvPM/7eJIq9ihgH6N32KEl5
	HOA6VJva5lwjfk7NV75/2lbWN3QV2csElvE5j9p1u3npR36ubwlhhAxhuqGDCPO/JzUC4oUR3+IzX
	fbHQqrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGTo-0000000FGfS-15gN;
	Fri, 11 Jul 2025 16:20:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtE-0000000FAtJ-0EfJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 15:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5Bh+EJq1eUrlDF5qFb56orBglILXN8HN0hoYDeEXxPU=; b=F13q63atqkQ4SoFBtwGfJnP/cw
	iTuiuNVa/5IjPAyV5ek3U36tzgAZ0XOwDdZt6EXKyKHy4aTjwNa7DJFlEktKYd7Jc/6bRJucoNGgH
	l6xIQ1Z7iB+paaki8pDTPk5blTUWL772I7guIZVcPIvzdPUNzI0EgfdIQ1sjq3p9fr4kOTRc6SyJ2
	zjIrB9DwxNhRXB/m1vH2wuyHrl5W16mnp9Rk3v4jHzVZTSfzq8K1kpzumCyIpAE9s0q9/NjVQg0YG
	089ysjM6YgFtZZ3t11fvS+68iAJb1IGGX5vjOGIDrHdfgs0OnTOIp69lVla5AeZ3PgzMD5Dm14ssl
	5jFgsK0Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtA-00000009IoP-0uCn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 118BF45D66;
	Fri, 11 Jul 2025 15:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48F9C4CEED;
	Fri, 11 Jul 2025 15:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752248530;
	bh=c9D2JdWvApd7j6G1yN6JtXvcNmPAbbTOny/mSW3rsE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyYC3N3AmwRfD3yYXfCuPF0Zt6hUX3yToWu4nEah3WA1mtUHZ/WgCLk3uUiPgdNTk
	 7j3aAQKaPjsw7m2ucgR+xsCVrfBHY1Y0bAhyaslDoHbkw5rajbQuCOdgKdumIhqUI1
	 3LEeMW8AwvwgFGTaFvLHG2d5ovBlMm+wP7c48ar46AOOnZyFnlTPyAujnpxy0tmY5p
	 zbjarZQcvbswaZhAGk9oR1pyfgGryygBPfTUE7tze78rbCcZgwSMTzn8VbL+/pL5iL
	 FMZrpXz15dottzyw5ax2sv0m16LkKziagj99Hbkpl4y5K/MHl6+SPalFns0Mw8Ds6E
	 8OjpKUi03WKVg==
Date: Fri, 11 Jul 2025 16:42:04 +0100
From: Will Deacon <will@kernel.org>
To: neeraj.upadhyay@kernel.org
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, paulmck@kernel.org,
	joelagnelf@nvidia.com, frederic@kernel.org, boqun.feng@gmail.com,
	urezki@gmail.com, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	qiang.zhang1211@gmail.com, neeraj.iitr10@gmail.com,
	neeraj.upadhyay@amd.com, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH rcu 06/13] torture: Provide EXPERT Kconfig option for
 arm64 KCSAN torture.sh runs
Message-ID: <aHEwzENaa9hNGt2k@willie-the-truck>
References: <20250709104414.15618-1-neeraj.upadhyay@kernel.org>
 <20250709104414.15618-7-neeraj.upadhyay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709104414.15618-7-neeraj.upadhyay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_164216_750011_C5B67172 
X-CRM114-Status: GOOD (  15.32  )
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

On Wed, Jul 09, 2025 at 04:14:07PM +0530, neeraj.upadhyay@kernel.org wrote:
> From: "Paul E. McKenney" <paulmck@kernel.org>
> 
> The arm64 architecture requires that KCSAN-enabled kernels be built with
> the CONFIG_EXPERT=y Kconfig option.  This commit therefore causes the
> torture.sh script to provide this option, but only for --kcsan runs on
> arm64 systems.
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: <kasan-dev@googlegroups.com>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Signed-off-by: Neeraj Upadhyay (AMD) <neeraj.upadhyay@kernel.org>
> ---
>  tools/testing/selftests/rcutorture/bin/torture.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rcutorture/bin/torture.sh b/tools/testing/selftests/rcutorture/bin/torture.sh
> index 25847042e30e..420c551b824b 100755
> --- a/tools/testing/selftests/rcutorture/bin/torture.sh
> +++ b/tools/testing/selftests/rcutorture/bin/torture.sh
> @@ -313,6 +313,13 @@ then
>  	do_scftorture=no
>  fi
>  
> +# CONFIG_EXPERT=y is currently required for arm64 KCSAN runs.
> +kcsan_expert=
> +if test "${thisarch}" = aarch64
> +then
> +	kcsan_expert="CONFIG_EXPERT=y"
> +fi

Acked-by: Will Deacon <will@kernel.org>

Will

