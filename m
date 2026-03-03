Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E7EC1429
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kDgpKSS2QylL8x43v99oq+aTp8CNuG7tgNvfL68fYE=; b=3bmiK9dXdQKnPz++CZx0EE3knW
	i9/RWqszA4EicBhzkvJMI3LjGw+/RUZqKYRya9XSBOsbAFG5ZqVkQngRX80KSH5tqhqqqxYic7ImC
	KO4pyrOddw9W5btySaPA34Vh/rhv2PkEUQtcofHrpPJJ1/5pOXkRqfcuk0aqKgMOHtUfiC0GRV5Tw
	FSEqHFNEi9hxJi0Uk40tNgKosAOVfxvZwTc5ebne51SXxcDXK+es9+C7KiqYZgJV6OY+i3E86f9u6
	2GlwaCSbrqV9BVcn1jKnXWjOnVPlwqv6jbk12BIXPvMoj8Sxowa40nBtycmDGqHe/P9WiVLElcdq4
	K2DDWLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNKv-0000000F0DT-2vWJ;
	Tue, 03 Mar 2026 10:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNKt-0000000F0Cj-07Fn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:50:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF577497;
	Tue,  3 Mar 2026 02:50:33 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25DF53F7BD;
	Tue,  3 Mar 2026 02:50:39 -0800 (PST)
Date: Tue, 3 Mar 2026 10:50:36 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 1/2] arm64: lib: xor-neon: remove redundant filename
 comment
Message-ID: <aaa8_DhVHZfGBBS7@arm.com>
References: <20260301152820.2589291-1-objecting@objecting.org>
 <aaWWBned-T74lsXl@infradead.org>
 <71ef2e5a-1c6c-42df-9aac-17185bf92ad3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71ef2e5a-1c6c-42df-9aac-17185bf92ad3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_025043_106475_1B8AB13B 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon, Mar 02, 2026 at 04:01:45PM +0000, Josh Law wrote:
> 2 Mar 2026 13:52:07 Christoph Hellwig <hch@infradead.org>:
> > On Sun, Mar 01, 2026 at 03:28:19PM +0000, Josh Law wrote:
> >> The filename in the header comment is redundant and not recommended
> >> by Linux kernel coding style.
> >
> > I have a pretty big series pending that changes this file in
> > meaninful ways.  But even without that please never send standalone
> > patches for trivial cleanups like this, only do them if you have to
> > touch the code for another reason anyway.
> 
> Hello Cristoph, I am sorry, again
> Since I am new to Linux kernel development
> I sometimes make mistakes, it's normal.
> Patch 2 should be more relevant, all of those I got under checkpatch.pl

Patch 2 is not relevant either. Unnecessary change that will make things
harder to backport, conflict with other changes.

Please don't run checkpatch.pl on existing code, only on new patches
before they are upstreamed.

-- 
Catalin

