Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D2C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKKpQAQ6JgcOkfxottrkVvBcXRW0On7hjY41tdShDfI=; b=CPB5wx8yBsULIN9Qi4QDqCZQZ4
	zTHQYcjcjig7OK4OVdWrNEIb+4CvRbHF6cRENLAjsi7eCcJWG9htYuT7Q+/C3eSboxIB62bYab5UP
	GbQWIyv01CQfPaMXnRW58ZKfljX3d7OJfSTHO2nxtzmSeNjYYr2VbzSVZgkw5rQmNcHQB3hEhFEyq
	L2rZ2cy/0I6zgwJDkNdcCURkZUCcdMOs1D1Rs1HCbSUTtr4EpD6rk33i6kBIpxsCUQLHkhfngj4Nz
	NQXHzh75GqyGM5pcpy6AH2h3FHqcPof6bd+UYgDd2nR+39loz9kcvqNe84oiXTT6A87bZ8sq+sfVA
	P/TNXWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDFK-0000000BpS5-47bZ;
	Thu, 20 Mar 2025 10:35:30 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDDc-0000000BpIb-3HMY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 10:33:46 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so229275241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742466823; x=1743071623; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BKKpQAQ6JgcOkfxottrkVvBcXRW0On7hjY41tdShDfI=;
        b=zMsdeqsFFCxeZy8fwV1S5ZdXgMqAAOY4c4aD3Et3m7Yi1OoX6wqPJMXA0DGh/AZuYs
         EkRZvVuSJL5fp8dLYOwwALeIm1bvUWVVreOFsZTbHWpmmpg9p4cc5kl2xpWHi6IzXVQa
         uAEdnQ/DX7j4MlFZv98sidKkJvHR3v2itRhHItOoDppngkcTVjaaBhSI+sNTZSOc73fS
         EBNIAISLrcMJANdfGw3oURi2iJPAR1bOQGAybZNlXyEEpheR0DYqCayec+H9pMIeuir1
         RSclcQVsZyxtbd0+Sji4TOvWOOq9PWjMHdV/bSD2ZJ1Iv3moPo9LB+zo67zWSV2cKuJh
         lusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466823; x=1743071623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKKpQAQ6JgcOkfxottrkVvBcXRW0On7hjY41tdShDfI=;
        b=DsAhi61PeLLtfK95YXRj6FtVHPShBqYoUyluo5g31gH4eygzzUNpE3qysBx19NGhLv
         z2haKyRv6/SQTsWUy8Ls+JYJ+TUZQ0lYgkMwpBdTm+3ZXONoucUutDzk4s7bdtlRS8I9
         /uHaXsBai4o4RT1h2tfAfJ45M0E06kdt5trU2aV/zH+2zRTKEn07/gfiaBEHA449kV6b
         YKwPfj1IsBfcNjle84iX/G50Jj3eazxypJPyB76eAfROAcuTmr10+nI9Fy4lHL1NfIJl
         ZX24Ag2FVO3+1DBsIh67VhxsAgWyYqAbgFhDU1KGcO8EL/G9m64t/Tw3/Slw14xmtIN6
         8Ctg==
X-Forwarded-Encrypted: i=1; AJvYcCUT8qW3JduOaWtXF7GZW0Q+B2cmNsYzhgqX2RCMEGx+YmR2K+nj7pTCpy3cUD+qzPTWNWNJneSAnfSTQKdAOW5T@lists.infradead.org
X-Gm-Message-State: AOJu0YybsI6YsAS8g6r2jJQW5ZBKaOFDlmODMQX1VIWAA74n+HpBUXKX
	TTviTo09bLApurZPr6gKI1jXnBvHHDC68r0WYAQKnqckbCxatVnl2yQK4Pk8MUR/gGCE2De64EA
	9tYwC5ifn9K/AyE8sRIO2Kj69lsl0uy0CnSOwtXfLIkO1+QQRpIY=
