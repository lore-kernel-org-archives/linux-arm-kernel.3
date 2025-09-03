Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824D8CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FApP1W/k3dKMuicxqC1R55fg6lwlL7PNEPqG6Xm5msg=; b=L1FKwstePJpgylsFJaUggPiqur
	LHszaDmfe8IzZj/p1AFRPBJsbtNESE093oTjnuRsY3unxiZFMDv1/7jBws7UypqGpfdCsY3rF32W+
	cTmL9pQ4GdbDndtBuaf9yjR/uCxsYu5gs84OcwbHsxhX2n2dRh5vVE5+AWIt9i4i9+C4LCc5mS/AV
	YocnY11DwrttmpWgrrEnty/3KOFtexCn0uuv0VQ+iXOybsCKrsIUAqC2MUx15BIEL+8HEjhXkHxnN
	VHZ3xgeShv1hxWO6+Zuz42ukZ7czxfkjSmR8do2Gl5pjRm0U90znBkRjwf5L2MT0u6iYK63ywQEza
	D4NT8C8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utj4L-00000005gFQ-24hr;
	Wed, 03 Sep 2025 08:42:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiFy-00000005GMn-3MZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41B9B6013B;
	Wed,  3 Sep 2025 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEC7C4CEF0;
	Wed,  3 Sep 2025 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756885813;
	bh=5akVTFofggby9D3NroVdSFslNTvcjqv8xij7f8QA1t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgQJrgQbFSIpsGJz3v4UQ/I4zcdTTIQxNXa0T3A6+MC/W3X4Ly4UVjMwGXYg8FJiK
	 1JBzpl1daPS8nag5vkVFH0i9U+rfh5uSszNxuV7cy0Lg8W83JP+z6W1ScHxc0g12WD
	 qTNu2dOprqyF+eqWLi479M6GiHMDvMSKRPjo4pXraKRoeKSgpzrf8FvTuGQU/RJPXI
	 zTPRbgFFopyqFE+kqXfiiwWvJ/w7h7ihBAZYvsGo79/qZQyT9+uNIt1FAXWKr6XnSI
	 8IRIkmL9uj/4fcCbF3DjWWp1A0Io+CQIkD9RryGxYZ7CevkiOWp5cU+Bkj2obEZN1Y
	 sPdQ2YMgVsisA==
Date: Wed, 3 Sep 2025 13:20:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jan Palus <jpalus@fastmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
Message-ID: <fi257eqhpzxp245g5vab3ttth5kuiuwpk7dsyhnoxo4sjlq535@fgpwb442eeek>
References: <bug-220479-41252@https.bugzilla.kernel.org/>
 <20250820184603.GA633069@bhelgaas>
 <20250902203226.u4i43vygl4bl2dqa@pali>
 <CAL_Jsq+cytAQAtSB7VjR8oKrXJJSSrOouKQZYQAWNvu+tStTnA@mail.gmail.com>
 <20250903073558.6v2d7q6n6hm2vv3a@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903073558.6v2d7q6n6hm2vv3a@pali>
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

On Wed, Sep 03, 2025 at 09:35:58AM GMT, Pali Rohár wrote:
> On Tuesday 02 September 2025 20:35:14 Rob Herring wrote:
> > On Tue, Sep 2, 2025 at 3:32 PM Pali Rohár <pali@kernel.org> wrote:
> > >
> > > These issues have been discussed more times for last 3 years.
> > > Tested changes which are fixing real bugs and are improving the
> > > pci-mvebu.c driver from people listed as M: in MAINTAINERS are being
> > > rejected or silently ignored. And untested changes which are not going
> > > to fix any bug are being accepted and causing new regressions. People
> > > then reporting bug reports to M: people who cannot do anything with it.
> > > The only advice which they can get is to not use mainline kernel.
> > > This pci-mvebu.c driver in mainline kernel is broken and nobody wanted
> > > to do anything with this situation for last 3 years, I was pointing for
> > > it more times. Due to this I'm ignoring bug reports for pci-mvebu.c
> > > driver for mainline kernel.
> > 
> > This makes no sense. Mainline is broken, but yet there's a regression
> > in mainline breaking the driver. The pci-mvebu.c maintainers have the
> > ability to test patches, but refuse to test any submitted patches
> > other than their own. I guess the only solution here is just remove
> > the driver...
> > 
> > Rob
> 
> This is not the way how to get patches being tested. Ignoring other
> people and taking untested patches because you did not wanted to
> communicate with maintainers. I have no reason to test other patches if
> my own are being ignored. This is fair. In past I spent lot of time on
> addressing issues in this driver, preparing fixes for real bugs and
> whole time was wasted. And if you expected that it would work in that,
> then go ahead and do it, remove the driver.
> 

Pali, as I communicated earlier, please send your fixes again and I'll try to
get them merged if we do not have any blocking reasons and the patches make
sense. I do not know what happened earlier with your patches and that's
irrelevant for me.

But if none of the other mainainters oppose your changes (IRQ in specific),
there are no reasons to not merge them IMO. But if there are concerns, then it
is your job to address them.

That being said, if you do not want to send them again and the driver continues
to being untested in mainline, we may need to mark it as Orphan/Obsolete and get
it removed later.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

