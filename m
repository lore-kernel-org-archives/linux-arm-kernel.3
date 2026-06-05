Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E078CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3kdr6qrmm7a2qwk5wi4DJkHk54J0i+2AKmaQ2WBomY=; b=hWgVxlC2QuO8ryee9yeYwd0g4x
	4YmFBBH6bPmUzWYsCqfVzv9ZwaUTvUIll1RWg1RDPrKIaPTGcUhW+HRsIKj1Cc7j4htjftOSK49TG
	z2UIeGOLZtznOAYmnM3XEUmgFoxjnXsEJJERFWlujNSh2Cd2TIfdK1OYss++smhYrNSlVAs/AKerb
	FjX79KTFaQeLUPvy8u2zuzAhsopCviiMrXUNfEOqblDxJOt+wDZ8bE6WjE+loMjQ5kJOFKZhK9SqL
	FhaB2BhYe9ZAlZaFassR5HNbdG8wa7KyUwh52y+SaLWthCdk69lSvL2EvvusFPI5ZTHIw3OdUOTgv
	EeyVwbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbYW-00000001B3L-2XZs;
	Fri, 05 Jun 2026 20:54:16 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbYT-00000001B2H-3eMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:54:15 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-6c534af2470so1575768137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780692852; x=1781297652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3kdr6qrmm7a2qwk5wi4DJkHk54J0i+2AKmaQ2WBomY=;
        b=F2qivKfp8S7UaEdjPIHE//9FWozHQ5aRd1q1O1Xm+WTlFO078vO4xu8NuUpAFeXr0W
         zlnQ/TShDhykOB6lSpGF+5cbUIIvh7SIbG+yFIMrHlLbY8HxjwQ10GjICmFjTGgw9YnK
         X4yOGhJrUvCSUT/4dQWFTpIoluyylhFRgTf5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692852; x=1781297652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3kdr6qrmm7a2qwk5wi4DJkHk54J0i+2AKmaQ2WBomY=;
        b=VxvKRryXAns232Yz8EjPlpWZiE6b1dGV4c8sQR9E3GE1O7xQNSRdZgmeswtr3XN6ea
         qtyjVwpbXnRv5R0Y9kK5W+b/L1yyfvPjXsXe8BjzTDIjEkV0RwlVl2zusFQ5q0hutZYr
         XrPmgoDwYHkr1Nx8m9Ssy0irAThTcn5LCj54KUEhZYe+s/iBfxdIULEAZbjbC2YShORA
         luBmRGQSkStknOn+1SHhD6Bk3dgDmg/YGvhAMzGA3GylLJZVtH5uYsPqY+2KphkoemsE
         3u1tO3BT335EeGRjylhOgweMF0jnVivyN184rOe3Dol8pLL6osltoT5gHS3BdZFbpjeb
         EERg==
X-Forwarded-Encrypted: i=1; AFNElJ/nOHqYPM3aGH0yRd28C6A7hRDLMUpTMvIuGputVCZp7uaCBYrtTYJc4zrO7CslXsOH5GQWrzDXnPTdKHoTKmQq@lists.infradead.org
X-Gm-Message-State: AOJu0Yze2KzhyxkIrITLgyUsIc6HkC1eNwSkBYO8SHQNDL3Am7tn0OlC
	eOfDG+XKMcN5VBB/oRzQ+dIqQw80YUz8c4isMxl45kFA7Dxdl7kD+E781qXQUoCYwK5d0lg+mbE
	nsk0=
X-Gm-Gg: Acq92OFULS1tckwGdKQWwNaQB2ee+rVh9IJMSkPcbFEv16YOZl8IzUuVWDQBubsEdLT
	YPUJ9v0YXDlPBoskPYvK7t30XuwBoCdC81lxTIWr/g4tVVoSyZnMM/gGoHd8bSrPVKBH1Xm3Ghu
	/hH9qRl/uo2drBMB4FiBGPZuve/0AG77Ej8v/Bs2dLtXUsdcm+YllX2TamczxIwLV+o1w6gePxi
	3LkmDHr+AZMWtdNFYsHK72+YfgTpght3eYFzqg7bftgdthBkAV/KC1HudWER6MXbzFgmaptVP00
	UWO/zva62uNvzaj3XM7IUct4HsN2fi55hhE64WEwx3qGwgG95adGdPgG4aiLh6jugFhPK2UpNsw
	r9HBRlfAeTXl0qslb5L5uxDWUC5A5dZHUhR67nWg8wHpNqnhmAe8+JSY7kt+M8QpNsaIMwb11p5
	Awbg/gm5WjdSYhfk21gRCnm+iEFgZfyIx7LNMC+TKLLOd5MItRe/B2aYs2P3BDTMVjipo5VQZ0J
	Hoe7azOPz0=
