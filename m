Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCDDFD5F98
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1lmlVtkteyQKjPIU9nkL+Qh7tCpjY5hPIL47/43B9k=; b=n9Zk0P1TBgMiNutTTzIzmuPbvN
	TRVQpOnmRAkZaywUzrXt/RMIopFXFBr6D8KRTSichamA5Fq2Vwh/oqBibM9vzXUT3A+hK/dkpkf4i
	fteWBKqgS/6rgP7ySD/J64pSgxzKv4MIoZnBakoO3BvWA/svCZtBibRHT2AH/vAduuYHe3qhhahwz
	kk7ONbKIUVFnNc7t3NikI0QY8Uq0AmjIlgudNL2IVxV3Co33jAGWZX69BIXzOhi5ME5+46d+L5mxS
	uRClnBZYR5TTk3lT+pswX4bcjqXYmDRaABKhzZjqcsOBc6CpJPynxdlx4qSqvNu39QPuPxf0oDKTp
	IfX9muyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOoG-00000008YbA-3UFq;
	Wed, 08 Apr 2026 09:02:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOoD-00000008Yag-2EZl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:02:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BED6B267F;
	Wed,  8 Apr 2026 02:02:40 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8BE3F632;
	Wed,  8 Apr 2026 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775638966; bh=MwIZpurKIaK2YuB/c3NPv24N8boUyLW1J76Veiv9B6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTIObpTILIdqTFIxZapH4Zhoi4927Ed25qDNcejFd4Be4QwwJeKqxj7IGMtzWLwTy
	 yYfi4iZmQ3+2R3ChD60rcq0IhFeg7HnGJnMXZkHsOxxwwFYEMmXNgdXHordtqSlCHG
	 ywQp2K4YTv4njF9WypfM/9i7ApTug3feRvUx5RRI=
Date: Wed, 8 Apr 2026 10:02:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/10] arm64/entry:
Message-ID: <adYZpA3-Tx6s1VOp@J2N7QTR9R3>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <87cy0a4gx7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy0a4gx7.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020249_612740_6F68EF90 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: vladimir.murzin@arm.com, Peter Zijlstra <peterz@infradead.org>, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Apr 07, 2026 at 11:08:36PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 07 2026 at 14:16, Mark Rutland wrote:
> > I've split the series into a prefix of changes for generic irqentry,
> > followed by changes to the arm64 code. I'm hoping that we can queue the
> > generic irqentry patches onto a stable branch, or take those via arm64.
> > The patches are as follows:
> >
> > * Patches 1 and 2 are cleanup to the generic irqentry code. These have no
> >   functional impact, and I think these can be taken regardless of the
> >   rest of the series.
> >
> > * Patches 3 to 5 refactor the generic irqentry code as described above,
> >   providing separate irqentry_{enter,exit}() functions and providing a
> >   split form of irqentry_exit_to_kernel_mode() similar to what exists
> >   for irqentry_exit_to_user_mode(). These patches alone should have no
> >   functional impact.
> 
> I looked through them and I can't find any problem with them. I queued
> them localy and added the missing kernel doc as I promised you on IRC.

Thanks! Much appreciated!

> As I have quite a conflict pending in the tip tree with other changes
> related to the generic entry code, I suggest that I queue 1-5, tag them
> for arm64 consumption and merge them into the conflicting branch to
> avoid trouble with pull request ordering and headaches for the -next
> people.
> 
> Does that work for you?

That sounds good to me.

Catalin, Will, does that work for you?

Mark.

