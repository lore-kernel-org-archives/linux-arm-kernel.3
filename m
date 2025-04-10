Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AF4C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xII/97dcDQDppFwmTFdjE+lkcwxiBTmdu4aYXUIv9Io=; b=OvrHoY+TJ5hGyTkDjeFCZVZ1m3
	q5mhhUffW/PPPBhCtwvKxtj0IvrVaI9vdoF34PGAwYBh3k5FVKXKJdSQMZw9EFvYe8OORbvZmLELD
	/AUV97wIkUyRIy13f8NfeDfjsl6YvJc3med+bXG0Ci6j6XYrlqu17VmJDJM1ZIUq9B4BHnencYpZB
	AoW024o+TR3XVsyUBsWu73rtnaYPrw2/1Ge72FVtyaZ5HcuL+8wzf9QmYC3dnQm06EkWdQ9C0ZbaL
	tzgBEUT/gvHVDYoyGngflkY91iJgFIQVvm62M7nK2g6xP2Yktmq8EwyJqvDJZJ0V7LEztSkhQJtwU
	KUw7ztxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2puA-0000000ADUx-1Gkn;
	Thu, 10 Apr 2025 11:17:10 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ob5-0000000A0BO-2uwD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:53:25 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CD1AC1F935;
	Thu, 10 Apr 2025 11:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744278800;
	bh=xII/97dcDQDppFwmTFdjE+lkcwxiBTmdu4aYXUIv9Io=;
	h=Received:From:To:Subject;
	b=0IVZ+hC9lH6g+5zA81dvvjZS1vHnx4+NtZC5P3XFpsY4Q3VbUeaeESv/YICRw9kew
	 tDkbf9+jg1Ut5WuIaFG7TpPvuasKCBNenLLE0j7BqU6P4Y0gpDYTPBdnrrS8/RVoYm
	 ANiOYbIV4jPshhk397wbbOMPocE/OgsHzGkM+CP8k3I/qA8zj9D980cZ8Dx3ynTkFg
	 AZd9yWvlQt8ncEajWkXqmKMscNsjU+fO/s2K/jAlRMkfwC9pNFlah/zZKr9I6UkulA
	 Po30uDOQ/ezYkFfBRCYD8z573sbSb3oUtcTQU3sLeowy6Vx6CzNMM7FoLti23iUwRq
	 oCfZuHo6Yl36A==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 56D7D7F976; Thu, 10 Apr 2025 11:53:20 +0200 (CEST)
Date: Thu, 10 Apr 2025 11:53:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: Kernel WARNING (RCU) with btnxpuart on TI AM62 platform
Message-ID: <Z_eVEKQn04-2nhpL@gaggiata.pivistrello.it>
References: <20250408083512.GA26035@francesco-nb>
 <24b28bda-e294-4680-bed5-c44efcb6c455@ti.com>
 <20250410062006.GA7506@francesco-nb>
 <4107dda8-25fe-4f30-a0e6-906441f9b4c9@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4107dda8-25fe-4f30-a0e6-906441f9b4c9@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_025323_891255_2485E06F 
X-CRM114-Status: GOOD (  12.62  )
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

On Thu, Apr 10, 2025 at 08:34:23AM +0200, Paul Menzel wrote:
> Am 10.04.25 um 08:20 schrieb Francesco Dolcini:
> 
> > On Tue, Apr 08, 2025 at 09:15:26PM +0530, Vignesh Raghavendra wrote:
> > > On 08/04/25 14:05, Francesco Dolcini wrote:
> > > > I do have the following kernel warning with 6.15-rc1, on a TI AM62
> > > > platform (arm64), single CPU core, using btnxpuart driver, any idea?
> > > > PREEMPT_RT is enabled, if it matters.
> > > > 
> > > > Either the issue is not systematic, or multi cores SoCs are not affected
> > > > (no error on the exact same image on a dual nor on quad core TI AM62).

...

> CVE-2024-26959 [1] has the same trace, and supposedly was fixed by Marcel’s
> commit 664130c0b030 (Bluetooth: btnxpuart: Fix btnxpuart_close) present
> since v6.9-rc1, that is also signed off by you.

It seems that the conclusion at that time was just wrong, the real issue seems
what Vignesh suggested.

Francesco


