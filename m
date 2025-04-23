Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FA0C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol/28DWxMuKG8vzvqpbstQnt04MDTJNitImOHrr5gFI=; b=VyAJmeFh0LGZrFtzHDSsi1Z1pX
	IVFnPB32QwM/o8DN4ZXMwF+xnaq4HYS690U0XT5h3XNWK86maut/7kFFi3Ec5eOrAHxJLFIJiadGg
	Nq4m6bGMs7lojS/Pfu3ojBgGrvGYa4c3zYLSgHz4/AOM6YJpe6gMqpu1RgrjDBqv2zgBvQyxh5StL
	NEL6cFFHoA6+2zfWCM8yFIlIILHrEMSjwjZZKKfPQLGiaV4muIxp1q8M6DkxZSD2OoV8RrB7hSzC3
	IsRs4ky0ekDZeYBRJMNe+QNWDLQuIk+Qtu00XZI8cpJMrnekci6L566cDtoqChR0gIax6SbxsKQBF
	HvdNt/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWD-0000000AfxO-0bbw;
	Wed, 23 Apr 2025 13:52:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Z2H-0000000ASFq-42fI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 12:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3013AA4CEBE;
	Wed, 23 Apr 2025 12:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C995C4CEEC;
	Wed, 23 Apr 2025 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410624;
	bh=s6sHA2mYPiaTg1SBSDd0rm5YqfRkSrgtUKA0vRyKMRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzB+jlA3mrMH9LuaG5V+4T5n5YnQaMTgGdJSpCiIKLO8ug7B48W22vYV6EIaG3ek8
	 JLHTKfDq6A9uN4hAmJ1MPs6VOyODGxKGUt7Jtxjp/gq0vn0ipixo0OQqcoHieGAfDG
	 8Sa7ixVZLU8ZKoxd6iq0JJTHPg5Ce7Q8CDmq0F98T9xPPlcGfdz0Ysj7Ri0yEniGaY
	 BVD2FNR5AzyOyw8fhiBscwIz1gqYJeG/kocGjz0XoY2KUBuuzlVl0l60sZAFwR/U+V
	 y6YpZlqueU54lyP15YD/aoMI2Km3y4g07jRL7J5513Rti3PKSjEvypD1iONOzQy1g5
	 zs1pIMmpPe2dA==
Date: Wed, 23 Apr 2025 17:47:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
Message-ID: <aAjaPV/2DSyPAGRB@vaman>
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
 <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
 <aAjTg8dgvxqLQOwQ@vaman>
 <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_051706_068773_5CE7C9F4 
X-CRM114-Status: GOOD (  20.74  )
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

On 23-04-25, 14:13, Geert Uytterhoeven wrote:
> Hi Vinod,
> 
> On Wed, 23 Apr 2025 at 13:48, Vinod Koul <vkoul@kernel.org> wrote:
> > On 23-04-25, 13:11, Geert Uytterhoeven wrote:
> > > On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
> > > > On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> > > > > The Arm DMA-350 controller is only present on Arm-based SoCs.
> > > >
> > > > Do you know that for sure? I certainly don't. This is a licensable,
> > > > self-contained DMA controller IP with no relationship whatsoever to any
> > > > particular CPU ISA - our other system IP products have turned up in the
> > > > wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
> > > > wouldn't either.
> > >
> > > The dependency can always be relaxed later, when the need arises.
> > > Note that currently there are no users at all...
> >
> > True, but do we have any warnings generated as a result, if there are no
> > dependency should we still limit a driver to an arch?
> 
> I am not aware of any warnings (I built it on MIPS yesterday ;-).
> It is just one more question that pops up during "make oldconfig",
> and Linus may notice and complain, too...

True, give there are no users, lets pick this and drop if we get a non
arm user

-- 
~Vinod

