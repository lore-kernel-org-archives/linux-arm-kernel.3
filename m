Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967DAD185F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndFWMjzooieb5xyGu4cJGAmspejtFb892UHQx8ZDIZg=; b=cFyuxmghlncyYiF7xaUXXb6S7I
	lw5s23EScNiTBzK1auoeNueK9PxuM6d2WIGlb2dEnA4kTTl+PiPbeTYaqmZvuuGNaDjPRvyEIs02W
	39MNj0jbUcblRJoyswdsuiXwYw0DuMVRvR2E7hqHUVvBxsoCsjS5QFY/CbSSmVNJZ980XRD5GdkZP
	vIgrB2/k6lfNu5OeAGGwVwRO1RG278omcUdZBJiRn/4HGAnnn5H5HAtKKwDkZE7aLlDksWJRAooDB
	9RXe41CqJ5gxqPfAR4iLCbFkoJk7aH0DUHZ2j5tTn7UJxG06pGvuyAXLTyEHgJlsw6E2x22f12GJZ
	iWx7vWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq8x-0000000HAv8-2jgn;
	Thu, 08 Jan 2026 13:33:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq8w-0000000HAuf-386I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9B3960136
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 13:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918D4C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767879217;
	bh=ndFWMjzooieb5xyGu4cJGAmspejtFb892UHQx8ZDIZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r/EdmpCVAgDo4biXkfjQarc2stbaiMWQEmRJ1angulctDwmO0To9YiVUXM47LcQAz
	 9JumEOXs+aGTeBjDskczURd/bqn3+g8H8y7vfo3tMeTr29Nx1pLHPn7QruMeppGtW2
	 DiQTYhRsJAjxAjVZHz5qn+ScVq6zT8sjyj3u4MaK9IanNX94b0iWq7c6IGjmYSqr9g
	 Q7dLbBjzeQo0oxuHwhpjzYikcdjeEmq6dhNPvJDYpcgQY32A4kTqVez6TOT/+P1oe7
	 egLt3HUrsxgq1X0SFmgaYPyOxXYSB6nyKKEGnKDLg6yNn1eIYBdDHU5IPtXEHyZI51
	 QAiIbX0qWNS2A==
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so2051549b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 05:33:37 -0800 (PST)
X-Gm-Message-State: AOJu0YzFg5h4X3vU1qONUUKBARR611CK4f9s1Bf/V+SV1Sd+9sQbM+hL
	0OIST2LR6a5LQPPjbp9QNO3RirVg9Mv4pKEsClj2nGybZlytXgPukBEEi3fQDLWu3ZmhSpp9uQl
	kkfkSV60R+yItK8JXVSPc6+xiT9pbsBs=
X-Google-Smtp-Source: AGHT+IGHIvVUprNBdrwsC9Pu7WwhWkbld3sZP0htQ2g4aAHDfX7s6G/JSDmknZne1WKYYALnNgfSsY07pebvo+Z3TWg=
X-Received: by 2002:a05:6a20:4308:b0:366:14b2:30e with SMTP id
 adf61e73a8af0-3898f9cd7ddmr6454679637.65.1767879217085; Thu, 08 Jan 2026
 05:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20251211040935.1288349-2-ardb@kernel.org> <CALxfFW4gyv3gSc1JhkPNqk4LL6S6gZbDRJx2y21PFZ8-8_9s_A@mail.gmail.com>
In-Reply-To: <CALxfFW4gyv3gSc1JhkPNqk4LL6S6gZbDRJx2y21PFZ8-8_9s_A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Jan 2026 14:33:25 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG+6CYVSV-2ZSqrEm+B=az+54=fNwHpC_6qQZ-z2=3Zgw@mail.gmail.com>
X-Gm-Features: AQt7F2oKLqFPgsT5ujde-bH1gL-fZZo30xTo_SHI9xAc2C3fpX2TG9hkL1r-C9c
Message-ID: <CAMj1kXG+6CYVSV-2ZSqrEm+B=az+54=fNwHpC_6qQZ-z2=3Zgw@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Bring back linear map randomization using
 PArange override
To: Seth Jenkins <sethjenkins@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
	mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, 
	kees@kernel.org, Liz Prucka <lizprucka@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 16 Dec 2025 at 19:14, Seth Jenkins <sethjenkins@google.com> wrote:
>
> > This is posted as an RFC because there are obvious shortcomings to this
> > approach. However, before I spend more time on this, I'd like to gauge
> > if there is any consensus that bringing this back is a good idea.
> I may be a minority, but I do think bringing this back is a good idea.
> It has now been 9+ years since hardware side channels for bypassing
> KASLR were discovered, and it still appears that real-world attackers
> overwhelmingly prefer alternative strategies - such as this one.
>
> I'm under no illusion that if we just do this one thing KASLR will be
> secure again, but I think this patch would still have a meaningful
> real-world impact in terms of making exploits significantly harder to
> write.
>

Thanks for the feedback.

I was hoping to get some other views on this matter, but sending the
patch during plumbers and right before the holidays probably didn't
help in that regard, I'm afraid.

Any thoughts on the desirability of this feature wrt randomization of
the placement of vmlinux in physical memory? AIUI, the main issue
being addressed here is predictable placement of statically allocated
kernel objects in the virtual address space, which could be solved in
either way. Or are there other concerns here?

Just trying to elicit as much input as possible on the list, so the
maintainers can make an informed decision.

Thanks,
Ard.

