Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EB2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TulnqDkg59FUxryL3ptCGcm21LX3Mt6uGVOMyyGg9JE=; b=SaUxGUyGq3KPXFkKJsgcX2927r
	PYVc7WuyJZIZ44yCPJ3fomRIsuqDJDm3Im6Q/hByXALUkf7bnpmQoOCv1QGOw2rmWffcveEgYq2iQ
	DQ/LWmJKNwaYhopdLIEgYdLx3W+RTBP5qovT3q85zIsbJYo0qRdnJNpvFbiO5sUZ1UZo6bDsHGcaW
	kJ9fl+t9hhXHAO4T0sLbKZKH7bbhVr/5OkKyjVnxYOGmgzi4kNdhQu2V5mF65s/aX8LLyNlBbEbt8
	jwvMXb0SrcTLuRo2swHkP7VaoE/a1gCq7EJtlqUZe+YEeSzl4HuRaD9vq1zWngnHSLhZQ3dcJyGPh
	IsEa/sUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgob1-0000000DPCp-3Iyy;
	Mon, 06 Jul 2026 19:03:11 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgoay-0000000DPCD-24lW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TulnqDkg59FUxryL3ptCGcm21LX3Mt6uGVOMyyGg9JE=; b=UeVAjPhIMhfIm2xnQeMe5orSBM
	uayF73MrVjbGWrJ25XxvjD2d25sNcK0zKrEuCZ82LjAw0ZU2VY2I+URjnSfvinmrbXu1YmDqqm6le
	lQnl1a2bJF9kSMa2iHXsJay31dO7/QtzAV/P26NJeLBC/YIMhr/eqLnc6nBh5BuA/p86n3A3KefI7
	0S9+ugrrdYnUv7PBoJ/TnAP9FXIUHA+82RsgblFGeidTyscKAxv7hibM7s50UyhHsHXpxwOz/HWZz
	yjqf8JFo4bYrckHItBIeesMLfLAgznr2qV/vSng4KMoVZzw9xaImOty3UnWZrWV4nSv97nxlt04+A
	t0yEeGcw==;
Received: from 189-68-33-146.dsl.telesp.net.br ([189.68.33.146] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wgoaH-009svi-EM; Mon, 06 Jul 2026 21:02:25 +0200
Message-ID: <84ed46a8-54db-4f48-9d59-5c06cd020c03@igalia.com>
Date: Mon, 6 Jul 2026 16:02:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
To: Thomas Gleixner <tglx@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>,
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, Uros Bizjak <ubizjak@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, kernel-dev@igalia.com
References: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
 <87qzlhjick.ffs@fw13>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <87qzlhjick.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_120308_533945_73E6FDDD 
X-CRM114-Status: GOOD (  16.42  )
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

Thomas!

Em 05/07/2026 17:23, Thomas Gleixner escreveu:
> On Sun, Jul 05 2026 at 14:56, André Almeida wrote:
>> As explained in the Testing section above, we developed a test that puts
>> breakpoints in the code to test if a user code being interrupted really clears
>> the op_pending pointer. This test wasn't initially working because of this check
>> at futex_fixup_robust_unlock():
>>
>>          /*
>>           * Avoid dereferencing current->mm if not returning from interrupt.
>>           * current->rseq.event is going to be used subsequently, so bringing the
>>           * cache line in is not a big deal.
>>           */
>>          if (!current->rseq.event.user_irq)
>> 		return;
>>
>> rseq.event.user_irq was always false during my tests, and it prevents the fixup
>> to happen. I figured out that arm64_syscall_enter_from_user_mode() was the
>> issue because it doesn't set user_irq to true when the task comes from a
>> syscall.
> 
> I have no idea what you are babbling about.
> 
> A syscall enter never sets user_irq to true. It's only set to true when
> an interrupt/exception entry comes from user space, i.e. via
> 
>      irqentry_enter_from_user_mode()
>          rseq_note_user_irq_entry()
> 

Sorry for the babbling, you are right. I got confused by analyzing the 
kernel stack trace after running the tests and wrongly thought that I 
spotted something missing. Please ignore patch 1/5.

> No?
> 
> Thanks,
> 
>          tglx
> 


