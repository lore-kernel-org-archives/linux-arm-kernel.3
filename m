Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CBCDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSOFVzjnYNB1d5rrdzoosTOvprcgQBQWb0G+083URhQ=; b=irE9UNvulkjjeA9HPTl6iumDQ1
	OeJKWK+/9OnViJxCJ+/1YPyV4nbfHBBXfxuLHVHmjHwYkRtE1mvDZ49kVlcfeAnjUp0qRR28AOHo5
	fdTHfOcmUhhbfbK/3UeLLSMuA47JOPdYs1bMSCHiGI1Ki+hFZcO24oZQ+vc4gFWRckHznjWT4/iyr
	D3RF03gXFR5tz+9HpbszUNjusy363H8QXLKtSC7LEz126+uzCXRHJaYFu5/kdde3HZ52lLPo7tJW3
	3Ykp/DLHZD4f3dYW+AS5LEZn2bX+Ma9Pw1ZJTRJYRBVInrRyi4vDKn+Y2NJvFSpez+N7EQpvYXJHG
	yC497d2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPz5-0000000EYEz-0qSN;
	Wed, 07 Jan 2026 09:37:44 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPz2-0000000EYDX-037K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:37:42 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-44ffed84cccso506260b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778659; x=1768383459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSOFVzjnYNB1d5rrdzoosTOvprcgQBQWb0G+083URhQ=;
        b=cHRl+8AOF2tgmBCFwbPADdob5j9Ew0jb62mB6D8H23BUK0VO6ILMq+EguiRIB4K1/X
         /p/TZGBfKVZm1F8DFTPD9r4k32F7U32XUHZR9Vm/E1/L5F407flUiDK6sNcRZsyGCd3F
         /vTz8clDfByIaZ9qMCQqX+jJc2MxXVTv8dfv1z1o/PDIg8jHU4oguEl/xOKfm+3lXCq3
         Z9apgNJKmGpMp/5qnRCwJ2rj549MhzMfMgKVBUBx3DIYBHHD8CoGRDjcZijBTo9I/YJT
         xTwBEUtpz/qy6vZYdylJAnbKkn3ZZfMwJf+DJa3T99xyy8eIqVyn9UR0MnPTV6o+cC49
         bFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsHslkyKtzqyZJnx6pnW/Is7MCOz5RIqHTUWRn5JPAzy5jNA/tLxR2GVznLDJN1DS7ZgD+u76NnNVyrvJT5TER@lists.infradead.org
X-Gm-Message-State: AOJu0YyAe+ly8+NZiOhZqnEEEOaJfBCo/ySkB95kMM15FosMQveWjFrU
	KGohb4UoCvfuBYifEW6PRFB0ySxeYWXGfea+MN74p5VtXJPrN06pY/kq
X-Gm-Gg: AY/fxX4qOZD1+rbE66VM5xUDJsUa96+cyNWGgNS3ywvg2+ULDDcTBxkSZKk1MVxf6Vi
	mmp2AllfBvN3MZjNHnwBxWXLgVJe8ig8pQ1DM/Fz8qUoqjMBBZaebJBMgM4zEahJpVyE+2DaEX7
	CalOAusTCSXMcX9oPFbJ3Pp7HwowlT/rG4myl0cr3LC3Uwr8HuIReEDMqZKue8K+4wiTKkOV2IZ
	gP6IkTf/nbD0j1HPLYi324Px2DpotpQlr9xq56gLkks/8eJvFJ3dAKoh0sqXLwmh6QtvDkTcXuN
	+l5u7dB0ntW0s0iVmDQSECn4q+KyXcPvy24xTjvOQn++ms4KGGPdMTESeB5J97spG8hKb4n+RQY
	rsCYOK4yxtThlqj1tBPJsztkzDeBFSHG3YiTshhXw2w5mHdu/IC2Bsx0KBRrYNWMOedLujYcK2T
	/sNsln4UyFFqsStQ==
X-Google-Smtp-Source: AGHT+IE6mzfvESbk566yQV8NURTCe+ARwpNwZIV2RSmTygG0udCgbDFLYujQwW54LSoVrkMmFxWFbA==
X-Received: by 2002:a05:6808:120a:b0:455:d817:513f with SMTP id 5614622812f47-45a6bcc87f7mr802717b6e.14.1767778658722;
        Wed, 07 Jan 2026 01:37:38 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e288d5fsm2230196b6e.14.2026.01.07.01.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:37:38 -0800 (PST)
Date: Wed, 7 Jan 2026 01:37:36 -0800
From: Breno Leitao <leitao@debian.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Laura Abbott <labbott@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com, puranjay@kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Disable branch profiling for all arm64 code
Message-ID: <frfmxk2ifpf5shcws42q3eeykb3xyflxocbic6junm7mzvmqik@vktwefe2zmw7>
References: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
 <aVz-NHMG7rSJ9u1N@J2N7QTR9R3>
 <aVz-6WozGIxGiTUR@J2N7QTR9R3>
 <20260106111142.1c123f12@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106111142.1c123f12@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_013740_897159_0FE349E2 
X-CRM114-Status: GOOD (  16.88  )
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

Hello Steven,

On Tue, Jan 06, 2026 at 11:11:42AM -0500, Steven Rostedt wrote:
> On Tue, 6 Jan 2026 12:24:09 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> 
> > Whoops; s/CONFIG_DEBUG_VIRTUAL/PROFILE_ANNOTATED_BRANCHES/ in both
> > places in my reply.
> 
> Note, it could still be useful ;-) 
> 
> I've been running my yearly branch profiling build on both my main
> workstation and my server. I post the results from my server publicly (this
> is updated every night):
> 
>    https://rostedt.org/branches/current
> 
> If you check out the branch_annotated file, you can see there's still quite
> a bit that gets it wrong. Some of these is because of bad assumptions by
> the developer, others is because the code moved around causing new branches
> to make later annotated branches go the opposite way.

I am starting to look and remove some of these likely/unlikely hint that
are 100% wrong on some very sane configuration (arm64 baremetal hosts
running a webserver).

So far, these are the fixes I have in flight now.

 * https://lore.kernel.org/all/20260105-dcache-v1-1-f0d904b4a7c2@debian.org/
 * https://lore.kernel.org/all/20260106-blk_unlikely-v1-1-90fb556a6776@debian.org/
 * https://lore.kernel.org/all/20260105-annotated_idle-v1-1-10ddf0771b58@debian.org/

