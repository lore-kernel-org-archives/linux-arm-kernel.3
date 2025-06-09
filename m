Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7ECC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLbdRBiGrwBn2APyakbOJp/n2j0i3a/OzdcoIJJU+Jw=; b=SwfoGlKvowpVxHcpU3tG30sDG6
	bI7KgUJ8oxxVQDrMJaWjTLNcdOJtiwwyTGjiAgSlx1RVuRlgG4VVo/rdnYYL5yX/xFXAUug1YXVtV
	iYnbsLeBtU1sK4aFidhC6P8KwMLoT64lkX5vXK4FuEjJ8w+lHNKhKpU5VI/iZTu5w427l8ozQtq36
	NYcyeZIXOPMzMJJGm7VsXBjQfdBhboNJeZRXktneJMqROmLisL6P0CUdxxsRIKraRIGXhPYdMe6uU
	A+KNvhTXBF9wVfL05oodgvJtRU37CiPMml8vKUWb+4SG5a8Z3PYHSQzQ/7hRBWa50okKaWD0x2Q6B
	wvqm7K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfBv-00000004dgJ-2Yul;
	Mon, 09 Jun 2025 16:17:43 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeWB-00000004XNL-44iQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749483274;
	bh=rJ0dKCI6FizSqv1KsmJCxjCnLfD7wV+uXaYhQiwtVyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SyaH7X2AjTdpmHREtSCNh+inUQ81NzASls6AVx1xftSWlXoSsoHAha+lLWLfOWPH7
	 3t6w10VagEIJgtmPS0I8C3Bt6sXKQxQkVfbEtKgddptuOQNMX9cMO+StgD7ele+l18
	 pngksDER6b6aQnIVsNfUAJns+QQZzXKby2rBOTuk=
Date: Mon, 9 Jun 2025 17:34:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: Provide vfork()
Message-ID: <df6f5620-5986-4080-bb00-c7bee856bf66@t-8ch.de>
References: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
 <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_083436_152622_527569D4 
X-CRM114-Status: GOOD (  10.01  )
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

Small followup review, sorry for the noise.

On 2025-06-09 16:08:56+0100, Mark Brown wrote:
<snip>

> +#ifndef sys_vfork

This ifndef is not necessary here.
No architecture has a special version.

> +static __attribute__((unused))
> +pid_t sys_vfork(void)
> +{
> +#ifdef __NR_vfork

For consistency:
#if defined(__NR_vfork)

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

