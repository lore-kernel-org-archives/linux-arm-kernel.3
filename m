Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C91C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=; b=ilwlQP6dEe0oSe/WFAb73j9nfM
	ucJsRTPI3TX0M2MN6vwIR6SGheRxy2xmC85OgrvnWxZEiBEbyVe8BOote1Pn9HLt2SEOCdBK1LaTZ
	6M7jwchCzrACiyc4A1Bb71VdzQ7x7rUWUwOeles4i4aVa+5w9g+d/i48Wt/vsTI832eVmR7SaXYeh
	oPMGxgWsAwG98ZH2VWVAjZK6x5l8ERAlyhE6hCwrR7EP6XyM0liusSQcgx2cr2wPtsRS8RAsmpGM4
	L0mnZ+A9DlfUcNYjjKjGJgSD1fzPuX6hvMEBow+DhNFXnaBU1u5fEXWhsh5asD+RAUt7xpfnFY31R
	jkgpax3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdXP-00000001taH-2jNc;
	Mon, 10 Feb 2025 23:50:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdW2-00000001tUW-0m3Y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 23:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=; b=R2OGwzzMKeroppZeaNvKLqK1uh
	yF1x5Olt7ylkM/9nINuibucEZpcDD5FQJIG44mxz6Bd+KgP6ek0TXF5hu3siMK6b6j1i02jic2mw0
	oe17CwkuL1ihGiAgcKgRwdTG9B2RcMXzRdvm9plxs7fPI7Ulhv2AE8a0hYFRHM0+tb3hI8yat3RvA
	/5DJ+/IPRFjls0p2sW2PH+kJyUhA4QaGpdPL7w9WIH6McruisPUdr46OOqEH3iThezxURbkq2XhW7
	8mJwOG6xaomLk6VbfSfmuvK+W8fCpqM0YdSSMIuO1/weJmgdq5CGODpYWYpnMxPI4pOWfBhkXxKNG
	ViUh3huw==;
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdVy-00000000NIK-1tG0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 23:48:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e5b4d615362so2964419276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 15:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739231311; x=1739836111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=;
        b=YvSNl7MUiAOF0Q3ODgsNBRp1cwRRvT8RJcv+kZE7BS5qv0rU0k2UmbUDk/SbErQz5q
         ouFfhH8aDo8xqGTL9XYpz1S38Zl6UhSyVPBlBzgCfxKkgLANfDv+hL+ugr5RaRJXPVlI
         MoIc/zPglRTSI7+zRxpQUP376bLCGBuBhfu2ocJ99xWMPpzS+z3YwdJGlFdVlseGPOqj
         pge4coWrIlu2pj+vl8H+secfZx+B8+d6bmOcNfBftXAvGLkjk+Xtm0u0oqq28BPCovev
         siG3yJv6ULM0c8j2m1aBYbf6G5pOZCHI2fqDNTQLCbF26WKtABjwUq8MBTTF8/GkOmCn
         cE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739231311; x=1739836111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=;
        b=JXMaW7C6cyyeNr68GnuEjNtOIkuJwuCc66G0XYvW4kd6rsHOg1j+D7AKNm1XLhyBvi
         Y+LVC+C4XuV7d0VBrq7l4uACTmUNvbVp5ON5Ywf0eP3RoW/rWCIEIC/qOAk9HLQcuIrc
         W3Bi3ED8xOlnAvARnVyADojQLEP8Aa1QMy+cZ5HDssUObffLviNqZHajLaU9hIfgXMCD
         /o/lhFRq4sNsZdGHF9WeW/K5lIbAAIE0H/mwE+qu5L3tjaxoOJVEb+8JETzQxbUdzAm5
         zJXCh/jlaLq83FuDtaG2mnA6Jfsee9XWyXljTixXluevIBcMuyfpBrdXo8OIWtlQpu0H
         FsBw==
X-Forwarded-Encrypted: i=1; AJvYcCVz+n+blcJpTlN5RX0y5ZRbyExyOytZubndKRtZ0cY6J8+AsKJUdHb3OJPdiAs1tAKySR17f+CAWqqyYRGKwMku@lists.infradead.org
X-Gm-Message-State: AOJu0YwlP3KdpKFgAZK6AfVEZ/40dwmcbikOHJw5F4fIRKlWysd9P8/Y
	hU1qaJhImK6mSjp4m0iQ/Y3qwFoqh7x5CxSAS6YVpAVTxFNzQoxv3g/7PAQYVpQ=
X-Gm-Gg: ASbGncvA1ektC4QQ/BBvaiZRd9v8TCR8i0nxaw38bgXtqFgkr1c5zflpJjh7rIsjTJy
	PD46R2c6q8WwsJVEKl9pTP+FlKBkjRSRJs1CCsYmS/puZU/Pin7bMaUMk4xc6dDIT1KCUih49+2
	CS1IgFoUhPSMlRdwrD8ATyoGjDvUdJZyXpqJe57YjENpP2gsYhwbpEruKR/N6MqT142CYFIlB50
	PPsU25rhihJjl6gAZ63fSXKpwUME3HbtOqAHglvn4C3J6ky3l7wwE0JmzHiT0X9p90X87Vzy6vW
	wP4=
X-Google-Smtp-Source: AGHT+IESD4xAhKpt/pl94F/2JTELVhfRZrr4MEz5jFM5hVpih0Ce3o8BYnuqyUwCOqcd7JcBXZF8hA==
X-Received: by 2002:a05:6902:1b03:b0:e5b:44f2:e2c2 with SMTP id 3f1490d57ef6-e5b461c59e5mr12913135276.25.1739231310645;
        Mon, 10 Feb 2025 15:48:30 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a45dd7esm2895010276.39.2025.02.10.15.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:48:29 -0800 (PST)
