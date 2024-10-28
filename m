Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0FAD1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDri43oQ6nee0pRXBOnuVbsguXFK2/SayOt4yMpeFzE=; b=Vjo0KE6oTdneLx21kL/OtmLgNS
	1qwPkMRv9WMOlbCW9DjSePerwz1O8KbS8lAM1+jYboMgaBEupIlpTcx/ipJGM2DuPv1R4k7abslOj
	79DVbhvHMZ868HgA70R91DQMqepUfZybEcxMGXo86lyLyGauMhwOlAfWsxxOufISDstUDl6hQmEYQ
	hgIHj+OO8cELHjtPjavmF83WE7buy62HWNUZfyhR1Ld0G0sTxshsgOiSOptg60jgU1yFbUEOaJDNk
	j/DF17TohVlRKoHtNdg1wGjf/ls3YVZ9x1dE/WvubWBpSCbC/ZtK0mh09ppBtuufKbhEZC01TjqpO
	w+h73+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P9P-0000000AozD-24NF;
	Mon, 28 Oct 2024 12:47:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P0f-0000000AmUa-1L3w;
	Mon, 28 Oct 2024 12:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A52D85C58DF;
	Mon, 28 Oct 2024 12:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D312C4CEE8;
	Mon, 28 Oct 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119092;
	bh=V1JXJL1vWwx7XP9YK/J1MZBdP+aQk/vvq7BuTE22XGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pPcuanI4L/9WHLvcEeESZlfco46yDS+cvw01ROOOs6ZBpPWbDhX7bdzaNH4kIZHWi
	 u/Tc+1Lq56F6vDPKvI84Ub7g2Iq6FU9LUmZNwydfWyyMk5XROv1P+ngdZ22truySCI
	 8M2kw96x8tdQfqGPyfDHCGAXb3nRv0K2D5TkZpzCwjDKWGte0QR9r1itWqW0EMxIRv
	 RGiWOeG6SHr9fE/b3LYUgUxwt6fn8bNlPM6mnM71QNBL8B5HdB7mArKp5RI4MubYpN
	 ku6exlDFjc3Fwpvdr+sE5TjHoHWOpBb2AWHyzv+Qv5ikzNwNXTOp30UINpKOmVsXRj
	 HLtI5d+Z52QWA==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7180e07185bso1858674a34.3;
        Mon, 28 Oct 2024 05:38:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOdERm34R6gEMA1665LPPzYwkrcNs2Y6nSlEk8QW6nJj8M72GQZfX0mFw2y3URcpHZGZUnKz1HrTJpSVaZDInD@lists.infradead.org, AJvYcCV/omwxNxNXQd18fwKOIfQ67tZ5PWQCuc2JpzLuO1esruWwAh0cL3JQAxlrzYW2cpoK6wcDf7LA+J9FiCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYRdy0Cu/W+qKCEgA7dPqh6NAhY+4/34q12h7hMFGmBOPOvsig
	vOlcH5gxHII9hm93vyaOd1hJXFoFLzG4WbJf9WlK2mz40B4IZgVmga2AizdnYdggYqjaXeu+jus
	W4jlIrPRpBKbZ9dG7hUU2KbjyWUE=
X-Google-Smtp-Source: AGHT+IHcPpA8PwSHFKyy4jVsSoWz0exQdbIJ/BCQr8AmaXDfJKdcACxok+MuRtE7oJfCfUQ19KdoW2248k6Yc5vVjzs=
X-Received: by 2002:a05:6870:3310:b0:25e:23b4:cf3e with SMTP id
 586e51a60fabf-29051e30582mr6787713fac.44.1730119091651; Mon, 28 Oct 2024
 05:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241028105200.1205509-1-pierre.gondois@arm.com>
In-Reply-To: <20241028105200.1205509-1-pierre.gondois@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 28 Oct 2024 13:37:55 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g=Q0aYEZUdy+F-bmptOvLVRxAs5gzGpbgrbCoFxMpcZQ@mail.gmail.com>
Message-ID: <CAJZ5v0g=Q0aYEZUdy+F-bmptOvLVRxAs5gzGpbgrbCoFxMpcZQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: CPPC: Make rmw_lock a raw_spin_lock
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jeremy Linton <jeremy.linton@arm.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Steffen Persvold <spersvold@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Reinette Chatre <reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, 
	Yury Norov <yury.norov@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_053813_476812_96726156 
