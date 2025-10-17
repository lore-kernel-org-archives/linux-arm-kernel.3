Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801AFCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NUdGt9MtwvZM8jFQHDsw1CCYzG2H7JFSs9BY7PdJqA=; b=nsxdbRsZ7YEmbG3Loi6qslqUeW
	LySvzl0UXMYeQ8CD7P9EqEOFSTDL4dHNT320mW6P2KNdDZvG93Dz55hQsSbqStLG5edZFmoEfzMpw
	8oCgGgzgHowS1OIUbC6Z/HeQy8Z2btFHQZEboxwRsEMcREW87ENyXokG3ix+4Y9xnGKFwu1y7f3Kz
	fjmhNd+8Ezm3zkYjPaviqELutXVJxDmiHUoyu5ir2eonPOwUIL2yn4cBOocTd2PzqcdoLS0WO9ANE
	3mZRBZFT6JO5hCl2pnSkFMmMVtsKh5N97pZx5ZyA1tTyT54h8oSg5Qe48EYZZyFwkuKnz6c6xokHj
	IyqGtQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia7-00000007g2Z-43dw;
	Fri, 17 Oct 2025 11:25:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia6-00000007g0j-17pq;
	Fri, 17 Oct 2025 11:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6NUdGt9MtwvZM8jFQHDsw1CCYzG2H7JFSs9BY7PdJqA=; b=Hs9rnXkxHjJhukQH8YKpfmx1MG
	VZA60esTzih9n9wz+52eqcD59QOx+XDFIHyh7c+pophLHqgU4pS4pFhzbPljuZVWqPytPuzxcaLl7
	S+E7SYSRSFwMybJrMhDmdTjSEfc00iD7BHmyfTmTRiICFGeQllh5SzKuMB3fgb9Ax4AAWWvj3Uavu
	KjG5+YOXW8tPPa0//Qqm1AlGRYRbcs7Y3JxSsHqhWz2AGe38QnB6cYh9h9t3xtx3WZuOcipGJF8lQ
	1baXzfSn292iNCLYPtUPcw5e9HmK8yNQQvOc+EEUeIP/k8jyFwFcGC+J6+je+9353wqrDfz3kSPye
	pecvA4Gw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia1-00000007Web-1SpD;
	Fri, 17 Oct 2025 11:25:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E1F4030023C; Fri, 17 Oct 2025 13:25:04 +0200 (CEST)
Date: Fri, 17 Oct 2025 13:25:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251017112504.GE3245006@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
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

On Fri, Oct 17, 2025 at 12:08:24PM +0100, Andrew Cooper wrote:
> On 17/10/2025 11:09 am, Thomas Gleixner wrote:
> > --- a/include/linux/uaccess.h
> > +++ b/include/linux/uaccess.h
> > +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
> > +for (bool ____stop = false; !____stop; ____stop = true)						\
> > +	for (typeof((_uptr)) _tmpptr = __scoped_user_access_begin(_mode, _uptr, _size, _elbl);	\
> > +	     !____stop; ____stop = true)							\
> > +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;		\
> > +		     ____stop = true)					\
> > +			/* Force modified pointer usage within the scope */			\
> > +			for (const typeof((_uptr)) _uptr = _tmpptr; !____stop; ____stop = true)	\
> > +				if (1)
> > +
> 
> Truly a thing of beauty.  At least the end user experience is nice.
> 
> One thing to be aware of is that:
> 
>     scoped_masked_user_rw_access(ptr, efault) {
>         unsafe_get_user(rval, &ptr->rval, efault);
>         unsafe_put_user(wval, &ptr->wval, efault);
>     } else {
>         // unreachable
>     }
> 
> will compile.  Instead, I think you want the final line of the macro to
> be "if (0) {} else" to prevent this.
> 
> 
> While we're on the subject, can we find some C standards people to lobby.
> 
> C2Y has a proposal to introduce "if (int foo =" syntax to generalise the
> for() loop special case.  Can we please see about fixing the restriction
> of only allowing a single type per loop?   This example could be a
> single loop if it weren't for that restriction.

So elsewhere, Linus suggested to use a struct to get around that. See
for example this lovely thing:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=locking/core&id=1bc5d8cefd0d9768dc03c83140dd54c552bea470


