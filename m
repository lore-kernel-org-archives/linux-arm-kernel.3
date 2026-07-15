Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9460EC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 03:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsTFuWVky3AvpuyIyjhI3rq8Kn5JDvyWTnSRKGSYItE=; b=Sst4UqcrvZn+o8mJSZiOjZ875t
	Rx9V4PvOPgfF9ZiYGGaf4O67y/fjIUOUO/EY3blLXhOV9t3qelHfoKr23xyvx8191sS+9+a74buS6
	ZFRGPX8NeWoxk3hDhrRzio4rmzUjHMGZBUpOn7SB/jBgenbO2UpOjdiuxGvb/yVSQVxdXPoaCSBxG
	mQq//E0UgmjSIuP461yZL6X8O4pd1/rpgEGZayceTOMxl9ocfX94GtUWdFj+ZHK8vVKyCNlPQ+o8c
	/vWgfeJmx41trRi5r/zJfKcUQg/clZEe5qU67w8+MXoz3Zq0erk2SCC8ZzyTRIaIYbKDYSYU7rkqw
	qwbySlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqHv-0000000DgYq-23L1;
	Wed, 15 Jul 2026 03:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqHs-0000000DgYQ-2ACZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 03:27:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E4F339;
	Tue, 14 Jul 2026 20:27:50 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 544933F915;
	Tue, 14 Jul 2026 20:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784086075; bh=4VMyIS9CNEBu+03NKL57zLDASfefb3rZHd6qXH5wWj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTYnR6qR/X1J3XSCH2N/+/hY8HeiMBgJjiIRZbNK/avWmrbKn3w6mmmZKppzuDqiG
	 mwe83ivLduy83vtHJFa7nXTkKL2V3/5B+5CRiVkwSgIXDe9xn2remmmzTOebCnmDwK
	 xC3PV7YZHmdnN2FlkeB9Lxz81+EaKaHUDeaH3eGU=
Date: Wed, 15 Jul 2026 08:57:51 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] arm64: sysreg: Add BBM_3
Message-ID: <alb-N4RPFjMgpPzy@a079125.arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-5-linu.cherian@arm.com>
 <07c755f7-7b1f-4423-a92b-aa9ff75202b8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c755f7-7b1f-4423-a92b-aa9ff75202b8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202756_761409_D8F533BC 
X-CRM114-Status: GOOD (  12.57  )
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


On Fri, Jul 10, 2026 at 12:16:56PM +0530, Anshuman Khandual wrote:
> 
> 
> On 08/07/26 8:13 PM, Linu Cherian wrote:
> > Add BBM_3 definition for ID_AA64MMFR1_EL1 register.
> 
> ID_AA64MMFR2_EL1 register has BBM field.

Thanks. Will fix.

> > 
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> >  arch/arm64/tools/sysreg | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index bc1788b1662b..082256ec3bf9 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
> >  	0b0000	0
> >  	0b0001	1
> >  	0b0010	2
> > +	0b0011	3
> >  EndEnum
> >  UnsignedEnum	51:48	TTL
> >  	0b0000	NI
> 

