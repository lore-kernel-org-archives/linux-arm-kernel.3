Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2401CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgs7FkY0tgl0Sjdi6ySMuymeOgk9KIlBu4zUfbYzxx0=; b=NGlKl8VAAgnSaE96C0nEzCSpzO
	Fx+HIPAudIpWEpF3sw48+HZBWMzFawC5oLMGm86OIfFYOmgy82ciBjq5kPqsjTh+vcVcBGVNUYV7i
	ewDthn7hiVkhtkOfNGAoIEZ5lPvwOy+303NeL18z/y4nI0idYYLa0HljWHVnBbaRxqd7tTEGOimv5
	R08Xd4ilaiUsJT3lNdjrrE9pYdh90hNdewOvv5SvJSWq4d6FciIfa+ptYen3QRS9D2w9/sL4a0gti
	5os8wqVbLpVITo8S4XEkxHkoMnerIHGvXXJu3Q4TDPmwFCzrtIZPOYyot7oov5aKHrUwIr0rALnto
	PREEpaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPkB-0000000DWxb-27MY;
	Mon, 11 May 2026 12:28:19 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPk7-0000000DWvl-1QAx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 12:28:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B9E1B6732A; Mon, 11 May 2026 14:28:09 +0200 (CEST)
Date: Mon, 11 May 2026 14:28:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] lib/raid6: Include asm/neon-intrinsics.h rather
 than arm_neon.h
Message-ID: <20260511122809.GB16499@lst.de>
References: <20260422171655.3437334-10-ardb+git@google.com> <20260422171655.3437334-17-ardb+git@google.com> <20260423074712.GC31018@lst.de> <20260509202354.GD11883@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509202354.GD11883@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_052815_726742_42CA6875 
X-CRM114-Status: GOOD (  12.88  )
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

On Sat, May 09, 2026 at 01:23:54PM -0700, Eric Biggers wrote:
> I think this patch also breaks the userspace build of lib/raid6/.  Which
> is going away in Christoph's series anyway,

Assuming we're overcoming the objections.  Anyway, about to repost this,
and maybe Art is another voice for dropping the userspace build support
of the RAID code.