X-Gm-Gg: ASbGnct/nN7CiBQjPUokGW51QMJY1ucp8QjjXJYgKQW28sUC36L7bbiLrWhU2iIAYL9
	xwqte5WwSERU5AVSPBOyGoALA8D2RxVns7nnedUyce+E3bMs5kJKyHhjv3RR5EQpA4O8xvk4iy6
	gPTHJwGPnLDqbFmv4HYYCDUcHB6JyHwXXswfNKYsyOm6zquWUnWP4HV5DIr/3lJn1SlA==
X-Google-Smtp-Source: AGHT+IEL8RynGDkzUn1M8qBaw1QSAu13l5oOS82op5r8NMWrFV9NMAszQoaAc7xxXxzXjG7O12MUPb/cR4HugdfzEyg=
X-Received: by 2002:a05:6102:26c1:b0:4c1:9526:a635 with SMTP id
 ada2fe7eead31-4c4ec82702amr4521750137.17.1742466823418; Thu, 20 Mar 2025
 03:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvPu+MQKhYyPZSSDpAn-zhRGmeHQ8hJksT_cdDdxfbB-g@mail.gmail.com>
 <Z9ra3I2axii2HRVb@J2N7QTR9R3>
In-Reply-To: <Z9ra3I2axii2HRVb@J2N7QTR9R3>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Mar 2025 16:03:32 +0530
X-Gm-Features: AQ5f1JqkKZULx7GkLi5GllTgOKMVJsQK1_wwFux-C6kOWnMYdf-RK7BCgTRrZ5A
Message-ID: <CA+G9fYuw_jXCz07Dsk46QXQr3+y5-NfkC30ZNh+XmyeWgibQhA@mail.gmail.com>
Subject: Re: Fast model boot failure with Linux next-20250312
To: Mark Rutland <mark.rutland@arm.com>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.linux.dev, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Rob Herring <robh@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_033344_833211_DB413A38 
X-CRM114-Status: GOOD (  19.13  )
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

On Wed, 19 Mar 2025 at 20:25, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Wed, Mar 19, 2025 at 08:07:47PM +0530, Naresh Kamboju wrote:
> > Regressions on the arm64 Fast Model (FVP-AEMvA) caused boot failures starting
> > with Linux next-20250312 and persisting through next-20250319.
> >
> > First seen on the next-20250312
> >  Good: next-20250311
> >  Bad:  next-20250312 .. next-20250319
> >
> > Regressions found on FVP:
> >  - boot
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducible? Yes
> >
> > Boot regression: Fast model boot failure with Linux next-20250312
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Anders bisected this to this commit id,
> >
> > # first bad commit:
> >   [858c7bfcb35e1100b58bb63c9f562d86e09418d9]
> >   arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
> >
> > NOTE:
> >   LKFT is currently running FVP Fast Models version 11.24.
> >   Planned upgrade to the Fast Models version 11.28 in this sprint.
>
> What firmware (and version therof) are you running within the model?

Fast Models [11.24.11 (Nov 29 2023)]
Booting Trusted Firmware
BL1: v2.9(release):v2.9.0
BL2: v2.9(release):v2.9.0
BL31: v2.9(release):v2.9.0
UEFI firmware (version  built at 22:31:25 on May 26 2023)
UEFI v2.70 (EDK II, 0x00010000)

We need to update the firmware version at our end.

>
> For example, if the EL3 firmware lacks support for FEAT_FGT2 or
> FEAT_PMUv3p9, the kernel will trap to EL3 early during boot and die.
>
> It would be really helpful if you could capture that in the report in
> future.
>
> Mark.
>
> >
> > ## Boot log
> >   <No crash log on the console>
> >
> > ## Source
> > * Kernel version: 6.14.0-rc7
> > * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > * Git sha: ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
> > * Git describe: next-20250319
> > * Project details:
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319
> > * DUT: arm64 Fast Model (FVP-AEMvA)
> > * Toolchains: gcc-13 and clang-20
> >
> > ## Build
> > * Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/log
> > * Build history:
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675685/suite/boot/test/gcc-13-lkftconfig/history/
> > * Build details:
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250319/testrun/27675691/suite/boot/test/gcc-13-lkftconfig/
> > * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/
> > * Kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2uX2EtC2pQdmVZ7ccoyhoi01Yy0/config
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
> >

- Naresh

