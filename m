Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6418F3ED5B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 17:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSi2bUKUJzMsc7l0lUucN8ECRJ1fY2+CGKX9GI9C9cM=; b=CaOQUwvA9PgB6Ndao8nMco/w1F
	PbBcp67h6vLdOjdUpX+iWoRGZNhRglVqJ45rxDfvNeaJacnLNCXrRzn8YLicHNJLED5ozjX8DBIhl
	ky2ZQmQouPYnn6326KelqI8buVX2+G9D8xZPzBT78JxtRzRgQNdCgngbUg8r51UBTr7sCa+uktgzY
	L487tVkIFzuNIFIwE4uVsVwVPhdjnue3r+FqUoKFhGlH3KKqHrJwFjy0Y9GRf3DJZnrX1ga8Gqqu/
	scvj9/KoHt/VG+6x/5mVJQsXkNSeT0WdazlTqlQFY3JLfV0wVR0WCblXLEipU2Lk1/wYFhxjXwf4T
	1ZdGwa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBcEk-0000000DgDw-2YdE;
	Sat, 11 Apr 2026 17:35:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBcEj-0000000DgDq-2jYZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 17:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B54886015B
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 17:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31245C4CEF7;
	Sat, 11 Apr 2026 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775928912;
	bh=6EsoCMNC5sXMkFgYBufNFBA0ceJXkOiSoYKRAmHD49I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CufYP9+5KHkN6t9LkVn72Q2qRM5DtFdhnLAB1QY6xa0ir4DuS/s61+dSTDD8syKyK
	 M6GhpH2tAAkZPyTOUk2WFyyQjkLpD1/6RygNBO77WhTLdlw4fxGhM702pSOq+ga3n6
	 mryn43CI5TK98uc8kIVSu+D9a+4c2vIzDa0TqO4UOjTmrEAqSXZSWK2PFHCQN89CBQ
	 sotOtflZUGTW7fsvHy/GUNgqDvOOG9gkhErGWOZuOdGQ8WNxPA70CQTiJAqdCSNijg
	 s1ABHbNaqldR0+WYoEqss0+LW7VC+VhF1Dl5AF74UlJDflYNVqstPzb1poSrN/Rb3U
	 DoUwuF8uhSz3g==
Date: Sat, 11 Apr 2026 18:35:08 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Message-ID: <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
 <20260411-tireless-agama-of-advance-5bdabf@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-tireless-agama-of-advance-5bdabf@quoll>
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

On Sat, Apr 11, 2026 at 10:49:50AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
> > Hi ARM SoC Team,
> > 
> > Please pull ! This is the only fix/update I have at the moment for v7.1
> > So, I am sending it early as fix but late as an update for v7.1.
> > 
> > Regards,
> > Sudeep
> > 
> > -->8
> > 
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> > 
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.1
> > 
> > for you to fetch changes up to 83210251fd70d5f96bcdc8911e15f7411a6b2463:
> > 
> >   firmware: arm_ffa: Use the correct buffer size during RXTX_MAP (2026-04-07 10:47:42 +0100)
> > 
> > ----------------------------------------------------------------
> > Arm FF-A fix for v7.1
> > 
> > Use the page aligned backing allocation size when computing the RXTX_MAP
> > page count. This fixes FF-A RX/TX buffer registration on kernels built
> > with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
> > larger aligned span than the discovered minimum buffer size.
> 
> Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
> firmware driver, so this could be sent together? I think you also use
> the same Git tree, right?
> 

Sure, I can put all of the firmware drivers I maintain together. I had
for some reason assumed individual PR is preferred.

-- 
Regards,
Sudeep

