Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013DCCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pKOtTzj1X1FPOhRSZV8T11hRcVBU23IcwkR+mYiKNk=; b=JrKeuNSbjZbb4yxPCOZ8idZGVq
	fFXmkkr4cBfzoMO8Q7m5oVcQxhBhGWP2r89/qXkNK1AgWx8b4zOAf7Rr3nCkIaK6wJk6vU4bG4I1L
	rpIhy2ZehmDbAZkD1cQM+5BebckEBPuW0rGhZNgm56h/627tI2n4LU4jGv5lD9Voj3PYs1wwPL3G+
	6Oq/l/FPnWeFXCxuygEK2jTVEcXzEfPa7EOxJUunKqobnRlR31f5rQOlFiLADOt+6uPbn7qChSPSZ
	zcgLfgjYHEwsXNbA4DmZGAnZrcw8TuDxHwGLF0C0jh1S7PeLOiPnk8VAtoQMdz9EzmbFryIUyGdeH
	BOZl/53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwSw-00000000IYL-2P3O;
	Wed, 17 Jun 2026 20:02:26 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwSt-00000000IXh-29Ah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 20:02:24 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso76921e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781726542; x=1782331342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pKOtTzj1X1FPOhRSZV8T11hRcVBU23IcwkR+mYiKNk=;
        b=bcqCZ2YLgrX0WQWIfkNegTivNH3rzJpv8FYHelCt5yxGXcIKTQnOOr5dX2cRzrSnlZ
         kCe0rrePhCPCbIVvT17BnYfHvEILAvhUURPzNH4U12DP4H1PGeNmmeED/kR6Adg6GP6D
         +Pw+BjlpQtoXEt0Lgz+uj/4RevcGC+NF8W+WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781726542; x=1782331342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pKOtTzj1X1FPOhRSZV8T11hRcVBU23IcwkR+mYiKNk=;
        b=c1+imkubG/JBaOO8CYRfB9ZhVJQ4ziZVKn+Q/DGmmMllnlZqUZJGnzfvhpWocAkb09
         Hss9GgXwlTiRME068TufPBVrVsfW5Z0yypjv2L0GMbuPzd7VMJk3SZyJqn4akkMQ1TS+
         GKIEIn9Y5eGiOAmMXsKBIgfvsYEp9eAJJ2TofcwU4VTAPy32Y4AK4rSpGGnecTOugu3t
         KQWR/LPPhnkzhSK4VDQ9uPBy1X4qpCbFkYZUyTyevu3jZXQ+HwyiGlzFUPaTRMoK+Lrd
         HPmMoXKA3kfjGxrPcZ/5Yzghd62dYVq3f35Iy4TU5sg/QaOTgeP24jIphJI3haHhXblo
         tvBw==
X-Forwarded-Encrypted: i=1; AFNElJ9MwnhJCYREfG3Elc1HLE/ZBpRpPdoVjCmio6WZu3XPJJ8GrfInSwpMUxQCSXRvsChA8V2cZ8iVkhIyG1tC4aEF@lists.infradead.org
X-Gm-Message-State: AOJu0YxK2QkUMNR1an9P11r2Hm7s+A4ePqZ4lCMN8gzoj5c9VkQjEJAZ
	pBCywbHZQJXJ9vpaJ0qbtFvbil1wzQVLwUUBr+CQTO32SWVONXHOkNVYXIva4ztTlY1XUjwPuon
	+9xM=
X-Gm-Gg: AfdE7clhBPiBHzxR2oGjWneAQZy6KUys3DAEosIpsI86iLWTT3OUcQfbh+NDWz5UIlq
	5Sh6XhBtzOarxlzQdSelmwQXgywsP/FHEkKoD0RZ7HF+nr2QYyICuhOJuoYN8b5Cqtqw/OiZJdn
	xVaaTLaPzpQ2/leCxxF4OsRw2uQ8ym/HesJQpw6LXO3qnZuQiVsa5A8QtOwSXNpqJlXlr3s8+bl
	zDv+zhxKMMCpT2+taGB3qNdm5FC4y1U9il3iPMesDrfsV85/dKAq8ozLF3nQ4ViUIeeWVgTLpji
	L4lQAEWqL2nMrrHXxuo3ZKT/b+iOxYIaDaKioklvA8F4EurzJDC/xR/HplI2G4VZQ3P0vzLAlpZ
	6CoGeSjTUkYPISNm2SZOE3eGM6ZyOu8X1eWv8NuEmR70tX7zp50DmS7zi9vmbTpXi5hjsdRThDP
	1H9awUXafH1U/o+PFzwVCfTYemi6KKzkMS2dd9YD6w2xgfZ+YQQCc=
