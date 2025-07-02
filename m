Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1383C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HpnIoplFmWQYQkSy1915z9kG2C5g+9MVhFgiTrBDOc=; b=FQ5Fhtzj8uMzvBX8iTbTtQOJWQ
	FF+wOqn6lr3ocSU3ZQWPQLAGs+iWTDZrpP7FzFuthxm1P5rwgW9iRQ2X7M44/nMxYLFzAgOzjXW8R
	arovadg4U6WAlBG0ZIcQkevwL8JzsYFBw/bSp8xYHD0bQFYqImTDYqHyp5g6vFksVDUnEbdpfK6VK
	LYcSNihsfDzHbmM5HaqKPij7aGY8UEh8ApmJDSbEz8aqoOxJw9gnWAAvzw8PiRsK4MazP8Nu9pbNW
	fQozgkcif4Mp1ZxLYUgTnqLiFZwpQRWjaRmklwtQzleBY7tZ6bI/ddF6XsmXiScjot460CK2RxyZf
	8wLv4gDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrmE-00000007U8w-34Yu;
	Wed, 02 Jul 2025 07:21:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrjs-00000007Tr6-2Qu7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 07:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751440718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1HpnIoplFmWQYQkSy1915z9kG2C5g+9MVhFgiTrBDOc=;
	b=RSozjltYZQeB8gUbf0A+wC1bF8VlcMsYGJ8PTPDH50991jgkT8a4NwRt2J7JLPo9zws7Rp
	bNO2nhGTImNSSg4nG7ckoZorqr4tFzxYrhX4asa3byTQ8PSvGHiEWbXsMwg/iQsa03PbEF
	9RK3f21Efp7TM7jcHXuG+IrxsMQfzXE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-9cBSFn9nMnSt-grO14wT_A-1; Wed, 02 Jul 2025 03:18:37 -0400
X-MC-Unique: 9cBSFn9nMnSt-grO14wT_A-1
X-Mimecast-MFC-AGG-ID: 9cBSFn9nMnSt-grO14wT_A_1751440716
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4539b44e7b1so21845675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 00:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440716; x=1752045516;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDUViJcXkIlXiB88dAQamJf+aOAdf1T+Ho4KanTBA8E=;
        b=LBjmrsrI0eG3xX+lirUoX5TsgPDomaA7dP6ls37UILWWEGaUWcfV2D+tCpe2tH4Ft6
         k+CYQcLmulUYjajWvSg6PsHHGWfHeRgjrdN/GWFQVY/tOvaYRb8Ij0CnIqKXG3r/TaHh
         lSU2+e3cmusX60L/lGCPTtURpGrfL7Jl130PHs1LXl3XM7K8YE0Vg+CXjII4Hbi41gGn
         kp9ZrPss97VfmleYJ/mGRA6LO+4t3vXb8KEziVC0SJmPAesgNoivUfD1zP8VnPiRFoCB
         1pPoffUKF6oH2mD0Vmix+huvwha1tGDJL6/2RFucEACZjYK0yjhR4GJ6+kYu+v6vvEbX
         Uzqg==
X-Forwarded-Encrypted: i=1; AJvYcCUMCVtetSoFVgll0hDG41q2AN7W57NRhTyutDP6mdEb+Ag+cOZ21XEw8no4/tSYxrI4PkbWgdgUgYtMaT1DWpjU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/gXWg18LSMxb8bCnGiRCeXZm/fRoQoYLEmZ6sQ7a7Ch7UeJq9
	slYbYeVwC0nFCMCOsGKb4P6H5zifdGk4SOax5aVAFgvJvVWoJFtBrsnUJT+84Cvy3y/y6zDq5Xi
	W2gCx9IrhKMLbdrlRMBpk9pdxq9Q/W3DHAVFlrBQIomw3dVzhwl3wZ6kF0hZYWhme6VdJTvvup5
	HUahOV3IX26ZA=
X-Gm-Gg: ASbGncvzn3LrFKEUtrEcYk1hlV2Gzx405Ur5ytiye/QT3BcTPPJE1TgFjLwKGAo0tkt
	2DR93g8rZIPILvKhZAa0+pZG7JdkdARbkiuUDfIyAI0dGMBIDa1vw4bJ89IU+yLsGLSPOoePDvc
	MWEa2Gd/arjLDsb5P5tNp7BHrqCU6rmQxRF2fYC74myBHNwQqDTxCDOe0r5x6H0sa2A3tCCnZ5w
	9Pqy1yu8DpT6DoIyL8WgCqu+EuO84FrSl+qsEsNZDBvgSuL9pRxRLFFwFgHZCqP8Yo6p3BpYQgA
	VMZdJV7fRsbl7sJ4lgyMadp7nc+Jnj4FIHZzpEqYHE8RozkO
