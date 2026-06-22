Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C8CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6dSGNMNY3+ZesnmZlBI1fLv0Njp9eIxZ3gGAGJvWuE=; b=a/De98xRfjNoXbNnRJG3L7dLST
	t7CPnXwzcPzhDRy3CuUSHodaAQP/J9IFw5HsrISdEen/u6DZnaO4pM4/MUcgNrBC6TbTbhiFx8Mm/
	iOQRxWDla7cjjQSsLxw2o6YZVsUYeokNPxY6dzgW4KZdqxCHe6jJrM+rqyQ6gqcn9yz22jyA/eFjs
	g3K1rdPLxDS+5VMsQrBr1YhAFoQ9ebBAmJFyAtwb0Vg5JfGKKtXyzy4iDFqYnh/rcF2Bxh04DCIhb
	UxmPPtqcqBh9YFj7rnaabRmS20oCml4wsaplueYt9IBWju4Ks+iVyd6FCbF6hMvqannnDkA0750yz
	y8/HY4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhtL-00000005DNM-2f3U;
	Mon, 22 Jun 2026 16:52:59 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhtI-00000005DM8-3Eic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:52:58 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-59ccf81e74bso1753016e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782147175; x=1782751975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6dSGNMNY3+ZesnmZlBI1fLv0Njp9eIxZ3gGAGJvWuE=;
        b=Ok8rqyYDNULSVIm5CeTnY5dWgNGZf1oEj3lgpqAtMOt7jQBAzMSJO2hJHuF9JZpRQL
         Vs37Z1lBVz+5qjC5bh8bJRyBQaXxNXs30fEOw1pRCDZF8t01Txn2H2qVHksIy4wpEKfe
         gbY8d6Uu9cbZ10dqxQlNrI1SyrGhEBpT+u/w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782147175; x=1782751975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w6dSGNMNY3+ZesnmZlBI1fLv0Njp9eIxZ3gGAGJvWuE=;
        b=IiJDN7HvEdT9JMTdOB7iuTuqMlrAe4D3VEFUWnwHb83yqrBso3EDgcuhGf7H4S+mgg
         oCzjVoWAp02nBVGd9QYrELgxM/yLscgONXz5yT6rbS+ro7iwYDOBfqAdHsbjPqbQNRh1
         eV6QUoHT4u7gryYXr21QE6hTknUanngoZQKSXJcjlUwIYWKpg40boez56XwzC4O+f3UC
         VUOLhZ75ibIk1NwZ3+apZPXI9iPMW8nIq82txAMZ1CekNQk+kMe4Kesv7vzamF7pQG55
         hIuVQbKFYpAgVIJqzWVpEw7AJ2tQvwUOZvh5LihK9Qvb9c8IGblRaARFDpDT4F2IzT1f
         ytnw==
X-Forwarded-Encrypted: i=1; AFNElJ9TEo6vdz8+w+2Z0VtAxnADdkxNgC/DieqATiWFxtt9I3QFCL7YuzmFMMnjx3hjHIt+jLfErOoHUehE8//RmUzt@lists.infradead.org
X-Gm-Message-State: AOJu0YyjptGs3tYAzJkin1HEo9qKPfV0Rs6JyGDROCXHsxdboFmJi8U+
	y1m/wd0lpcnjKiHjL1KXV2QLc29p6XxR3vJRYv82pefpgf3sjaj0byUb/q6ppI4LC7wkzCVEnm8
	2v1E=
X-Gm-Gg: AfdE7cmf9gKuBOSIdBUzjq5FH4j+KCLH8FXasUAUGf0xvquP7mfPl3bI6Rfk7ez33sq
	7kD1wof6oCUoKJtkJJYOYo45vK1DN8za9yh0+dNaKYMkSXjPHjzLU4HmKeDA27a9bWj+1T0hZyn
	I8r4yac61WmrJrZX2w3aL1xqnCJYChLmlU+s2MvVIB6xBkOzeUgv1HOhg93ssxd7l4FBnO++152
	4uFNOnd2Wrw0I53rfW4UY1TPlwa4GRvWmeJ7OTj9oexJv7wtFotSJSfrQfCD82OTfqZtjZn1Nli
	85m+nQmYWO0Nvv8928MkrPvL7XRMd+zib3jx58yChuFZkKpEDm9yAvQIO+/854opsZkJRjJQwsx
	57Chd6nfv7LufWVHYUh9gyrSa+tREYlgK9x+RwS/hzyXa5poFAP/Zk3GpjgxUpPTd8+j42I0NNu
	K2cbxrzvlxP03392kf2j92CZtb4BYKg4pb3YwOEEVX1zuVDiYhz+4=
