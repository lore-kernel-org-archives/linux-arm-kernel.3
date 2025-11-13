Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66D1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 22:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UVVQud0Izrm82Y9YsVW4ejkPGLxxg20QvfQU/ToybY=; b=yPTPnxQphqJZ1t8GEepk2IGTjl
	VTCQc8igDG2hR5MXtQXWIygC3SKoMwtm2XEu2vRY3xdAOAu34rBnUvOo6UZBjsg/aDO0Gm8OWE+Cp
	LP+mXGz61JuRgYTfsuBheoSxXGsuMBCO10+7U+xgWD0PGH9aicaFFEf5vJJJk0vGmSz/sEH90qo+s
	4/03Y713t0cfGPFi4b3Y6slSithI3990s8PJCte/kjszhvee0AkGfrzRFj3sUktElCwpcB/wlJ70C
	JUTadK6/en6ct4OaBLIQ2y0/Hj/sTHcl7fFSUMPpAeEWVuq7vd7xx4XGi77ECeIwimwOW4oVxbNyV
	Y48wMjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJg4g-0000000BCjk-47D9;
	Thu, 13 Nov 2025 22:45:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJg4e-0000000BCjL-41Ui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 22:45:54 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so2475373a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 14:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763073950; x=1763678750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UVVQud0Izrm82Y9YsVW4ejkPGLxxg20QvfQU/ToybY=;
        b=UqOUDtGwqxfFbuUrVvGNjBGLLidl+ZRGeQnefM66YGvk/7ZIy87Zy80gvxeG3WY7j1
         tDUl7eSBU3qPTDI7FbArEOSyOXgCqm/Lak42myiJGB9eAaPfaIyT1OqyQGKVefjmdYGv
         v4+QvFqMU3CGu4HGZHemNf/+DrMuWnmBI0Rog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763073950; x=1763678750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0UVVQud0Izrm82Y9YsVW4ejkPGLxxg20QvfQU/ToybY=;
        b=AA6736JHy0Ng5VZaEQZO7+ICg1j1L8D0b8DsKzX7ZQu/ZjPtG+SQJxNNFxNVQonyH8
         yAo1sC80HqC1VO26PhiC8qB5TJrgQqlWEr5fMPg5fQSw7QxMf1V4XzRiwS2kI8g0WNlh
         B/ZTCyQ1Zv7ZF070IqEnEz+xEjLPruROeXitAmOckXHMI3TDmpjARTGWA/XZRYxod6O9
         WN+p2BfTT69myD2bLU7CwU6eOIiIXOQZ0slGBAnSwPRqvapTbRR5b6Q3d/zJyE51955i
         BTMTuZ+8sV9U0eEkgGZuIl7pLDreAStppbea94cClzwBgMf0amiq01GZVRGrEqEIg0ay
         8Y0w==
X-Forwarded-Encrypted: i=1; AJvYcCUZXyJWPi9wli1G6rFP/4LadgV3n4Y5qqmWrr0O8SZrmUvvyJIziarYzHZM5KaZ2ZI1R+x1lN33mZdK7wEJpc5M@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnyej6CcXB6HoZbs4W4Dc6B/crKa39wAJnBKpe9pS/U4pzezrK
	xJ6GHfRCJjWMU1vWNr87em1D3yyAMocZz4lnL7U0WTWPXUTqf7S2O+A4qPEgK0aI4Uqs6Nk3EV9
	3sUjqBRR/
X-Gm-Gg: ASbGncvEREYzlzqg9qPx0GfxcCf+NJ1I1M7bm5IhJb/88lDGfeRXbS5iXLQjdakVl5M
	7ELpwGU0sQKB4xUK/QrWbcpbAbTdofGGiEjZ+r2BikFeKoi55mVtLzqlH1OooInBZXUVwniH8Ye
	0zTIHQhwuhPb/e++SxzKLFvk+ZUwvGEJpcbSLDF6HPgjglhOh5bhxBrAgseNkzJzdyv6Eu1juBP
	AbekpdLESSO8RCraX4nbp3xJvU+vOWck+W8FTLFcdwntqysNw09HahnOeK2PJnzb5sWuRfyKh6q
	INmg0GTPVKiI9hAjLTak8oJ4SxPHagNUOXf4MGvhsOWsyLw9GFbfKEb6572xyNeSNL4e1USd1Gs
	igp5ZCuBBQ71X3zn8DGLxhRGzDIjJM9ZaTHycvTGZ57GkxrylNzZ1BiTkPor5ogYEHwGLNznJLU
	btDbqLl2C/MULhNx8Fq8G0Hx4zPwUBPUYCMWFeEcPdT8j1c22/0Q==