X-CRM114-Status: GOOD (  19.49  )
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

On Mon, Oct 28, 2024 at 11:52=E2=80=AFAM Pierre Gondois <pierre.gondois@arm=
.com> wrote:
>
> The following BUG was triggered. sugov_update_shared() locks a
> raw_spinlock while cpc_write() locks a spinlock. To have a correct
> wait-type order, update rmw_lock to a raw_spinlock.
>
> Also save irq state.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [ BUG: Invalid wait context ]
> 6.12.0-rc2-XXX #406 Not tainted
> -----------------------------
> kworker/1:1/62 is trying to lock:
> ffffff8801593030 (&cpc_ptr->rmw_lock){+.+.}-{3:3}, at: cpc_write+0xcc/0x3=
70
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by kworker/1:1/62:
>   #0: ffffff897ef5ec98 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_ne=
sted+0x2c/0x50
>   #1: ffffff880154e238 (&sg_policy->update_lock){....}-{2:2}, at: sugov_u=
pdate_shared+0x3c/0x280
> stack backtrace:
> CPU: 1 UID: 0 PID: 62 Comm: kworker/1:1 Not tainted 6.12.0-rc2-g9654bd3e8=
806 #406
> Workqueue:  0x0 (events)
> Call trace:
>   dump_backtrace+0xa4/0x130
>   show_stack+0x20/0x38
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x28
>   __lock_acquire+0x480/0x1ad8
>   lock_acquire+0x114/0x310
>   _raw_spin_lock+0x50/0x70
>   cpc_write+0xcc/0x370
>   cppc_set_perf+0xa0/0x3a8
>   cppc_cpufreq_fast_switch+0x40/0xc0
>   cpufreq_driver_fast_switch+0x4c/0x218
>   sugov_update_shared+0x234/0x280
>   update_load_avg+0x6ec/0x7b8
>   dequeue_entities+0x108/0x830
>   dequeue_task_fair+0x58/0x408
>   __schedule+0x4f0/0x1070
>   schedule+0x54/0x130
>   worker_thread+0xc0/0x2e8
>   kthread+0x130/0x148
>   ret_from_fork+0x10/0x20
>
> Fixes: 60949b7b8054 ("ACPI: CPPC: Fix MASK_VAL() usage")
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/acpi/cppc_acpi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 1a40f0514eaa..e7e4bf932e28 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -1127,7 +1127,7 @@ static int cpc_write(int cpu, struct cpc_register_r=
esource *reg_res, u64 val)
>                         return -ENODEV;
>                 }
>
> -               raw_spin_lock_irqsave(&cpc_desc->rmw_lock, flags);
> +               raw_spin_lock(&cpc_desc->rmw_lock);

This won't apply because the current code is

spin_lock(&cpc_desc->rmw_lock);

and analogously below.  I think that it needs to be
raw_spin_lock_irqsave(), though.

Besides, a raw spin lock needs to be declared as such.

>                 switch (size) {
>                 case 8:
>                         prev_val =3D readb_relaxed(vaddr);
> @@ -1142,7 +1142,7 @@ static int cpc_write(int cpu, struct cpc_register_r=
esource *reg_res, u64 val)
>                         prev_val =3D readq_relaxed(vaddr);
>                         break;
>                 default:
> -                       raw_spin_unlock_irqrestore(&cpc_desc->rmw_lock, f=
lags);
> +                       raw_spin_unlock(&cpc_desc->rmw_lock);
>                         return -EFAULT;
>                 }
>                 val =3D MASK_VAL_WRITE(reg, prev_val, val);
> @@ -1175,7 +1175,7 @@ static int cpc_write(int cpu, struct cpc_register_r=
esource *reg_res, u64 val)
>         }
>
>         if (reg->space_id =3D=3D ACPI_ADR_SPACE_SYSTEM_MEMORY)
> -               raw_spin_unlock_irqrestore(&cpc_desc->rmw_lock, flags);
> +               raw_spin_unlock(&cpc_desc->rmw_lock);
>
>         return ret_val;
>  }
> --
> 2.25.1
>

