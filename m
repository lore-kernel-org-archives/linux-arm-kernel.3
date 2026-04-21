Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E43F8FA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bgNf4YivZGu1nsDMHDmBZ+9sSBMSyPnPvxOcvLGcT0=; b=ez+hiurYheGOSSFg3teLjSaBiH
	UzfUN49fj5aJ2/uROxtOmrMX41gSr1gq5D/M3iXmTvBDO5ikBu1gbOyXXXF1v/fh7VEZ0YdtLsAxh
	VMuM4gBC90T9FWfdhI8rxHENRtOGxDzQUV4pQXOKeYwQYeq6f63Z5cF0Qvf/aP1SgU0DQRL6G7sti
	omZWreDw0ZOUT6+avAd5fp4AIzy9+5NIdQh7RyZeaH8WaVSNmZ+H6o8VHmScBgr2Tz4/K6aFkDdF+
	e0Ka/gJ5fqROTOsDa3q1qhONeyqXHBb71lLmPtruB462roCVhanPICVFthAYH0XpZpk2S1cJKgy2F
	W2ySPPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAek-00000008cOh-11MA;
	Tue, 21 Apr 2026 12:56:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAeh-00000008cOI-3DW4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 12:56:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C58DF25DC;
	Tue, 21 Apr 2026 05:56:34 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EB3D3FE76;
	Tue, 21 Apr 2026 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776776200; bh=/ayGc21r8/ncAlc24Og8fknfgsFrnj75Oxhv3tWBRng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qspZV0YwriFI+2AhIad+vv9vG37bn5utLcXEfijscBpcTasOdl/ALrfW9HZ0IN2wx
	 0swzgdLAUwyAHSuLchMs62R18YUcwxfwOk7X4PDsYUsQQC6PT6FJ4e9aOg7SghSIJO
	 6Nmkl3miMLQFs2Gtn18hdrhcEnzgdnLXxwmrCqe0=
Date: Tue, 21 Apr 2026 13:56:28 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: kernel-hwcap.h change causing full kernel rebuilds
Message-ID: <20260421125628.GA3849283@e124191.cambridge.arm.com>
References: <52fb2e8f-3e1c-4cf5-a02a-0d68beedd18b@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52fb2e8f-3e1c-4cf5-a02a-0d68beedd18b@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_055643_892960_200B67AF 
X-CRM114-Status: GOOD (  13.61  )
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

Hi!

On Tue, Apr 21, 2026 at 06:52:55AM -0600, Jens Axboe wrote:
> Hi,
> 
> Maybe this has already been reported, but a quick search on lore did
> not find anything. So here goes... After commit:

Here you go!

https://lore.kernel.org/linux-arm-kernel/20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org/

and on it's in rc1 now:

https://lore.kernel.org/linux-arm-kernel/aeaDFH0-2zhOQTxy@arm.com/


Thanks,
Joey

> 
> commit abed23c3c44f565dc812563ac015be70dd61e97b
> Author: Mark Brown <broonie@kernel.org>
> Date:   Mon Mar 2 22:53:16 2026 +0000
> 
>     arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps
> 
> arch/arm64/include/generated/asm/kernel-hwcap.h is generated for
> _every build_, which means that you can literally run make back to back
> without _any_ source changes and you are rewarded with a full kernel
> rebuild. Not sure how this ever got past any kind of testing, because
> it's very noticeable.
> 
> For now I've reverted this change locally as any kind of testing now
> kicks off a full build, when a single file rebuild is all that is
> needed.
> 
> -- 
> Jens Axboe
> 
> 
> 