X-Received: by 2002:a05:6102:5491:b0:720:81d5:92dd with SMTP id ada2fe7eead31-72a78a86867mr7351508137.22.1782147174787;
        Mon, 22 Jun 2026 09:52:54 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c0e9590sm6933949241.3.2026.06.22.09.52.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:52:52 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966f003be09so970380241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 09:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+nFZqLh15KoMGZlBo32Oid/2kPyDDrD8LWmo8+3XpCa7fPUHdQ6L2qCI9OBFLGk/ySWOkC53TIMXb/j6XFzv33@lists.infradead.org
X-Received: by 2002:a05:6102:f88:b0:636:46ee:2f0b with SMTP id
 ada2fe7eead31-72a768114c3mr7575649137.12.1782147171526; Mon, 22 Jun 2026
 09:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781709543.git.kas@kernel.org> <ajVLeseWOZn0XXY2@arm.com>
 <868q8asj1u.wl-maz@kernel.org> <ajk-Vge2qhaY-TwJ@thinkstation>
In-Reply-To: <ajk-Vge2qhaY-TwJ@thinkstation>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jun 2026 09:52:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTcL1NVkvR8Fw_BXvHHk-vBtLSGoJrU-RFSt0yvGUjxA@mail.gmail.com>
X-Gm-Features: AVVi8CfGHrJjtsTwjSYF25Ig4REGll-mWwkEm8aTUXbr2Wvoj2jvWteIYcEcXB8
Message-ID: <CAD=FV=UTcL1NVkvR8Fw_BXvHHk-vBtLSGoJrU-RFSt0yvGUjxA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: cross-CPU NMI via SDEI
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Petr Mladek <pmladek@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_095256_863499_86684CB0 
X-CRM114-Status: GOOD (  26.30  )
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

On Mon, Jun 22, 2026 at 6:56=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.na=
me> wrote:
>
> The ratio is flat across the whole 1-to-72 sweep, so -- relevant to the
> scalability question -- it's a constant per-syscall tax, not a contention
> effect. The impact tracks syscall/exception density: page_fault1, a more
> realistic workload, stays within ~5%.

FWIW, I'm not sure 5% is truly a "realistic" measure of the overhead
here. While it cannot be denied that pseudo-NMI has some overhead,
every time I've seen someone study it in "real world" scenarios it
ends up being fairly negligible. Not zero, mind you. ...but some
amount below 1%.  ...and by this, I mean put real-world workloads on a
system with pseudo NMI enabled and pick your favorite metric. Perhaps
measure the amount of work completed in a given time. I dunno if this
is possible for you to do in this case.


> > The direction of travel is to deprecate SDEI. I wouldn't add more stuff
> > on top of this interface.
>
> I understand FEAT_NMI is the long-term answer, and I'm not arguing agains=
t
> deprecating SDEI. My concern is the gap in between. By our estimate it's
> 10+ years before the last non-FEAT_NMI machine retires from the fleet --
> for scale, we're still running Skylake today. So there's roughly a
> decade where a large installed base has neither FEAT_NMI nor affordable
> pseudo-NMI, and no way to reach a DAIF-masked CPU for an all-CPU
> backtrace or to capture a wedged CPU in a crash dump. That's the
> functional gap this series tries to cover.
>
> Given the deprecation direction, I deliberately kept the SDEI footprint a=
s
> small as I could. The series adds no new firmware interface and no vendor
> SMC -- it uses only the standard software-signalled event (event 0) via
> SDEI_EVENT_SIGNAL, which is already present on these systems for
> firmware-first RAS (APEI/GHES). And SDEI is only ever invoked in a "bad
> state": to deliver a backtrace signal to a CPU that a normal IPI can't
> reach, or to stop a CPU that ignored the stop IPIs. Nothing on any hot or
> steady-state path touches it.
>
> If even that minimal use is unacceptable on a deprecated interface, I'd
> rather know now and redirect the effort -- but I'd appreciate a pointer t=
o
> what should cover this gap for existing silicon in the meantime.

FWIW, despite the fact that pseudo-NMI (in my experience) ends up
being mostly negligible, personally I'd be in favor of landing Kiryl's
patches. I dunno how many times I've had the discussion of pseudo-NMI
overhead over the years and it's certainly very easy to show that
there is _some_ overhead and that in pathological cases there is a lot
of overhead. As Kiryl says, the patches don't add a ton of extra
complexity and they even combine some of the stop/crash-stop code,
which is nice. Having them as a stop-gap until true NMI is available
seems nice to me. ...of course, I'm not an ARM maintainer, so it's
obviously not up to me. :-)

-Doug

