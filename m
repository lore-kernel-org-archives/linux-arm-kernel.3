Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AA9C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UChGTTKXear8gQd2Dj9H+VICAHM0s5K1F+6xOkJhwk8=; b=vmpSqSS4Q4b9x6Cx7B/NFir+bM
	8LO1J/XSClJWrDDEJa728B0eARKruUYjsZJjVxa5kfl2U2HPbnsNghF7JiOgh/PdbL8LhHwh+1cB8
	EfWK07C4FLuEHZj7dtknUUzwrCzjCsKrkEAPrs4ezx1SktWpeuUcWOxK6Z1psZPC6gmFdgmy2X04o
	I6sKczSwEOVcf9syr2N5y34eqmZt3KdbFEbmV4vgTNQP47VUdKAWT2Mo0PSx9KQjKRjDKxopbTB0D
	bf4YWmeYv3Ful6zVWD/PFTSECyX7Wvj/a6s+enUhQeVW/LSCRv12y3AmYWZJ3oACzf2ZfGslKLYSE
	fBqtcweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55ez-0000000HPag-0Y1Z;
	Fri, 11 Sep 2026 18:07:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55ex-0000000HPaF-0WKD;
	Fri, 11 Sep 2026 18:07:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51CD960008;
	Fri, 11 Sep 2026 18:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4D11F000FF;
	Fri, 11 Sep 2026 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150054;
	bh=UChGTTKXear8gQd2Dj9H+VICAHM0s5K1F+6xOkJhwk8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=okGWbp7gf4AeBkG9/1Ay3g134R1cA7gjJeSJln7cqv1+wr822XQAFp7ViyNSs/fEy
	 z7zj8wp3HAgD3z32sFxFD8ENpA/QsUoDi9IeetJuRhIJjdJ1dPbP3c2BqKBLL6JFrv
	 ZR1uZdclFtaZwkCNcFg+RtgSjSwltBsGB3p4JNqI9cjQ/l2YggHMqpjWlrDdmgyHbE
	 f7YYyYyao8MceMxbecrRVMxzoBexwY7gsB6gWoUXbnbZXtWn7LMuheBUflTFoQHW71
	 PMQS9WRNx6sj5ZymzSoBsPVKT5HKAPP7qX+WVkBk4bs7s8JFJtHyuOf+fiTviwYY3a
	 H6b8m5iaN6e/w==
Date: Fri, 11 Sep 2026 12:07:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
cc: Anup Patel <anup@brainfault.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, samuel.holland@sifive.com
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <87ecf74c8r.ffs@fw13>
Message-ID: <295ecaaa-fca0-05c2-ddaf-ad3a2985776d@kernel.org>
References: <871pb9841j.ffs@fw13> <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com> <87ecf74c8r.ffs@fw13>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1429182635-1789150055=:1495113"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1429182635-1789150055=:1495113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+ Samuel

Hi Thomas,

Sorry for the delay; I've been on vacation this week.

On Sat, 5 Sep 2026, Thomas Gleixner wrote:

> On Sat, Sep 05 2026 at 16:37, Anup Patel wrote:
> > On Fri, Sep 4, 2026 at 8:19 PM Thomas Gleixner <tglx@kernel.org> wrote:
> >> I'm still going to pick up obvious and simple bug fixes, but for
> >> anything which requires deep knowledge on the underlying hardware, I'm
> >> going to just mark them obsolete when they molded in my inbox unreviewed
> >> by the people who understand it for six weeks.
>
[ ... ]
> 
> I don't know what's wrong with SiFive but they really need to get their
> act together. Paul?

The approach you described above is fine.  Please feel free to ignore 
anything beyond bug fixes that doesn't have an appropriate ack, at least 
until we figure out how to broaden the pool of maintainers for those 
drivers.

For what it's worth, several other companies also adopted SiFive PLIC-like 
interrupt controllers, and reuse those drivers.  It would be great if 
kernel folks from those other companies can step in and help maintain the 
underlying code.


thanks,

- Paul
--8323329-1429182635-1789150055=:1495113--

