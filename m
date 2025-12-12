Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87DED4415D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeE2YLqv0KKyO0eVbQQKbqUPBiIkCwWWviiC5hUVnVo=; b=DZlhQK3wkhMkjVwdd+NjkyWgdF
	EM/KImXsNXT/tTFHv6UGFZPSf4IOa0L0qTl38ehrwd2p0XR4joGsXEmPRf6j8XfMAEnyEcSc+FyOo
	Xo4oAOGto5VrWJVO5cneqvNl8J0Fy2Fb5xIDOAZpcihCGWGuyvwqKT1t9p2zBFomKqPQWDjrxhkm7
	ubTmrCAh9mBOCef4BcsK4iUT6bRlQscZ2rsL6eiaeg6E/ynNflGg7kKQBuJns9pS8Wofruv69M1OI
	ql9S+ezMdD3gSzFTkuG4kVxP3/5/JU4GKmdCMxZUdzeC5h3hJ6B2kNkVZNNgrwtKXuXhYxSd5kdkO
	f8bdCdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzcy-00000000Msv-2w6D;
	Fri, 12 Dec 2025 09:39:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzcw-00000000MsU-0xVD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 09:39:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB9C1063;
	Fri, 12 Dec 2025 01:39:41 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99A143F73B;
	Fri, 12 Dec 2025 01:39:46 -0800 (PST)
Date: Fri, 12 Dec 2025 09:39:43 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 01/35] arm64/sysreg: Add new SPE fields
Message-ID: <aTvi33vLZU5S9CoM@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-2-alexandru.elisei@arm.com>
 <20251210183827.GA3920451@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210183827.GA3920451@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_013954_312685_040C70B0 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Hi Leo,

On Wed, Dec 10, 2025 at 06:38:27PM +0000, Leo Yan wrote:
> On Fri, Nov 14, 2025 at 04:06:42PM +0000, Alexandru Elisei wrote:
> 
> [...]
> 
> >  Sysreg	PMBIDR_EL1	3	0	9	10	7
> > -Res0	63:12
> > +Res0	63:48
> > +Field	47:32	MaxBuffSize
> > +Res0	31:12
> >  Enum	11:8	EA
> >  	0b0000	NotDescribed
> >  	0b0001	Ignored
> >  	0b0010	SError
> >  EndEnum
> > -Res0	7:6
> > +Enum	7:6	AddrMode
> > +	0b00	VM_ONLY
> > +	0b01	BOTH
> > +	0b10	RESERVED
> > +	0b11	nVM_ONLY
> > +EndEnum
> 
> Not sure how to select the enum names, but seems names above don't match
> well to the definitions.  How about:
> 
>   Enum  7:6     AddrMode
>         0b00    VA_ONLY         // Virtual address only
>         0b01    VA_PA           // Virtual and physical address supported
>         0b10    RESERVED
>         0b11    VM_PA_ONLY      // Physical address only in VM

Why not, but I would name the last value PA_ONLY.

Thanks,
Alex