X-Received: by 2002:a05:600c:1c09:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-454a38c6b35mr18382965e9.16.1751440715710;
        Wed, 02 Jul 2025 00:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0GCHKuqWnzbgcCC6m78Wi/zAqCIxAo5Dp7eqsRuep+U+N6YTxhNMXvShwaYLGKWZpCfAjNg==
X-Received: by 2002:a05:600c:1c09:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-454a38c6b35mr18382505e9.16.1751440715213;
        Wed, 02 Jul 2025 00:18:35 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm219597395e9.5.2025.07.02.00.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:18:34 -0700 (PDT)
Message-ID: <5097b17cc506af60ca718aba5a0a10e0fda01440.camel@redhat.com>
Subject: Re: [PATCH v2] tracing: Fix inconsistency in irq tracking on NMIs
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy
 Lutomirski <luto@kernel.org>,  Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,  Mark
 Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 09:18:32 +0200
In-Reply-To: <20250701125459.GL1613200@noisy.programming.kicks-ass.net>
References: <20250625120823.60600-1-gmonaco@redhat.com>
	 <20250701125459.GL1613200@noisy.programming.kicks-ass.net>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TSB0qX8giwAPNP1caA4DzH_LboaAj1OGpyJKZYxxYyA_1751440716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_001840_692187_DF2DADAC 
X-CRM114-Status: GOOD (  38.50  )
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



