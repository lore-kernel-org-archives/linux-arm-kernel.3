Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3E8D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWBqMCQ9m5dFkIDG+Fxd2ersqB659n0gBI8CFPt58gI=; b=Db2/oRFDhwiB8lfGjXy9GfKSeg
	tSrB9l7qMe5DomniRcbLKTlGz0xI41ntf4BhNpzxxo4E7+asvSLuUPt6JDvHZWxkxBFWUMHtaovlm
	f3xYNHZAhTvMVGkZUnEOrZywViKp2l9jok2qYW0159FHMzGTXSUpjJFoW0O96NW3zgwh7jRQD4lhh
	zFGWQBmor1aYsLrWjVC+nph4qqiU3XchYpR7Mirk/URi2VMCZ1yUQusqji5b3N7Q7kUuMYEJrfdEo
	+B4RmYev2Z+Qt67sRInCqRIenSsh+82uOlkcJbBihzJVFnWdmN7oTi7VRq1Zg81Rq0fnbgxdeAYz5
	xetnAGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5msy-0000000EgEK-1zuQ;
	Tue, 29 Oct 2024 14:07:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5m9R-0000000EYeF-07kX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68AD75C5E3E;
	Tue, 29 Oct 2024 13:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2F1C4CECD;
	Tue, 29 Oct 2024 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730208048;
	bh=atIdjrSoz8cQOo8Oh3x41BjnGBTqmvpWtHpYQOqBTIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maPSauNb/CNnnievFOAFYOU7f38+08j7hlhokWmUHB9io3DNtx2BMgx4rZ0txddjB
	 GO8ZTV8Myxrx2wOfS6tluq1+dap7q3kdp9o7AzxslPu8PzWJnGuO7vErF09+/TEoo1
	 XM23aIbOHbl66pxZKZGD46phpT/55IPOE5AbfNddUd7sWMd1Vf13R04tg2TjkwE9Yb
	 X9nAvwaG0+niGCVERR8HS2UT9TMxZQLIL9oBm0k6cn4oKl8R0xerfhbm1u5/XPgjM2
	 yAhn/JrOghfLEPizGb6UQ28HL7Ssbje5uHGypz186z62YAeTi3zJocUTxeNxv8zoXe
	 Gah5N6nGQt5jg==
Date: Tue, 29 Oct 2024 13:20:43 +0000
From: Will Deacon <will@kernel.org>
To: huanglei <huanglei814@163.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, huanglei <huanglei@kylinos.cn>,
	arnd@arndb.de
Subject: Re: Re: [PATCH] arm64/Kconfig: introduce GENERIC_ISA_DMA
Message-ID: <20241029132042.GA4416@willie-the-truck>
References: <20241025011641.4858-1-huanglei814@163.com>
 <20241028150544.GA2445@willie-the-truck>
 <26ed8fbb.1809.192d5ef13e5.Coremail.huanglei814@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26ed8fbb.1809.192d5ef13e5.Coremail.huanglei814@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_062049_136318_5E97374B 
X-CRM114-Status: GOOD (  24.47  )
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

On Tue, Oct 29, 2024 at 09:41:08AM +0800, huanglei wrote:
>     Even if MAX_SMA_CANNELS is not defined, as long as GENETIC-SIA_DMA is
>     enabled， request_rma/free_rma  function will also be exported, and
>     other modules using these two interfaces will not encounter link
>     errors.
> 
>     I don't know why others haven't noticed, but I discovered it when
>     debugging pcie parallel port drivers.  And the arm/Kconfig  has been
>     around for a long time.

Please try to avoid top-posting in replies, as it makes the conversation
very hard to follow.

> At 2024-10-28 22:05:45, "Will Deacon" <will@kernel.org> wrote:
> >On Fri, Oct 25, 2024 at 09:16:41AM +0800, huanglei814 wrote:
> >> From: huanglei <huanglei@kylinos.cn>
> >> 
> >> Enable GENERIC_ISA_DMA feature on arm64 platform,
> >> thus, request_dma and free_dma interface can be export.
> >> and driver modules can use the this interfaces on arm64
> >> platform.
> >> 
> >> Currently, many pcie parallel port drivers still use these
> >> interfaces when ported to arm64 platform.
> >
> >Why has it taken so long for anybody to notice?
> >
> >> Signed-off-by: huanglei <huanglei@kylinos.cn>
> >> ---
> >>  arch/arm64/Kconfig | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index fd9df6dcc593..986eb251f68f 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -367,6 +367,9 @@ config GENERIC_CSUM
> >>  config GENERIC_CALIBRATE_DELAY
> >>  	def_bool y
> >>  
> >> +config GENERIC_ISA_DMA
> >> +	def_bool y
> >> +
> >
> > Does this actually do anything without MAX_DMA_CHANNELS defined?
>
>     Even if MAX_SMA_CANNELS is not defined, as long as GENETIC-SIA_DMA is
>     enabled， request_rma/free_rma  function will also be exported, and
>     other modules using these two interfaces will not encounter link
>     errors.

Do the drivers do anything useful after they've linked? Can you please
provide some in-tree examples of drivers that can be used on arm64 only
once GENERIC_ISA_DMA is selected? If they just need some stubs for
request_dma() and free_dma(), then it feels to me like that should be
the default implementation, rather than having to select something to
get them.

Will

