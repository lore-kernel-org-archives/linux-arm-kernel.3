Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E289EC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq0+62+lyiuauvfkQT293McNXmkcgObePyzeeyJqVXU=; b=f3RHVUZ5BxaFq0wxtodhyKOH1G
	dzroQM2TvPnTfe1TpTuo6zUJZtZbayboug6vvG2hYlpTDGwIpz2YErd+Bz+BWY1A9FwE1XpRsXW6N
	gW7bh7eP1hgAXgU5DFTrEivjgu62adgZDNE4NGlApDo3DQIYI9b61QxwKrrnW8KrCjdSypwbivJXH
	NQPN9h0K6JijnU773+ynX3mMemEb9UitEid7iGWVOrVFuXCb1H5Mu++49rD2IlIwSMJa2XPdTSOvy
	AGq6tPabQyJp21wDfgVSf7aVtBGITH/lO017RkGDHDRBkIS8VKL/+VhtwIGTbXK2Qf8vT2JUn7Yd5
	wkyfazFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC0r-000000066Rb-0tlE;
	Tue, 08 Jul 2025 17:21:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAtO-00000005vVj-3UUw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E075D46778;
	Tue,  8 Jul 2025 16:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86690C4CEEF;
	Tue,  8 Jul 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751991001;
	bh=Vo8fKYBnprjiGYOH/VOVRMxkPm6Y8f4SzUdQeB2EkvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkkJTDJcoQWJRX4CtG/Y5eIzaZrwjy+ME+DhcB/IdLAp/Zzij3x06XuRDm4RHHK8Q
	 A+ZwodpgOWg5DHRJHYZ523KyUEygCcYwsDYunVlxcRsKa/KzhAIc7yW4AfMX8ceAt+
	 e7MPYC9Y7eaxEqJOdnqcQkXSW+est2B7m3DtFUvi3JA0c6X8jyglTh0Xgu9tiP4RIx
	 qXz8879OEWmFFouCA2bJjOkCLBRGleCc4VuDMLc2euvcqgg7s8o3NhhrG9CenJMvWt
	 0YaMp8d+IuvC4zPN4xlrOJyZ0gosL1KVK38ZJ3dHnOCdJR+o+l3rjlcQ+tf0Fh73Z5
	 O8luVhEZMEUJg==
Date: Tue, 8 Jul 2025 17:09:57 +0100
From: Simon Horman <horms@kernel.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [External] : Re: [PATCH net] net: thunderx: Fix
 format-truncation warning in bgx_acpi_match_id()
Message-ID: <20250708160957.GQ452973@horms.kernel.org>
References: <20250706195145.1369958-1-alok.a.tiwari@oracle.com>
 <20250707191644.GC452973@horms.kernel.org>
 <96f8e9d7-6e4c-4f7a-bb66-a3b43e30182a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96f8e9d7-6e4c-4f7a-bb66-a3b43e30182a@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_091002_889151_EB9FBF85 
X-CRM114-Status: GOOD (  21.13  )
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

On Tue, Jul 08, 2025 at 08:34:39AM +0530, ALOK TIWARI wrote:
> 
> 
> On 7/8/2025 12:46 AM, Simon Horman wrote:
> > >    drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:23: note:
> > > directive argument in the range [0, 255]
> > >      snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
> > >                           ^~~~~~~
> > >    drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:2: note:
> > > ‘snprintf’ output between 5 and 7 bytes into a destination of size 5
> > >      snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
> > > 
> > > compiler warning due to insufficient snprintf buffer size.
> > > 
> > > Signed-off-by: Alok Tiwari<alok.a.tiwari@oracle.com>
> > Thanks Alok,
> > 
> > I agree this is a good change.
> > 
> > However, by my reading the range of values of bgx->bgx_id is 0 - 8
> > because of the application of BGX_ID_MASK which restricts the
> > value to 3 bits.
> > 
> > If so, I don't think this is a bug and it should be targeted at net-next.
> > With a description of why it is not a bug.
> > 
> > Conversely, you think it is a bug, then I think an explanation as to why
> > would be nice to add to the commit description.  And A fixes tag is needed.
> 
> Thanks Simon,
> It is compile warning, We can target it for net-next.
> 
> I will resend it with [PATCH net-next]

Thanks, good plan.