On Tue, 2025-07-01 at 14:54 +0200, Peter Zijlstra wrote:
> On Wed, Jun 25, 2025 at 02:08:22PM +0200, Gabriele Monaco wrote:
> > The irq_enable/irq_disable tracepoints fire only when there's an
> > actual
> > transition (enabled->disabled and vice versa), this needs special
> > care
> > in NMIs, as they can potentially start with interrupts already
> > disabled.
> > The current implementation takes care of this by tracking the
> > lockdep
> > state on nmi_entry as well as using the variable tracing_irq_cpu to
> > synchronise with other calls (e.g. local_irq_disable/enable).
> >=20
> > This can be racy in case of NMIs when lockdep is enabled, and can
> > lead
> > to missing events when lockdep is disabled.
> >=20
> > Remove dependency on the lockdep status in the NMI common
> > entry/exit
> > code and adapt the tracing code to make sure that:
> >=20
> > - The first call disabling interrupts fires the tracepoint
> > - The first non-NMI call enabling interrupts fires the tracepoint
> > - The last NMI call enabling interrupts fires the tracepoint unless
> > =C2=A0 interrupts were disabled before the NMI
> > - All other calls don't fire
>=20
> I'm not at all convinced this is correct. Nor can I understand
> anything
> much about what you wrote above.
>=20
>=20
> > =C2=A0arch/arm64/kernel/entry-common.c |=C2=A0 5 ++---
> > =C2=A0kernel/entry/common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++---
> > =C2=A0kernel/trace/trace_preemptirq.c=C2=A0 | 12 +++++++-----
> > =C2=A03 files changed, 11 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/arch/arm64/kernel/entry-common.c
> > b/arch/arm64/kernel/entry-common.c
> > index 7c1970b341b8c..7f1844123642e 100644
> > --- a/arch/arm64/kernel/entry-common.c
> > +++ b/arch/arm64/kernel/entry-common.c
> > @@ -213,10 +213,9 @@ static void noinstr arm64_exit_nmi(struct
> > pt_regs *regs)
> > =C2=A0=09bool restore =3D regs->lockdep_hardirqs;
> > =C2=A0
> > =C2=A0=09ftrace_nmi_exit();
> > -=09if (restore) {
> > -=09=09trace_hardirqs_on_prepare();
> > +=09trace_hardirqs_on_prepare();
> > +=09if (restore)
> > =C2=A0=09=09lockdep_hardirqs_on_prepare();
> > -=09}
> > =C2=A0
> > =C2=A0=09ct_nmi_exit();
> > =C2=A0=09lockdep_hardirq_exit();
> > diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> > index a8dd1f27417cf..e234f264fb495 100644
> > --- a/kernel/entry/common.c
> > +++ b/kernel/entry/common.c
> > @@ -343,10 +343,9 @@ void noinstr irqentry_nmi_exit(struct pt_regs
> > *regs, irqentry_state_t irq_state)
> > =C2=A0{
> > =C2=A0=09instrumentation_begin();
> > =C2=A0=09ftrace_nmi_exit();
> > -=09if (irq_state.lockdep) {
> > -=09=09trace_hardirqs_on_prepare();
> > +=09trace_hardirqs_on_prepare();
> > +=09if (irq_state.lockdep)
> > =C2=A0=09=09lockdep_hardirqs_on_prepare();
> > -=09}
> > =C2=A0=09instrumentation_end();
> > =C2=A0
> > =C2=A0=09ct_nmi_exit();
> > diff --git a/kernel/trace/trace_preemptirq.c
> > b/kernel/trace/trace_preemptirq.c
> > index 0c42b15c38004..fa45474fc54f1 100644
> > --- a/kernel/trace/trace_preemptirq.c
> > +++ b/kernel/trace/trace_preemptirq.c
> > @@ -58,7 +58,11 @@ static DEFINE_PER_CPU(int, tracing_irq_cpu);
> > =C2=A0 */
> > =C2=A0void trace_hardirqs_on_prepare(void)
> > =C2=A0{
> > -=09if (this_cpu_read(tracing_irq_cpu)) {
> > +=09int tracing_count =3D this_cpu_read(tracing_irq_cpu);
> > +
> > +=09if (in_nmi() && tracing_count > 1)
> > +=09=09this_cpu_dec(tracing_irq_cpu);
> > +=09else if (tracing_count) {
> > =C2=A0=09=09trace(irq_enable, TP_ARGS(CALLER_ADDR0,
> > CALLER_ADDR1));
> > =C2=A0=09=09tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
> > =C2=A0=09=09this_cpu_write(tracing_irq_cpu, 0);
> > @@ -89,8 +93,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on);
> > =C2=A0 */
> > =C2=A0void trace_hardirqs_off_finish(void)
> > =C2=A0{
> > -=09if (!this_cpu_read(tracing_irq_cpu)) {
> > -=09=09this_cpu_write(tracing_irq_cpu, 1);
> > +=09if (this_cpu_inc_return(tracing_irq_cpu) =3D=3D 1) {
> > =C2=A0=09=09tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> > =C2=A0=09=09trace(irq_disable, TP_ARGS(CALLER_ADDR0,
> > CALLER_ADDR1));
> > =C2=A0=09}
> > @@ -103,8 +106,7 @@ void trace_hardirqs_off(void)
> > =C2=A0{
> > =C2=A0=09lockdep_hardirqs_off(CALLER_ADDR0);
> > =C2=A0
> > -=09if (!this_cpu_read(tracing_irq_cpu)) {
> > -=09=09this_cpu_write(tracing_irq_cpu, 1);
> > +=09if (this_cpu_inc_return(tracing_irq_cpu) =3D=3D 1) {
> > =C2=A0=09=09tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> > =C2=A0=09=09trace(irq_disable, TP_ARGS(CALLER_ADDR0,
> > CALLER_ADDR1));
> > =C2=A0=09}
>=20
> So what about lovely things like:
>=20
> trace_hardirqs_on_prepare()
> =C2=A0 if (tracing_irq_cpu) {
> =C2=A0=C2=A0=C2=A0 tracer_hardirqs_on();
> =C2=A0=C2=A0=C2=A0 <NMI>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_hardirqs_off_finish();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (this_cpu_inc_return() =3D=
=3D 1) // will be > 1
>=20
>=20
> So now we've traced IRQs are on, start an NMI, and loose the IRQs off
> event. Well done.
>=20
>=20
> This was all safe in that it would occasionally emit a duplicate
> state,
> but no state was wrong. Both your attempts have broken things.
>=20
> How about you fix you tool to accept duplicate state in the face of
> NMI
> instead?

Alright, I get this is yet another broken solution.. Thanks for
pointing it out.

The problem here is that, from the model's perspective, we don't only
get duplicated events, but also missing ones:

 d..1. ..932: irq_enable:   caller=3Dfinish_task_switch
 d.h3. ..933: event_sncid:  can_sched x irq_disable -> cant_sched
 d.h2. ..933: irq_disable:  caller=3Dirqentry_nmi_enter+0x53=20
 d.h2. ..936: nmi_handler:  perf_event_nmi_handler()
< missing irq_enable from NMI >
 ...2. ..942: error_sncid:  event schedule_exit not expected in the
state cant_sched

[This monitor verifies exiting and entering __schedule occur only with
interrupts enabled]

I first thought this was just possible with racing NMIs, but as Thomas
pointed out [1], this can happen much easier when irqsoff is enabled
but lockdep is not.

I could probably only fix this without even considering NMIs when
interrupts are disabled, but I believe if that happens, the tracepoints
would report something wrong, since using tracing_irq_cpu alone does:

local_irq_disable -> trace_irq_off
  nmi_enter -> no trace
  nmi_exit -> trace_irq_on
  // here interrupts are still off, aren't they?
local_irq_enable -> no trace

The idea that I described poorly, was to use tracing_irq_cpu in a way
that the first context disabling interrupts fires the tracepoint
(current behaviour), but when it's time to enable interrupts, an NMI
which didn't disable interrupts shouldn't trace but let the next
context trace.

Thanks,
Gabriele

[1] - https://lore.kernel.org/lkml/87sejup1fe.ffs@tglx