X-Google-Smtp-Source: AGHT+IGjwOytuJEIYDnvjdFAZ9Rf/+LpYCkKkJtrXmAI2Qrz3MaRh0PH/SH4yRwVNX9YeSbjI4jU8g==
X-Received: by 2002:a17:907:60d3:b0:b73:21af:99bc with SMTP id a640c23a62f3a-b736782da23mr88790266b.28.1763073949757;
        Thu, 13 Nov 2025 14:45:49 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41e5sm251427366b.19.2025.11.13.14.45.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 14:45:49 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32a5494dso739321f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 14:45:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXknNShU0cFJP+fxsjumryBkZ0doAFJENCFDwjOwshw1sQMg1VgS5yvsYxsFf00oNxfmVckJnNjK8ZlnUNYHDhR@lists.infradead.org
X-Received: by 2002:a05:6000:2010:b0:42b:3c3e:5d53 with SMTP id
 ffacd0b85a97d-42b5933aff4mr761555f8f.16.1763073948860; Thu, 13 Nov 2025
 14:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20251111073459.44030-1-cuiyunhui@bytedance.com>
In-Reply-To: <20251111073459.44030-1-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 14:45:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
X-Gm-Features: AWmQ_bkNWl8O-v3oF1GNsRABKkGX6YQ-aUhM_Mt29bXwj4MZQ9qr2FjFv9F9mEw
Message-ID: <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_144553_028072_E036F6D2 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon, Nov 10, 2025 at 11:35=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.co=
m> wrote:
>
> After discussion [1],[2], hardlockup_perf cannot be completely replaced b=
y
> the hardlockup_buddy approach, so this patch is still being submitted.
>
> v1->v2:
> The contents of arch/arm64/watchdog_hld.c are directly consolidated into
> kernel/watchdog_perf.c.
>
>
> v2->v3:
> Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update logic=
,
> select it by default on arm64 and riscv, without affecting other arches
> like x86 and PPC.
>
> v3->v4:
> Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR=
_PERF && CPU_FREQ"
> in the Kconfig files for arm64 and riscv in one line, with no line breaks=
.
>
> v4->v5:
> Remove __weak from hw_nmi_get_sample_period()
>
> Link: https://lore.kernel.org/all/CAD=3DFV=3DUEhVCD6JehQi1wor2sSmtTLDyf=
=3D37xfo-DOTK1=3Du1xzA@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@=
gmail.com/ [2]
>
> Yunhui Cui (2):
>   watchdog: move arm64 watchdog_hld into common code
>   riscv: add HARDLOCKUP_DETECTOR_PERF support
>
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/kernel/Makefile       |  1 -
>  arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
>  arch/riscv/Kconfig               |  3 +
>  drivers/perf/arm_pmu.c           | 10 +++-
>  drivers/perf/riscv_pmu_sbi.c     | 10 ++++
>  include/linux/perf/arm_pmu.h     |  2 -
>  kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
>  lib/Kconfig.debug                |  8 +++
>  9 files changed, 114 insertions(+), 98 deletions(-)
>  delete mode 100644 arch/arm64/kernel/watchdog_hld.c

Perhaps you missed that (I think) Andrew had already dropped your v4
due to the Kernel Test Robot finding a problem. See:

https://lore.kernel.org/r/202510240701.eB6r97V3-lkp@intel.com

I don't think you've fixed these problems in v5, have you? I think you
need a v6 for it? I haven't dug all the way, but I'd suspect the
compile error is if "HARDLOCKUP_DETECTOR_PERF" is defined but not
"CPU_FREQ". Indeed, that matches the config in the report...


-Doug

