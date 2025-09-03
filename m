Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FFCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxwTLZmaUALB0zx7s/iL08mhNtjM53j/J+m08rLp3AE=; b=1TVgXyNS446sq+YOyK6lid1tkz
	vNqAUp5VfWpq0zgLgpRYsKFuARXJHZEPaObfVDE+uG4fPnBjzNGUCDPeee6YxM+f2scpI5KjbfcjY
	58fWFET50c0/lqTwOUBe57oXZt1anNaNfQlJWYDVhQIsZF20VlJG1O0VhvAlgGbxY72UOgJB33D53
	57DDI27uX7LPlAOuebMHMw7wBLtDSwNOchSsohaUua0ZE9gd+3mhERUTaItJvZUUPi+hzBNh6aj2h
	EtFRXCAG7XAkQPg1aZyr+zpbxt4F+GYy3powV1lfag4+Glt9ghwUx4wrg/coKiu1C+3LfhQubwS+J
	HOCCeGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiVI-00000005OxD-2vpA;
	Wed, 03 Sep 2025 08:06:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti2E-000000059Yp-3bAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F16160239;
	Wed,  3 Sep 2025 07:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67981C4CEF1;
	Wed,  3 Sep 2025 07:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756884961;
	bh=X3VFQjKOhgj2N/yG/2HmPx47KJ7yqJvzhfPKtcVetaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPqcucxiGPtihPWq7bGl9KPyTly6mue5wTLCQ/mhDST4zTTLmXkLuVylQW0V5SI0g
	 x4MbZd7c1uQSuOh9xnWFk86qMhgFZTe2GXn9V6F/BP+5272JJep2QRKLa9cYvfvuE/
	 NAT2ApAPLrc7yY3Nq19e4HzzbT5C3+Lgn+SL6jJX7lzPLIRhXi22JeR9PrmWZiHVuB
	 to3fbayuiZXG2tAw5WKAhBGh00M2F9XiaUoPzfTrHFLeHbovq/QQ1eR1wcAIjTYSju
	 diDgjxipjtrtsK3heSS3cLdhs015qT2Ryr6UNW7B21QhnQt4Pz/pg6ldxA7o8A0/GD
	 SrYlMmNPcgA3g==
Received: by pali.im (Postfix)
	id 58B207AE; Wed,  3 Sep 2025 09:35:58 +0200 (CEST)
Date: Wed, 3 Sep 2025 09:35:58 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jan Palus <jpalus@fastmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
Message-ID: <20250903073558.6v2d7q6n6hm2vv3a@pali>
References: <bug-220479-41252@https.bugzilla.kernel.org/>
 <20250820184603.GA633069@bhelgaas>
 <20250902203226.u4i43vygl4bl2dqa@pali>
 <CAL_Jsq+cytAQAtSB7VjR8oKrXJJSSrOouKQZYQAWNvu+tStTnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+cytAQAtSB7VjR8oKrXJJSSrOouKQZYQAWNvu+tStTnA@mail.gmail.com>
User-Agent: NeoMutt/20180716
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

On Tuesday 02 September 2025 20:35:14 Rob Herring wrote:
> On Tue, Sep 2, 2025 at 3:32 PM Pali Rohár <pali@kernel.org> wrote:
> >
> > These issues have been discussed more times for last 3 years.
> > Tested changes which are fixing real bugs and are improving the
> > pci-mvebu.c driver from people listed as M: in MAINTAINERS are being
> > rejected or silently ignored. And untested changes which are not going
> > to fix any bug are being accepted and causing new regressions. People
> > then reporting bug reports to M: people who cannot do anything with it.
> > The only advice which they can get is to not use mainline kernel.
> > This pci-mvebu.c driver in mainline kernel is broken and nobody wanted
> > to do anything with this situation for last 3 years, I was pointing for
> > it more times. Due to this I'm ignoring bug reports for pci-mvebu.c
> > driver for mainline kernel.
> 
> This makes no sense. Mainline is broken, but yet there's a regression
> in mainline breaking the driver. The pci-mvebu.c maintainers have the
> ability to test patches, but refuse to test any submitted patches
> other than their own. I guess the only solution here is just remove
> the driver...
> 
> Rob

This is not the way how to get patches being tested. Ignoring other
people and taking untested patches because you did not wanted to
communicate with maintainers. I have no reason to test other patches if
my own are being ignored. This is fair. In past I spent lot of time on
addressing issues in this driver, preparing fixes for real bugs and
whole time was wasted. And if you expected that it would work in that,
then go ahead and do it, remove the driver.