X-Received: by 2002:a05:6122:2a54:b0:5a2:d144:6b9b with SMTP id 71dfb90a1353d-5bbd42df473mr364508e0c.9.1781726541848;
        Wed, 17 Jun 2026 13:02:21 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ff961e3sm9433659e0c.3.2026.06.17.13.02.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 13:02:19 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9667fe10d29so31462241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 13:02:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HcB0wksZjeLSLpnofEh2wgQIzvjt5/3PvTFgM7MB0MHE+X2f+dAGxP6QzSqlyqinEJjlqVB/w31oyCZSAk4MP@lists.infradead.org
X-Received: by 2002:a05:6102:50aa:b0:71f:6308:1b6e with SMTP id
 ada2fe7eead31-727c707f964mr857902137.25.1781726538567; Wed, 17 Jun 2026
 13:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781709543.git.kas@kernel.org> <97a870d0670b7e1c2fb9f5142f6e36c594282017.1781709543.git.kas@kernel.org>
In-Reply-To: <97a870d0670b7e1c2fb9f5142f6e36c594282017.1781709543.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jun 2026 13:02:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-BkwjJhZFV0YknsJeC+4os9q9pbdU09GXYUeUSLMfiw@mail.gmail.com>
X-Gm-Features: AVVi8Cfu7OoRciBnSTCdzLSbFTkbcaIaPRIaPmeTdJFLs4aPJ5NHkqY4JPOoYVw
Message-ID: <CAD=FV=V-BkwjJhZFV0YknsJeC+4os9q9pbdU09GXYUeUSLMfiw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: escalate smp_send_stop() to an SDEI NMI as
 a last resort
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_130223_803172_3A8C9B9D 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Jun 17, 2026 at 12:20=E2=80=AFPM Kiryl Shutsemau <kirill@shutemov.n=
ame> wrote:
>
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> A CPU wedged with interrupts masked ignores the stop IPI, and without
> pseudo-NMI there is no NMI IPI to escalate to: a reboot proceeds with
> the CPU still running, and a kdump misses its registers.
>
> Add a third rung to smp_send_stop(): once the IPI (and pseudo-NMI IPI,
> if enabled) rungs have run, signal SDEI event 0 at whatever stayed
> online. Firmware delivers it regardless of the target's DAIF, so it
> reaches a CPU a plain IPI cannot; the target acks by going offline,
> which the caller already polls for.
>
> Fold the stop bookkeeping into one arm64_nmi_cpu_stop(regs,
> die_on_crash), shared by the stop IPI handlers, panic_smp_self_stop()
> and the SDEI handler, replacing the near-duplicate local_cpu_stop() and
> ipi_cpu_crash_stop(). @die_on_crash is the only difference: the IPI
> handlers pass true and PSCI CPU_OFF the CPU on a crash stop so a capture
> kernel can reclaim it; the SDEI handler and self-stop pass false and
> park. The SDEI park is required, not conservative -- its handler runs
> inside an SDEI event that is never completed (completing it resumes the
> wedged context), and a CPU_OFF from that unfinished-event context wedges
> EL3 on some firmware (left as a follow-up). The dump is unaffected; only
> re-onlining the CPU in an SMP capture kernel is lost.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  arch/arm64/include/asm/nmi.h    |  24 +++++++
>  arch/arm64/kernel/smp.c         | 113 +++++++++++++++++++++-----------
>  drivers/firmware/Kconfig        |   2 +
>  drivers/firmware/arm_sdei_nmi.c |  86 ++++++++++++++++++++++++
>  4 files changed, 187 insertions(+), 38 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