X-Received: by 2002:a05:6102:4191:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-6fefd72e0b5mr3135447137.28.1780692852574;
        Fri, 05 Jun 2026 13:54:12 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f9afe7sm7539602241.6.2026.06.05.13.54.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 13:54:12 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963a722ed58so1495962241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99KaJD06qzncfu7OFlxiWNNCu1kWGDTSDe8XFi2Nh0+pUmvHjBN8zxjU6cwIigqP9RtG57kI9BTf4DMJ73aKRq@lists.infradead.org
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id
 ada2fe7eead31-6feed1adbffmr3683635137.4.1780692851321; Fri, 05 Jun 2026
 13:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <145b9e98b12a7d314fc4a203075f65c3a0c3a913.1780496779.git.kas@kernel.org>
In-Reply-To: <145b9e98b12a7d314fc4a203075f65c3a0c3a913.1780496779.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 13:54:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMqFVnri1aVGbFJhN6Ts3SeJUzEZrfN0Pqp9WeOzE=OA@mail.gmail.com>
X-Gm-Features: AVVi8Ce5lMqSEWZVqGZM1FY6-oeUDRbFaZ9laA85TwkYWEFSDqaKWmanEo0FJTk
Message-ID: <CAD=FV=XMqFVnri1aVGbFJhN6Ts3SeJUzEZrfN0Pqp9WeOzE=OA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drivers/firmware: add SDEI cross-CPU NMI service for arm64
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_135413_923238_75D49F31 
X-CRM114-Status: GOOD (  25.89  )
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

On Wed, Jun 3, 2026 at 7:36=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.nam=
e> wrote:
>
> @@ -928,11 +929,19 @@ static void arm64_backtrace_ipi(cpumask_t *mask)
>  void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_c=
pu)
>  {
>         /*
> +        * Prefer the SDEI cross-CPU NMI provider when active: firmware
> +        * dispatches the event out of EL3 and reaches CPUs that have
> +        * interrupts locally masked, without the per-IRQ-mask cost that
> +        * pseudo-NMI pays for the same reach. The plain IPI path below
> +        * can't reach such a CPU unless pseudo-NMI is enabled.
> +        *
>          * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_" in the=
 name,
>          * nothing about it truly needs to be implemented using an NMI, i=
t's
>          * just that it's _allowed_ to work with NMIs. If ipi_should_be_n=
mi()
>          * returned false our backtrace attempt will just use a regular I=
PI.
>          */
> +       if (sdei_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
> +               return;
>         nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_=
ipi);

nit: instead of one comment block, I would have broken it up in two. Like:

/*
 * Prefer the SDEI ...
 */
if (sdei_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
  return;

/*
 * NOTE: though ...
 */
nmi_trigger_cpumask_backtrace(...);



>  }
>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d8483..6501087ff90d 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -36,6 +36,25 @@ config ARM_SDE_INTERFACE
>           standard for registering callbacks from the platform firmware
>           into the OS. This is typically used to implement RAS notificati=
ons.
>
> +config ARM_SDEI_NMI
> +       bool "SDEI-based cross-CPU NMI service (arm64)"
> +       depends on ARM64 && ARM_SDE_INTERFACE
> +       help
> +         Provides SDEI-based cross-CPU NMI delivery for hooks that need
> +         to reach interrupt-masked CPUs on silicon that lacks FEAT_NMI:
> +
> +           - arch_trigger_cpumask_backtrace()  (sysrq-l, RCU stalls,
> +             hardlockup_all_cpu_backtrace, soft-lockup secondary dumps,
> +             hung-task auxiliary dumps)
> +
> +         The driver registers a handler for the SDEI software-signalled
> +         event (event 0) and reaches a target CPU by signalling it with
> +         SDEI_EVENT_SIGNAL. Firmware delivers the event out of EL3
> +         regardless of the target's PSTATE.DAIF -- forced delivery into =
a
> +         CPU wedged with interrupts locally masked.
> +
> +         If unsure, say N.

Is there some downside to this? It seems like anyone who has the SDE
interface would want this. Not sure why you'd suggest people say "N".

Other than the nit, this looks reasoanble to me, though I'm a complete
noob when it comes to SDEI...

Reviewed-by: Douglas Anderson <dianders@chromium.org>

