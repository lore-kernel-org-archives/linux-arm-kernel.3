Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC71C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrlRnQHrCG4d6tPMV5yG7XeiopBpCeOoD6UcAs2qjYo=; b=piCp8ATRj75eghg0Fe/iQRMn/B
	cZY7VInxeMeIGW+fgNWGS4fv4aAz27lifRwTjKGH7ugO+w5DaV2B/1V8SuzGytbmHwg+1rVHY//2D
	V+Xpabhktuz6rfMctWS5FW/JZM3o7s4wdVCbZlbsEjzQ5LapsuesGCbKXxVunW6JNTr8F8HlQVjjF
	p/Ygs3emDqVbmssnAgD8M2sanAya4O81bFCMkM23dcORSU8XrfcaFYBvfNAZPb9ZtpfyzlxCC1EA0
	7UK6kFRIy6vRPdpYBGtqLjZHfYYBpe0T7g18DvFJxVXU9GiDLdB3RISCTY4SVhkZXgsGeJ+hSLtKu
	G8vo7l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU9Z-00000009kj2-4C0v;
	Tue, 18 Feb 2025 20:25:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTha-00000009fD0-3lJx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:56:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A04C15C5F1C;
	Tue, 18 Feb 2025 19:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB33BC4CEE2;
	Tue, 18 Feb 2025 19:56:14 +0000 (UTC)
Date: Tue, 18 Feb 2025 14:56:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, Martin
 Kelly <martin.kelly@crowdstrike.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>
Subject: Re: [PATCH v4 0/6] scripts/sorttable: ftrace: Remove place holders
 for weak functions in available_filter_functions
Message-ID: <20250218145636.37a1df08@gandalf.local.home>
In-Reply-To: <20250218145836.7740B3b-hca@linux.ibm.com>
References: <20250217153401.022858448@goodmis.org>
	<20250218145836.7740B3b-hca@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_115619_000477_CB8322D4 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue, 18 Feb 2025 15:58:36 +0100
Heiko Carstens <hca@linux.ibm.com> wrote:

> Hi Steven,
> 
> > This series removes the place holder __ftrace_invalid_address___ from
> > the available_filter_functions file.
> > 
> > The rewriting of the sorttable.c code to make it more manageable
> > has already been merged:
> > 
> >   https://git.kernel.org/torvalds/c/c0e75905caf368e19aab585d20151500e750de89
> > 
> > Now this is only for getting rid of the ftrace invalid function place holders.  
> 
> Since you asked me to test this on s390: seems to work with
> HAVE_BUILDTIME_MCOUNT_SORT enabled; the ftrace selftests still
> work as before.

My tests found a bug (forgot to initialize a variable) and I will be
sending a v5 soon.

You may also want to enable: CONFIG_FTRACE_SORT_STARTUP_TEST

That will make ftrace test to see if the mcount table is indeed sorted at
boot up.

-- Steve

