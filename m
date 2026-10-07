Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B7CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgotGUP9ng09w4prtsqqHpwR1KpOaOmUE6z6DSePSnU=; b=tYSR2P0dnkXbU9wOJOBgqCL4ZT
	QRq7HLXydgOOEaEdtiQjl9FPp3YwqQq7/x6jXgGE3IXUfaizH/dR6qeyMIXkMCDmhsqLBVNtlZArQ
	sLwH/EO8nba5Y9680jMw00oJdi3IyjbFKS67m8YPV2IUs+jqNS9AIv9PgLqvR9mqRNXBfPHCxeJXF
	IndoYqd0yCx2Lv/xCmGujG26li6jMDwr7VE1/lkSTnsX8cjB4RED4tTVKYv21+/2R9n++123n4hue
	5MC4+OxCDv3lyOsfJc1LwcrkHuwwn6qnexOosXeZt5+acCygpiKvVEtSxCSNkTGqHTpus6DfMpfCx
	fuK+axzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQY0-00000002QCu-3Lsn;
	Wed, 07 Oct 2026 12:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQXz-00000002QCQ-2Gfa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:14:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72EE4601FB;
	Wed,  7 Oct 2026 12:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4781F0089B;
	Wed,  7 Oct 2026 12:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791375298;
	bh=pgotGUP9ng09w4prtsqqHpwR1KpOaOmUE6z6DSePSnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mzHMIN4oCYXHf3a2L9jlaCdT4LtnmTOvFubFfhzIFbFUp2F1V7zOReejtFfVPopGt
	 ChIy1dAjQmAhBObgfZ+8vjyD3JLqQq5p96APQ9HCtbGG3APeE80qLe3eAsgK+6BK2E
	 juNLz/pZhyvVX81gOvtt4EOX5EEl6OcpbWnfk9YI9ZY6dvTv8A/clEapRXe9aV5jMP
	 2kO2ZnyB4aIQ+KeO4y4Xhz5ow6Nz0Py0UHV6dSrPdI12t9mwiboa1JrIgBLgS9WPNY
	 2xAp/4ky4KrNyCAn9mRLA5XsD9JG7XYxFR/yeVQZyLjUELv5nk5qEoJwlMTPlEV4Fc
	 ybGZWfxFazH4Q==
Message-ID: <sashiko-outbox-162993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/11] arm64/sframe: Validate IP addresses
To: "Weinan Liu" <wnliu@google.com>, "Will Deacon" <will@kernel.org>, "Indu
 Bhagat" <ibhagatgnu@gmail.com>, "Dylan Hatch" <dylanbhatch@google.com>, "Mark
 Rutland" <mark.rutland@arm.com>, "Roman Gushchin" <roman.gushchin@linux.dev>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Jiri Kosina" <jikos@kernel.org>, "Jens
 Remus" <jremus@linux.ibm.com>, "Peter Zijlstra" <peterz@infradead.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Josh Poimboeuf" <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, "Song Liu" <song@kernel.org>, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, "Puranjay
 Mohan" <puranjay@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Mostafa
 Saleh" <smostafa@google.com>, "Herbert Xu" <herbert@gondor.apana.org.au>, "Prasanna
 Kumar T S M" <ptsm@linux.microsoft.com>, joe.lawrence@redhat.com, "David S.
 Miller" <davem@davemloft.net>
In-Reply-To: <20261007114335.440322-7-dylanbhatch@google.com>
References: <20261007114335.440322-1-dylanbhatch@google.com>
 <20261007114335.440322-7-dylanbhatch@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:14:56 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] unwind: noinstr violation via static inline callees in sframe_find()
--

commit e12d5712c137b31d5aeba1eafd95262908a336d3
Author: Dylan Hatch <dylanbhatch@google.com>

arm64/sframe: Validate IP addresses

This commit adds validation for instruction pointers during sframe unwindin=
g.
It introduces architecture-specific checks for arm64 to ensure the IPs fall
within valid kernel or module text ranges, handling special sections like
.exit.text and .rodata.text.

[ ... ]
> diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/=
asm/unwind_sframe.h
> new file mode 100644
> index 0000000000000..1b45d328c746f
> --- /dev/null
> +++ b/arch/arm64/include/asm/unwind_sframe.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_UNWIND_SFRAME_H
> +#define _ASM_ARM64_UNWIND_SFRAME_H
> +
> +#include <linux/module.h>
> +#include <linux/sframe.h>
> +#include <asm/sections.h>
> +
> +static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
> +{
> +	if (__is_kernel_text(ip) || is_kernel_inittext(ip))
> +		return true;

[Severity: Low]
Since sframe_find() is marked noinstr and calls this helper, marking
sframe_is_kernel_ip_valid() as __always_inline helps prevent it from being
outlined. However, __is_kernel_text() and is_kernel_inittext() are standard
static inline functions. Could the compiler decide to outline these nested
helpers into the instrumentable .text section?

If that happens, objtool validation might fail during the build, and it cou=
ld
theoretically result in recursive instrumentation faults (e.g., KASAN) if
called during NMI stack unwinding.

> +
> +	/* .exit.text is retained in vmlinux on arm64. */
> +	if (ip >=3D (unsigned long)__exittext_begin &&
[ ... ]
> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
> index 33883408581da..c95fcb63e7eaf 100644
> --- a/kernel/unwind/sframe.c
> +++ b/kernel/unwind/sframe.c
[ ... ]
> @@ -44,6 +44,45 @@ struct sframe_fre_internal {
[ ... ]
> +#ifdef CONFIG_MODULES
> +
> +static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_=
section *sec,
> +							  unsigned long ip)
> +{
> +	struct module *mod =3D container_of(sec, struct module, sframe_sec);
> +
> +	return within_module_mem_type(ip, mod, MOD_TEXT) ||
> +		within_module_mem_type(ip, mod, MOD_INIT_TEXT);

[Severity: Low]
Similarly, within_module_mem_type() is a regular static inline function
called from the noinstr path. Does this present the same outlining risk
as the kernel text helpers above?

> +}
> +
> +#else

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007114335.4403=
22-1-dylanbhatch@google.com?part=3D6

