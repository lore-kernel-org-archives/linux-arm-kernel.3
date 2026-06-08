Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6D8CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGkZcMBoAb+m8aY5hGGCVEYyH5C6dmJ8Ri3+vL0A/d8=; b=LPdHRsOVcS3hdT7jRowqnZGI9T
	e66CfWeXrm2X9cnYq7tTKEMjp6V6aXOEqqLRDuXGz7O4/byNJVg9EU6zy4nLcv9dhgxOO2Ao0IMwQ
	Gy6OIfQ3YF1T/ITX1Nl9oCzg6WCUI68GXEcPDN0NUFDgaVijf3tZmf0mWwrEAcs9TY1idx2IwZIhb
	UYb3XVHBG0ZcDHc2CW68JEHjTStpOOJVVrf7Pdlv9+LZM0Zz2Dp36HdToJsezspb7DueuH+1WNUd5
	SayMvhnqbku4w/8fvGM6hiqWveVUHgQvSYU0LTjSynYSbPUwL6crqdMc6g/KA6vaaBQ4WFFG5bj5c
	7H4eftSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVjj-000000037TQ-048S;
	Mon, 08 Jun 2026 08:53:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVjf-000000037RU-25VD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:53:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E8AC41A8C;
	Mon,  8 Jun 2026 08:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359F51F00893;
	Mon,  8 Jun 2026 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908811;
	bh=aGkZcMBoAb+m8aY5hGGCVEYyH5C6dmJ8Ri3+vL0A/d8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=fhjIuQp/Sup6o+sH0Z+zrskRvvuZfaaJITO4GbIdNebdzX5jnBc07vYHk8dWJB9WR
	 yE5JBOka/s+xDQy+CpvrNBPHQ3o6370lJMwur9CnIaDh94eYmGVrt3HqpLTGiGLtz4
	 XNVq6Z1OkRLsEt7V0WuaCnEkqNmQfdFvR9EYiJ+MdVc9jnZumiXmS27ia35iIAQrA0
	 u7QEDn7oLO5QiDPdyZcgS3aciwL2MXTc1tUML4R6VdCInYg+lOOfYdQj6CDfrxlfVX
	 IGXAlXAszT4xf+34dQdZ8C3QI3br29+cMutJROpEjDcUDgLTblYyD1UOktWHQCv23/
	 W9snBZHWFI+4A==
Content-Type: multipart/mixed; boundary="===============6216399173514572217=="
MIME-Version: 1.0
Message-Id: <23edac0734ee3ef334237165500d8f34e3c649081db7b3140a4a8596a202f339@mail.kernel.org>
In-Reply-To: <20260608080440.127491-3-ankur.a.arora@oracle.com>
References: <20260608080440.127491-3-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v12 02/15] arm64: barrier: Support smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  8 Jun 2026 08:53:30 +0000 (UTC)
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

--===============6216399173514572217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943..fa676428ec3f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1606,6 +1606,9 @@ config ARCH_SUPPORTS_CRASH_DUMP
>  config ARCH_DEFAULT_CRASH_DUMP
>  	def_bool y
>
> +config ARCH_HAS_CPU_RELAX
> +	def_bool y
> +

ARCH_HAS_CPU_RELAX isn't private to the barrier code.  Before this it was
defined only by arch/x86, and the generic kernel already keys cpuidle
behavior off it in two places that arm64 builds.

In drivers/cpuidle/Makefile:

  obj-$(CONFIG_ARCH_HAS_CPU_RELAX)	  += poll_state.o

and in drivers/acpi/processor_idle.c:

  #define ACPI_IDLE_STATE_START	(IS_ENABLED(CONFIG_ARCH_HAS_CPU_RELAX) ? 1 : 0)
  ...
  if (IS_ENABLED(CONFIG_ARCH_HAS_CPU_RELAX)) {
          cpuidle_poll_state_init(drv);
          count = 1;
  }

On arm64, ACPI_PROCESSOR is "default y" and depends on ARM64, and it
selects ACPI_PROCESSOR_IDLE which selects CPU_IDLE.  So on an ACPI arm64
system this now builds poll_state.o and makes acpi_processor_setup_cstates()
register a POLL idle state as C-state index 0, shifting the firmware
C-states up by one.

The commit message describes this symbol only as indicating "an optimized
implementation of cpu_poll_relax()", and the generic patch describes it as
"a cpu_poll_relax() implementation that is expected to be cheaper".  Neither
mentions the cpuidle/ACPI poll_state side effect.

Is enabling the cpuidle polling idle state on arm64 intended here, or is
ARCH_HAS_CPU_RELAX only meant to feed smp_cond_load_relaxed_timeout()?  If
the latter, would a dedicated symbol (or decoupling poll_state/ACPI from
ARCH_HAS_CPU_RELAX) avoid the unintended idle-path change?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/27125050324
--===============6216399173514572217==--

