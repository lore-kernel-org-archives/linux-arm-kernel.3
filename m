Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6DCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+RZ7dh5aacsWXafBI55a264qUntbTl9wClSrh+omSA=; b=gjVfcTyPWBGaAeE4xAorjMAEyO
	DFFMrpLlOD5FU89bMDBnSu6H7bd7pDgrl98TI8OYXYQWpL6gPY5AfyFVC8yTY+ZVH0+Gx2cWkwzn0
	0s+Z1fwcXxxT0AXsSK6Z1p17pHiKWZ6KArAnLtksjG2D4VZ4+cV8mxVvImZODq2U6IWDh/ZLPmgCU
	00siNPoPJTJu5YBKGrgdRN/zcaeoqmpM2qPg/9KuLO18C0yC6khNtERmS45bxL1uTnWNAF34bZROc
	GGJ5xZxPrDXY5lJG8I+osmvrcpMjyN5XqDSZV5OwvI2a9obp5uLyFm74g8u464KjCbjmHkqiFegwh
	ZmwNvBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7mj-0000000ELd4-2uri;
	Mon, 15 Jun 2026 13:55:29 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7me-0000000ELci-0Pe2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:55:25 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id A151D1FB7F;
	Mon, 15 Jun 2026 15:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781531721;
	bh=/+RZ7dh5aacsWXafBI55a264qUntbTl9wClSrh+omSA=; h=From:To:Subject;
	b=U/KC50tVSFSBVJP8UtD5PMKMHVbeqU7Uq9F9ezLLFxTRWdlAFSBoa/Q9QmDnXDGB2
	 wiJdbnKcLOX40WA5yQSDNJlNgK85pzQifYn7iI0n8IrFDmZCThgopwjY/dGyZKKRwB
	 4U+HcyPs7UMXDHhHHMJsQzpuo5YS7HRfDvwbWYNj5d0IZgSbdkU6BD/t+5WE8k+AGZ
	 TsN1kWIeG5scyYuIpOLxzcR2KGrbqC4gqIaH2AvTeVGMZXbZQw0WyRX8/vy4EGahRH
	 4xykrXHu+bo6qtmolhU+db+bJv+nitWFhXTADPzFpt33OtJLcIKnBEaXbJL3twoq/9
	 sAiN3iBS2Cj1A==
Date: Mon, 15 Jun 2026 15:55:18 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Message-ID: <20260615135518.GA167853@francesco-nb>
References: <20260615132640.161584-1-francesco@dolcini.it>
 <20260615134608.adr62go2doeggkaj@margin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615134608.adr62go2doeggkaj@margin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_065524_741729_D4987037 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Jun 15, 2026 at 08:46:08AM -0500, Nishanth Menon wrote:
> On 15:26-20260615, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add git tree for TI K3 architecture.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Thanks for adding this in..
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8629ed2aa82f..cbc56dc242b9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3756,6 +3756,7 @@ M:	Vignesh Raghavendra <vigneshr@ti.com>
> >  M:	Tero Kristo <kristo@kernel.org>
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Supported
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
> 
> Is it better to use https?
> https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git ?

I followed what is used in 95% of the instances for git.kernel.org,
and we have git:// for the other 2 instances of the TI git tree.

If there is a value on using https:// it should be done on the whole file.

My preference would be to merge this as it is, if you disagree I can
send a v2.

Francesco

								  