Date: Mon, 10 Feb 2025 15:48:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] perf syscalltble: Remove syscall_table.h
Message-ID: <Z6qQTL7k8VmAM_nD@ghost>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-2-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210165108.95894-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234834_759068_5A01A13D 
X-CRM114-Status: GOOD (  24.50  )
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

On Mon, Feb 10, 2025 at 08:51:02AM -0800, Ian Rogers wrote:
> The definition of "static const char *const syscalltbl[] = {" is done
> in a generated syscalls_32.h or syscalls_64.h that is architecture
> dependent. In order to include the appropriate file a syscall_table.h
> is found via the perf include path and it includes the syscalls_32.h
> or syscalls_64.h as appropriate.
> 
> To support having multiple syscall tables, one for 32-bit and one for
> 64-bit, or for different architectures, an include path cannot be
> used. Remove syscall_table.h because of this and inline what it does
> into syscalltbl.c.
> 
> For architectures without a syscall_table.h this will cause a failure
> to include either syscalls_32.h or syscalls_64.h rather than a failure
> to include syscall_table.h. For architectures that only included one
> or other, the behavior matches BITS_PER_LONG as previously done on
> architectures supporting both syscalls_32.h and syscalls_64.h.

This is a great way of doing this, thank you.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>
> ---
>  tools/perf/arch/alpha/include/syscall_table.h     | 2 --
>  tools/perf/arch/arc/include/syscall_table.h       | 2 --
>  tools/perf/arch/arm/include/syscall_table.h       | 2 --
>  tools/perf/arch/arm64/include/syscall_table.h     | 8 --------
>  tools/perf/arch/csky/include/syscall_table.h      | 2 --
>  tools/perf/arch/loongarch/include/syscall_table.h | 2 --
>  tools/perf/arch/mips/include/syscall_table.h      | 2 --
>  tools/perf/arch/parisc/include/syscall_table.h    | 8 --------
>  tools/perf/arch/powerpc/include/syscall_table.h   | 8 --------
>  tools/perf/arch/riscv/include/syscall_table.h     | 8 --------
>  tools/perf/arch/s390/include/syscall_table.h      | 2 --
>  tools/perf/arch/sh/include/syscall_table.h        | 2 --
>  tools/perf/arch/sparc/include/syscall_table.h     | 8 --------
>  tools/perf/arch/x86/include/syscall_table.h       | 8 --------
>  tools/perf/arch/xtensa/include/syscall_table.h    | 2 --
>  tools/perf/util/syscalltbl.c                      | 8 +++++++-
>  16 files changed, 7 insertions(+), 67 deletions(-)
>  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> 
> diff --git a/tools/perf/arch/alpha/include/syscall_table.h b/tools/perf/arch/alpha/include/syscall_table.h
> deleted file mode 100644
> index b53e31c15805..000000000000
> --- a/tools/perf/arch/alpha/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_64.h>
> diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/arc/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/arm/include/syscall_table.h b/tools/perf/arch/arm/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/arm/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/arm64/include/syscall_table.h b/tools/perf/arch/arm64/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/arm64/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/csky/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/loongarch/include/syscall_table.h b/tools/perf/arch/loongarch/include/syscall_table.h
> deleted file mode 100644
> index 9d0646d3455c..000000000000
> --- a/tools/perf/arch/loongarch/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscall_table_64.h>
> diff --git a/tools/perf/arch/mips/include/syscall_table.h b/tools/perf/arch/mips/include/syscall_table.h
> deleted file mode 100644
> index b53e31c15805..000000000000
> --- a/tools/perf/arch/mips/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_64.h>
> diff --git a/tools/perf/arch/parisc/include/syscall_table.h b/tools/perf/arch/parisc/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/parisc/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/powerpc/include/syscall_table.h b/tools/perf/arch/powerpc/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/powerpc/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/riscv/include/syscall_table.h b/tools/perf/arch/riscv/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/riscv/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/s390/include/syscall_table.h b/tools/perf/arch/s390/include/syscall_table.h
> deleted file mode 100644
> index b53e31c15805..000000000000
> --- a/tools/perf/arch/s390/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_64.h>
> diff --git a/tools/perf/arch/sh/include/syscall_table.h b/tools/perf/arch/sh/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/sh/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/sparc/include/syscall_table.h b/tools/perf/arch/sparc/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/sparc/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/x86/include/syscall_table.h b/tools/perf/arch/x86/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/x86/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/xtensa/include/syscall_table.h b/tools/perf/arch/xtensa/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/xtensa/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
> index 928aca4cd6e9..2f76241494c8 100644
> --- a/tools/perf/util/syscalltbl.c
> +++ b/tools/perf/util/syscalltbl.c
> @@ -7,13 +7,19 @@
>  
>  #include "syscalltbl.h"
>  #include <stdlib.h>
> +#include <asm/bitsperlong.h>
>  #include <linux/compiler.h>
>  #include <linux/zalloc.h>
>  
>  #include <string.h>
>  #include "string2.h"
>  
> -#include <syscall_table.h>
> +#if __BITS_PER_LONG == 64
> +  #include <asm/syscalls_64.h>
> +#else
> +  #include <asm/syscalls_32.h>
> +#endif
> +
>  const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
>  static const char *const *syscalltbl_native = syscalltbl;
>  
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

